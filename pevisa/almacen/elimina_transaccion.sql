declare
  -- Anula transacciones masivo
  l_total_g simple_integer := 0;
  l_total_d simple_integer := 0;

  cursor trx is
--     select cod_alm, tp_transac, serie, numero
--       from tmp_carga_data;
    select *
      from kardex_g
     where cod_alm = 'FT'
       and tp_transac = '06'
       and serie = 1
       and numero in (
       800105
       )
     order by ing_sal desc, numero_pguia;
begin
  for r in trx loop
    delete
      from kardex_g
     where cod_alm = r.cod_alm
       and tp_transac = r.tp_transac
       and serie = r.serie
       and numero = r.numero;

    l_total_g := l_total_g + sql%rowcount;

    delete
      from kardex_d
     where cod_alm = r.cod_alm
       and tp_transac = r.tp_transac
       and serie = r.serie
       and numero = r.numero;

    l_total_d := l_total_d + sql%rowcount;
  end loop;

  dbms_output.put_line('total eliminado kardex_g >>>>> ' || l_total_g);
  dbms_output.put_line('total eliminado kardex_d >>>>> ' || l_total_d);
end;

select cod_alm, tp_transac, serie, numero
  from tmp_carga_data;