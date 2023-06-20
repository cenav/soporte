select *
  from cotizacion
 where serie = 20
   and num_ped = 3410;

-- GET_CORREO_EFACT

select correo
  from cliente_resp
 where cod_cliente = '20505542364'
   and cod_respo = '80'; ----------------- UBICACION DEL CORREO PARA EFACT

select *
  from cliente_resp
 where cod_cliente = '20505542364';