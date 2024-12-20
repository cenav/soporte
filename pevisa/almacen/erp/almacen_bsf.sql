-- almacenes salida Ate 02, 03, 05, 01
select *
  from almacenes
 where descripcion like '%SALVADOR%';

select *
  from almacenes
 where cod_alm in ('01', '02', '03', '05', 'V0', 'BT', 'B1');

select *
  from almacen_local
 where cod_alm in ('01', '02', '03', '05', 'V0', 'B1', 'BT');

select * from locales;

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
 where usuario in ('DCONTRERAS', 'JNEYRA', 'PEVISA', 'PCALDERON', 'LARIAS')
   and cod_alm in ('B1', 'BT')
 order by cod_alm;

select *
  from traslados_almacenes
 where cod_alm_origen in ('01', '02', '03', '05', 'V0')
   and cod_alm_destino = 'B1'
 order by cod_alm_destino;

select *
  from traslados_almacenes
 where cod_alm_destino = 'B1'
 order by cod_alm_destino;

select *
  from traslados_almacenes
 where cod_alm_origen = 'B1'
 order by cod_alm_destino;

select *
  from almacen_trasaccion_serie
 where cod_alm in ('01', '02', '03', '05', 'V0', 'F0', 'B1')
   and serie in (147, 148, 149, 151, 152)
 order by cod_alm;

-- Series según almacén y transacción
select n.serie, n.automatico
  from numdoc n
     , almacen_trasaccion_serie t
 where n.tp_transac = :p_tp_transac
   and n.tp_transac = t.tp_transac
   and t.cod_alm = :p_cod_alm
   and n.serie = t.serie
 order by 1;

select *
  from transacciones_almacen
 where tp_transac in ('35', '10', '22');

select *
  from numdoc
 where tp_transac = '35'
 order by serie;

select *
  from numdoc
 order by serie;

select * from sucursales where cod_cliente = '20100084768' order by nro_sucur;

-- almacen sucursal (tiene nombre cojudo)
select *
  from almacen_punto_partida_llegada
 where cod_alm in ('B1');

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
 where cod_alm = 'BT';

select *
  from kardex_g
 where estado <= 7
   and tp_transac = '10'
   and ing_sal = 'I'
   and cod_relacion = '20100084768'
   and nro_sucur in ('04', '05', '06', '11', '03', '07', '08')
   and cod_alm in (
   select cod_alm_transito
     from almacenes
    where cod_alm_transito is not null
      and cod_alm_transito = kardex_g.cod_alm
   );

select *
  from kardex_g
 where cod_alm = 'F0'
   and serie = 149;

select *
  from kardex_d
 where cod_alm = 'F0'
   and tp_transac = '35'
   and serie = 149
   and numero = 2;

select *
  from almacenes
 where descripcion like '%PUNTA HERMOSA%';

select *
  from kardex_g
 where estado <= 7
   and tp_transac = '25'
   and ing_sal = 'S'
   and cod_relacion = '20100084768'
   and nro_sucur in ('03')
   and pr_procedencia = 'PK_NACIONAL'
   and tara_co is not null
   and tara_co > tara_bo
   and user in ('PQUEZADA', 'PFALMAUX031', 'RGONZALES', 'PEVISA', 'JNEYRA');

select *
  from kardex_g
 where estado <= 7
   and tp_transac = '10'
   and ing_sal = 'I'
   and cod_relacion = '20100084768' and nro_sucur in ('04', '05', '06', '11', '03', '07', '08')
   and cod_alm in (
   select cod_alm_transito
     from almacenes
    where cod_alm_transito is not null
      and cod_alm_transito = kardex_g.cod_alm
   )
   and serie = 149
   and numero = 2;

-- usuario oracle alamcen faucett PCALDERON

select *
  from seccrus
 where co_usrusr in ('PCALDERON', 'JNEYRA');

select *
  from kardex_d
 where serie = 148;

select *
  from sucursales
 where cod_cliente = '00000998099';

select *
  from clientes
 where cod_cliente = '00000998099';

select *
  from numdoc
 where tp_transac = '35'
   and serie = 151;

select *
  from numdoc
 where tp_transac = '35'
   and serie in (
                 147, 148, 149, 151, 152
   );

select *
  from numdoc
 where serie > 100;

select *
  from pr_usualma
 where usuario = 'DCONTRERAS'
 order by cod_alm;