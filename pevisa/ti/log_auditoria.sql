select *
  from log_auditoria
 where tabla = 'PCFORMULAS'
   and accion = 'INSERT'
   and cod_id_pk = '%400.2145%'
 order by fecha desc;


select *
  from log_auditoria
 where tabla = 'PCFORMULAS'
--    and accion = 'INSERT'
   and cod_id_pk like '%SA 70046-1%'
 order by fecha desc;

select *
  from log_auditoria
 where tabla = 'ORDEN_DE_COMPRA'
   and cod_id_pk = '4-66710';

select *
  from log_auditoria
 where tabla = 'ORDEN_DE_COMPRA'
   and columna = 'MONEDA';

select *
  from log_auditoria
 where txt like '%SA 70046-1%';

select *
  from log_auditoria
 where txt like '%400.2145%';

select * from pcformulas;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'SA'
   and numero = 8503;


select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'SA'
   and ot_numero = 8503
   and art_cod_art = '400.2145';


select *
  from pcformulas
 where cod_art = 'SA 70046-1'
   and cod_for = '400.2145';


select *
  from pr_ot_historia
 where nuot_tipoot_codigo = 'SA'
   and numero = 8503
 order by creacion_cuando;


select *
  from solicita_cambio_ot
 where ot_tpo = 'SA'
   and ot_nro = 8503
 order by fch_solicitud desc;


select *
  from solicita_cambio_ot
 where ot_tpo = 'SA'
   and ot_nro = 8503
 order by fch_solicitud desc;


select art_cod_art
  from pr_for_ins
 where formu_art_cod_art = 'SA 70046-1'
 minus
select cod_for
  from pcformulas
 where cod_art = 'SA 70046-1';


select cod_for
  from pcformulas
 where cod_art = 'SA 70046-1'
 minus
select art_cod_art
  from pr_for_ins
 where formu_art_cod_art = 'SA 70046-1';

select * from log_auditoria;


select d.cod_art
     , sum(d.cantidad) as consumo_anual
     , round(sum(d.cantidad) / 12) as consumo_mensual
     , count(distinct (to_char(d.fch_transac, 'mm'))) as frecuencia_meses
  from kardex_g g
     , kardex_d d
 where d.tp_transac in ('22', '29')
   and g.estado <> '9'
   and g.cod_alm = d.cod_alm
   and g.serie = d.serie
   and g.tp_transac = d.tp_transac
   and g.numero = d.numero
   and g.fch_transac >= trunc(trunc(sysdate - 365), 'month')
   and g.fch_transac <= trunc(sysdate, 'month') - 1
 group by d.cod_art;


select distinct (to_char(d.fch_transac, 'mm')) as frecuencia_meses
  from kardex_g g
     , kardex_d d
 where d.tp_transac in ('22', '29')
   and g.estado <> '9'
   and g.cod_alm = d.cod_alm
   and g.serie = d.serie
   and g.tp_transac = d.tp_transac
   and g.numero = d.numero
   and g.fch_transac >= trunc(trunc(sysdate - 365), 'month')
   and g.fch_transac <= trunc(sysdate, 'month') - 1;


select min(fecha)
  from log_auditoria;


select *
  from log_auditoria
 where tabla = 'PR_OT_DET'
--    and accion = 'UPDATE'
   and extract(year from fecha) = 2025;


select *
  from log_auditoria
 where tabla = 'PR_OT'
--    and accion = 'UPDATE'
   and extract(year from fecha) = 2025;


select * from tipo_linea order by cod_tipo;


select *
  from tab_lineas_tipo_linea
 where cod_tipo = 2
 order by cod_linea;


select *
  from tab_lineas_tipo_linea
 where cod_tipo = 3
 order by cod_linea;

select *
  from log_auditoria
 where tabla = 'PR_OT'
   and cod_id_pk = '6541';
