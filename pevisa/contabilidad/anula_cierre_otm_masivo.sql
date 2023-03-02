declare
  /* Anulacion de OT activo fijo */
  c_tipo_asiento   constant varchar2(30) := 'ACTIVO';

  ot                        ot_mantto%rowtype;
  es_activo_instalado       boolean;

  cursor cr_ot_anular is
    select *
      from ot_mantto
     where id_tipo = 'MQ'
       and id_serie = 7
       and id_numero in (
       5734
       );

  cursor cr_activos_anular(p_tipo varchar2, p_serie number, p_numero number) is
    select *
      from activo_fijo
     where otm_tipo = p_tipo and otm_serie = p_serie and otm_numero = p_numero;

  function voucher_anulado(
    p_codactivo activo_fijo.cod_activo_fijo%type
  ) return boolean is
    l_anulado   pls_integer := 0;
    l_eliminado pls_integer := 0;
  begin
    select count(*)
      into l_anulado
      from activo_fijo_asiento a
           join movglos m on a.ano = m.ano and a.mes = m.mes and a.libro = m.libro and a.voucher = m.voucher
     where a.cod_activo_fijo = p_codactivo
       and a.cod_tipo = c_tipo_asiento
       and m.estado = '9';

    select count(*)
      into l_eliminado
      from activo_fijo_asiento a
           join movglos m on a.ano = m.ano and a.mes = m.mes and a.libro = m.libro and a.voucher = m.voucher
     where a.cod_activo_fijo = p_codactivo
       and a.cod_tipo = c_tipo_asiento
       and m.estado != '9';

    return l_anulado > 0 or l_eliminado = 0;
  end;

  function voucher_anulado(
    p_ot ot_mantto%rowtype
  ) return boolean is
    c pls_integer := 0;
  begin
    select count(*)
      into c
      from movglos
     where ano = p_ot.cierre_ano
       and mes = p_ot.cierre_mes
       and libro = p_ot.cierre_libro
       and voucher = p_ot.cierre_voucher
       and estado = '9';

    return c > 0;
  end;

  procedure anula_salida_almacen(
    p_alm kardex_g.cod_alm%type
  , p_trx kardex_g.tp_transac%type
  , p_ser kardex_g.serie%type
  , p_num kardex_g.numero%type
  ) is
  begin
    delete kardex_d
     where cod_alm = p_alm and tp_transac = p_trx and serie = p_ser and numero = p_num;

    delete kardex_g
     where cod_alm = p_alm and tp_transac = p_trx and serie = p_ser and numero = p_num;
  end;

  procedure actualiza_estado(
    p_tipo   varchar2
  , p_serie  number
  , p_numero number
  ) is
  begin
    update ot_mantto
       set estado                 = decode(p_tipo, 'MQ', 1, 3)
         , total_servicio_soles   = 0
         , total_servicio_dolares = 0
         , total_repuesto_soles   = 0
         , total_repuesto_dolares = 0
         , total_soles            = 0
         , total_dolares          = 0
         , registro_contable      = null
         , cierre_ano             = null
         , cierre_mes             = null
         , cierre_libro           = null
         , cierre_voucher         = null
         , fecha_cierre           = null
         , usuario_cierre         = null
     where id_tipo = p_tipo and id_serie = p_serie and id_numero = p_numero;
  end;
begin
  for rc in cr_ot_anular loop
    ot := api_ot_mantto.onerow(rc.id_tipo, rc.id_serie, rc.id_numero);

    case ot.registro_contable
      when 'ACTIVO' then
        for r in cr_activos_anular(rc.id_tipo, rc.id_serie, rc.id_numero) loop
          if not voucher_anulado(r.cod_activo_fijo) then
            raise_application_error(-20001, 'anular voucher de activacion ' || r.cod_activo_fijo);
          end if;

          es_activo_instalado := ot.id_activo_fijo = r.cod_activo_fijo;

          if es_activo_instalado then
            api_activo_fijo_asiento.del(r.cod_activo_fijo, c_tipo_asiento);
            anula_salida_almacen(r.activacion_almacen, r.activacion_tp_transac, r.activacion_serie,
                                 r.activacion_numero);
          else
            api_activo_fijo.del(r.cod_activo_fijo);
            api_pcarticul.del(r.cod_activo_fijo);
          end if;

          actualiza_estado(rc.id_tipo, rc.id_serie, rc.id_numero);
        end loop;
      when 'GASTO' then
        if not voucher_anulado(ot) and ot.cierre_voucher is not null then
          raise_application_error(-20002, 'anular voucher gasto '
            || ot.cierre_ano
            || '-'
            || ot.cierre_mes
            || '-'
            || ot.cierre_libro
            || '-'
            || ot.cierre_voucher);
        end if;

        actualiza_estado(rc.id_tipo, rc.id_serie, rc.id_numero);
    end case;
  end loop;

  commit;
exception
  when others then
    if sqlcode not between -20999 and -20000 then
      logger.log_error('Anulacion de OTM');
    end if;

    rollback;
    raise;
end;