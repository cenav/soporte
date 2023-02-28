create or replace package body utilconta as

  procedure asiento_sin_detalle(
    p_ano simple_integer
  , p_mes simple_integer
  ) is
  begin
    delete
      from movglos g
     where g.ano = p_ano
       and g.mes = p_mes
       and not exists(
         select 1
           from movdeta d
          where d.ano = g.ano
            and d.mes = g.mes
            and d.libro = g.libro
            and d.voucher = g.voucher
       );
  end;

  procedure asiento_sin_detalle is
  begin
    asiento_sin_detalle(extract(year from sysdate), extract(month from sysdate));
  end;

  procedure completa_cero(
    p_ano simple_integer
  , p_mes simple_integer
  ) is
  begin
    update movdeta
       set tipo_referencia = '00'
     where ano = p_ano
       and mes = p_mes
       and tipo_referencia is null;

    update movdeta
       set serie = '0000'
     where ano = p_ano
       and mes = p_mes
       and serie is null;

    update movdeta
       set nro_referencia = '0000000'
     where ano = p_ano
       and mes = p_mes
       and nro_referencia is null;
  end;

  procedure completa_cero is
  begin
    completa_cero(extract(year from sysdate), extract(month from sysdate));
  end;

  procedure elimina_relacion(
    p_ano simple_integer
  , p_mes simple_integer
  ) is
  begin
    update movdeta
       set tipo_relacion = null
     where ano = p_ano
       and mes = p_mes
       and relacion is null
       and tipo_relacion is not null;
  end;

  procedure elimina_relacion is
  begin
    elimina_relacion(extract(year from sysdate), extract(month from sysdate));
  end;

  procedure agrega_relacion(
    p_ano simple_integer
  , p_mes simple_integer
  ) is
    l_ano simple_integer := 0;
  begin
    for r in (
      select *
        from movdeta
       where ano = p_ano
         and mes = p_mes
         and relacion is not null
         and tipo_relacion is null
      )
    loop
      if api_proveed.row_exists(r.relacion) then
        update movdeta
           set tipo_relacion = 'P'
         where ano = r.ano
           and mes = r.mes
           and libro = r.libro
           and voucher = r.voucher
           and relacion = r.relacion;
      end if;
      if api_vw_personal.exist(r.relacion) then
        update movdeta
           set tipo_relacion = 'T'
         where ano = r.ano
           and mes = r.mes
           and libro = r.libro
           and voucher = r.voucher
           and relacion = r.relacion;
      end if;
      if api_centro_de_costos.row_exists(r.relacion) then
        update movdeta
           set tipo_relacion = 'U'
         where ano = r.ano
           and mes = r.mes
           and libro = r.libro
           and voucher = r.voucher
           and relacion = r.relacion;
      end if;
      if api_clientes.exist(r.relacion) then
        update movdeta
           set tipo_relacion = 'C'
         where ano = r.ano
           and mes = r.mes
           and libro = r.libro
           and voucher = r.voucher
           and relacion = r.relacion;
      end if;
    end loop;
  end;

  procedure agrega_relacion is
  begin
    agrega_relacion(extract(year from sysdate), extract(month from sysdate));
  end;

end;