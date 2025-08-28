select * from vw_liberacion_producto;

select *
  from embarques_liberacion
 where numero_embarque = 5067;


select *
  from pevisa.embarques_liberacion
 where numero_embarque = '5379'
   and num_importa = 'PVC25066'
   and cod_art = '10005-FS MLS';


select * from pevisa.estados_liberacion_producto;