-- eliminar las facturas que no deben aparacer en el listado
select *
  from excomision_repre_fact
 where codigo = 188
   and numero_factura not in (
                              55015577, 55015816, 55016026, 55016222
   );

-- fecha de proceso de comision dejar en nulo
select *
  from exfacturas
 where numero in (
   55006522
   );
