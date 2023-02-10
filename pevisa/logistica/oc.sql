select *
  from orden_de_compra
 where serie = 5
   and num_ped = 2137;

select *
  from itemord
 where serie = 5
   and num_ped = 2137;

select *
  from oc_registro_facturas
 where serie_oc = 5
   and numero_oc = 2137;