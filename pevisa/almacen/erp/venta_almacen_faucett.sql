-- venta nacional 2025 - 2026
select cod_cliente, nombre_cliente
     , sum(case cod_megagrupo when '1000' then cantidad end) as empaques
     , sum(case cod_megagrupo when '2000' then cantidad end) as comercial
     , sum(case cod_megagrupo when '3000' then cantidad end) as baterias
     , sum(case cod_megagrupo when '4000' then cantidad end) as neumaticos
  from vw_venta_detalle
 where extract(year from fecha) in (2026, 2025)
 group by cod_cliente, nombre_cliente;

select distinct cod_megagrupo, desc_megagrupo
  from vw_venta_detalle
 where extract(year from fecha) in (2026, 2025);


select * from grupo_venta;

select *
  from clientes
 where cod_cliente = '20609615002';

select *
  from ubigeo
 where cod_ubc = '130101';

select *
  from vw_venta_detalle
 where extract(year from fecha) in (2026, 2025)
   and cod_cliente = '10088740110';

select cod_cliente, nombre_cliente
     , sum(case
             when extract(month from fecha) = 11 and cod_megagrupo = '1000' then cantidad
           end) as nov_empaques
     , sum(case
             when extract(month from fecha) = 11 and cod_megagrupo = '2000' then cantidad
           end) as nov_comercial
     , sum(case
             when extract(month from fecha) = 11 and cod_megagrupo = '3000' then cantidad
           end) as nov_baterias
     , sum(case
             when extract(month from fecha) = 11 and cod_megagrupo = '4000' then cantidad
           end) as nov_neumaticos
     , sum(case
             when extract(month from fecha) = 12 and cod_megagrupo = '1000' then cantidad
           end) as dic_empaques
     , sum(case
             when extract(month from fecha) = 12 and cod_megagrupo = '2000' then cantidad
           end) as dic_comercial
     , sum(case
             when extract(month from fecha) = 12 and cod_megagrupo = '3000' then cantidad
           end) as dic_baterias
     , sum(case
             when extract(month from fecha) = 12 and cod_megagrupo = '4000' then cantidad
           end) as dic_neumaticos
     , sum(case
             when extract(month from fecha) = 01 and cod_megagrupo = '1000' then cantidad
           end) as ene_empaques
     , sum(case
             when extract(month from fecha) = 01 and cod_megagrupo = '2000' then cantidad
           end) as ene_comercial
     , sum(case
             when extract(month from fecha) = 01 and cod_megagrupo = '3000' then cantidad
           end) as ene_baterias
     , sum(case
             when extract(month from fecha) = 01 and cod_megagrupo = '4000' then cantidad
           end) as ene_neumaticos
     , sum(case
             when extract(month from fecha) = 02 and cod_megagrupo = '1000' then cantidad
           end) as feb_empaques
     , sum(case
             when extract(month from fecha) = 02 and cod_megagrupo = '2000' then cantidad
           end) as feb_comercial
     , sum(case
             when extract(month from fecha) = 02 and cod_megagrupo = '3000' then cantidad
           end) as feb_baterias
     , sum(case
             when extract(month from fecha) = 02 and cod_megagrupo = '4000' then cantidad
           end) as feb_neumaticos
     , sum(case
             when extract(month from fecha) = 03 and cod_megagrupo = '1000' then cantidad
           end) as mar_empaques
     , sum(case
             when extract(month from fecha) = 03 and cod_megagrupo = '2000' then cantidad
           end) as mar_comercial
     , sum(case
             when extract(month from fecha) = 03 and cod_megagrupo = '3000' then cantidad
           end) as mar_baterias
     , sum(case
             when extract(month from fecha) = 03 and cod_megagrupo = '4000' then cantidad
           end) as mar_neumaticos
     , sum(case
             when extract(month from fecha) = 04 and cod_megagrupo = '1000' then cantidad
           end) as abr_empaques
     , sum(case
             when extract(month from fecha) = 04 and cod_megagrupo = '2000' then cantidad
           end) as abr_comercial
     , sum(case
             when extract(month from fecha) = 04 and cod_megagrupo = '3000' then cantidad
           end) as abr_baterias
     , sum(case
             when extract(month from fecha) = 04 and cod_megagrupo = '4000' then cantidad
           end) as abr_neumaticos
  from vw_venta_detalle
 where fecha >= to_date('01/11/2025', 'dd/mm/yyyy')
 group by cod_cliente, nombre_cliente;


select v.cod_cliente, v.nombre_cliente, c.direccion
     , u.nom_dpt as departamento, u.nom_pvc as provincia, u.nom_dtt as distrito
     , sum(case
             when extract(month from v.fecha) = 11 and v.cod_megagrupo = '1000' then v.cantidad
           end) as nov_empaques
     , sum(case
             when extract(month from v.fecha) = 11 and v.cod_megagrupo = '2000' then v.cantidad
           end) as nov_comercial
     , sum(case
             when extract(month from v.fecha) = 11 and v.cod_megagrupo = '3000' then v.cantidad
           end) as nov_baterias
     , sum(case
             when extract(month from v.fecha) = 11 and v.cod_megagrupo = '4000' then v.cantidad
           end) as nov_neumaticos
     , sum(case
             when extract(month from v.fecha) = 12 and v.cod_megagrupo = '1000' then v.cantidad
           end) as dic_empaques
     , sum(case
             when extract(month from v.fecha) = 12 and v.cod_megagrupo = '2000' then v.cantidad
           end) as dic_comercial
     , sum(case
             when extract(month from v.fecha) = 12 and v.cod_megagrupo = '3000' then v.cantidad
           end) as dic_baterias
     , sum(case
             when extract(month from v.fecha) = 12 and v.cod_megagrupo = '4000' then v.cantidad
           end) as dic_neumaticos
     , sum(case
             when extract(month from v.fecha) = 01 and v.cod_megagrupo = '1000' then v.cantidad
           end) as ene_empaques
     , sum(case
             when extract(month from v.fecha) = 01 and v.cod_megagrupo = '2000' then v.cantidad
           end) as ene_comercial
     , sum(case
             when extract(month from v.fecha) = 01 and v.cod_megagrupo = '3000' then v.cantidad
           end) as ene_baterias
     , sum(case
             when extract(month from v.fecha) = 01 and v.cod_megagrupo = '4000' then v.cantidad
           end) as ene_neumaticos
     , sum(case
             when extract(month from v.fecha) = 02 and v.cod_megagrupo = '1000' then v.cantidad
           end) as feb_empaques
     , sum(case
             when extract(month from v.fecha) = 02 and v.cod_megagrupo = '2000' then v.cantidad
           end) as feb_comercial
     , sum(case
             when extract(month from v.fecha) = 02 and v.cod_megagrupo = '3000' then v.cantidad
           end) as feb_baterias
     , sum(case
             when extract(month from v.fecha) = 02 and v.cod_megagrupo = '4000' then v.cantidad
           end) as feb_neumaticos
     , sum(case
             when extract(month from v.fecha) = 03 and v.cod_megagrupo = '1000' then v.cantidad
           end) as mar_empaques
     , sum(case
             when extract(month from v.fecha) = 03 and v.cod_megagrupo = '2000' then v.cantidad
           end) as mar_comercial
     , sum(case
             when extract(month from v.fecha) = 03 and v.cod_megagrupo = '3000' then v.cantidad
           end) as mar_baterias
     , sum(case
             when extract(month from v.fecha) = 03 and v.cod_megagrupo = '4000' then v.cantidad
           end) as mar_neumaticos
     , sum(case
             when extract(month from v.fecha) = 04 and v.cod_megagrupo = '1000' then v.cantidad
           end) as abr_empaques
     , sum(case
             when extract(month from v.fecha) = 04 and v.cod_megagrupo = '2000' then v.cantidad
           end) as abr_comercial
     , sum(case
             when extract(month from v.fecha) = 04 and v.cod_megagrupo = '3000' then v.cantidad
           end) as abr_baterias
     , sum(case
             when extract(month from v.fecha) = 04 and v.cod_megagrupo = '4000' then v.cantidad
           end) as abr_neumaticos
  from vw_venta_detalle v
       join clientes c on v.cod_cliente = c.cod_cliente
       left join ubigeo u on c.ubigeo_nuevo = u.cod_ubc
 where v.fecha >= to_date('01/11/2025', 'dd/mm/yyyy')
 group by v.cod_cliente, v.nombre_cliente, c.direccion, u.nom_dpt, u.nom_pvc, u.nom_dtt;
