-- 31 ALM CHATARRA

-- revisa stock
  with stock_kardex as (
    select d.cod_alm, d.cod_art
         , nvl((sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad))), 0) as stock_kdx
      from kardex_d d
           join almacen_local al on d.cod_alm = al.cod_alm
     where d.estado <> '9'
     group by d.cod_alm, d.cod_art
    )
select a.cod_art, a.cod_alm, nvl(a.stock, 0) as stock_alm, nvl(s.stock_kdx, 0) as stock_kdx
  from almacen a
       left join stock_kardex s
                 on a.cod_alm = s.cod_alm
                   and a.cod_art = s.cod_art
 where a.stock <> s.stock_kdx
   and a.cod_art = 'FOR3913'
   and a.cod_alm = '37';


-- revisa stock almacenes
  with almacenes_vulcano as (
    select al.cod_alm, a.descripcion, al.cod_local
      from almacen_local al
           join almacenes a on al.cod_alm = a.cod_alm
     where al.cod_local = 'VUL'
    )
     , stock_kardex as (
    select d.cod_alm, d.cod_art
         , nvl((sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad))), 0) as stock_kdx
      from kardex_d d
           join almacen_local al on d.cod_alm = al.cod_alm
     where d.estado <> '9'
     group by d.cod_alm, d.cod_art
    )
select a.cod_art, a.cod_alm, nvl(a.stock, 0) as stock_alm
  from almacen a
       join almacenes_vulcano v
            on a.cod_alm = v.cod_alm
       left join stock_kardex s
                 on a.cod_alm = s.cod_alm
                   and a.cod_art = s.cod_art
 where a.stock <> s.stock_kdx;


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
                and d.cod_alm = a.cod_alm
              group by d.cod_art
             ), 0) as stock_kdx
  from almacen a
 where a.cod_art = :p_articulo;
--    and a.stock <> nvl(
--      (
--        select sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
--          from kardex_d d
--         where d.estado <> '9'
--           and d.cod_art = a.cod_art
--           and d.cod_art = :p_articulo
--         group by d.cod_art
--        ), 0);


select d.cod_alm, sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
 where d.estado <> '9'
   and d.cod_art = :p_articulo
 group by d.cod_alm, d.cod_art;

select *
  from almacen
 where cod_art = :p_articulo;

select *
  from articul
 where cod_art like 'HJ 23-320%';

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
--    and d.cod_alm = :p_almacen
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

select *
  from almacen
 where cod_alm = '03'
   and cod_art = '380.647';

select *
  from kardex_d_historia
 where cod_art = 'CAR 405';

select *
  from kardex_d
 where cantidad = 1600
   and extract(year from fch_transac) = 2025
   and cod_art = 'CAR 405';

select * from solicita_cambio_trx_det;

select * from solicita_cambio_trx;

begin
  pr_stock_minimo_iqf('ENVIAR_CORREO_SIEMPRE');
end;

select a.cod_art, a.descripcion, a.cod_lin, round(
    f_consumo_articulo(a.cod_art, (sysdate - 120), sysdate) / 4 * 3, 0) as promedio_3_meses
     , round(f_stock_almacen(a.cod_art, '02'), 0) as stock_almacen_02
     , round(f_stock_almacen(a.cod_art, '21'), 0) as stock_laboratorio, round(
    f_consumo_articulo(a.cod_art, (sysdate - 120), sysdate), 0) as consumo
     , round(
    f_consumo_articulo(a.cod_art, (sysdate - 120), sysdate) / 4, 0) as promedio
     , round(
    f_stock_almacen(a.cod_art, '02') /
    nullif((f_consumo_articulo(a.cod_art, (sysdate - 120), sysdate) / 4), 0), 2) as meses
     , round(f_cantidad_requerida(a.cod_art), 0) as cantidad_requerida
     , round(f_compras_en_curso(a.cod_art), 0) as compras_en_curso, round(
    f_stock_almacen(a.cod_art, '02') - f_cantidad_requerida(a.cod_art) +
    f_compras_en_curso(a.cod_art), 0) as stock_finalizando_programa
  from articul a
 where procedencia like 'IQF';


select u.usuario, u.email, c.stock_minimo_iqf
  from usuarios u
     , correos_programas c
 where u.usuario = c.usuario
   and stock_minimo_iqf = 'SI';

select *
  from correos_programas
 where stock_minimo_iqf = 'SI';

select *
  from usuarios
 where usuario = 'PEVISA';

select *
  from kardex_d
 where cod_alm = '03'
   and tp_transac = '51'
   and serie = 1
   and numero in (
   26557
   )
   and cod_art = '400.028';

select *
  from kardex_d_otros
 where observaciones is not null;

select *
  from kardex_d_otros
 where id_subgrupo is not null;

select cod_alm, tp_transac, serie, numero, cod_art, cantidad, fch_transac, ing_sal
  from kardex_d
 where cod_art = :p_articulo
   and cod_alm = '63'
   and trunc(fch_transac) >= to_date('30/09/2025', 'dd/mm/yyyy');


select cod_alm, tp_transac, serie, numero, cod_art, cantidad, fch_transac, ing_sal
  from kardex_d
 where cod_art = :p_articulo
   and cod_alm = '63'
   and trunc(fch_transac) < to_date('30/09/2025', 'dd/mm/yyyy');


-- a la fecha
select d.cod_alm, sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
 where d.estado <> '9'
   and d.cod_art = :p_articulo
--    and trunc(fch_transac) < to_date('30/09/2025', 'dd/mm/yyyy')
 group by d.cod_alm, d.cod_art;

-- stock actual
select d.cod_alm, sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
 where d.estado <> '9'
   and d.cod_art = :p_articulo
 group by d.cod_alm, d.cod_art;


-- stock vulcano
select d.cod_alm, a.descripcion, d.cod_art
     , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
       join almacenes a on d.cod_alm = a.cod_alm
 where d.estado <> '9'
   and d.cod_alm in (
   select al.cod_alm
     from almacen_local al
          join almacenes a on al.cod_alm = a.cod_alm
    where al.cod_local = 'VUL'
   )
having sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) > 0
 group by d.cod_alm, d.cod_art, a.descripcion
 order by d.cod_alm;


-- almacenes Vulcano
select al.cod_alm, a.descripcion, al.cod_local
  from almacen_local al
       join almacenes a on al.cod_alm = a.cod_alm
 where al.cod_local = 'VUL';


-- stock alm D2
select d.cod_alm, a.descripcion, d.cod_art, b.cod_lin
     , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
       join almacenes a on d.cod_alm = a.cod_alm
       join articul b on d.cod_art = b.cod_art
 where d.estado <> '9'
   and d.cod_alm = '39'
having sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) > 0
 group by d.cod_alm, d.cod_art, a.descripcion, b.cod_lin
 order by d.cod_alm;

select *
  from almacenes
 where cod_alm = 'V3';

-- stock alm 06
select d.cod_alm, a.descripcion, d.cod_art, b.cod_lin
     , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
       join almacenes a on d.cod_alm = a.cod_alm
       join articul b on d.cod_art = b.cod_art
 where d.estado <> '9'
   and d.cod_alm = '06'
having sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) > 0
 group by d.cod_alm, d.cod_art, a.descripcion, b.cod_lin
 order by d.cod_alm;


-- stock alm 30 embalaje
select d.cod_alm, a.descripcion, d.cod_art, b.cod_lin
     , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
       join almacenes a on d.cod_alm = a.cod_alm
       join articul b on d.cod_art = b.cod_art
 where d.estado <> '9'
   and d.cod_alm = '30'
   and exists(
   select 1
     from tab_lineas_tipo_linea l
    where l.cod_tipo = 2
      and l.cod_linea = b.cod_lin
   )
having sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) > 0
 group by d.cod_alm, d.cod_art, a.descripcion, b.cod_lin
 order by d.cod_alm, cod_art;

select *
  from tipo_linea
 order by cod_tipo;

select *
  from tab_lineas_tipo_linea
 where cod_tipo = 2;

-- stock almacenes produccion
select d.cod_alm, a.descripcion, d.cod_art, b.cod_lin
     , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
       join almacenes a on d.cod_alm = a.cod_alm
       join articul b on d.cod_art = b.cod_art
 where d.estado <> '9'
   and d.cod_alm in (
                     '31', '32', '33', '34', '35', '36', '38'
   )
having sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) > 0
 group by d.cod_alm, d.cod_art, a.descripcion, b.cod_lin
 order by d.cod_alm;

select *
  from almacenes
 where es_stock = 1;

select nvl(sum(a1.stock), 0)
  from almacen a1
       join almacenes a2 on a1.cod_alm = a2.cod_alm
 where a1.cod_art = :key
   and a2.es_stock = 1;


select get_stock_corrida_produccion('BLAF 0.23-177N') from dual;

-- stock alm D2
select d.cod_alm, a.descripcion, d.cod_art, b.cod_lin
     , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
       join almacenes a on d.cod_alm = a.cod_alm
       join articul b on d.cod_art = b.cod_art
 where d.estado <> '9'
   and d.cod_art = 'PIED-PEV-0019'
having sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) > 0
 group by d.cod_alm, d.cod_art, a.descripcion, b.cod_lin
 order by d.cod_alm;


select *
  from articul
 where cod_art like 'PIED-PEV-0019';

-- stock almacenes produccion
select d.cod_alm, a.descripcion, d.cod_art, b.cod_lin
     , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
       join almacenes a on d.cod_alm = a.cod_alm
       join articul b on d.cod_art = b.cod_art
 where d.estado <> '9'
   and d.cod_alm in ('31')
having sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) > 0
 group by d.cod_alm, d.cod_art, a.descripcion, b.cod_lin
 order by d.cod_alm;


select *
  from almacenes
 where cod_alm = '31';