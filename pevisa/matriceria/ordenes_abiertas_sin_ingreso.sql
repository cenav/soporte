select *
  from orden_matriceria
 where extract(year from fecha) = 2025
   and extract(month from fecha) = 4;

select * from itemmatri;

select oc.cod_proveed, p.nombre as nom_proveed
     , sum(decode(oc.moneda, 'S', nvl(oc.tot_orden, 0), 0)) as soles
     , sum(decode(oc.moneda, 'D', nvl(oc.tot_orden, 0), 0)) as dolares
  from orden_de_compra oc
       join proveed p on oc.cod_proveed = p.cod_proveed
       join orden_matriceria m on oc.serie = m.ser_oc and oc.num_ped = m.nro_oc
 where oc.estado < '8'
 group by oc.cod_proveed, p.nombre
 order by soles desc, dolares desc;

-- ordenes matriceria sin ingreso
select oc.serie as oc_serie, oc.num_ped as oc_numero, oc.cod_proveed, p.nombre as nom_proveed
     , oc.fecha, oc.estado, e.descripcion, m.num_ped as oc_matriceria
     , decode(oc.moneda, 'S', nvl(oc.tot_orden, 0), 0) as soles
     , decode(oc.moneda, 'D', nvl(oc.tot_orden, 0), 0) as dolares
  from orden_de_compra oc
       join proveed p on oc.cod_proveed = p.cod_proveed
       join orden_matriceria m on oc.serie = m.ser_oc and oc.num_ped = m.nro_oc
       join orden_de_compra_estado e on oc.estado = e.estado
 where oc.estado < '8'
   and exists (
   select 1
     from orden_de_compra_historia h
    where h.serie = oc.serie
      and h.num_ped = oc.num_ped
      and creacion_quien = 'JMANAYAY'
      and tipo_evento = 'CREACION'
   )
 order by oc.fecha desc, soles desc, dolares desc;
