select * from vw_monitoreo_gasto_mk;

select o.serie, o.num_ped, o.fecha, o.codigo_grupo_compra, g.descripcion as grupo_compra, o.detalle
     , e.nombres || ' ' || e.apellido_paterno as solicita, o.cod_proveed, p.nombre as proveedor
     , case o.codigo_unidad_negocio
         when '02' then '2000'
         when '03' then '3000'
         when '04' then '4000'
         else '5000'
       end as cod_megagrupo
     , to_number(to_char(o.fecha, 'YYYY')) as ano, to_number(to_char(o.fecha, 'MM')) as mes
     , round(case o.moneda when 'S' then o.tot_valvta else o.tot_valvta * m.import_cam end,
             2) as soles
     , round(case o.moneda when 'D' then o.tot_valvta else o.tot_valvta / m.import_cam end,
             2) as dolares
  from orden_de_compra o
       join unidades_negocio u on o.codigo_unidad_negocio = u.codigo_unidad_negocio
       join lg_grupos_compras g on o.codigo_grupo_compra = g.codigo_grupo_compra
       left join cambdol m on o.fecha = m.fecha and m.tipo_cambio = 'V'
       left join planilla10.personal e on o.c_resp = e.c_codigo
       left join proveed p on o.cod_proveed = p.cod_proveed
 where o.estado not in ('0', '1', '9')
   and o.codigo_grupo_compra in
       ('200', '201', '202', '203', '204', '205', '206', '207', '208', '209', '210', '211', '212',
        '213', '214', '215', '216', '217', '218', '219', '220', '221', '222', '223', '224', '225',
        '226', '227', '228', '229', '230', '231', '232', '233', '234', '235')
   and o.codigo_unidad_negocio in ('02', '03', '04')
 order by o.codigo_unidad_negocio;

select *
  from lg_grupos_compras
 where codigo_grupo_compra in
       ('200', '201', '202', '203', '204', '205', '206', '207', '208', '209', '210', '211', '212',
        '213', '214', '215', '216', '217', '218', '219', '220', '221', '222', '223', '224', '225',
        '226', '227', '228', '229', '230', '231', '232', '233', '234', '235');

select *
  from lg_grupos_compras
 where abreviada = 'SERVVARMK';

select *
  from unidades_negocio
 where codigo_unidad_negocio in ('02', '03', '04', '07');

select * from presupuesto_gasto;