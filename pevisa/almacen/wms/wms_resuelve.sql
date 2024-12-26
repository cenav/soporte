select count(*)
  from wms_picking_alm o
 where o.tk_serie = '3'
   and o.tk_numero = 33
--and o.cod_art = :control.txt_articulo
   and o.id_ubicacion = '005202001007';

select *
  from wms_picking_alm
 where tk_numero = 33;

select *
  from vwms_solicitud
 where cod_art = 'BOLSA P1822';

select *
  from wms_orden_sol
 where numero = 199321;

select *
  from wms_orden_sol
 where numero = 199321;

select *
  from solimat_d
 where numero = 199321;

select *
  from kardex_d
 where fch_transac = to_date('27/11/2024', 'dd/mm/yyyy')
   and cod_art = 'BOLSA P1822'
   and cantidad = 1500;

select *
  from kardex_d
 where fch_transac = to_date('27/11/2024', 'dd/mm/yyyy')
   and cod_art = 'BOLSA P1316'
   and cantidad = 1000;

select *
  from pr_usualma
 where usuario = 'PEVISA'
   and cod_alm in ('T1', 'M1', 'M2');

select *
  from kardex_d
 where fch_transac = to_date('27/11/2024', 'dd/mm/yyyy')
   and cod_art = 'MSE-95059';

-- M1	16	1	206640
-- T1	27	1	1571397

-- M2	16	1	206641
-- T1	27	1	1571398

select *
  from kardex_d
 where fch_transac = to_date('27/11/2024', 'dd/mm/yyyy')
   and cod_art = 'SUAJE 380.966VMI';

select *
  from wms_orden_sol
 where tk_numero = 59;

select *
  from wms_orden_sol_item
 where tk_numero = 59;

select *
  from wms_rec_guia
 where rec_numero = 671
   and cod_art = 'BOLSA P0950';

select *
  from wms_orden_sol_item
 where numero = 587005;

select *
  from wms_usuarios
 where usuario = 'PEVISA';

select * from vwms_picking_listsol;

select *
  from wms_picking
 where tk_numero = 82;

select *
  from wms_picking_alm
 where tk_numero = 82;

select *
  from wms_alm_ubicacion
 where referencia = '59';

select *
  from wms_alm_ubicacion
 where lote = 587005;

select *
  from wms_alm_ubicacion
 where cod_art = 'RIB 200.367'
   and referencia = '59'
 order by fecha_ingreso desc;

select *
  from pcarticul
 where cod_art = 'RIB 200.367';

select a.cod_art, a.cod_art, o.saldo, o.saldo
  from pcarticul a
     , wms_picking_alm o
 where a.cod_interno = '1000119821'
   and o.tk_serie = '2'
   and o.tk_numero = '59'
   and o.cod_art = a.cod_art
   and o.saldo > 0
   and rownum = 1;

select *
  from pr_ot_bolsas
 where numero = 567856;

select *
  from wms_rec_oms
 where estado = '1';

select *
  from wms_rec_oms
 where ot_numero = 567856;

select * from vw_detalle_orden_sol;

select cant_prog - cant_ingresado
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and nuot_serie = 8
   and numero = 565377;

select cant_formula
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_nuot_serie = 8
   and ot_numero = 565377
   and art_cod_art = 'ROLLO 10 PUG';

select cantidad
  from kardex_d
 where pr_tipot = 'PR'
   and pr_numot = 565377
   and cod_art = 'ROLLO 10 PUG';

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 581130
   and (cod_lin in (
   select distinct(cod_lin)
     from pr_grupos_lineas
    where id_grupo in (
      select distinct id_grupo
        from grupos_tipo_solicitud
       where tipo_sol = 'PIEZA'
      )
   )
   or cod_lin in ('1809', '1440'));


select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero = 581130;

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 581130;

select o.nuot_tipoot_codigo, o.numero, o.formu_art_cod_art, to_char(o.fecha, 'dd/mm/yyyy') as fecha
     , o.cant_prog, e.descripcion as estado
  from pr_ot o
       join pr_estadopr e on o.estado = e.estado
 where o.estado in ('1', '2', '3', '4', '5')
   and o.nuot_tipoot_codigo = :load.ot_tpo
   and o.nuot_serie = :load.ot_ser
 order by o.fecha desc;


select * from vwms_solicitud_juegop;

select *
  from wms_orden_sol
 where tipo = 'PR'
   and estado <> '0'
   and numero = 581193;

select *
  from wms_orden_sol
 where tipo = 'PR'
   and numero = 581193;

select *
  from wms_picking_alm
 where ot_numero = 581193;

select * from wms_orden_sol;

select *
  from wms_orden_sol_item
 where tipo = 'PR'
   and numero = 586215;

select *
  from wms_orden_sol
 where tk_serie = 2
   and tk_numero = 91;

select *
  from wms_picking
 where tk_serie = 2
   and tk_numero = 91;

select *
  from wms_orden_sol
 where picker = '43589';

select *
  from wms_orden_sol
 where picker is not null;

select *
  from wms_usuarios
 where usuario = '43589';

select *
  from wms_usuarios
 where nombre like '%DANIEL%';

select * from wms_orden_rec;

select * from vwms_solicitud_juegop;

select *
  from solimat_g
 where numero = 199861;

select *
  from solimat_d
 where numero = 199861;

select numero + 1
  from numdoc
 where tp_transac = '27'
   and serie = 3
   for update of numero;
