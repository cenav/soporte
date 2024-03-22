select a.cod_art
     , a.cod_alm
     , a.stock as stock_alm
     , nvl((
             select sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
               from kardex_d d
              where d.estado <> '9'
                and d.cod_art = a.cod_art
                and d.cod_alm = :p_almacen
              group by d.cod_alm, d.cod_art
             ), 0) as stock_kdx
  from almacen a
 where a.cod_alm = :p_almacen
   and a.stock <> nvl(
     (
       select sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
         from kardex_d d
        where d.estado <> '9'
          and d.cod_art = a.cod_art
          and d.cod_alm = :p_almacen
        group by d.cod_alm, d.cod_art
       ), 0);

-- compara stock
select 'TABLA' as origen, cod_alm, cod_art, stock
  from almacen
 where cod_alm = :p_almacen
   and cod_art = :p_articulo
 union all
select 'KARDEX' as origen, cod_alm, cod_art
     , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
 where d.estado != '9'
   and d.cod_alm = :p_almacen
   and d.cod_art = :p_articulo
 group by d.cod_alm, d.cod_art;

-- revisa stock
select a.cod_art, a.cod_alm, a.stock as stock_alm
     , nvl((
             select sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
               from kardex_d d
              where d.estado <> '9'
                and d.cod_art = a.cod_art
                and d.cod_alm = :P_ALMACEN
              group by d.cod_alm, d.cod_art
             ), 0) as stock_kdx
  from almacen a
 where a.cod_alm = :P_ALMACEN
   and a.stock <> nvl(
     (
       select sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
         from kardex_d d
        where d.estado <> '9'
          and d.cod_art = a.cod_art
          and d.cod_alm = :P_ALMACEN
        group by d.cod_alm, d.cod_art
       ), 0);


-- actualiza kardex
begin
  for r in (
    select a.cod_art
         , a.cod_alm
         , a.stock as stock_alm
         , nvl((
                 select sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
                   from kardex_d d
                  where d.estado <> '9'
                    and d.cod_art = a.cod_art
                    and d.cod_alm = :P_ALMACEN
                  group by d.cod_alm, d.cod_art
                 ), 0) as stock_kdx
      from almacen a
     where a.cod_alm = :P_ALMACEN
       and a.stock <> nvl(
         (
           select sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
             from kardex_d d
            where d.estado <> '9'
              and d.cod_art = a.cod_art
              and d.cod_alm = :P_ALMACEN
            group by d.cod_alm, d.cod_art
           ), 0)
    )
  loop
    if r.stock_kdx >= 0 then
      update almacen
         set stock = r.stock_kdx
       where cod_art = r.cod_art
         and cod_alm = r.cod_alm;
    end if;
  end loop;
end;

select *
  from almacen
 where cod_art = 'PARALELA 2 MAT2 1547DCS-4';


select *
  from kardex_d
 where cod_art = 'PARALELA 2 MAT2 1547DCS-4';