-- original
select sum(decode(moneda, 'S', nvl(oc.tot_orden, 0), 0)) as soles
     , sum(decode(moneda, 'D', nvl(oc.tot_orden, 0), 0)) as dolares
  from orden_de_compra oc
 where oc.estado < '9'
   and oc.fecha_aprobacion is not null
   and to_char(oc.fecha_aprobacion, 'YYYYMM') = to_char(sysdate, 'YYYYMM');

-- cuadra totales
select sum(decode(moneda, 'S', nvl(oc.tot_orden, 0), 0)) as soles
     , sum(decode(moneda, 'D', nvl(oc.tot_orden, 0), 0)) as dolares
  from orden_de_compra oc
 where oc.estado < '9'
   and oc.fecha_aprobacion is not null
   and extract(year from oc.fecha_aprobacion) = 2025;

-- resumen por proveedor
select oc.cod_proveed, p.nombre as nom_proveed
     , sum(decode(oc.moneda, 'S', nvl(oc.tot_orden, 0), 0)) as soles
     , sum(decode(oc.moneda, 'D', nvl(oc.tot_orden, 0), 0)) as dolares
  from orden_de_compra oc
       join proveed p on oc.cod_proveed = p.cod_proveed
 where oc.estado < '9'
   and oc.fecha_aprobacion is not null
   and extract(year from oc.fecha_aprobacion) = 2025
 group by oc.cod_proveed, p.nombre
 order by soles desc, dolares desc;


-- detalle por proveedor
select oc.cod_proveed, p.nombre as nom_proveed, oc.serie, oc.num_ped
     , trunc(oc.fecha_aprobacion) as fecha_aprobacion, e.descripcion as estado
     , decode(oc.moneda, 'S', nvl(oc.tot_orden, 0), 0) as soles
     , decode(oc.moneda, 'D', nvl(oc.tot_orden, 0), 0) as dolares
  from orden_de_compra oc
       join proveed p on oc.cod_proveed = p.cod_proveed
       join orden_de_compra_estado e on oc.estado = e.estado
 where oc.estado < '9'
   and oc.fecha_aprobacion is not null
   and extract(year from oc.fecha_aprobacion) = 2025
 order by nom_proveed, soles desc;
