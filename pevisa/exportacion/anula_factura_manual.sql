-- estado = 9
select *
  from exfacturas
 where numero in (
   55019734
   );

select *
  from exfacturas_detalles
 where numero = 55019734;

insert into exfacturas_detalles
  (numero, evento, detalle)
values
  (55019734, '04', 'FACTURACION DOBLE');

-- estado = 9
select *
  from docuvent
 where tipodoc = '01'
   and serie = 'F055'
   and numero = 19734;

select distinct descripcion, codigo
  from tablas_auxiliares
 where tipo = '86'
   and codigo <> '....'
 order by descripcion;