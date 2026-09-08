-- revisa stock
  with stock_kardex as (
    select d.cod_alm, d.cod_art
         , nvl((sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad))), 0) as stock_kdx
      from kardex_d d
     where d.estado <> '9'
     group by d.cod_alm, d.cod_art
    )
select a.cod_art, a.cod_alm, nvl(a.stock, 0) as stock_alm, nvl(s.stock_kdx, 0) as stock_kdx
  from almacen a
       left join stock_kardex s
                 on a.cod_alm = s.cod_alm
                   and a.cod_art = s.cod_art
 where nvl(a.stock, 0) <> nvl(s.stock_kdx, 0)
 order by a.cod_alm;

-- valida merge antes de cambiar
  with stock_kardex as (
    select d.cod_alm, d.cod_art
         , sum(decode(d.ing_sal, 'S', -d.cantidad, d.cantidad)) as stock_kdx
      from kardex_d d
     where d.estado <> '9'
     group by d.cod_alm, d.cod_art
    )
select a.cod_alm, a.cod_art, nvl(a.stock, 0) as stock_tabla
     , nvl(s.stock_kdx, 0) as stock_kardex
  from almacen a
       left join stock_kardex s
                 on s.cod_alm = a.cod_alm
                   and s.cod_art = a.cod_art
 where nvl(a.stock, 0) <> nvl(s.stock_kdx, 0)
   and nvl(s.stock_kdx, 0) >= 0
 order by a.cod_alm, a.cod_art;

-- actualiza diferencia de stock entre kardex y almacen
-- el stock se iguala al kardex siempre
merge into almacen a
using (
    with stock_kardex as (
      select d.cod_alm, d.cod_art
           , sum(decode(d.ing_sal, 'S', -d.cantidad, d.cantidad)) as stock_kdx
        from kardex_d d
       where d.estado <> '9'
       group by d.cod_alm, d.cod_art
      )
  select a2.cod_alm, a2.cod_art, nvl(s.stock_kdx, 0) as stock_kdx
    from almacen a2
         left join stock_kardex s
                   on s.cod_alm = a2.cod_alm
                     and s.cod_art = a2.cod_art
   where nvl(a2.stock, 0) <> nvl(s.stock_kdx, 0)
     and nvl(s.stock_kdx, 0) >= 0
    ) x
on (
  a.cod_alm = x.cod_alm
    and a.cod_art = x.cod_art
  )
when matched then
  update
     set a.stock = x.stock_kdx;

-- valida kardex_d diferente a articul.s_act
  with stock_kardex as (
    select d.cod_art
         , sum(decode(d.ing_sal, 'S', -d.cantidad, d.cantidad)) as stock_kdx
      from kardex_d d
     where d.estado <> '9'
     group by d.cod_art
    )
select a.cod_art, nvl(a.s_act, 0) as stock_articul, nvl(s.stock_kdx, 0) as stock_kardex
     , nvl(a.s_act, 0) - nvl(s.stock_kdx, 0) as diferencia
  from articul a
       left join stock_kardex s
                 on s.cod_art = a.cod_art
 where nvl(a.s_act, 0) <> nvl(s.stock_kdx, 0)
 order by a.cod_art;

-- actualiza diferencia de stock entre kardex y articul.s_act
-- el stock se iguala al kardex siempre
merge into articul a
using (
    with stock_kardex as (
      select d.cod_art
           , sum(decode(d.ing_sal, 'S', -d.cantidad, d.cantidad)) as stock_kdx
        from kardex_d d
       where d.estado <> '9'
       group by d.cod_art
      )
  select a2.cod_art, nvl(s.stock_kdx, 0) as stock_kdx
    from articul a2
         left join stock_kardex s
                   on s.cod_art = a2.cod_art
   where nvl(a2.s_act, 0) <> nvl(s.stock_kdx, 0)
    ) x
on (
  a.cod_art = x.cod_art
  )
when matched then
  update
     set a.s_act = x.stock_kdx;