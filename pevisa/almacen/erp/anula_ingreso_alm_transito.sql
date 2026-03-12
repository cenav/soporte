-- anula salida de almacen de transito e ingreso a almacen destino
-- cambiar saldo a 0 --> kardex_d.pr_canthabi
-- cambiar local destino --> kardex_g.cod_vende

select *
  from kardex_g
 where cod_alm = '58'
   and tp_transac = '10'
   and serie = 131
   and numero = 2395;


select *
  from kardex_g
 where cod_alm = '58'
   and tp_transac = '10'
   and serie = 131
   and numero = 2395;


select *
  from kardex_d
 where cod_alm = '58'
   and tp_transac = '10'
   and serie = 131
   and numero = 2395;


select *
  from kardex_d
 where cod_alm = '58'
   and tp_transac = '10'
   and serie = 131
   and numero = 2395;
