select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero in (
   654664
   );

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero in (
   654664
   );

-- Obtenemos el número de lote
select *
  from pr_formu f
 where f.vigencia = 1
   and f.art_cod_art = 'FOR3805';


-- Actualizamos la cantidad de la fórmula
update pr_ot_det d
   set d.cant_formula = (:p_cant_programada * d.rendimiento) / nullif(:p_lote, 0)
 where d.ot_nuot_tipoot_codigo = 'PR'
   and d.ot_numero in (
   654664
   );