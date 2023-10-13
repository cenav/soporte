select *
  from transacciones_almacen
 where descripcion like '%VENTA%';


select cod_alm, descripcion
  from almacenes a
 where cod_alm in ('A1', 'A4')
   and nvl(estado, 0) = 1
 order by 1;


select tp_transac, descripcion
  from transacciones_almacen
 where tp_transac = '21'
   and ingreso_salida = 'S'
   and estado = 1;