select *
  from pr_estados_sao
 order by estado;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'SA'
   and numero in (1047, 1691);