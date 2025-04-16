select *
  from pr_ot
 where nuot_tipoot_codigo = 'FC'
   and numero = 506;

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'FC'
   and ot_numero in (
                     506, 507, 508, 509, 510, 511, 512, 513, 514, 515
   );

select *
  from pr_ot
 where nuot_tipoot_codigo = 'FC'
   and abre01 = '499';