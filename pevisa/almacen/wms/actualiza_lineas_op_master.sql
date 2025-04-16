select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 602870;

merge into pr_ot_det d
using articul a
on (d.art_cod_art = a.cod_art)
when matched then
  update
     set d.cod_lin = a.cod_lin
   where d.ot_nuot_tipoot_codigo = 'PR'
     and d.ot_numero in (602866,606824,606829,606826,606825);