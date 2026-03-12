-- cuadra stock WMS con ERP
select *
  from wms_alm_ubicacion
 where cod_art = 'PIED-PEV-0019'
 order by fecha_ingreso;

select *
  from articul
 where cod_art = 'BO-N8094 0.5';

-- lv_stock_wms
select nvl(sum(cantidad), 0)
  from wms_alm_ubicacion
 where cod_alm = '30'
   and cod_art = 'BO-N8094 0.5'
   and estado <> '9';

select *
  from almacenes
 where cod_alm like 'RV';

select *
  from usuarios_almacenes_perfil
 where cod_alm = 'RV';

select *
  from kardex_d
 where cod_alm = 'RV'
 order by fch_transac desc;

select *
  from transacciones_almacen
 where tp_transac = '35';