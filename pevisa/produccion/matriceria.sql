select distinct a.cod_alm, b.descripcion
  from usuarios_almacenes_perfil a
     , almacenes b
 where a.usuario = user
   and a.cod_alm = b.cod_alm
   and a.estado = 1
 order by a.cod_alm;

select *
  from almacenes
 where cod_alm in ('M1');

select *
  from almacenes
 where descripcion like '%MATRICERIA%'
   and cod_alm in ('M1', 'M2', 'M3', 'M4');

select tp_transac, descripcion
  from transacciones_almacen
 where tp_transac = '15';


select serie, automatico
  from numdoc
 where tp_transac = '15';

select *
  from articul
 where cod_lin = '';

select *
  from tab_lineas
 where linea = '1980';

select * from usuarios_almacenes;

select a.cod_art, a.descripcion, a.tp_c_stck, a.unidad, m.stock, a.tp_art, a.cod_fam, a.cod_lin
  from almacen m
     , articul a
 where m.cod_alm = 'M1'
   and m.cod_art = a.cod_art
   and a.estado <> '9'
   and a.cod_lin not in ('ZZ', '1980')
 order by a.descripcion;

select *
  from tablas_auxiliares
 where tipo = 33
   and codigo in ('M1', 'M2', 'M3', 'M4');

select *
  from tablas_auxiliares
 where tipo = '34';

select *
  from alcontrol
 where usuario = 'RLUCANO';

select nom_menu
  from menu_inventario
 where id_menu = 'R';

select * from menu_inventario;

select *
  from seccrus
 where co_usrusr = 'RLUCANO';

select *
  from seccrus
 where co_usrusr = 'JCABEZAS';

select serie, num_ped, count(*) as total
  from orden_de_compra_historia
 where extract(year from creacion_cuando) = 2023
   and glosa = 'APROBADO'
having count(*) > 1
 group by serie, num_ped;

select *
  from orden_de_compra_historia
 where serie = 1
   and num_ped = 85113
   and glosa = 'APROBADO';

select * from paramlg;