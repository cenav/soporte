declare
  -- Anula transacciones de forma masiva
  l_total_g simple_integer := 0;
  l_total_d simple_integer := 0;

--   cursor trx is --> transacciones de una orden por codigo de pieza
--     select *
--       from kardex_g
--      where exists (
--        select *
--          from kardex_d
--         where kardex_g.cod_alm = kardex_d.cod_alm
--           and kardex_g.tp_transac = kardex_d.tp_transac
--           and kardex_g.serie = kardex_d.serie
--           and kardex_g.numero = kardex_d.numero
--           and pr_tipot = 'PR'
--           and pr_numot = 590741
--           and cod_art in ('RIBX 90003', 'RING 90003N')
--        );


--   TD	10	140	2964
  cursor trx is --> por número de transaccion
    select *
      from kardex_g
     where cod_alm = '03'
       and tp_transac = '08'
       and serie = 1
       and numero in (
       26182
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