select *
  from orden_de_compra
 where serie = 13
   and num_ped in (4235, 4236, 4237, 4238, 4239);

select *
  from itemord
 where serie = 5
   and num_ped = 2137;

select *
  from oc_registro_facturas
 where serie_oc = 5
   and numero_oc = 2137;

select *
  from kardex_d
 where cod_alm = 'A3'
   and tp_transac = '11'
   and serie = 1
   and numero = 29834;
