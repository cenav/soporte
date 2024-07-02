declare
  -- LIBRO 08
  l_ano     movglos.ano%type;
  l_mes     movglos.mes%type;
  l_libro   movglos.libro%type;
  l_voucher movglos.voucher%type;

  cursor cr_archivo is
    select cod_relacion as cod_proveedor, tipdoc_cp as tipdoc, serie_cp as serie_num, numero_cp as numerodoc
      from view_kardex_reg_compras
     where ano = 2024
       and mes = 4
       and voucher is null
     group by cod_relacion, tipdoc_cp, serie_cp, numero_cp;
begin
  for r in cr_archivo loop
    begin
      select ano, mes, libro, voucher
        into l_ano, l_mes, l_libro, l_voucher
        from movglos
       where cod_proveed = r.cod_proveedor
         and tipo_referencia = r.tipdoc
         and serie = r.serie_num
         and nro_referencia = lpad(r.numerodoc, 7, '0');

      update kardex_g_movglos
         set ano     = l_ano
           , mes     = l_mes
           , libro   = l_libro
           , voucher = l_voucher
       where cod_proveedor = r.cod_proveedor
         and tipdoc_cp = r.tipdoc
         and serie_cp = r.serie_num
         and numero_cp = r.numerodoc;
    exception
      when no_data_found then
        dbms_output.put_line(r.cod_proveedor || '-' || r.tipdoc || '-' || r.serie_num || '-' || r.numerodoc);
    end;
  end loop;
end;

declare
  -- LIBRO 05
  l_ano     movglos.ano%type;
  l_mes     movglos.mes%type;
  l_libro   movglos.libro%type;
  l_voucher movglos.voucher%type;

  cursor cr_archivo is
    select cod_relacion as cod_proveedor, tipdoc_cp as tipdoc, serie_cp as serie_num, numero_cp as numerodoc
      from view_kardex_reg_compras
     where ano = 2024
       and mes = 4
       and voucher is null
     group by cod_relacion, tipdoc_cp, serie_cp, numero_cp;

  function falta_voucher(
    p_cod_proveedor kardex_g_movglos.cod_proveedor%type
  , p_tipdoc_cp     kardex_g_movglos.tipdoc_cp%type
  , p_serie_cp      kardex_g_movglos.serie_cp%type
  , p_numero_cp     kardex_g_movglos.numero_cp%type
  ) return boolean
  as
    l_var simple_integer := 0;
  begin
    select count(*)
      into l_var
      from kardex_g_movglos
     where cod_proveedor = p_cod_proveedor
       and tipdoc_cp = p_tipdoc_cp
       and serie_cp = p_serie_cp
       and numero_cp = p_numero_cp
       and voucher is null;

    return l_var > 0;
  end;
begin
  for r in cr_archivo loop
    if falta_voucher(r.cod_proveedor, r.tipdoc, r.serie_num, r.numerodoc) then
      begin
        select ano, mes, libro, voucher
          into l_ano, l_mes, l_libro, l_voucher
          from movdeta
         where libro = '05'
           and nvl(estado, '0') != '9'
           and relacion = r.cod_proveedor
           and tipo_referencia = r.tipdoc
           and serie = r.serie_num
           and nro_referencia = lpad(r.numerodoc, 7, '0');

        update kardex_g_movglos
           set ano     = l_ano
             , mes     = l_mes
             , libro   = l_libro
             , voucher = l_voucher
         where cod_proveedor = r.cod_proveedor
           and tipdoc_cp = r.tipdoc
           and serie_cp = r.serie_num
           and numero_cp = r.numerodoc;
      exception
        when others then
          dbms_output.put_line(r.cod_proveedor || '-' || r.tipdoc || '-' || r.serie_num || '-' ||
                               r.numerodoc);
      end;
    end if;
  end loop;
end;

-- vouchers del mes
declare
  l_ano     movglos.ano%type;
  l_mes     movglos.mes%type;
  l_libro   movglos.libro%type;
  l_voucher movglos.voucher%type;

  cursor cr_archivo is
    select cod_relacion as cod_proveedor, tipdoc_cp as tipdoc, serie_cp as serie_num, numero_cp as numerodoc
         , cod_art, ano, mes, libro, voucher
      from view_kardex_reg_compras
     where ano = 2024
       and mes = 5
--        and libro = '10'
       and voucher is null
--        and voucher like '2%'
--      and cod_art = 'SLIM400.777'
     group by cod_relacion, tipdoc_cp, serie_cp, numero_cp, ano, mes, voucher, cod_art, libro;
begin
  for r in cr_archivo loop
    begin
        with vouchers as (
          select ano, mes, libro, voucher
               , case libro
                   when '08' then 1
                   when '05' then 2
                   when '40' then 3
                   else 99
                 end as orden
            from movdeta
           where relacion = r.cod_proveedor
             and tipo_referencia = r.tipdoc
             and serie = r.serie_num
             and nro_referencia = lpad(r.numerodoc, 7, '0')
             and libro not in ('10')
             and ano = r.ano
             and mes = r.mes
           order by orden
          )
      select v.ano, v.mes, v.libro, v.voucher
        into l_ano, l_mes, l_libro, l_voucher
        from vouchers v
       where rownum = 1;

--       if r.voucher != l_voucher then
      update kardex_g_movglos
         set ano     = l_ano
           , mes     = l_mes
           , libro   = l_libro
           , voucher = l_voucher
       where cod_proveedor = r.cod_proveedor
         and tipdoc_cp = r.tipdoc
         and serie_cp = r.serie_num
         and numero_cp = r.numerodoc;
--       end if;
    exception
      when no_data_found then
        dbms_output.put_line(r.cod_proveedor || '-' || r.tipdoc || '-' || r.serie_num || '-' || r.numerodoc);
      when too_many_rows then
        dbms_output.put_line(r.cod_proveedor || '-' || r.tipdoc || '-' || r.serie_num || '-' || r.numerodoc);
    end;
  end loop;
end;