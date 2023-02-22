select *
  from orden_de_compra
 where serie = 1
   and num_ped in (84822);

select *
  from itemord
 where serie = 1
   and num_ped in (84849);

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
  from kardex_d
 where cod_alm = 'A3'
   and tp_transac = '11'
   and serie = 1
   and numero = 29834;

select *
  from caja_chica
 where serie = 2
   and numero = 230013;

select *
  from gastos_de_viaje_habilitado_m
 where id_vendedor = '21'
   and numero = '168';

select * from gastos_de_viaje_motivos;