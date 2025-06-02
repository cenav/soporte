-- 578887 buen ejemplo
-- 577473
select *
  from wms_rec_oms
 where extract(year from ot_fecha) = 2025
   and extract(month from ot_fecha) = 3;

select *
  from wms_rec_oms
 where usuario = 'CNAVARRO';

-- modelo de tabla de solicitud
select *
  from wms_orden_sol
 where tipo = 'PR';

select * from wms_orden_sol_item;

select * from wms_estado_solicitud;

-- EB tipo embolsado
select *
  from wms_rec_oms
 where rec_tipo = 'EB';

select *
  from wms_rec_oms
 where ot_numero = :p_numero;

select *
  from wms_orden_rec
 where tipo = 'EB'
   and serie = 1
   and numero = 1618;

select *
  from wms_orden_rec
 where nro_pedido = 1643;

select *
  from wms_orden_rec;


select rec_tipo, rec_serie, rec_numero, ot_tipo, ot_numero, count(*) as ordenes
  from wms_rec_oms
having count(*) > 1
 group by rec_tipo, rec_serie, rec_numero, ot_tipo, ot_numero;

select *
  from pr_ot_bolsas
 where nuot_tipoot_codigo = 'PR'
   and numero = :p_numero
   and id_etiqueta is not null;

select * from tmp_solicita_ingreso_wms;

select ot_tipo, ot_serie, ot_numero, cod_art, sum(cantidad) as cant_tot
  from tmp_solicita_ingreso_wms
 group by ot_tipo, ot_serie, ot_numero, cod_art;

select *
  from pr_ot
 where numero = 578887;

select *
  from pcarticul
 where cod_art = '66100CS-4';

select * from wms_rec_oms_item;

select *
  from tmp_solicita_ingreso_wms;

select *
  from pr_ot_bolsas
 where nuot_tipoot_codigo = 'PR'
   and numero = 578887;

/*
insert into wms_rec_oms_item( rec_tipo, rec_serie, rec_numero, rec_item, bolsa, id_etiqueta
                            , cantidad)
select 'EB', 1, 77777, 0 + rownum, bolsa, id_etiqueta, cantidad
  from pr_ot_bolsas
 where nuot_tipoot_codigo = 'PR'
   and numero = 578887;
*/

/*
select nvl(max(rec_item), 0)
  into x_ultimo
  from wms_rec_oms_item
 where rec_tipo = x_tipo
   and rec_serie = x_serie
   and rec_numero = x_numero;
*/

select *
  from wms_rec_oms
 where ot_tipo = 'PR'
   and ot_numero = 600256;

select *
  from wms_rec_oms_item
 where rec_tipo = 'EB'
   and rec_numero = 2630;

select *
  from pr_ot_bolsas
 where nuot_tipoot_codigo = 'PR'
   and numero = 607332;

select *
  from wms_rec_oms
 order by usuario;

select distinct cod_art
  from wms_rec_oms
 order by cod_art;

select * from pr_ot_bolsas
where trunc(fecha) > to_date('01/05/2025', 'dd/mm/yyyy')
and usuario = 'WCORONEL';