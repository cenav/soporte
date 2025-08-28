-- reporte bobinas
select a.cod_art, a.consumo_anual, f.cod_art, f.canti
  from pcformulas f
       join vw_articulo a on f.cod_for = a.cod_art
 where a.cod_art = 'BO 1.2GR-165';

-- reporte bobinas x linea
select a.cod_art, a.consumo_anual, f.cod_art, f.canti
  from pcformulas f
       join vw_articulo a on f.cod_for = a.cod_art
 where a.cod_lin between '1630' and '1634'
   and length(a.cod_lin) = 4;

select *
  from pcformulas
 where cod_for = 'BO 1.2GR-165';

select *
  from numdoc
 where tp_transac = '10'
   and serie = 131;

select *
  from transacciones_almacen
 where tp_transac = '10';

select * from kardex_d_otros;

select *
  from notificacion
 where sistema = 'ACTIVO_FIJO'
   and proceso = 'INGRESO_ALMACEN';

select *
  from pr_ot_det_lin
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 609595;

select *
  from pr_ot
 where extract(year from fecha) = 2025
   and extract(month from fecha) = 5;

select *
  from prod_subgrupo_linea_rel
 where id_linea = '2021';
