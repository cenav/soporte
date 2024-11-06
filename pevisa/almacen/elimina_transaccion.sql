declare
  -- Anula transacciones masivo
  l_total_g simple_integer := 0;
  l_total_d simple_integer := 0;

  cursor trx is
--     select cod_alm, tp_transac, serie, numero
--       from tmp_carga_data;
--     select g.*
--       from kardex_g g
--            join kardex_g_historia h
--                 on g.cod_alm = h.cod_alm
--                   and g.tp_transac = h.tp_transac
--                   and g.serie = h.serie
--                   and g.numero = h.numero
--      where trunc(h.fecha) = to_date('10/09/2024', 'dd/mm/yyyy')
--        and h.usuario = 'PEVISA'
--      order by ing_sal desc;
    select *
      from kardex_g
     where cod_alm = '15'
       and tp_transac = '29'
       and serie = 1
       and numero in (
                      1858318, 1858420, 1858430, 1858249, 1858437, 1858250, 1858252, 1858430,
                      1858095, 1858253, 1858097, 1858258, 1858098, 1858259, 1858078, 1858260,
                      1858084, 1858449, 1858451, 1858261, 1858446, 1858070, 1858229
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

select *
  from almacen
 where cod_art in (
                   'PUB116-0302001', 'PUB116-0201001'
   );

select *
  from transacciones_almacen
 where tp_transac in ('06', '27', '29');

select *
  from kardex_g
 where cod_alm = '08'
   and tp_transac = '06'
   and serie = 1
   and numero in (
   818171
   )
 order by ing_sal desc, numero_pguia;

-- 15-29-1-1858318
-- 18-29-1-1858244
-- 18-29-1-1858319
-- 18-29-1-1858247
-- 15-29-1-1858420
-- 18-29-1-1858248
-- 15-29-1-1858430
-- 15-29-1-1858322
-- 15-29-1-1858432
-- 15-29-1-1858434
-- 18-29-1 1858249
-- 15-29-1-1858251
-- 15-29-1-1858437
-- 18-29-1-1858250
-- 18-29-1-1858252
-- 15-29-1-1858430
-- 18-29-1-1858074
-- 09-29-1-1858095
-- 15-29-1-1858253
-- 15-29-1-1858254
-- 15-29-1-1858255
-- 15-29-1-1858097
-- 15-29-1-1858256
-- 15-29-1-1858257
-- 15-29-1-1858258
-- 15-29-1-1858098
-- 15-29-1-1858259
-- 15-29-1-1858078
-- 15-29-1-1858260
-- 37-29-1-1858084
-- 15-29-1-1858449
-- 15-29-1-1858451
-- 15-29-1-1858261
-- 15-29-1-1858446
-- 15-29-1-1858070
-- 15-29-1-1858226
-- 15-29-1-1858229