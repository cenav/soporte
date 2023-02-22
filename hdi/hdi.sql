insert into usuarios_tipos(usuario, tipo, mes_predeterminado)
select 'ECHINCHA', tipo, mes_predeterminado
  from usuarios_tipos
 where usuario = 'MDIAZ';

select *
  from usuarios_tipos
 where usuario = 'ECHINCHA';

select *
  from factpag
 where cod_proveedor = '99000038'
   and tipdoc = '91'
   and numero in ('0000027', '0000030', '0000033');

select *
  from plancta
 where cuenta = '42122300';

select *
  from plancta
 where cuenta in ('77611101', '93611101');

-- 77611101
-- 93611101

select *
  from plancta
 where descripcion like '%cambio%';

select sign(-7000) as negativo, sign(0) as cero, sign(3000) as positivo  from dual;
