select *
  from usuarios_almacenes_perfil
 where usuario = 'EBELTRAN'
   and cod_alm = ('05')
   and tp_transac in ('15', '28');

select *
  from almacenes
 where estado = '1';

select *
  from transacciones_almacen
 where flg_ajuste = 1;