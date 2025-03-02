select * from caja_chica;

select * from caja_chica_d;

select * from caja_chica_serie;

select * from caja_chica_motivos;

select * from centro_de_costos;

-- plan de cuentas
select * from plancta;

-- libros contables
select *
  from tablas_auxiliares
 where tipo = 1
 order by codigo;

-- numeracion de libros
select * from nrolibr;

-- asientos contables maestro
select * from movglos;

-- asientos contables detalle
select * from movdeta;

-- facturas por pagar (estado de cuenta)
select * from factpag;
