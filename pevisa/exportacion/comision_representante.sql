-- eliminar las facturas que no deben aparacer en el listado
select *
  from excomision_repre_fact
 where codigo = 201
   and numero_factura not in (
                              55017703, 55017723, 55017947, 55017972, 55018056, 55018088, 55018096,
                              55018102, 55018103, 55018135, 55018143, 55018162, 55018187, 55018189,
                              55018201, 55018227, 55018236, 55018262, 55018263, 55018268, 55018273,
                              55018286, 55018373
   );

-- fecha de proceso de comision dejar en nulo
select *
  from exfacturas
 where numero in (
                  55018374, 55018376, 55018422, 55018443, 55018444, 55018453, 55018490, 55018532,
                  55018533, 55018567, 55018568, 55018575, 55018608, 55018727
   );