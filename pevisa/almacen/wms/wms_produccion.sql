select * from vw_detalle_orden_sol;

select * from vw_soli_general_wms_prod;

select * from wms_estado_solicitud order by id_estado;

select *
  from wms_orden_sol
 where tipo = 'PR'
   and numero = 589738;

select *
  from wms_orden_sol_item
 where tipo = 'PR'
   and numero = 589738;

-- solicita produccion wms saldo
select *
  from pr_ordenes_solicitud_oms
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 585753;
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
