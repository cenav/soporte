-- almacenes salida Ate 02, 03, 05, 01
select *
  from almacenes
 where descripcion like '%BFS%';

select *
  from almacen
 where cod_art in ('SA KITHS1725112S-1', 'CNIT 300');

select *
  from almacenes
 order by cod_alm;

select *
  from tablas_auxiliares
 where tipo = '33'
 order by codigo;

select *
  from pr_usualma
 where usuario = 'PEVISA'
 order by cod_alm;

select *
  from traslados_almacenes
 where cod_alm_origen = '02';

select *
  from almacen_trasaccion_serie
 where cod_alm = '02'
 order by serie;

select *
  from numdoc
 where tp_transac = '35'
 order by serie;

select *
  from almacen_punto_partida_llegada
 where cod_alm = '02';

select ta.cod_alm_destino, a.descripcion
  from traslados_almacenes ta
     , almacenes a
 where ta.cod_alm_destino = a.cod_alm
   and ta.cod_alm_origen = '02'
 order by 1;

select *
  from solimat_g
 where numero = 198873;

select *
  from solimat_d
 where numero = 198873;

select nro_sucur, direccion
  from sucursales
 where cod_cliente = '20100084768'
   and nro_sucur = (
   select punto
     from almacen_punto_partida_llegada
    where cod_alm = :p_destino
   );

select *
  from sucursales
 where cod_cliente = '20100084768'
 order by nro_sucur;

select *
  from kardex_g
 where cod_alm = '02'
   and tp_transac = '35'
   and serie = 700
   and numero = 1;

select *
  from kardex_d
 where cod_alm = '02'
   and tp_transac = '35'
   and serie = 700
   and numero = 1;

select *
  from kardex_g
 where cod_alm = 'BT'
   and extract(year from fch_transac) = 2024;

select *
  from kardex_g
 where cod_alm = 'B1';

select *
  from kardex_d
 where cod_alm = 'B1';

select *
  from kardex_g
 where estado <= 7
   and tp_transac = '10'
   and ing_sal = 'I'
   and cod_relacion = '20100084768'
   and nro_sucur in ('04', '05', '06', '11', '03', '07', '08')
   and cod_alm in
       (
         select cod_alm_transito
           from almacenes
          where cod_alm_transito is not null
            and cod_alm_transito = kardex_g.cod_alm
         );
