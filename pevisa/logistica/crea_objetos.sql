create package oc_cuotas_no as
  type cuota_record is record (
    tipo_documento    varchar2(2),
    serie_documento   varchar2(4),
    numero_documento  varchar2(15),
    fecha_emision     date,
    fecha_vencimiento date,
    moneda            varchar2(1),
    importe           number,
    proveed_oc        varchar2(30),
    doccanje          varchar2(2),
    sercanje          varchar2(4),
    nrocanje          varchar2(15),
    estado            varchar2(1),
    tcam_imp          number,
    cuenta            varchar2(15),
    serie_ref         varchar2(4),  -- Nuevo
    nro_referencia    varchar2(15), -- Nuevo
    cuenta2           varchar2(15)  -- Nuevo
  );

  type t_cuotas is table of cuota_record index by binary_integer;

  -- Variables globales
  cuotas t_cuotas;

  function calcula_cuotas(
    p_precio_compra in number
  , p_cond in          varchar2
  , p_tipdoc_cp in     varchar2
  , p_serie_num in     varchar2
  , p_numero_cp in     varchar2
  , p_fecha_cp in      date
  , p_moneda_cp in     varchar2
  , p_proveed_oc in    varchar2
  , p_cuenta in        varchar2
  , p_cuenta2 in       varchar2
  , p_oc_serie in      varchar2
  , p_oc_numero in     varchar2
  ) return t_cuotas;

  procedure genera_cuotas(
    p_cond in varchar2
  );

  procedure valida(
    p_cond in varchar2
  );

  procedure guarda_cuotas;

  procedure genera_asiento(
    fch         date
  , voucher out varchar2
  );
  /* Para acceder a las variables publicas desde Oracle Forms 6i */
  procedure set_cuotas(
    cuotas t_cuotas
  );

  function get_cuotas return t_cuotas;
end oc_cuotas_no;
/



create package body oc_cuotas_no as
  -- Variables Globales
  g_doccuota factpag%rowtype;
  bulk_errors exception;
  pragma exception_init (bulk_errors
    , -24381);

  function calcula_cuotas(
    p_precio_compra in number
  , p_cond in          varchar2
  , p_tipdoc_cp in     varchar2
  , p_serie_num in     varchar2
  , p_numero_cp in     varchar2
  , p_fecha_cp in      date
  , p_moneda_cp in     varchar2
  , p_proveed_oc in    varchar2
  , p_cuenta in        varchar2
  , p_cuenta2 in       varchar2
  , p_oc_serie in      varchar2
  , p_oc_numero in     varchar2
  )
    return t_cuotas is
    cuota_val         number;
    total             number := 0;
    i                 number := 1;
    num_cuotas        number;
    es_ultima_cuota   boolean;
    fecha_vencimiento date   := p_fecha_cp;
  begin
    cuotas.delete(); -- Cuidado con las variables globales

    select count(*)
      into num_cuotas
      from condpag_cuotas
     where cond_pag = p_cond;

    if num_cuotas = 0 then
      raise_application_error(
          -20002
        , 'No se encontraron condiciones de pago para el código proporcionado.'
      );
    end if;

    for r in ( select porcentaje, dias
                 from condpag_cuotas
                where cond_pag = p_cond
                order by nro_cuotas)
    loop
      cuota_val := round(p_precio_compra * r.porcentaje, 2);
      es_ultima_cuota := (i = num_cuotas);

      if es_ultima_cuota then
        cuota_val := round(p_precio_compra - total, 2);
      else
        total := total + cuota_val;
      end if;

      fecha_vencimiento := fecha_vencimiento + r.dias;

      cuotas(i).tipo_documento := p_tipdoc_cp;
      cuotas(i).tipo_documento := 'NO';
      cuotas(i).serie_documento := p_serie_num;
      cuotas(i).numero_documento := p_numero_cp || '-P' || to_char(i);
      cuotas(i).fecha_emision := p_fecha_cp;
      cuotas(i).fecha_vencimiento := fecha_vencimiento;
      cuotas(i).moneda := p_moneda_cp;
      cuotas(i).importe := cuota_val;
      cuotas(i).proveed_oc := p_proveed_oc;

      --
      cuotas(i).serie_ref := p_oc_serie;
      cuotas(i).nro_referencia := p_oc_numero;
      cuotas(i).cuenta2 := p_cuenta2;

      cuotas(i).doccanje := p_tipdoc_cp;
      cuotas(i).sercanje := p_serie_num;
      cuotas(i).nrocanje := p_numero_cp;
      cuotas(i).estado := '0';
      cuotas(i).tcam_imp := 0;
      cuotas(i).cuenta := p_cuenta;
      i := i + 1;
    end loop;

    return cuotas;
  exception
    when no_data_found then
      raise_application_error(-20003, 'No se encontraron datos en la tabla de cuotas.');
    when others then
      raise_application_error(-20001, 'Error al calcular las cuotas: ' || sqlerrm);
  end calcula_cuotas;

  procedure genera_cuotas(
    p_cond in varchar2
  ) is
  begin
    valida(p_cond);
    guarda_cuotas();
    -- Inserta las cuotas en la tabla canjedoc_cpag
    --actualiza_docs(); -- Inserta los documentos en la tabla factpag_canje
  exception
    when others then
      if sqlcode not between -20999 and -20000 then
        logger.log_error('Error al generar las cuotas: ' || sqlerrm);
      end if;

      rollback;
      raise;
  end genera_cuotas;

  procedure valida(
    p_cond in varchar2
  ) is
    porcentaje_total number := 0;
  begin
    for r in (select porcentaje
                from condpag_cuotas
               where cond_pag = p_cond)
    loop
      porcentaje_total := porcentaje_total + r.porcentaje;
    end loop;

    if round(porcentaje_total, 2) != 1 then
      raise_application_error(-20004, 'Los porcentajes no suman el 100%.');
    end if;
  end valida;

  procedure guarda_cuotas is
    -- Inserta las cuotas en la tabla CANJEDOC, esta nueva tabla permite guardar los campos
    -- tipo, serie y numero, con esto se tiene la relacion completa del documento canjeado,
    -- pudiendo canjear a otros documentos que no sean solo letras.
  begin
    forall i in 1 .. cuotas.count save exceptions
      insert into canjedoc_cpag( tpodoc, serdoc, nrodoc, emision, vencimiento
                               , moneda, importe, cod_proveedor, doccanje, sercanje
                               , nrocanje, estado, tcam_imp, cuenta)
      values ( cuotas(i).tipo_documento, cuotas(i).serie_documento, cuotas(i).numero_documento
             , cuotas(i).fecha_emision, cuotas(i).fecha_vencimiento, cuotas(i).moneda
             , cuotas(i).importe, cuotas(i).proveed_oc, cuotas(i).doccanje, cuotas(i).sercanje
             , cuotas(i).nrocanje, cuotas(i).estado, cuotas(i).tcam_imp, cuotas(i).cuenta);
  exception
    when bulk_errors then
      for i in 1 .. sql%bulk_exceptions.count loop
        logger.log(
            'Cuota: '
              || cuotas(sql%bulk_exceptions(i).error_index).tipo_documento
              || ' Nro: '
              || cuotas(sql%bulk_exceptions(i).error_index).numero_documento
              || ' Serie: '
              || cuotas(sql%bulk_exceptions(i).error_index).serie_documento
              || ' emision: '
              || cuotas(sql%bulk_exceptions(i).error_index).fecha_emision
              || ' vencimiento: '
              || cuotas(sql%bulk_exceptions(i).error_index).fecha_vencimiento
              || ' moneda: '
              || cuotas(sql%bulk_exceptions(i).error_index).moneda
              || ' importe: '
              || cuotas(sql%bulk_exceptions(i).error_index).importe
              || ' proveed_oc: '
              || cuotas(sql%bulk_exceptions(i).error_index).proveed_oc
              || ' doccanje: '
              || cuotas(sql%bulk_exceptions(i).error_index).doccanje
              || ' sercanje: '
              || cuotas(sql%bulk_exceptions(i).error_index).sercanje
              || ' nrocanje: '
              || cuotas(sql%bulk_exceptions(i).error_index).nrocanje
              || ' estado: '
              || cuotas(sql%bulk_exceptions(i).error_index).estado
              || ' tcam_imp: '
              || cuotas(sql%bulk_exceptions(i).error_index).tcam_imp
              || ' cuenta: '
              || cuotas(sql%bulk_exceptions(i).error_index).cuenta
              || ' serie_ref: '
              || cuotas(sql%bulk_exceptions(i).error_index).serie_ref
              || ' nro_referencia: '
              || cuotas(sql%bulk_exceptions(i).error_index).nro_referencia
              || ' cuenta2: '
              || cuotas(sql%bulk_exceptions(i).error_index).cuenta2
              || ' Err: '
              || sqlerrm(sql%bulk_exceptions(i).error_code * -1)
        );
      end loop;

      raise_application_error(-20001, 'Error al guardar las cuotas.');
    when others then
      raise_application_error(-20001, 'Error inesperado al guardar las cuotas: ' || sqlerrm);
  end guarda_cuotas;

  procedure genera_asiento(
    fch         date
  , voucher out varchar2
  ) as
    -- Constantes
    c_pase_ctacte constant    varchar2(1) := 'S';
    c_fecha_registro constant date        := sysdate;
    c_soles constant          varchar2(1) := 'S';
    c_dolares constant        varchar2(1) := 'D';

    -- Variables Globales
    g_voucher                 pkg_asiento.trc_voucher;

    procedure inicializa is
    begin
      g_voucher.ano := to_number(to_char(fch, 'YYYY'));
      g_voucher.mes := to_number(to_char(fch, 'MM'));
      g_voucher.libro := '48';
      g_voucher.voucher := api_movglos.nuevo_numero(g_voucher.ano, g_voucher.mes, g_voucher.libro);
      g_voucher.cambio := api_cambdol.onerow(fch, pkg_asiento.c_tipo_cambio).import_cam;
      voucher := g_voucher.ano || '-' || g_voucher.mes || '-' || g_voucher.libro || '-' ||
                 g_voucher.voucher;
      if g_voucher.cambio is null then
        raise_application_error(-20020, 'No existe tipo de cambio para la fecha ' || fch);
      end if;
    end;


    procedure graba_cabecera is
      mg movglos%rowtype;
    begin
      mg.ano := g_voucher.ano;
      mg.mes := g_voucher.mes;
      mg.libro := g_voucher.libro;
      mg.voucher := g_voucher.voucher;
      mg.glosa := 'NO SE PAGA ' || cuotas(1).serie_ref || '-' ||
                  cuotas(1).nro_referencia; -- Cambiar según la referencia
      mg.fecha := fch;
      mg.tipo_cambio := pkg_asiento.c_tipo_cambio;
      mg.estado := pkg_asiento.c_estado;
      mg.sistema := 'CONT';
      mg.pase_ctacte := c_pase_ctacte;
      mg.pase_cta_cte_pro := c_pase_ctacte;
      mg.moneda := cuotas(1).moneda;
      mg.serie_orden := cuotas(1).serie_ref; -- Actualiza según el nuevo campo
      mg.numero_order := cuotas(1).nro_referencia; -- Actualiza según el nuevo campo
      mg.usuario := user;
      mg.fec_reg := c_fecha_registro;
      mg.nro_planilla := to_char(fch, 'DD/MM/YYYY');
      api_movglos.ins(mg);
    end;

    procedure graba_detalle_docs is
      c_nota_credito constant varchar2(2) := '07';
      md                      movdeta%rowtype;
    begin
      for i in 1 .. cuotas.count loop
        md.ano := g_voucher.ano;
        md.mes := g_voucher.mes;
        md.libro := g_voucher.libro;
        md.voucher := g_voucher.voucher;
        md.cuenta := cuotas(i).cuenta;
        md.tipo_cambio := pkg_asiento.c_tipo_cambio;
        md.tipo_relacion := 'P';
        md.relacion := cuotas(i).proveed_oc;
        md.tipo_referencia := cuotas(i).tipo_documento;
        md.serie := cuotas(i).serie_documento;
        md.nro_referencia := cuotas(i).numero_documento;
        md.fecha := fch;
        md.f_vencto := cuotas(i).fecha_vencimiento;
        md.detalle := 'NO SE PAGA ' || cuotas(i).serie_ref || '-' ||
                      cuotas(i).nro_referencia; -- Cambiar según el detalle
        md.cargo_s := 0;
        md.cargo_d := 0;
        md.abono_s := 0;
        md.abono_d := 0;
        if cuotas(i).moneda = c_dolares and cuotas(i).tipo_documento != c_nota_credito then
          md.cargo_d := cuotas(i).importe;
          md.cargo_s := round(cuotas(i).importe * g_voucher.cambio, 2);
        elsif cuotas(i).moneda = c_soles and cuotas(i).tipo_documento != c_nota_credito then
          md.cargo_s := cuotas(i).importe;
          md.cargo_d := round(cuotas(i).importe / g_voucher.cambio, 2);
        elsif cuotas(i).moneda = c_dolares and cuotas(i).tipo_documento = c_nota_credito then
          md.abono_d := abs(cuotas(i).importe);
          md.abono_s := round(abs(cuotas(i).importe) * g_voucher.cambio, 2);
        elsif cuotas(i).moneda = c_soles and cuotas(i).tipo_documento = c_nota_credito then
          md.abono_s := abs(cuotas(i).importe);
          md.abono_d := round(abs(cuotas(i).importe) / g_voucher.cambio, 2);
        end if;
        md.abono_s := abs(md.abono_s);
        md.abono_d := abs(md.abono_d);
        md.cargo_s := abs(md.cargo_s);
        md.cargo_d := abs(md.cargo_d);
        md.estado := pkg_asiento.c_estado;
        md.columna := api_plancta.onerow(md.cuenta).col_compras;
        md.generado := api_plancta.genera_automaticos(md.cuenta);
        md.usuario := user;
        md.fec_reg := c_fecha_registro;
        md.cambio := g_voucher.cambio;
        md.file_cta_cte := 'P';
        api_movdeta.ins(md);
      end loop;
    end;

    procedure graba_detalle_cuotas is
      md movdeta%rowtype;
    begin
      for i in 1 .. cuotas.count loop
        md.ano := g_voucher.ano;
        md.mes := g_voucher.mes;
        md.libro := g_voucher.libro;
        md.voucher := g_voucher.voucher;
        md.cuenta := cuotas(i).cuenta2;
        md.tipo_cambio := pkg_asiento.c_tipo_cambio;
        md.tipo_relacion := 'P';
        md.relacion := cuotas(i).proveed_oc;
        md.tipo_referencia := cuotas(i).tipo_documento;
        md.serie := cuotas(i).serie_documento;
        md.nro_referencia := cuotas(i).numero_documento;
        md.fecha := fch;
        md.f_vencto := cuotas(i).fecha_vencimiento;
        md.detalle := 'NO SE PAGA ' || cuotas(i).serie_ref || '-' ||
                      cuotas(i).nro_referencia; -- Cambiar según el detalle
        if cuotas(i).moneda = c_dolares then
          md.abono_d := cuotas(i).importe;
          md.abono_s := round(cuotas(i).importe * g_voucher.cambio, 2);
        else
          md.abono_s := cuotas(i).importe;
          md.abono_d := round(cuotas(i).importe / g_voucher.cambio, 2);
        end if;
        md.cargo_s := 0;
        md.cargo_d := 0;
        md.abono_s := abs(md.abono_s);
        md.abono_d := abs(md.abono_d);
        md.cargo_s := abs(md.cargo_s);
        md.cargo_d := abs(md.cargo_d);
        md.estado := pkg_asiento.c_estado;
        md.columna := api_plancta.onerow(md.cuenta).col_compras;
        md.generado := api_plancta.genera_automaticos(md.cuenta);
        md.usuario := user;
        md.fec_reg := c_fecha_registro;
        md.cambio := g_voucher.cambio;
        md.file_cta_cte := 'P';
        api_movdeta.ins(md);
      end loop;
    end;
    procedure guarda_numero_voucher is
    begin
      forall i in 1 .. cuotas.count save exceptions
        update canjedoc_cpag
           set ano      = g_voucher.ano
             , mes      = g_voucher.mes
             , libro    = g_voucher.libro
             , voucher  = g_voucher.voucher
             , tcam_imp = g_voucher.cambio
         where tpodoc = cuotas(i).tipo_documento
           and serdoc = cuotas(i).serie_documento
           and nrodoc = cuotas(i).numero_documento
           and cod_proveedor = cuotas(i).proveed_oc;
    exception
      when bulk_errors then
        for i in 1 .. sql%bulk_exceptions.COUNT loop
          logger.log(sql%bulk_exceptions(i).error_index || ': ' ||
                     sqlerrm(sql%bulk_exceptions(i).error_code * -1));
        end loop;
        raise_application_error(-20003, 'Error al actualizar el número de voucher.');
    end;
  begin
    inicializa(); -- GENERA ANO, MES, LIBRO, VOUCHER PASO 1
    graba_cabecera(); -- LLENA MOVGLOS PASO 3
    graba_detalle_docs();
    graba_detalle_cuotas(); -- LLENA MOVDETA PASO 4
    guarda_numero_voucher();
  exception
    when others then
      if sqlcode not between -20999 and -20000 then
        logger.log_error('Error en la generación del asiento con voucher ' || g_voucher.voucher);
      end if;
      rollback;
      raise;
  end genera_asiento;
  procedure set_cuotas(
    cuotas t_cuotas
  ) is
  begin
    oc_cuotas_no.cuotas := set_cuotas.cuotas;
  end;

  function get_cuotas return t_cuotas is
  begin
    return cuotas;
  end;
end oc_cuotas_no;
/

