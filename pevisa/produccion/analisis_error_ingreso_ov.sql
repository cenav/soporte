select *
  from pr_ot
 where nuot_tipoot_codigo in ('PR', 'VA') and estado < 7;

select *
  from pr_ot
 where numero = 12004;

select *
  from kardex_d
 where cod_alm = '30'
   and tp_transac = '18'
   and serie = 2
   and numero = 623771;
