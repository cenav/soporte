select *
  from articul
 where cod_art = 'R-09283-32016-JN';

select *
  from expednac_d
 where numero = 424
   and cod_art = 'R-09283-32016-JN';

-- abre01, per_env --> numero, nro
-- abre02 --> pedido importacion
select *
  from pr_ot
 where nuot_tipoot_codigo = 'FC'
   and nuot_serie = 1
   and numero = 230;

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'FC'
   and ot_nuot_serie = 1
   and ot_numero = 230;

select *
  from tab_lineas
 where linea = '829';

select *
  from tab_lineas
 where linea = '935';