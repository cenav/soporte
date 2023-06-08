-- estadistica venta cliente
select d.nombre
     , sum(decode('D', 'S',
                  (decode(d.moneda, 'S', decode(to_char(d.fecha, 'MM'), '01', d.precio_vta, 0),
                          (decode(to_char(d.fecha, 'MM'), '01', (d.precio_vta * d.import_cam),
                                  0)))),
                  (decode(d.moneda, 'D', decode(to_char(d.fecha, 'MM'), '01', d.precio_vta, 0),
                          (decode(to_char(d.fecha, 'MM'), '01', (d.precio_vta / d.import_cam),
                                  0)))))) as "ENE"
     , sum(decode('D', 'S',
                  (decode(d.moneda, 'S', decode(to_char(d.fecha, 'MM'), '02', d.precio_vta, 0),
                          (decode(to_char(d.fecha, 'MM'), '02', (d.precio_vta * d.import_cam),
                                  0)))),
                  (decode(d.moneda, 'D', decode(to_char(d.fecha, 'MM'), '02', d.precio_vta, 0),
                          (decode(to_char(d.fecha, 'MM'), '02', (d.precio_vta / d.import_cam),
                                  0)))))) as "FEB"
     , sum(decode('D', 'S',
                  (decode(d.moneda, 'S', decode(to_char(d.fecha, 'MM'), '03', d.precio_vta, 0),
                          (decode(to_char(d.fecha, 'MM'), '03', (d.precio_vta * d.import_cam),
                                  0)))),
                  (decode(d.moneda, 'D', decode(to_char(d.fecha, 'MM'), '03', d.precio_vta, 0),
                          (decode(to_char(d.fecha, 'MM'), '03', (d.precio_vta / d.import_cam),
                                  0)))))) as "MAR"
     , sum(decode('D', 'S',
                  (decode(d.moneda, 'S', decode(to_char(d.fecha, 'MM'), '04', d.precio_vta, 0),
                          (decode(to_char(d.fecha, 'MM'), '04', (d.precio_vta * d.import_cam),
                                  0)))),
                  (decode(d.moneda, 'D', decode(to_char(d.fecha, 'MM'), '04', d.precio_vta, 0),
                          (decode(to_char(d.fecha, 'MM'), '04', (d.precio_vta / d.import_cam),
                                  0)))))) as "ABR"
     , sum(decode('D', 'S',
                  (decode(d.moneda, 'S', decode(to_char(d.fecha, 'MM'), '05', d.precio_vta, 0),
                          (decode(to_char(d.fecha, 'MM'), '05', (d.precio_vta * d.import_cam),
                                  0)))),
                  (decode(d.moneda, 'D', decode(to_char(d.fecha, 'MM'), '05', d.precio_vta, 0),
                          (decode(to_char(d.fecha, 'MM'), '05', (d.precio_vta / d.import_cam),
                                  0)))))) as "MAY"
     , sum(decode('D', 'S',
                  (decode(d.moneda, 'S', decode(to_char(d.fecha, 'MM'), '06', d.precio_vta, 0),
                          (decode(to_char(d.fecha, 'MM'), '06', (d.precio_vta * d.import_cam),
                                  0)))),
                  (decode(d.moneda, 'D', decode(to_char(d.fecha, 'MM'), '06', d.precio_vta, 0),
                          (decode(to_char(d.fecha, 'MM'), '06', (d.precio_vta / d.import_cam),
                                  0)))))) as "JUN"
     , sum(decode('D', 'S',
                  (decode(d.moneda, 'S', decode(to_char(d.fecha, 'MM'), '07', d.precio_vta, 0),
                          (decode(to_char(d.fecha, 'MM'), '07', (d.precio_vta * d.import_cam),
                                  0)))),
                  (decode(d.moneda, 'D', decode(to_char(d.fecha, 'MM'), '07', d.precio_vta, 0),
                          (decode(to_char(d.fecha, 'MM'), '07', (d.precio_vta / d.import_cam),
                                  0)))))) as "JUL"
     , sum(decode('D', 'S',
                  (decode(d.moneda, 'S', decode(to_char(d.fecha, 'MM'), '08', d.precio_vta, 0),
                          (decode(to_char(d.fecha, 'MM'), '08', (d.precio_vta * d.import_cam),
                                  0)))),
                  (decode(d.moneda, 'D', decode(to_char(d.fecha, 'MM'), '08', d.precio_vta, 0),
                          (decode(to_char(d.fecha, 'MM'), '08', (d.precio_vta / d.import_cam),
                                  0)))))) as "AGO"
     , sum(decode('D', 'S',
                  (decode(d.moneda, 'S', decode(to_char(d.fecha, 'MM'), '09', d.precio_vta, 0),
                          (decode(to_char(d.fecha, 'MM'), '09', (d.precio_vta * d.import_cam),
                                  0)))),
                  (decode(d.moneda, 'D', decode(to_char(d.fecha, 'MM'), '09', d.precio_vta, 0),
                          (decode(to_char(d.fecha, 'MM'), '09', (d.precio_vta / d.import_cam),
                                  0)))))) as "SET"
     , sum(decode('D', 'S',
                  (decode(d.moneda, 'S', decode(to_char(d.fecha, 'MM'), '10', d.precio_vta, 0),
                          (decode(to_char(d.fecha, 'MM'), '10', (d.precio_vta * d.import_cam),
                                  0)))),
                  (decode(d.moneda, 'D', decode(to_char(d.fecha, 'MM'), '10', d.precio_vta, 0),
                          (decode(to_char(d.fecha, 'MM'), '10', (d.precio_vta / d.import_cam),
                                  0)))))) as "OCT"
     , sum(decode('D', 'S',
                  (decode(d.moneda, 'S', decode(to_char(d.fecha, 'MM'), '11', d.precio_vta, 0),
                          (decode(to_char(d.fecha, 'MM'), '11', (d.precio_vta * d.import_cam),
                                  0)))),
                  (decode(d.moneda, 'D', decode(to_char(d.fecha, 'MM'), '11', d.precio_vta, 0),
                          (decode(to_char(d.fecha, 'MM'), '11', (d.precio_vta / d.import_cam),
                                  0)))))) as "NOV"
     , sum(decode('D', 'S',
                  (decode(d.moneda, 'S', decode(to_char(d.fecha, 'MM'), '12', d.precio_vta, 0),
                          (decode(to_char(d.fecha, 'MM'), '12', (d.precio_vta * d.import_cam),
                                  0)))),
                  (decode(d.moneda, 'D', decode(to_char(d.fecha, 'MM'), '12', d.precio_vta, 0),
                          (decode(to_char(d.fecha, 'MM'), '12', (d.precio_vta / d.import_cam),
                                  0)))))) as "DIC"
     , sum(decode('D', 'S', (decode(d.moneda, 'S', d.precio_vta, (d.precio_vta * d.import_cam))),
                  (decode(d.moneda, 'D', d.precio_vta, (d.precio_vta / d.import_cam))))) as "TOTAL"
  from docuvent d
 where d.estado <> 9
   and d.tipodoc in ('01', '03', '07')
   and d.fecha >= trunc(trunc(sysdate - 365) + 30, 'MONTH')
   and d.cod_cliente = '20538428524'
 group by d.cod_cliente, d.nombre;

select *
  from clientes
 where nombre like '%LUCAS%';
