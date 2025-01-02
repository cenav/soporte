create or replace package pevisa.cancelacion_auto_factura_po as
  type t_docs is table of factpag%rowtype index by binary_integer;

  -- Variables globales
  docs t_docs;

  procedure genera_asiento(
    fch         date
  , voucher out varchar2
  );

  /* Para acceder a las variables publicas desde Oracle Forms 6i */
  procedure set_docs(
    docs t_docs
  );

  function get_docs return t_docs;

end cancelacion_auto_factura_po;
/

--spec

create or replace package body pevisa.cancelacion_auto_factura_po as

  -- Variables Globales
  g_doccuota factpag%rowtype;
  bulk_errors exception;
  pragma exception_init (bulk_errors, -24381);

  procedure genera_asiento(
    fch         date
  , voucher out varchar2
  ) as
    -- Constantes
    c_pase_ctacte constant    varchar2(1) := 'S';
    c_fecha_registro constant date        := sysdate;
    c_soles constant          varchar2(1) := 'S';
    c_dolares constant        varchar2(1) := 'D';
    registro                  number(8, 4);
    -- Variables Globales
    g_voucher                 pkg_asiento.trc_voucher;
-----------------------------------------------------------------------------------------------------
    procedure inicializa is
    begin
      g_voucher.ano := to_number(to_char(fch, 'YYYY'));
      g_voucher.mes := to_number(to_char(fch, 'MM'));
      g_voucher.libro := '49';--validar con Contador/a General
      g_voucher.voucher := api_movglos.nuevo_numero(g_voucher.ano, g_voucher.mes, g_voucher.libro);
      g_voucher.cambio := api_cambdol.onerow(fch, pkg_asiento.c_tipo_cambio).import_cam;
      registro := api_cambdol.onerow(docs(2).fecha, pkg_asiento.c_tipo_cambio).import_cam;
      voucher := g_voucher.ano || '-' || g_voucher.mes || '-' || g_voucher.libro || '-' ||
                 g_voucher.voucher;
      if g_voucher.cambio is null then
        raise_application_error(-20020, 'No existe tipo de cambio para la fecha ' || fch);
      end if;
    end;
-----------------------------------------------------------------------------------------------------
    procedure graba_cabecera is
      mg movglos%rowtype;
    begin
      mg.ano := g_voucher.ano;
      mg.mes := g_voucher.mes;
      mg.libro := g_voucher.libro;
      mg.voucher := g_voucher.voucher;
      mg.glosa := 'EXTORNO OC ' || docs(1).serie_ref || '-' || docs(1).nro_referencia ||
                  regexp_substr(docs(2).numero, '-P[0-9]+');-------cambio '01'//g_doccuota.tipdoc // '#GLOS'
      mg.fecha := fch;
      mg.tipo_cambio := pkg_asiento.c_tipo_cambio;
      mg.estado := pkg_asiento.c_estado;
      mg.sistema := 'CONT';
      mg.pase_ctacte := c_pase_ctacte;
      mg.pase_cta_cte_pro := c_pase_ctacte;
      mg.moneda := docs(1).moneda;
      mg.serie_orden := docs(1).serie_ref;
      mg.numero_order := docs(1).nro_referencia;
      mg.usuario := user;
      mg.fec_reg := c_fecha_registro;
      mg.nro_planilla := to_char(fch, 'DD/MM/YYYY');
      api_movglos.ins(mg);
    end;
-------------------------------------------------------------------------------------------------------
    procedure graba_detalle_docs is
      c_nota_credito constant varchar2(2) := '07';
      md                      movdeta%rowtype;
    begin
      --for i in 1 .. docs.count loop
      md.ano := g_voucher.ano;
      md.mes := g_voucher.mes;
      md.libro := g_voucher.libro;
      md.voucher := g_voucher.voucher;
      md.cuenta := docs(1).ctactble;
      md.tipo_cambio := pkg_asiento.c_tipo_cambio;
      md.tipo_relacion := 'P';
      md.relacion := docs(1).cod_proveedor;
      md.tipo_referencia := docs(1).tipdoc;
      md.serie := docs(1).serie_num;
      md.nro_referencia := docs(1).numero;
      md.fecha := docs(1).fecha;
      md.f_vencto := docs(1).f_vencto;
      md.cargo_s := 0;
      md.cargo_d := 0;
      md.abono_s := 0;
      md.abono_d := 0;
      if docs(1).moneda = c_dolares and docs(1).tipdoc != c_nota_credito then
        md.cargo_d := docs(1).saldo;
        md.cargo_s := round(docs(1).saldo * g_voucher.cambio, 2);
      elsif docs(1).moneda = c_soles and docs(1).tipdoc != c_nota_credito then
        md.cargo_s := docs(1).saldo;
        md.cargo_d := round(docs(1).saldo / g_voucher.cambio, 2);
      elsif docs(1).moneda = c_dolares and docs(1).tipdoc = c_nota_credito then
        md.abono_d := abs(docs(1).saldo);
        md.abono_s := round(abs(docs(1).saldo) * g_voucher.cambio, 2);
      elsif docs(1).moneda = c_soles and docs(1).tipdoc = c_nota_credito then
        md.abono_s := abs(docs(1).saldo);
        md.abono_d := round(abs(docs(1).saldo) / g_voucher.cambio, 2);
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
      --end loop;
    end;
----------------------------------------------------------------------------------------------------
    procedure graba_detalle_cuotas is
      md movdeta%rowtype;
    begin
      --FOR i IN 1 .. docs.COUNT LOOP
      md.ano := g_voucher.ano;
      md.mes := g_voucher.mes;
      md.libro := g_voucher.libro;
      md.voucher := g_voucher.voucher;
      md.cuenta := '1895';
      md.tipo_cambio := pkg_asiento.c_tipo_cambio;
      md.tipo_relacion := 'P';
      md.relacion := docs(2).cod_proveedor;
      md.tipo_referencia := docs(2).tipdoc;
      md.serie := docs(2).serie_num;
      md.nro_referencia := docs(2).numero;
      md.fecha := docs(2).fecha;
      md.f_vencto := docs(2).f_vencto;
      if docs(2).moneda = c_dolares then
        md.abono_d := docs(2).saldo;
        md.abono_s := round(docs(2).saldo * registro, 2);
      else
        md.abono_s := docs(2).saldo;
        md.abono_d := round(docs(2).saldo / registro, 2);
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
      md.cambio := registro;
      md.file_cta_cte := 'P';
      api_movdeta.ins(md);
      --END LOOP;
    end;
-------------------------------------------------------------------------------------------------
  begin
    inicializa(); -- GENERA ANO,MES,LIBRO,VOUCHER PASO 1
    graba_cabecera(); -- LLENA MOVGLOS PASO 2
    graba_detalle_docs(); -- CANJEA EL FACTPAG PASO 3 CARGO a la vez deja en saldo 0
    graba_detalle_cuotas(); -- LLENA MOVDETA PASO 4  ABONO
    pkg_asiento.calc_cuenta_dif_cambio(g_voucher, 'S', fch); -- PASO 4.5 si es sol//no es necesario si se canjea el mismo dia o al momento
    pkg_asiento.calc_cuenta_dif_cambio(g_voucher, 'D', fch); -- PASO 4.5 si es dolar//no es necesario si se canjea el mismo dia o al momento
  exception
    when others then
      if sqlcode not between -20999 and -20000 then
        logger.log_error('Error en la generacin del asiento con voucher ' || g_voucher.voucher);
      end if;
      rollback;
      raise;
  end genera_asiento;

  procedure set_docs(
    docs t_docs
  ) is
  begin
    cancelacion_auto_factura_po.docs := docs;
  end;

  function get_docs return t_docs is
  begin
    return docs;
  end;
end cancelacion_auto_factura_po;
/

