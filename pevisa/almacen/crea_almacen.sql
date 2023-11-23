select *
  from almacenes
 order by cod_alm;

select *
  from tablas_auxiliares
 where tipo = 33
   and codigo != '....'
 order by codigo;

select *
  from transacciones_almacen
 where tp_transac = '35';

select *
  from numdoc
 where tp_transac = '35'
 order by serie;

select * from almacen_trasaccion_serie;

select * from traslados_almacenes;

select * from sucursales;

select *
  from sucursales
 where cod_cliente = '20100084768'
 order by nro_sucur;

-- AV. LOS FORESTALES 1296 VILLA EL SALVADOR, LIMA-PERÚ

select *
  from almacen_punto_partida_llegada
 where cod_alm = '02';

select n.serie, n.automatico
  from numdoc n
     , almacen_trasaccion_serie t
 where n.tp_transac = '35'
   and n.tp_transac = t.tp_transac
   and t.cod_alm = '02'
   and n.serie = t.serie
 order by 1;

select ta.cod_alm_destino, a.descripcion
  from traslados_almacenes ta
     , almacenes a
 where ta.cod_alm_destino = a.cod_alm
   and ta.cod_alm_origen = '02'
 order by 1;

select nro_sucur, direccion
  from sucursales
 where cod_cliente = '20100084768'
   and nro_sucur = (
   select punto
     from almacen_punto_partida_llegada
    where cod_alm = 'V0'
   );

select *
  from almacen_punto_partida_llegada
 where cod_alm = 'V0';

select *
  from almacenes
 where cod_alm_transito is not null;

select *
  from almacenes
 where cod_alm_transito = '63';

select *
  from almacenes
 where cod_alm = '63';

select *
  from almacenes
 where descripcion like '%TRANSITO%';

select *
  from planilla10.personal
 where apellido_paterno = 'GARCIA';

select *
  from pcarticul
 where cod_sunat is not null;
