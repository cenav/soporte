select *
  from wms_orden_sol a
 where oms_tipo = 'WS' ---(Wms Solicitud)
   and oms_serie = 1
   and oms_numero = 557
   and tipo = 'VA'
   and numero = 11096;

-- anular solicitud --

update wms_orden_sol a
   set estado = '9'
 where oms_tipo = 'WS' ---(Wms Solicitud)
   and oms_serie = 1
   and oms_numero = 557
   and tipo = 'VA'
   and numero = 11096;

--anular Tarea Picking --

update wms_picking a
   set estado = '9'
 where tk_serie = '2'
   and tk_numero = :p_tarea;
