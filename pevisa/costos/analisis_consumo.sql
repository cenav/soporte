begin
  pkg_analisis_consumo.procesa(2023, 05);
end;

select *
  from analisis_consumo
 where ano = 2023
   and mes = 5;

select * from error_log order by id_log desc;

-- PR 8 503540 BO 2.0GR-200
select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero = 513172;

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 513172;

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 513172
   and art_cod_art = 'BO 1.4TG-165';

-- l_cant_ing_prod_fecha ==> formula original