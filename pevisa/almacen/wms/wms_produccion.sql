select * from vw_detalle_orden_sol;

select * from vw_soli_general_wms_prod;

select *
  from wms_orden_sol_item
 where tipo = 'PR'
   and numero = 585753;

-- solicita produccion wms saldo
select *
  from pr_ordenes_solicitud_oms
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 585753;
-- 378.000