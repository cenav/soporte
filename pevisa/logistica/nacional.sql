select *
  from pr_ot
 where nuot_tipoot_codigo = 'FC'
   and numero = 275;

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'FC'
   and ot_numero = 275;

select *
  from view_cuentas_pagar_semanas
 where wsemana between to_date('11/03/2024', 'dd/mm/yyyy') and to_date('16/03/2024', 'dd/mm/yyyy');

select * from orden_de_compra;

-- analisis ordenes
select o.serie, o.num_ped, trunc(o.fecha) as fecha, o.fecha_aprobacion, o.estado
     , e.descripcion as dsc_estado, o.cod_proveed, p.nombre, detalle, c_resp, s.nombre, o.moneda
     , tot_orden
--      , decode(o.moneda, 'S', nvl(o.tot_orden, 0), 0) as soles
--      , decode(o.moneda, 'D', nvl(o.tot_orden, 0), 0) as dolares
     , case o.moneda
         when 'D' then round(tot_orden * c.import_cam, 2)
         else tot_orden
       end as tot_soles
     , case o.moneda
         when 'S' then round(tot_orden / c.import_cam, 2)
         else tot_orden
       end as tot_dolares
  from orden_de_compra o
       join proveed p on o.cod_proveed = p.cod_proveed
       left join cambdol c on trunc(o.fecha) = c.fecha and c.tipo_cambio = 'V'
       left join orden_de_compra_estado e on o.estado = e.estado
       left join vw_personal s on o.c_resp = s.c_codigo
 where extract(year from o.fecha_aprobacion) = 2024
   and extract(month from o.fecha_aprobacion) = 3
   and o.estado != '9'
 order by tot_soles desc;

select *
  from orden_de_compra o
 where extract(year from o.fecha) = 2024
   and extract(month from o.fecha) = 3
   and o.moneda = 'D';

select *
  from cambdol
 where fecha = to_date('20/03/2024', 'dd/mm/yyyy');

select * from orden_de_compra;