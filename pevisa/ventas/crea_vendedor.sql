select *
  from usuarios_cotizacion
 where usuario in ('MVARGAS', 'JSOTOMAYOR');


select *
  from tablas_auxiliares
 where tipo = 29
   and codigo <> '....';

select *
  from vendedores
 where cod_vendedor in ('B11', 'B12');

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

-- LOV código vendedor modulo cotización
select codigo, descripcion, indicador3
  from tablas_auxiliares
 where tipo = 29
   and codigo <> '....'
   and codigo in (
   select cod_vendedor
     from vendedores
    where abreviada = :usuario
   )
 union all
select codigo, descripcion, indicador3
  from tablas_auxiliares
 where tipo = 29 and codigo <> '....'
   and exists (
   select usuario
     from usuarios_cotizacion
    where usuario = :usuario
      and indicador3 = '1'
   )
 order by 1;
