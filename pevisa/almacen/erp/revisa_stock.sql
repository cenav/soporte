-- revisa fecha sin hora
select *
  from kardex_d d
 where d.fch_transac != trunc(d.fch_transac)
   and extract(year from d.fch_transac) = 2024
   and extract(month from d.fch_transac) in (8, 9)
   and d.cod_alm not like 'A%';

-- stock total por almacén
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

-- stock total por artículo
select a.cod_art
     , a.cod_alm
     , a.stock as stock_alm
     , nvl((
             select sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
               from kardex_d d
              where d.estado <> '9'
                and d.cod_art = a.cod_art
                and d.cod_art = :p_articulo
              group by d.cod_art
             ), 0) as stock_kdx
  from almacen a
 where a.cod_art = :p_articulo
   and a.stock <> nvl(
     (
       select sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
         from kardex_d d
        where d.estado <> '9'
          and d.cod_art = a.cod_art
          and d.cod_art = :p_articulo
        group by d.cod_art
       ), 0);


select d.cod_alm, sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
 where d.estado <> '9'
   and d.cod_art = :p_articulo
 group by d.cod_alm, d.cod_art;

select *
  from almacen
 where cod_art = 'MAT4 90020';

select d.cod_alm, sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
 where d.estado <> '9'
   and d.cod_art = :p_articulo
   and d.fch_transac < to_date('01/03/2025', 'dd/mm/yyyy')
 group by d.cod_alm, d.cod_art;

select d.*
  from kardex_d d
 where d.estado <> '9'
   and d.cod_art = :p_articulo
--    and d.cod_alm = 'TD'
   and d.fch_transac >= to_date('01/03/2025', 'dd/mm/yyyy')
 order by fch_transac, ing_sal desc;


/*
433
489
530
*/

select *
  from kardex_g
 where cod_alm = 'M4'
   and tp_transac = '35'
   and serie = 140
   and numero in (2918, 2964);

select *
  from almacenes
 where cod_alm = 'M1';

select *
  from transacciones_almacen
 where tp_transac in ('10', '35');

-- MAT1 92046
-- MAT1 95120
-- MAT1 95300
-- MAT1 180.761CS-1 -2
-- MAT1 180.761CS-3 -2
-- MAT1 180.789ZN-2
-- MAT1 200.1535CS-1 -2
-- MAT1 200.1703CS-1 -2

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

select * from tmp_carga_data;

-- stock por almacen
select cod_alm, cod_art
     , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
 where d.estado != '9'
   and d.cod_alm = :p_almacen
having sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) > 0
 group by d.cod_alm, d.cod_art;

select *
  from kardex_d
 where cod_alm = '01'
   and estado != '9'
   and cod_art = '200.1656';

-- stock por artículo
  with tabla as (
    select cod_alm, cod_art, stock
      from almacen
     where cod_art = :p_articulo
    )
select d.cod_alm, d.cod_art
     , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
     , a.stock as stock_tabla
  from kardex_d d
       left join almacen a on d.cod_alm = a.cod_alm and d.cod_art = a.cod_art
 where d.estado != '9'
   and d.cod_art = :p_articulo
 group by d.cod_alm, d.cod_art, a.stock;


-- stock a la fecha
select d.cod_alm, d.cod_art
     , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
 where d.estado != '9'
   and d.cod_art = :p_articulo
   and d.fch_transac <= to_date('31/08/2024', 'dd/mm/yyyy')
 group by d.cod_alm, d.cod_art;


-- hasta julio
select d.cod_alm, d.cod_art
     , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
 where d.estado != '9'
   and d.cod_art = :p_articulo
   and d.fch_transac <= to_date('31/07/2024', 'dd/mm/yyyy')
 group by d.cod_alm, d.cod_art;

-- solo agosto
select d.cod_alm, d.cod_art
     , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
 where d.estado != '9'
   and d.cod_art = :p_articulo
   and extract(year from d.fch_transac) = 2024
   and extract(month from d.fch_transac) = 8
 group by d.cod_alm, d.cod_art;

-- hasta agosto
select d.cod_alm, d.cod_art
     , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
 where d.estado != '9'
   and d.cod_art = :p_articulo
   and d.fch_transac <= to_date('31/08/2024', 'dd/mm/yyyy')
 group by d.cod_alm, d.cod_art;


select *
  from kardex_d d
 where d.estado != '9'
   and d.cod_art = :p_articulo
   and extract(year from d.fch_transac) = 2024
   and extract(month from d.fch_transac) = 8;

select *
  from transacciones_almacen
 where tp_transac = '55';

select *
  from kardex_d_historia
 where cod_art = :p_articulo;

select *
  from kardex_g_historia
 where cod_alm = 'F0'
   and tp_transac = '55'
   and extract(year from fecha) = 2024;

select *
  from transacciones_almacen
 where descripcion like '%FALTANTE%';

select *
  from solicita_cambio_trx_det
 where cod_alm = 'F0'
   and extract(year from fch_transac_old) = 2024
   and extract(month from fch_transac_old) = 8
 order by fch_transac_old desc;

select *
  from solicita_cambio_trx
 where id_solicitud in (
                        2984, 2970, 2913
   );

select *
  from almacen
 where cod_art in (
   '95330MLS'
   );

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

select *
  from almacen
 where cod_art in (
                   'CAJA EXT 059X32X48', 'CAJA EXT 085X32X48'
   )
   and cod_alm in ('03', '24')
 order by cod_art;

select cod_alm, cod_art
     , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
 where d.estado != '9'
   and d.cod_alm in ('03', '24')
   and d.cod_art in (
                     'CAJA EXT 059X32X48', 'CAJA EXT 085X32X48'
   )
 group by d.cod_alm, d.cod_art;

-- stock almacen 01
select d.cod_art, a.cod_lin, sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
       join articul a on d.cod_art = a.cod_art
 where d.estado <> '9'
   and d.cod_alm = :p_almacen
having sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) > 0
 group by d.cod_alm, d.cod_art, a.cod_lin;

-- hasta 31 12 2024
select cod_alm, cod_art
     , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
 where d.estado != '9'
   and d.cod_alm = :p_almacen
   and d.cod_art = :p_articulo
   and d.fch_transac < to_date('01/01/2025', 'dd/mm/yyyy')
 group by d.cod_alm, d.cod_art;

-- movimientos enero 2025
select cod_alm, t.tp_transac, t.descripcion, ing_sal, cod_art, d.fch_transac
     , decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad) as stock
  from kardex_d d
       join transacciones_almacen t on d.tp_transac = t.tp_transac
 where d.estado != '9'
   and d.cod_alm = :p_almacen
   and d.cod_art = :p_articulo
   and d.fch_transac >= to_date('01/01/2025', 'dd/mm/yyyy')
 order by fch_transac;

select cod_alm, cod_art
     , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
 where d.estado != '9'
   and d.cod_alm = :p_almacen
   and d.cod_art = :p_articulo
 group by d.cod_alm, d.cod_art;

select d.cod_alm, d.cod_art, a.cod_lin
     , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
       join articul a on d.cod_art = a.cod_art
 where d.estado != '9'
   and d.cod_alm = '01'
   and a.cod_lin = 'ZZ'
having sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) > 0
 group by d.cod_alm, d.cod_art, a.cod_lin;