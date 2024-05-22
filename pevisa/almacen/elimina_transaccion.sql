declare
  -- Anula transacciones masivo
  l_total simple_integer := 0;

  cursor trx is
    select cod_alm, tp_transac, serie, numero
      from tmp_carga_data
     where cod_alm in ('37');
--     select *
--       from kardex_g
--      where cod_alm = '37'
--        and tp_transac = '18'
--        and serie = 2
--        and numero = 574885
--      order by ing_sal desc, numero_pguia;
begin
  for r in trx loop
    delete
      from kardex_g
     where cod_alm = r.cod_alm
       and tp_transac = r.tp_transac
       and serie = r.serie
       and numero = r.numero;

    l_total := l_total + sql%rowcount;

    delete
      from kardex_d
     where cod_alm = r.cod_alm
       and tp_transac = r.tp_transac
       and serie = r.serie
       and numero = r.numero;

    l_total := l_total + sql%rowcount;
  end loop;

  dbms_output.put_line('total eliminado >>>>> ' || l_total);
end;