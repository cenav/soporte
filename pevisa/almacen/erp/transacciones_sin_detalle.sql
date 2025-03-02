select g.*
  from kardex_g g
 where g.fch_transac >= to_date('01/01/2024', 'dd/mm/yyyy')
   and g.estado != '9'
   and not exists (
   select *
     from kardex_d d
    where d.cod_alm = g.cod_alm
      and d.tp_transac = g.tp_transac
      and d.serie = g.serie
      and d.numero = g.numero
   )
 order by ing_sal desc;

-- transacción modelo
select *
  from kardex_d
 where cod_alm = '57'
   and tp_transac = '27'
   and serie = 2
   and extract(year from fch_transac) = 2024
   and extract(month from fch_transac) = 11
   and cod_art = '1021MLS';

insert into pevisa.kardex_d
  ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d, costo_s, fch_transac, por_desc1
  , por_desc2, imp_vvb, estado, cuenta69, origen, ing_sal, lote, conos, tara, flag, autonum, orden
  , pr_proveedor, pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob, pr_canthabi, pr_tipot
  , pr_numot, pr_numped)
values
  ( '57', '27', 2, 937559, '1021MLS', 660.0000, 0.000000, 0.000000, date '2025-01-20', 0.00, 0.00
  , 0.000, '2', null, 'P', 'S', null, null, null, null, null, null, null, null, null, null, 0.00
  , 0.0000, 0.0000, 'AR', 1065871, null);

