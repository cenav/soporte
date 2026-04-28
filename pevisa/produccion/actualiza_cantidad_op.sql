declare
  k_num_op    constant number := 656701;
  k_cant_prog constant number := 1988;
  l_lote               number := 0;
begin
     update pr_ot
        set cant_prog = k_cant_prog
      where nuot_tipoot_codigo = 'PR'
        and nuot_serie = 8
        and numero = k_num_op
  returning lote into l_lote;

  dbms_output.put_line(l_lote);

  update pr_ot_det d
     set d.cant_formula    = (k_cant_prog * d.rendimiento) / nullif(l_lote, 0)
       , d.cant_despachada = (k_cant_prog * d.rendimiento) / nullif(l_lote, 0)
   where d.ot_nuot_tipoot_codigo = 'PR'
     and d.ot_numero = k_num_op;
exception
  when others then
    raise_application_error(-20000, sqlerrm);
end;

select *
  from pevisa.pr_ot
 where nuot_tipoot_codigo = 'PR'
   and estado != '9'
   and extract(year from fecha) = 2025;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero in (
   559927
   );

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero in (
   655599
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
   655633
   );

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

select *
  from tmp_carga_data;