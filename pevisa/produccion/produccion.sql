select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero in (
                  469861, 469858, 475239, 475236, 487587, 487590
   );

select *
  from pr_ot
 where nuot_tipoot_codigo = 'VA'
   and numero in (
   9759
   );

select *
  from kardex_g
 where cod_alm = '18'
   and tp_transac = '18'
   and serie = 2
   and numero = 516713;

select *
  from kardex_g
 where cod_alm = '18'
   and tp_transac = '29'
   and serie = 1
   and numero = 1630;