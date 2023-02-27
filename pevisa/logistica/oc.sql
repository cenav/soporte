select *
  from orden_de_compra
 where serie = 3
   and num_ped in (43144);

select *
  from itemord
 where serie = 1
   and num_ped in (84861);

select *
  from orden_de_compra_historia
 where serie = 1
   and num_ped in (84822)
   and glosa = 'APROBADO';

select *
  from oc_registro_facturas
 where serie_oc = 5
   and numero_oc = 2137;

select *
  from kardex_g
 where cod_alm = '02'
   and tp_transac = '11'
   and serie = 1
   and numero = 29913;

select *
  from kardex_d
 where cod_alm = '02'
   and tp_transac = '11'
   and serie = 1
   and numero = 29913;

select *
  from caja_chica
 where serie = 2
   and numero = 230013;

select *
  from gastos_de_viaje_habilitado_m
 where id_vendedor = '21'
   and numero = '168';

select * from gastos_de_viaje_motivos;
