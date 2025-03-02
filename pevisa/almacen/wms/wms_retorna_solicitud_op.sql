select *
  from wms_orden_oms
 where oms_numero = :p_oms_numero;

select *
  from wms_orden_oms_item
 where oms_numero = :p_oms_numero;

-- cambiar cant_prog
select *
  from pr_ordenes_solicitud_oms
 where oms_numero = :p_oms_numero;

select *
  from wms_orden_sol
 where tipo = 'PR'
   and oms_numero = :p_oms_numero;

select *
  from wms_orden_sol_item
 where tipo = 'PR'
   and oms_numero = :p_oms_numero;

select *
  from vw_detalle_orden_sol
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 582934;


-- cant solicitada
select nvl(sum(cant_for), 0)
  from vw_soli_general_wms_prod
 where tipo_solicitud in ('WMS', 'PRODUCCION')
   and estado not in ('ANULADO')
   and tipo = 'PR'
   and serie = '8'
   and numero = 582934
   and cod_art = 'RC 014';


select *
  from vw_soli_general_wms_prod
 where tipo_solicitud in ('WMS', 'PRODUCCION')
   and estado not in ('ANULADO')
   and tipo = 'PR'
   and serie = '8'
   and numero = 582934
   and cod_art = 'RC 014';

select * from wms_libera_orden_surte;

-- saldo