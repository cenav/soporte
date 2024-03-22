select *
  from usuarios_cotizacion
 where usuario in ('SLATORRE', 'CMIESES');

select *
  from vendedores
 where cod_vendedor = '04';

select *
  from vendedores
 where abreviada = 'SLATORRE';

select cod_vendedor, indicador1
  from vendedores
 where abreviada = 'SLATORRE'
   and estado = '1';

