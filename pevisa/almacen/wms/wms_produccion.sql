select * from vw_detalle_orden_sol;

select * from vw_soli_general_wms_prod;

select * from wms_estado_solicitud order by id_estado;

-- numero de la tarea tk_serie tk_numero
select *
  from wms_orden_sol
 where tipo = 'PR'
   and numero in (575573);

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