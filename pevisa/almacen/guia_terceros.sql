select *
  from pcarticul
 where cod_art in (
                   'RODILLOS', 'PLANCHAS METALICAS', 'CUCHILLAS ', 'MESAS DE AMARRE', 'SOPORTES',
                   'EJES ', 'ENGRANAJES', 'POLEAS', 'MOTORES', 'TRANSFORMADORES',
                   'ELEMENTOS DE MAQUINAS', 'RUEDAS', 'SIERRA CINTA', 'FAJA TRANSPORTADORA',
                   'MARTILLETE', 'CABEZAL DE MAQUINA', 'PLATINA', 'GUIADORES', 'FRENOS', 'EMBRAGUE',
                   'ZAPATAS', 'RESORTES', 'COMPRESOR', 'TARJETA ELECTRONICA', 'PC DE MAQUINA',
                   'PLC', 'CONTROL ELECTRONICO', 'TORNILLOS', 'MUESTRAS DE REPUESTO'
   );

select *
  from kardex_d
 where cod_art in (
                   'MOTORES', 'TARJETA ELECTRONICA'
   );

select *
  from transacciones_almacen
 where tp_transac = '22';

select * from almacen_activo_fijo
where cod_alm = 'A2';
