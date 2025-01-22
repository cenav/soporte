select *
  from pevisa.wms_orden_oms
 where oms_numero = '557';

select *
  from pevisa.wms_orden_oms_item
 where oms_numero = '557';


select *
  from pevisa.pr_ordenes_solicitud_oms
 where oms_numero = '557';

select *
  from pevisa.wms_orden_sol
 where tipo = 'PR'
   and oms_numero = '557';

select *
  from pevisa.wms_orden_sol_item
 where tipo = 'PR'
   and oms_numero = '557';