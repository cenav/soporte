declare
  -- Anula transacciones masivo
  l_total_g simple_integer := 0;
  l_total_d simple_integer := 0;

  cursor trx is
--     select cod_alm, tp_transac, serie, numero
--       from tmp_carga_data;
    select g.*
      from kardex_g g
           join kardex_g_historia h
                on g.cod_alm = h.cod_alm
                  and g.tp_transac = h.tp_transac
                  and g.serie = h.serie
                  and g.numero = h.numero
     where trunc(h.fecha) = to_date('10/09/2024', 'dd/mm/yyyy')
       and h.usuario = 'PEVISA'
     order by ing_sal desc;
--     select *
--       from kardex_g
--      where cod_alm = '37'
--        and tp_transac = '16'
--        and serie = 1
--        and numero in (
--        204493
--        )
--      order by ing_sal desc, numero_pguia;
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

select *
  from almacen
 where cod_art in (
                   'PUB116-0302001', 'PUB116-0201001'
   );
