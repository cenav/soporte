-- vor de cambiar cliente en el sistema, tanto en el módulo de taller como de la cotización
-- en el módulo de servicios:
--
-- El código del cliente correcto es: 20603612249 (MAQEQP S.A.C.)
--
-- EL código del cliente errado es: 20160286068 (MAQUINARIAS S.A.)
--
-- OT 6588
--

select o.*
  from orden_de_venta o -- 111111111111111111111      cambiar el cliente
 where numero in (6731, 6735);

--  91581 y el pedido 54383 a la OTHD2619.
--
-- HD2619

select o.*
  from cotizacion o
--order by fecha desc
 where num_ped in (
   select numero_ref
     from orden_de_venta o
    where numero in (:orden_venta)
   );

select numero_ref
  from orden_de_venta o -- 2
 where numero in (:orden_venta);


select rowid, o.*
  from clientes o -- 3
 where cod_cliente in (
   select id_cliente
     from orden_de_venta o
    where numero in (:orden_venta)
   );
-- NRT L-710499-G F3F LATAM S.L.U
-- AV. DIAGONAL NUM. 490 PLANTA PRAL. PUERTA 1 08006

select rowid, o.*
  from clientes o -- 3
 where cod_cliente in (
   select id_cliente
     from orden_de_venta o
    where numero in (:orden_venta)
   );
------------------------------------ 22222222222222222222222222222222

update cotizacion o
   set cod_cliente = (
     select cc.cod_cliente
       from clientes cc
      where cc.cod_cliente in (
        select o.id_cliente
          from orden_de_venta o
         where o.numero = :orden_venta
        )
     )
     , ruc         = (
     select cc.cod_cliente
       from clientes cc
      where cc.cod_cliente in (
        select o.id_cliente
          from orden_de_venta o
         where o.numero = :orden_venta
        )
     )
     , nombre      = (
     select cc.nombre
       from clientes cc
      where cc.cod_cliente in (
        select o.id_cliente
          from orden_de_venta o
         where o.numero = :orden_venta
        )
     )
     , direccion   = (
     select cc.direccion
       from clientes cc
      where cc.cod_cliente in (
        select o.id_cliente
          from orden_de_venta o
         where o.numero = :orden_venta
        )
     )
 where num_ped in (
   select numero_ref
     from orden_de_venta o
    where numero in (:orden_venta)
   );


select o.*
  from cotizacion o
 where num_ped in (
   select numero_ref
     from orden_de_venta o
    where numero in (:orden_venta)
   );

------------------------------------ 33333333333333333333333333333333

update pedido o
   set cod_cliente = (
     select cc.cod_cliente
       from clientes cc
      where cc.cod_cliente in (
        select o.id_cliente
          from orden_de_venta o
         where o.numero = :orden_venta
        )
     )
     , ruc         = (
     select cc.cod_cliente
       from clientes cc
      where cc.cod_cliente in (
        select o.id_cliente
          from orden_de_venta o
         where o.numero = :orden_venta
        )
     )
     , nombre      = (
     select cc.nombre
       from clientes cc
      where cc.cod_cliente in (
        select o.id_cliente
          from orden_de_venta o
         where o.numero = :orden_venta
        )
     )
     , direccion   = (
     select cc.direccion
       from clientes cc
      where cc.cod_cliente in (
        select o.id_cliente
          from orden_de_venta o
         where o.numero = :orden_venta
        )
     )
 where num_ped in (
   55370
   );

select o.*
  from pedido o
 where num_ped in (
                   2361, 2363
   );

select rowid, o.*
  from cotizacion o
 where nro_lista <> 1
   and numped_unix like 'HD%'
 union
select rowid, o.*
  from cotizacion o
 where num_ped in (83054);

select rowid, o.*
  from itemcot o
 where num_ped in (98623)
 order by cod_art;

select rowid, r.*
  from lispred r
 where cod_art like 'H00-HD2254-OT';


select rowid, o.*
  from itemcot o
 where num_ped in (80117);


select rowid, o.*
  from orden_de_venta_recepcion o
 where numero = 1087
 order by fecha;

select rowid, o.*
  from orden_de_venta_informe_tecnico o
 where numero = 5023
 order by fecha;

select rowid, o.*
  from itemcot o
 where num_ped = 74853;

select *
  from articul
 where cod_art in (
   select cod_art
     from itemcot o
    where num_ped = 74853
   );

select *
  from articul
 where cod_art in (
   select id_articulo
     from orden_de_venta_requerido o
    where numero = 3048
   );



select rowid, o.*
  from orden_de_venta_requerido o
 where numero = 3048
 order by id_articulo;

select rowid, o.*
  from orden_de_venta_informe_tecnico o
 where numero = 5500
 order by fecha;
-- RECEPCION                EVALUACION                       10
-- EVALUACION               EVALUACION TERMINADA             18
-- EVALUACION TERMINADA     COTIZACION GENERADA              20
-- EVALUACION TERMINADA     COTIZACION ENVIADA               20
-- COTIZACION ENVIADA       COTIZACION ENVIADA               20
-- COTIZACION GENERADA      COTIZACION APROBADA              30
-- COTIZACION APROBADA      COTIZACION EN EJECUCION          33
-- COTIZACION EN EJECUCION  FACTURA GENERADA                 40
-- COTIZACION APROBADA      FACTURA GENERADA                 40
-- FACTURA GENERADA         FACTURA DESPACHADA               40
--
-- COTIZACION EN EJECUCION  PEDIDO GENERADO                  40
--
-- 30
-- 33
--
-- pr_programas_compras
--
-- 2233 y 2234

select rowid, o.*
  from orden_de_venta_historia o
 where numero in (2233, 2234)
 order by fecha;

select rowid, o.*
  from orden_de_venta o
 where numero in (2388, 3445);


--   OT3445 y de la cotización 106835


select modifica, moneda, inc_igv, desc_max
  from lispreg
 where nro_lista = :nro_lista;

select *
  from itemcot
 where num_ped = 51097;

select usuario, indicador1, minimo --INTO :BLK_DATA5.X_INDICADOR1, :BLK_DATA5.X_MINIMO
  from usuarios_cotizacion; --WHERE USUARIO = USER;

select carpeta_archivos_informes from parametros;

-- 7,782.00

-- 9182.76

select rowid, c.*
  from cotizacion c
 where num_ped in (84750, 106835);

select rowid, c.*
  from itemcot c
 where num_ped in (84750, 106835);

select *
  from itemcot
 where num_ped = 74853;

select a.cod_art, sum(i.cantidad) as cantidad
  from articul a
     , itemcot i
     , cotizacion h
     , taller_lineas_servicio t
 where substr(h.numped_unix, 1, 2) = 'DI5714'
   and rtrim(substr(h.numped_unix, 3, 6)) = to_char('DI5714')
   and i.serie = h.serie
   and i.num_ped = h.num_ped
   and a.cod_art = i.cod_art
--                   AND T.cod_lin = a.cod_lin
   --AND T.tipo_articulo_taller IN ('O', 'T', 'E')
 group by a.cod_art;

select substr(h.numped_unix, 1, 2)        serie
     , rtrim(substr(h.numped_unix, 3, 6)) xxxx
     , h.numped_unix
     , a.cod_art
     , i.cantidad                         cantidad
  from articul a
     , itemcot i
     , cotizacion h
     , taller_lineas_servicio t
 where i.serie = '20'
   and i.num_ped = 74853
--					         AND  SUBSTR (h.numped_unix, 1, 2)         = 'DI'
--					         AND RTRIM (SUBSTR (h.numped_unix, 3, 6)) = '5714'
   and substr(h.numped_unix, 1, 2) = 'DI'
   and rtrim(substr(h.numped_unix, 3, 6)) = to_char(5714)
   and i.serie = h.serie
   and i.num_ped = h.num_ped
   and a.cod_art = i.cod_art
   and t.cod_lin = a.cod_lin
   and t.tipo_articulo_taller in ('O', 'T', 'E');


select a.cod_art, sum(i.cantidad) cantidad
  from articul a
     , itemcot i
     , cotizacion h
     , taller_lineas_servicio t
 where substr(h.numped_unix, 1, 2) = 'DI'
   and rtrim(substr(h.numped_unix, 3, 6)) = to_char(5714)
   and i.serie = h.serie
   and i.num_ped = h.num_ped
   and a.cod_art = i.cod_art
   and t.cod_lin = a.cod_lin
   and t.tipo_articulo_taller in ('O', 'T', 'E')
 group by a.cod_art;

select *
  from orden_de_venta_item
 where serie = 'DI'
   and numero = 5714
   and id_articulo = 'INYDEL102';

select *
  from plancta
 where cuenta = '12212300';
