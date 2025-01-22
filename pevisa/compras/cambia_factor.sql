select *
  from itemord
 where serie = 1
   and num_ped = 84820;

-- debe cuadrar con el total de la factura
select precio * cant_ped / factor_uc, total
     , precio * cant_ped / total as factor_calculado, factor_uc
     , precio * :p_cant_ingresar / factor_uc, total
  from itemord
 where serie = 1
   and num_ped in (
   83659
   );

-- factor segun la cantidad a ingresar y el total de la factura
select precio * :p_cant_ingresar / :p_total_factura as factor
  from itemord
 where serie = 1
   and num_ped in (
   83659
   );

-- el factor calculado debe cuadrar con el valor de la factura
select precio * 546.1, 1.10363514974882260596546310832025117739
  from itemord
 where serie = 1
   and num_ped in (
   83659
   );
