select *
  from kardex_g
 where cod_alm = 'F0'
   and tp_transac = '15'
 order by fch_transac desc;


select *
  from kardex_g
 where cod_alm = 'F0'
   and tp_transac = '15'
   and serie = 1
   and numero = 2127;


select *
  from kardex_d
 where cod_alm = 'F0'
   and tp_transac = '15'
   and serie = 1
   and numero = 2127;

