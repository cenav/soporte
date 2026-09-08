select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero in (
   655633
   );

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero in (
   655633
   );

-- Obtenemos el número de lote
select *
  from pr_formu f
 where f.vigencia = 1
   and f.art_cod_art = 'FOR3805';


-- Actualizamos la cantidad de la fórmula
update pr_ot_det d
   set d.cant_formula = (:p_cant_programada * d.rendimiento) / nullif(:p_lote, 0)
 where d.ot_nuot_tipoot_codigo = 'AR'
   and d.ot_numero in (
   1127467
   );


-- Actualizamos rendimiento
update pr_ot_det d
   set d.rendimiento  = :p_rendimiento
     , d.cant_formula = ((
                           select o.cant_prog
                             from pr_ot o
                            where o.nuot_tipoot_codigo = d.ot_nuot_tipoot_codigo
                              and o.nuot_serie = d.ot_nuot_serie
                              and o.numero = d.ot_numero
                           ) * :p_rendimiento) / nullif(:p_lote, 0)
 where d.ot_nuot_tipoot_codigo = 'PR'
   and d.ot_numero in (660320)
   and d.art_cod_art = 'XCA-73R-M';

select *
  from pr_ot_orden_de_servicio
 where numero = 657448;


select *
  from pr_ot_orden_de_servicio
 where oc_numero = 23591;

select *
  from itemord
 where serie = 2
   and num_ped in (23589, 23586, 23590, 23591)
 order by item;

select *
  from pr_ot_det d
 where d.ot_nuot_tipoot_codigo = 'PR'
   and d.ot_nuot_serie = 8
   and d.art_cod_art = 'SERV PEV 790.590-R'
--    and exists(
--    select 1
--      from pr_ot o
--     where d.ot_nuot_tipoot_codigo = o.nuot_tipoot_codigo
--       and d.ot_nuot_serie = o.nuot_serie
--       and d.ot_numero = o.numero
--       and o.estado = '1'
--    )
 order by d.ot_numero desc;


select *
  from articul_servicios
 where cod_art = 'SERV PEV 790.590-R';

-- agrupas por OP (OS) y mandas la candida a compras