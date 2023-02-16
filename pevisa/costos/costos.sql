select *
  from kardex_g
 where num_importa like 'BSERVL009-%';

select *
  from kardex_d
 where cod_alm = '15'
   and tp_transac = '11'
   and serie = 2
   and numero = 7056;

select *
  from kardex_g_movglos
 where cod_alm = '15'
   and tp_transac = '11'
   and serie = 2
   and numero = 7056;

select *
  from caja_chica_d
 where alm_transac = '03'
   and tpo_transac = '11'
   and ser_transac = 2
   and nro_transac = 6794;
