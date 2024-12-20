select *
  from usuarios_cotizacion
 where usuario in ('MVARGAS', 'JSOTOMAYOR');

select *
  from vendedores
 where cod_vendedor = 'A4';

select *
  from vendedores
 where abreviada = 'SLATORRE';

select *
  from vendedores
 where nombre like '%PUENTE%';

select cod_vendedor, indicador1
  from vendedores
 where abreviada = 'SLATORRE'
   and estado = '1';