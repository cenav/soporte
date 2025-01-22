-- eliminar las facturas que no deben aparacer en el listado
select *
  from excomision_repre_fact
 where codigo = 202
   and numero_factura not in (
                              55018374, 55018376, 55018422, 55018443, 55018444, 55018453, 55018490,
                              55018532, 55018533, 55018567, 55018568, 55018575, 55018608, 55018727
   );

-- fecha de proceso de comision dejar en nulo
select *
  from exfacturas
 where numero in (
                  55017990, 55018119, 55018289, 55018445, 55018446, 55018509, 55018511, 55018574,
                  55018629, 55018630, 55018643, 55018652, 55018663, 55018691, 55018692, 55018700,
                  55018721, 55018746, 55018796, 55018797, 55018798, 55018812, 55018840, 55018858,
                  55018942, 55018975, 55019033, 55019038
   );