select *
  from orden_de_compra
 where serie = 3
   and num_ped in (43104);

select *
  from itemord
 where serie = 1
   and num_ped in (84849);

select *
  from orden_de_compra_historia
 where serie = 3
   and num_ped in (43104);

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
