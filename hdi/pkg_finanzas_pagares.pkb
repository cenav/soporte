create or replace package body pkg_finanzas_pagares as
  /* Constantes */
  k_tipo constant varchar2(2) := '2';
  k_si constant varchar2(1) := 'S';
  k_no constant varchar2(1) := 'N';
  k_fmt constant varchar2(30) := 'dd/mm/yyyy';

  /* Variables globales */
  g_ano number(5);
  g_mes number(3);
  g_voucher number(6);
  g_icambio number(8, 4);
  g_portes cobro_banco.importe%type := 0;
  g_moneda varchar2(2);

  cursor pagares_vencidos_cur(p_fecha date) is
    select pag.cod_proveedor, pag.tipdoc
         , pag.serie_num, pag.numero
         , pag.moneda, nvl(mvf.banco, '01') as banco
         , bco.cod_banco, pag.tcam_sal
         , pag.ctactble, bco.ano
         , bco.mes, bco.tipo
         , bco.voucher, bco.cod_prestamo
         , nvl(cuo.importe_interes, 0) + nvl(cuo.importe_comision, 0) +
           nvl(cuo.importe_gastos, 0) as interes
         , abs(pag.saldo) as saldo
         , bco.ctabnco_auto
      from prestamo_banco bco
           join prestamo_banco_cuota cuo
                on bco.cod_banco = cuo.cod_banco and bco.cod_prestamo = cuo.cod_prestamo
           join tipo_prestamo_banco tpo on bco.cod_tipo_prestamo = tpo.cod_tipo_prestamo
           join factpag pag
                on bco.cod_proveedor = pag.cod_proveedor
                  and bco.tipdoc = pag.tipdoc
                  and cuo.serie_num = pag.serie_num
                  and cuo.numero = pag.numero
           left join movfigl mvf
                     on bco.ano = mvf.ano
                       and bco.mes = mvf.mes
                       and bco.tipo = mvf.tipo
                       and bco.voucher = mvf.voucher
     where pag.f_vencto = p_fecha
       and tpo.auto_pagare = 1
       and pag.saldo != 0;


  procedure init(
    p_fecha     date
  , p_cod_banco varchar2
  , p_moneda    varchar2
  ) is
  begin
    g_ano := extract(year from p_fecha);
    g_mes := extract(month from p_fecha);
    g_voucher := api_movfigl.nuevo_numero(g_ano, g_mes, k_tipo);
    g_icambio := api_cambdol.onerow(p_fecha, 'V').import_cam;
    g_portes := nvl(api_cobro_banco.onerow(2, p_cod_banco).importe, 0);
    g_moneda := p_moneda;
  end;


  function diferencia_cambio(
    p_moneda varchar2
  ) return number as
    l_diferencia_soles   number(10, 2) := 0;
    l_diferencia_dolares number(10, 2) := 0;
    l_diferencia         number(10, 2) := 0;
  begin
    begin
      select abs(sum(cargo_s) - sum(abono_s)) as diferencia_soles
           , abs(sum(cargo_d) - sum(abono_d)) as diferencia_dolares
        into l_diferencia_soles, l_diferencia_dolares
        from movfide
       where ano = g_ano
         and mes = g_mes
         and tipo = k_tipo
         and voucher = g_voucher;
    exception
      when others then
        l_diferencia_soles := 0;
        l_diferencia_dolares := 0;
    end;

    if p_moneda = 'S' then
      l_diferencia := l_diferencia_soles;
    else
      l_diferencia := l_diferencia_dolares;
    end if;

    return l_diferencia;
  end;


  function ubicacion_diferencia return varchar2 is
    l_cargo_s   number(10, 2) := 0;
    l_abono_s   number(10, 2) := 0;
    l_cargo_d   number(10, 2) := 0;
    l_abono_d   number(10, 2) := 0;
    l_ubicacion varchar2(30);
  begin
    begin
      select sum(cargo_s) as cargo_s, sum(abono_s) as abono_s, sum(cargo_d) as cargo_d
           , sum(abono_d) as abono_d
        into l_cargo_s, l_abono_s, l_cargo_d, l_abono_d
        from movfide
       where ano = g_ano
         and mes = g_mes
         and tipo = k_tipo
         and voucher = g_voucher;
    exception
      when others then
        l_cargo_s := 0;
        l_abono_s := 0;
        l_cargo_d := 0;
        l_abono_d := 0;
    end;

    if l_cargo_s < l_abono_s then
      l_ubicacion := 'CARGO_S';
    elsif l_cargo_s > l_abono_s then
      l_ubicacion := 'ABONO_S';
    elsif l_cargo_d < l_abono_d then
      l_ubicacion := 'CARGO_D';
    elsif l_cargo_d > l_abono_d then
      l_ubicacion := 'ABONO_D';
    end if;

    return l_ubicacion;
  end;


  procedure cuenta_banco(
    p_vencimiento date
  , p_prestamo    pagares_vencidos_cur%rowtype
  ) is
    l_cargo_s  movfide.cargo_s%type := 0;
    l_abono_s  movfide.abono_s%type := 0;
    l_cargo_d  movfide.cargo_d%type := 0;
    l_abono_d  movfide.abono_d%type := 0;
    l_cuenta   movfide.cuenta%type;
    l_generado movfide.generado%type;
  begin
    if p_prestamo.moneda = 'S' then
      l_abono_s := p_prestamo.saldo + g_portes;
      l_abono_d := (p_prestamo.saldo + g_portes) / g_icambio;
    else
      l_abono_s := (p_prestamo.saldo + g_portes) * g_icambio;
      l_abono_d := p_prestamo.saldo + g_portes;
    end if;

    l_cuenta := api_ctabnco.onerow(p_prestamo.ctabnco_auto).cuenta;
    l_generado := pkg_finanzas_queries.generado_cuenta(l_cuenta);

    begin
      pkg_finanzas_api.insert_movfide(
          p_ano => g_ano
        , p_mes => g_mes
        , p_tipo => k_tipo
        , p_voucher => g_voucher
        , p_item => 1
        , p_cuenta => l_cuenta
        , p_etipor => null
        , p_ecodigo => null
        , p_etipo => null
        , p_eserie => null
        , p_enumero => null
        , p_fecha => p_vencimiento
        , p_cargo_s => l_cargo_s
        , p_abono_s => l_abono_s
        , p_cargo_d => l_cargo_d
        , p_abono_d => l_abono_d
        , p_banco => p_prestamo.banco
        , p_file_cta_cte => k_no
        , p_estado => 0
        , p_generado => l_generado
        , p_usuario => user
        , p_fec_reg => p_vencimiento
        , p_tipo_mov => 'CRE'
        , p_cambio => g_icambio
        );
    exception
      when others then
        logger.log_error(
              'PRESTAMO: ' || p_prestamo.cod_banco || ' ' || p_prestamo.cod_prestamo ||
              ' VENCIMIENTO: ' || to_char(p_vencimiento, k_fmt)
          );
        raise;
    end;
  end;


  procedure cuenta_prestamo(
    p_fecha    date
  , p_moneda   varchar2
  , p_saldo    number
  , p_ruc      varchar2
  , p_tipo     varchar2
  , p_serie    varchar2
  , p_numero   varchar2
  , p_impcam   number
  , p_ctactble varchar2
  ) is
    l_cargo_s  movfide.cargo_s%type := 0;
    l_abono_s  movfide.abono_s%type := 0;
    l_cargo_d  movfide.cargo_d%type := 0;
    l_abono_d  movfide.abono_d%type := 0;
    l_generado movfide.generado%type;
  begin
    if p_moneda = enum_moneda.soles then
      l_cargo_s := p_saldo;
      l_cargo_d := p_saldo / p_impcam;
    else
      l_cargo_s := p_saldo * p_impcam;
      l_cargo_d := p_saldo;
    end if;

    l_generado := pkg_finanzas_queries.generado_cuenta(p_ctactble);

    pkg_finanzas_api.insert_movfide(
        p_ano => g_ano
      , p_mes => g_mes
      , p_tipo => k_tipo
      , p_voucher => g_voucher
      , p_item => 1
      , p_cuenta => p_ctactble
      , p_etipor => 'P'
      , p_ecodigo => p_ruc
      , p_etipo => p_tipo
      , p_eserie => p_serie
      , p_enumero => p_numero
      , p_fecha => p_fecha
      , p_cargo_s => l_cargo_s
      , p_abono_s => l_abono_s
      , p_cargo_d => l_cargo_d
      , p_abono_d => l_abono_d
      , p_banco => null
      , p_file_cta_cte => 'P'
      , p_estado => 0
      , p_generado => l_generado
      , p_usuario => user
      , p_fec_reg => p_fecha
      , p_tipo_mov => 'CRE'
      , p_cambio => p_impcam
      );
  end;


  procedure cuenta_diferencia_cambio(
    p_fecha date
  ) is
    l_cargo_s  movfide.cargo_s%type := 0;
    l_abono_s  movfide.abono_s%type := 0;
    l_cargo_d  movfide.cargo_d%type := 0;
    l_abono_d  movfide.abono_d%type := 0;
    l_generado movfide.generado%type;
    l_cuenta   movfide.cuenta%type;
  begin
    if diferencia_cambio(enum_moneda.soles) > 0 or diferencia_cambio(enum_moneda.dolares) > 0 then
      if ubicacion_diferencia() = 'CARGO_S' then
        l_cargo_s := diferencia_cambio(enum_moneda.soles);
      elsif ubicacion_diferencia() = 'CARGO_D' then
        l_cargo_d := diferencia_cambio(enum_moneda.dolares);
      elsif ubicacion_diferencia() = 'ABONO_S' then
        l_abono_s := diferencia_cambio(enum_moneda.soles);
      elsif ubicacion_diferencia() = 'ABONO_D' then
        l_abono_d := diferencia_cambio(enum_moneda.dolares);
      end if;

      if (rpad(ubicacion_diferencia(), 5) = 'ABONO') then
        l_cuenta := api_cuenta_asiento_auto.cuenta(
            enum_cuenta_asiento_auto.dif_cambio_prov_mas
          , g_moneda
          );
      else
        l_cuenta := api_cuenta_asiento_auto.cuenta(
            enum_cuenta_asiento_auto.dif_cambio_prov_menos
          , g_moneda
          );
      end if;

      l_generado := pkg_finanzas_queries.generado_cuenta(l_cuenta);

      pkg_finanzas_api.insert_movfide(
          p_ano => g_ano
        , p_mes => g_mes
        , p_tipo => k_tipo
        , p_voucher => g_voucher
        , p_item => 1
        , p_cuenta => l_cuenta
        , p_etipor => null
        , p_ecodigo => null
        , p_etipo => null
        , p_eserie => null
        , p_enumero => null
        , p_fecha => p_fecha
        , p_cargo_s => l_cargo_s
        , p_abono_s => l_abono_s
        , p_cargo_d => l_cargo_d
        , p_abono_d => l_abono_d
        , p_banco => null
        , p_file_cta_cte => k_no
        , p_estado => 0
        , p_generado => l_generado
        , p_usuario => user
        , p_fec_reg => trunc(p_fecha)
        , p_tipo_mov => 'CRE'
        , p_cambio => g_icambio
        );
    end if;
  end ;


  procedure cuenta_interes_cargo(
    p_fecha   date
  , p_interes number
  , p_moneda  varchar2
  , p_numero  varchar2
  ) is
    l_cargo_s  movfide.cargo_s%type := 0;
    l_abono_s  movfide.abono_s%type := 0;
    l_cargo_d  movfide.cargo_d%type := 0;
    l_abono_d  movfide.abono_d%type := 0;
    l_generado movfide.generado%type;
    l_cuenta   movfide.cuenta%type;
  begin
    if p_moneda = enum_moneda.soles then
      l_cargo_s := p_interes;
      l_cargo_d := p_interes / g_icambio;
    else
      l_cargo_s := p_interes * g_icambio;
      l_cargo_d := p_interes;
    end if;
    l_cuenta := api_cuenta_asiento_auto.cuenta(
        enum_cuenta_asiento_auto.interes_prestamo
      , g_moneda
      );
    l_generado := pkg_finanzas_queries.generado_cuenta(l_cuenta);

    pkg_finanzas_api.insert_movfide(
        p_ano => g_ano
      , p_mes => g_mes
      , p_tipo => k_tipo
      , p_voucher => g_voucher
      , p_item => 1
      , p_cuenta => l_cuenta
      , p_etipor => null
      , p_ecodigo => null
      , p_etipo => null
      , p_eserie => null
      , p_enumero => p_numero
      , p_fecha => p_fecha
      , p_cargo_s => l_cargo_s
      , p_abono_s => l_abono_s
      , p_cargo_d => l_cargo_d
      , p_abono_d => l_abono_d
      , p_banco => null
      , p_file_cta_cte => k_no
      , p_estado => 0
      , p_generado => l_generado
      , p_usuario => user
      , p_fec_reg => trunc(p_fecha)
      , p_tipo_mov => 'CRE'
      , p_cambio => g_icambio
      );
  end;


  procedure cuenta_interes_abono(
    p_fecha           date
  , p_importe_interes number
  , p_moneda          varchar2
  , p_ruc             varchar2
  , p_tipo            varchar2
  , p_serie           varchar2
  , p_numero          varchar2
  , p_impcam          number
  ) is
    l_cargo_s  movfide.cargo_s%type := 0;
    l_abono_s  movfide.abono_s%type := 0;
    l_cargo_d  movfide.cargo_d%type := 0;
    l_abono_d  movfide.abono_d%type := 0;
    l_cuenta   movfide.cuenta%type;
    l_generado movfide.generado%type;
  begin
    if p_moneda = enum_moneda.soles then
      l_abono_s := p_importe_interes;
      l_abono_d := p_importe_interes / p_impcam;
    else
      l_abono_s := p_importe_interes * p_impcam;
      l_abono_d := p_importe_interes;
    end if;

    l_cuenta := api_cuenta_asiento_auto.cuenta(
        enum_cuenta_asiento_auto.interes_bancos
      , g_moneda
      );

    l_generado := pkg_finanzas_queries.generado_cuenta(l_cuenta);

    pkg_finanzas_api.insert_movfide(
        p_ano => g_ano
      , p_mes => g_mes
      , p_tipo => k_tipo
      , p_voucher => g_voucher
      , p_item => 1
      , p_cuenta => l_cuenta
      , p_etipor => 'P'
      , p_ecodigo => p_ruc
      , p_etipo => p_tipo
      , p_eserie => p_serie
      , p_enumero => p_numero
      , p_fecha => p_fecha
      , p_cargo_s => l_cargo_s
      , p_abono_s => l_abono_s
      , p_cargo_d => l_cargo_d
      , p_abono_d => l_abono_d
      , p_banco => null
      , p_file_cta_cte => k_no
      , p_estado => 0
      , p_generado => l_generado
      , p_usuario => user
      , p_fec_reg => trunc(p_fecha)
      , p_tipo_mov => 'CRE'
      , p_cambio => p_impcam
      );
  end;

  procedure cuenta_cargas_financieras(
    p_fecha date
  ) is
    l_cargo_s  movfide.cargo_s%type := 0;
    l_abono_s  movfide.abono_s%type := 0;
    l_cargo_d  movfide.cargo_d%type := 0;
    l_abono_d  movfide.abono_d%type := 0;
    l_cuenta   movfide.cuenta%type;
    l_generado movfide.generado%type;
  begin
    if g_portes > 0 then
      l_cargo_d := g_portes;
      l_cargo_s := g_portes * g_icambio;

      l_cuenta := api_cuenta_asiento_auto.cuenta(
          enum_cuenta_asiento_auto.otra_carga_financiera
        , g_moneda
        );
      l_generado := pkg_finanzas_queries.generado_cuenta(l_cuenta);

      pkg_finanzas_api.insert_movfide(
          p_ano => g_ano
        , p_mes => g_mes
        , p_tipo => k_tipo
        , p_voucher => g_voucher
        , p_item => 1
        , p_cuenta => l_cuenta
        , p_etipor => null
        , p_ecodigo => null
        , p_etipo => null
        , p_eserie => null
        , p_enumero => null
        , p_fecha => p_fecha
        , p_cargo_s => l_cargo_s
        , p_abono_s => l_abono_s
        , p_cargo_d => l_cargo_d
        , p_abono_d => l_abono_d
        , p_banco => null
        , p_file_cta_cte => k_no
        , p_estado => 0
        , p_generado => l_generado
        , p_usuario => user
        , p_fec_reg => trunc(p_fecha)
        , p_tipo_mov => 'CRE'
        , p_cambio => g_icambio
        );
    end if;
  end;


  procedure genera_asiento_detalle(
    p_vencimiento date
  , p_prestamo    pagares_vencidos_cur%rowtype
  ) is
  begin
    cuenta_banco(p_vencimiento, p_prestamo);
    cuenta_prestamo(
        p_vencimiento
      , p_prestamo.moneda
      , p_prestamo.saldo
      , p_prestamo.cod_proveedor
      , p_prestamo.tipdoc
      , p_prestamo.serie_num
      , p_prestamo.numero
      , p_prestamo.tcam_sal
      , p_prestamo.ctactble
      );
    cuenta_diferencia_cambio(p_vencimiento);
    cuenta_interes_cargo(
        p_vencimiento
      , p_prestamo.interes
      , p_prestamo.moneda
      , p_prestamo.numero
      );
    cuenta_interes_abono(
        p_vencimiento
      , p_prestamo.interes
      , p_prestamo.moneda
      , p_prestamo.cod_proveedor
      , p_prestamo.tipdoc
      , p_prestamo.serie_num
      , p_prestamo.numero
      , p_prestamo.tcam_sal
      );
    cuenta_cargas_financieras(p_vencimiento);
    cuenta_diferencia_cambio(p_vencimiento);
  end;


  procedure genera_asiento_maestro(
    p_vencimiento date
  , p_prestamo    pagares_vencidos_cur%rowtype
  ) is
    l_glosa      varchar2(40);
    l_a_la_orden varchar2(100);
    l_doc        varchar2(5);
  begin
    if p_prestamo.tipdoc = '25' then
      l_doc := 'FI';
    elsif p_prestamo.tipdoc = '26' then
      l_doc := 'CT';
    end if;

    l_glosa := 'PAGARE ' || l_doc || ' ' || p_prestamo.numero || ' CUOTA ' || p_prestamo.serie_num;
    l_a_la_orden := api_proveed.onerow(p_prestamo.cod_proveedor).nombre;

    pkg_finanzas_api.insert_movfigl(
        p_ano => g_ano
      , p_mes => g_mes
      , p_tipo => k_tipo
      , p_voucher => g_voucher
      , p_item => 1
      , p_fecha => p_vencimiento
      , p_glosa => l_glosa
      , p_fpaga => 'A'
      , p_banco => p_prestamo.banco
      , p_numero => '00000060'
      , p_importe => p_prestamo.saldo
      , p_estado => 0
      , p_pase_cta_cte => k_si
      , p_pase_cta_cte_pro => k_si
      , p_a_la_orden => l_a_la_orden
      , p_moneda => p_prestamo.moneda
      , p_usuario => user
      , p_fec_reg => p_vencimiento
      , p_tipo_mov => 'CRE'
      , p_cod_cliente => p_prestamo.cod_proveedor
      , p_tipo_cambio => 'V'
      , p_sistema => 'FME'
      , p_nro_planilla => null
      );
  end;


  procedure envia_correo(
    p_mensaje            varchar2
  , p_pagares_cancelados pls_integer
  , p_fecha              date
  ) is
    l_mensaje varchar2(500)
      := 'Los siguientes pagares de HDI se cancelaron el ' ||
         to_char(p_fecha, k_fmt) ||
         ':' || chr(10) || chr(10);
  begin
    if p_pagares_cancelados > 0 then
      l_mensaje := rtrim(l_mensaje) || p_mensaje;
      enviar_correo(
          'sistemas@pevisa.com.pe'
        , 'cnavarro@pevisa.com.pe'
        , 'HDI CANCELACION AUTOMATICA DE PAGARES (' || to_char(p_fecha, k_fmt) || ')'
        , l_mensaje
        );
      enviar_correo(
          'sistemas@pevisa.com.pe'
        , 'mdiaz@pevisa.com.pe'
        , 'HDI CANCELACION AUTOMATICA DE PAGARES (' || to_char(p_fecha, k_fmt) || ')'
        , l_mensaje
        );
    end if;
  end;


  procedure cancela_cuotas(
    p_vencimiento date default trunc(sysdate)
  ) is
    l_vouchers_generados varchar2(500);
    l_total_registros    pls_integer := 0;
  begin
    for rec in pagares_vencidos_cur(p_vencimiento) loop
      init(p_vencimiento, rec.cod_banco, rec.moneda);
      genera_asiento_maestro(p_vencimiento, rec);
      genera_asiento_detalle(p_vencimiento, rec);
      l_vouchers_generados :=
            rtrim(l_vouchers_generados) || g_ano || ' ' || g_mes || ' ' ||
            k_tipo || ' ' ||
            g_voucher || ' ' || chr(10);
      l_total_registros := l_total_registros + 1;
    end loop;

    envia_correo(l_vouchers_generados, l_total_registros, p_vencimiento);
    commit;
  exception
    when others then
      /* Use the standard error logging mechanism. */
      if sqlcode not between -20999 and -20000 then
        logger.log_error('VENCIMIENTO: ' || to_char(p_vencimiento, k_fmt));
      end if;

      rollback;
      raise;
  end;


  procedure cancela_cuotas(
    p_vencimiento date
  , p_pago        date
  ) is
    l_vouchers_generados varchar2(500);
    l_total_registros    pls_integer := 0;
  begin
    for rec in pagares_vencidos_cur(p_vencimiento) loop
      init(p_pago, rec.cod_banco, rec.moneda);
      genera_asiento_maestro(p_pago, rec);
      genera_asiento_detalle(p_pago, rec);

      l_vouchers_generados :=
            rtrim(l_vouchers_generados) || g_ano || ' ' || g_mes || ' ' ||
            k_tipo || ' ' ||
            g_voucher || ' ' || chr(10);
      l_total_registros := l_total_registros + 1;
    end loop;

    envia_correo(l_vouchers_generados, l_total_registros, p_pago);
    commit;
  exception
    when others then
      rollback;
  end;
end;
