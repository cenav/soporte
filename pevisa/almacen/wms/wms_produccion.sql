select * from vw_detalle_orden_sol;

select * from vw_soli_general_wms_prod;

select * from wms_estado_solicitud order by id_estado;

-- numero de la tarea tk_serie tk_numero
select *
  from wms_orden_sol
 where tipo = 'PR'
   and numero in (390);

select *
  from wms_orden_sol
 where tipo = 'PR'
   and numero in (590817)
   and oms_numero = 1584;

select *
  from pr_ordenes_solicitud_oms
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 590817
   and oms_numero = 1584;

select * from wms_estado_solicitud;

-- numero de la tarea tk_serie tk_numero
select *
  from wms_orden_sol_item
 where tipo = 'PR'
   and numero = 575573;

-- tarea
select *
  from wms_picking_alm
 where tk_serie = 2
   and tk_numero = 1197
   and tk_item = 1;

-- solicita produccion wms saldo
select *
  from pr_ordenes_solicitud_oms
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 575573;
-- 378.000

-- 588283 y 565380

-- query de picking produccion > ordenes pendientes
select w.juego, get_deslinea(a.linea) as des_linea, w.estado, sum(w.cant_prog) as cantidad
  from wms_orden_sol w
     , pcarticul a
 where w.tipo = 'PR'
   and w.estado = '0'
   and a.cod_art = w.juego
 group by w.juego, get_deslinea(a.linea), w.estado
 order by juego;

-- :VW_DETALLE_ORDEN_SOL.saldo := :VW_DETALLE_ORDEN_SOL.cant_prog
--                              - :VW_DETALLE_ORDEN_SOL.cant_solicitada
--                              + :VW_DETALLE_ORDEN_SOL.CANT_REPROCESA;


-- cant_prog
select cantfinal
  from view_vws_libera_orden
 where nuot_tipoot_codigo = 'PR'
   and nuot_serie = 8
   and numero = 564561;


select pr.nuot_tipoot_codigo, pr.nuot_serie, pr.numero, cant_prog - cant_ingresado
  + nvl((
          select cant_ingresado
            from pr_ot p
           where p.nuot_tipoot_codigo = pr.nuot_tipoot_codigo
             and p.nuot_serie = pr.nuot_serie
             and p.numero = pr.numero
             and numero in (
             select w.numero
               from wms_libera_orden_surte w
              where w.nuot_tipo_ot = p.nuot_tipoot_codigo
                and w.nuot_serie = p.nuot_serie
                and w.numero = p.numero
             )
          ),
        0) as cantfinal
  from pr_ot pr
 where estado < 9
   and nuot_tipoot_codigo = 'PR'
   and nuot_serie = 8
   and numero = 564561;

select *
  from wms_libera_orden_surte
 where nuot_tipo_ot = 'PR'
   and nuot_serie = 8
   and numero = 564561;

-- cant_solicitada
select nvl(sum(cant_for), 0)
  from vw_soli_general_wms_prod
 where tipo_solicitud in ('WMS', 'PRODUCCION')
   and estado not in ('ANULADO')
   and tipo = 'PR'
   and serie = 8
   and numero = 564561
   and cod_art = 'RING 90003N';

select * --> cant_prog modificar por la cantidad según el rendimiento
  from pr_ordenes_solicitud_oms
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 541136;

-- cant_reprocesa
select nvl(sum(cant_pedir), 0) as cant_reprocesa
  from solicita_reproceso_ot p
     , solicita_reproceso_ot_det pd
 where p.id_solicitud = pd.id_solicitud
   and p.id_estado = '40' --APROBADO
   and p.ot_tpo = 'PR'
   and p.ot_ser = 8
   and p.ot_nro = 582934
   and pd.art_cod_art = 'RC 014';


select *
  from wms_orden_sol
--  where tipo = 'PR'
 where tk_serie = 3
   and tk_numero = 210;

select *
  from wms_orden_sol_item
 where tk_serie = 3
   and tk_numero = 210;

select *
  from wms_orden_sol
 where oms_numero = 201430;

select codigo, descripcion
  from tablas_auxiliares
 where tipo = '33'
   and codigo <> '....'
   and not exists (
   select 1
     from almacenes
    where tipo_alm = 'WMS'
      and almacenes.cod_alm = tablas_auxiliares.codigo
   )
 order by codigo;

select *
  from almacenes
 where cod_alm = 'D5';

select *
  from almacenes
 where tipo_alm = 'WMS';

select a.cod_alm, t.descripcion, a.nombre
  from pr_usualma a
     , tablas_auxiliares t
 where a.cod_alm = t.codigo
   and t.tipo = '33'
   and a.usuario = :PR_OT.xusuario
   and not exists (
   select 1
     from almacenes
    where tipo_alm = 'WMS'
      and almacenes.cod_alm = t.codigo
   )
 order by a.cod_alm;

select *
  from transacciones_almacen
 where tp_transac = '18';

select * from wms_rec_oms;

select *
  from wms_orden_sol
 where oms_tipo = 'WS'
   and oms_numero = 390;


-- INSERT INTO PEVISA.WMS_ORDEN_SOL (TIPO, SERIE, NUMERO, FECHA_OT, JUEGO, NRO_PEDIDO, REF_CLIENTE, DESTINO, CANT_PROG, TOT_ITEMS, ESTADO, PICKER, TK_SERIE, TK_NUMERO, TK_ITEM, FECHA_REC, FECHA_DES, FECHA_ANU, OMS_TIPO, OMS_SERIE, OMS_NUMERO) VALUES ('PR', '8', 607314, TIMESTAMP '2025-04-30 14:53:57', 'CL-O PL95350-1ZN', null, null, null, 30.00, null, '8', '43469', '2', 2724, 1, TIMESTAMP '2025-05-14 11:29:03', null, null, 'WS', '2', 390);

select *
  from wms_orden_sol
 where tipo = 'PR'
   and numero = 602953;

select *
  from vw_solicitud_oms_pendientes
 where numero = 602953;

select *
  from wms_orden_sol_item
 where numero = 602953;

select * from wms_estado_solicitud;

select count(*)
  from pr_ot o
     , pr_ot_det d
 where o.numero like 607202
   and o.nuot_tipoot_codigo in ('PR', 'VA')
   and o.estado between '1' and '5'
   and d.ot_numero = o.numero
   and exists (
   select w.cod_art
     from wms_alm_ubicacion w
    where w.cod_art = d.art_cod_art
      and estado <> '9'
   );

select *
  from wms_alm_ubicacion
 where cod_art in (
                   'BH 0.23 - 300 ETIQ E-01', 'FOR3913', 'NI 2900 0.6-300', 'NI 2900 0.8-300'
   );