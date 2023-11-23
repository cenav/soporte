-- cotizacion
select c.serie, c.num_ped, c.fecha, c.cod_cliente, e.nombre, c.cond_pag, c.cod_vende
     , v.nombre as nom_vendedor, c.refe_pedido, p.estado, c.moneda, c.total_bruto, c.total_descuento
     , c.total_igv, c.total_valvta, c.total_pedido as total_cotizacion, p.num_ped
  from cotizacion c
       join clientes e on c.cod_cliente = e.cod_cliente
       join vendedores v on c.cod_vende = v.cod_vendedor
       join pedido p on c.refe_pedido = p.num_ped
 where extract(year from c.fecha) = 2023
   and extract(month from c.fecha) = 6
 order by fecha;

select *
  from pedido
 where num_ped = 222725;

select c.serie, c.num_ped, c.fecha, c.cod_cliente, e.nombre, c.cond_pag, c.cod_vende
     , v.nombre as nom_vendedor, c.refe_pedido, p.estado, c.moneda
     , c.total_pedido as total_cotizacion, p.total_facturado
  from cotizacion c
     , clientes e
     , vendedores v
     , pedido p
 where c.cod_cliente = e.cod_cliente
   and c.cod_vende = v.cod_vendedor
   and c.refe_pedido = p.num_ped(+)
   and to_char(c.fecha, 'YYYY') = 2023
   and to_char(c.fecha, 'MM') = 6
   and c.num_ped in (198001, 199163)
 order by c.fecha;

select *
  from cotizacion
 where extract(year from fecha) = 2023
   and extract(month from fecha) = 4;

select *
  from cotizacion
 where num_ped = 207268;

select *
  from itemcot
 where num_ped = 207268;

select distinct estado
  from cotizacion
 where extract(year from fecha) = 2023
   and extract(month from fecha) = 4;

select *
  from histcot
 where num_ped = 196170;

select *
  from histcot
 where cod_accion != '00'
   and extract(year from fecha) = 2023
   and extract(month from fecha) = 5;

select serie, num_ped, item, cod_art, cantidad, cod_lin
  from itemcot
 where serie = 21
   and num_ped = 444
 order by item;

select *
  from histped
 where serie = 21
   and num_ped = 486;

select *
  from pedido
 where serie = 23
   and num_ped = 1899;

select *
  from itemped
 where serie = 21
   and num_ped = 486;

select *
  from cotizacion
 where serie = 21
   and num_ped = 207785;

select *
  from itemcot
 where serie = 21
   and num_ped = 456;

select *
  from cotizacion
 where num_ped = 201502;

select *
  from itemcot
 where num_ped = 201502;

select c.serie, c.num_ped as cotiza, c.fecha, c.estado, c.cod_cliente, c.nombre, c.cod_vende
     , v.abreviada, c.refe_pedido, c.moneda, nvl(p.estado, 'x') as estado_pedi, c.cond_pag
     , c.nro_lista, p.fecha_aprueba, c.total_pedido as total_cotiza
     , nvl(p.total_facturado, 0) as total_facturado, null as tipodoc_rel, null as serie_rel
     , null as numero_rel
  from cotizacion c
     , pedido p
     , vendedores v
 where p.serie(+) = c.serie
   and p.num_ped(+) = c.refe_pedido
   and v.cod_vendedor = c.cod_vende
   and c.num_ped = 201502;

select *
  from pedido
 where estado = '2'
   and cod_vende in (
   select cod_vendedor
     from vendedores
    where supervisor like '%'
   );


select c.serie, c.num_ped, c.fecha, c.nombre as cliente, c.total_pedido, c.moneda
     , v.nombre as vendedor, c.numero_ref, c.nro_sucur, s.nombre_sucursal
  from cotizacion c
     , vendedores v
     , sucursales s
 where c.estado in ('0', '5')
   and v.cod_vendedor = c.cod_vende
   and s.cod_cliente(+) = c.cod_cliente
   and s.nro_sucur(+) = c.nro_sucur
   and c.num_ped = 201499
   and (
         select count(*)
           from itemcot x
          where x.num_ped = c.num_ped
            and x.serie = c.serie
            and x.precio_sugerido > 0
         ) = 0;
--  union
-- select c.serie, c.num_ped, c.fecha, c.nombre as cliente, c.total_pedido, c.moneda
--      , v.nombre as vendedor, c.numero_ref, c.nro_sucur, s.nombre_sucursal
--   from cotizacion c
--      , vendedores v
--      , sucursales s
--  where c.estado in ('0', '5')
--    and v.cod_vendedor = c.cod_vende
--    and c.cod_cliente in '20100085578'
--    and s.cod_cliente(+) = c.cod_cliente
--    and s.nro_sucur(+) = c.nro_sucur
--  order by 1, 2 desc;

select *
  from cotizacion
 where num_ped in (207157);

select *
  from itemcot
 where num_ped = 207157;

select *
  from clientes
 where cod_cliente = '10479286430';

select *
  from itemcot
 where num_ped = 206298;

-- no figura en cotizacion de netos
-- tipo documento debe ser 20
select *
  from cotizacion
 where estado = '2'
   and num_ped = 207180
   and cod_vende in (
   select cod_vendedor
     from vendedores
    where supervisor like '01'
   );

select *
  from usuarios_cotizacion
 where usuario = 'LSALCEDO';

-- estado = '2' AND COD_VENDE IN (SELECT COD_VENDEDOR
-- FROM VENDEDORES
-- WHERE SUPERVISOR LIKE :GLOBAL.SUPERVISOR)

select *
  from itemped
 where num_ped = '230860';

-- aprobacion de netos, cotizacion estado = 2
select *
  from cotizacion
 where num_ped = 207389;

select *
  from itemcot
 where num_ped = 207389;

select *
  from pedido
 where num_ped = 231899;

select *
  from pedido
 where num_ped = 231899;

select cod_vendedor, abreviada
  from vendedores
 where cod_vendedor = '11';

select *
  from pedido
 where unidad_negocio in ('01', '02') and cod_vende like '%';

select * from view_art_ventas_nac;

select *
  from vendedores
 where abreviada in ('DTIRAVANTI', 'LSALCEDO')
   and estado = '1';

select cod_vendedor, indicador1
  from vendedores
 where nombre like '%SALCEDO%';

select *
  from tablas_auxiliares
 where tipo = '98'
 order by tipo;

select *
  from view_art_ventas_nac
 where cod_art = 'FS 93044 MLS'
   and cod_vende = '14';