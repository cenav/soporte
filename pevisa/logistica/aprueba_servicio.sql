select *
  from orden_de_compra_calificacion
 where serie = 3
   and num_ped = 44336;

select *
  from orden_de_compra_calificacion
 where serie = 3
   and num_ped = 44336;

insert into orden_de_compra_calificacion( num_ped, serie, c_resp, fecha_calificacion
                                        , detalle_servicio_recibido, evaluacion_a, evaluacion_b
                                        , usuario_calificacion, aprueba_pago)
select num_ped, serie, c_resp, sysdate, 'A', 'A', 'A', 'PEVISA', 'SI'
  from orden_de_compra
 where serie = 3
   and num_ped = 44336;
