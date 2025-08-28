select *
  from almacenes
 where cod_alm = 'SR'
 order by cod_alm;

select *
  from pr_usualma
 where usuario = 'DCONTRERAS'
   and cod_alm = 'SR';

-- 27 16
select *
  from transacciones_almacen
 where descripcion like '%TRANSF%';

select * from almacenes_perfil;

select *
  from usuarios_almacenes_perfil
 where usuario = 'DCONTRERAS';