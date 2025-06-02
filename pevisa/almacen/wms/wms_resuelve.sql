select count(*)
  from wms_picking_alm o
 where o.tk_serie = '3'
   and o.tk_numero = 33
--and o.cod_art = :control.txt_articulo
   and o.id_ubicacion = '005202001007';

select *
  from wms_picking_alm
 where oms_tipo = 'WS'
   and oms_serie = 1
   and oms_numero = 848;

-- 373
-- BH 0.23-200

select *
  from wms_picking_alm
 where tk_serie = 3
   and tk_numero = 372;

select *
  from wms_usuarios
 where nombre like '%EMERSON%';

-- cabecera de solicitudes
select *
  from wms_solimat_sol
 where tipo = 'SM'
   and numero = 200398;

select *
  from wms_solimat_sol
 where estado in ('1', '2');

select *
  from wms_picking
 where tk_serie = 2
   and tk_numero = 757;

select *
  from wms_picking_alm
 where tk_serie = 2
   and tk_numero = 757;

select *
  from wms_picking_alm
 where ot_numero = 201178;

select *
  from wms_alm_ubicacion
 where cod_art = 'FOR3818';

-- INSERT INTO PEVISA.WMS_ALM_UBICACION (COD_ALM, ID_UBICACION, COD_ART, LOTE, ITEM, CANTIDAD, SALDO, FECHA_INGRESO, USUARIO, REFERENCIA, TIPO_OPERACION, TIPO_REF, SERIE_REF, ID_BOLSAS, ESTADO) VALUES ('D5', '005208017001', 'FOR3818', '1', 2, -26.81, -26.81, TIMESTAMP '2025-01-24 16:46:22', '43355', '194', '35', 'PR', '3', '0', '0');

select *
  from wms_ubicaciones
 where id_ubicacion = '005208017001';

select *
  from wms_picking
 where tk_numero = 196;

select *
  from wms_picking_alm
 where tk_numero = 133;

select * from wms_estado_solicitud;

select *
  from vwms_solicitud
 where cod_art = 'BOLSA P1822';

select *
  from wms_orden_sol
 where numero = 585179;

select *
  from wms_orden_sol_item
 where oms_numero = 581
   and oms_tipo = 'WS';

select *
  from wms_picking_alm
 where ot_numero = 599838;

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
 where rec_numero = 645;

select *
  from wms_orden_sol_item
 where numero = 1037436
   and tipo = 'PR';

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

select * from wms_rec_guia;


select *
  from wms_orden_rec
 where rec_numero = '671';

select *
  from wms_rec_guia
 where rec_numero = '671';

-- eliminado
-- select *
--   from kardex_g
--  where cod_alm = 'D5'
--    and tp_transac = '10'
--    and serie = 1
--    and numero in (
--                   1169, 1170, 1171, 1172, 1173, 1174, 1175, 1176, 1177, 1179, 1184
--    )
--  order by ing_sal desc, numero_pguia;

select *
  from kardex_g
 where cod_alm = 'D5'
   and tp_transac = '10'
   and serie = 1
   and numero in (
   1150
   );

select *
  from kardex_d
 where cod_alm = 'D5'
   and tp_transac = '10'
   and serie = 1
   and numero in (
   1150
   );

select *
  from almacen
 where cod_art = 'BOLSA 12.59';

select *
  from kardex_d
 where cod_alm = 'D5'
   and tp_transac = '10'
   and cod_art = 'BOLSA 12.59'
   and extract(year from fch_transac) = 2024
   and extract(month from fch_transac) = 12
   and pr_numot = '671';

select *
  from kardex_d
 where cod_alm = 'T6'
   and cod_art = 'BOLSA 12.59'
   and extract(year from fch_transac) = 2024
   and extract(month from fch_transac) = 12;

select sysdate from dual;

select * from view_monto_completo_resumen_30;

select * from tmp_pedidos_30;

select * from pr_embarques;

select *
  from pr_programa_embarques_id
 where estado = '1';

select *
  from wms_rec_oms
 where ot_tipo = 'PR'
   and ot_numero = 567744;

select *
  from pr_ot_bolsas
 where nuot_tipoot_codigo = 'PR'
   and numero = 567744;

select * from solimat_g;

select *
  from pr_usualma
 where cod_alm = 'D5'
   and usuario = 'PEVISA';

select *
  from pr_usualma
 where cod_alm = 'D2'
   and usuario = 'PEVISA';

select *
  from wms_picking_alm
 where ot_numero = 585179;

select * from wms_estado_solicitud;

select *
  from wms_orden_rec_item
 where pr_serie = '141'
   and pr_numero = 729;

select *
  from wms_orden_rec
 where tipo = 'WR'
   and numero = 777;

select *
  from wms_orden_rec
 where numero = 790;

select *
  from wms_orden_rec_item
 where tk_numero = 790;

select * from kardex_g;

select *
  from kardex_g
 where ser_doc_ref = 141
   and nro_doc_ref = 729;

select *
  from kardex_g
 where cod_alm = 'T6'
   and tp_transac = '10'
   and serie = 141
   and numero in (
   729
   );

select *
  from kardex_d
 where cod_alm = 'D2'
   and tp_transac = '16'
   and serie = 3
   and numero in (
   158340
   );

select *
  from almacen
 where cod_art = 'RIB 88065';

select *
  from kardex_d
 where cod_alm = 'T6'
   and cod_art = 'BOLSA 22.27'
   and fch_transac >= to_date('31/01/2025', 'dd/mm/yyyy');

select *
  from kardex_d
 where cod_art = 'BOLSA 22.27'
   and fch_transac >= to_date('31/01/2025', 'dd/mm/yyyy');

select v.tk_serie, v.tk_numero, v.fecha, v.picker, u.tk_item, u.ot_serie, u.ot_numero
     , u.id_ubicacion, u.cod_art, get_deslinea(a.cod_lin) as des_linea, u.cantidad
     , u.nro_ser_lote as lote
  from wms_packing v
     , wms_packing_alm u
     , articul a
 where u.tk_serie = v.tk_serie
   and u.tk_numero = v.tk_numero
   and a.cod_art = u.cod_art
   and v.tk_numero = :p_numero
   and v.tk_serie = 1
 order by 1, 2, 6, 7;

select * from wms_estado_solicitud;

select *
  from wms_usuarios
 where usuario = '43589';

select *
  from wms_usuarios;

select *
  from wms_orden_rec
 where tk_numero = 757;

select *
  from wms_orden_rec_item
 where tk_numero = 757;

select *
  from wms_packing
 where tk_numero = 757;

select *
  from wms_packing_alm
 where tk_numero = 757;

select *
  from wms_packing_seg
 where tk_numero = 757;

-- kardex de wms (picking)
select *
  from wms_alm_ubicacion
 where cod_art = 'BOLSA 22.27'
   and referencia = '790'; --> tarea picking

select id_ubicacion, cod_art, sum(cantidad) as cantidad
  from wms_alm_ubicacion
 where cod_art = 'BOLSA 24.29'
 group by id_ubicacion, cod_art;

select *
  from pcarticul
 where cod_art = 'BOLSA 22.27';

select a.cod_art, a.cod_art, b.saldo, b.tk_numero
  from pcarticul a
     , wms_packing_alm b
 where a.cod_interno = '1000049902'
   and b.tk_serie = '20'
   and b.tk_numero = 790
   and b.cod_art = a.cod_art
   and b.saldo > 0
   and rownum = 1;

select *
  from wms_ubicaciones
 where id_ubicacion in ('030101007002', '030101007001');

select *
  from articul
 where cod_art = 'BH 0.32-171';

select *
  from tab_lineas
 where linea = '1622';

select *
  from tab_lineas
 where linea like '16%';

select *
  from tab_lineas
 where descripcion like '%BOBINA%';

select *
  from tab_lineas
 where linea = '2028';

select *
  from wms_lineas_solicitud
 where tipo_sol = 'MATER'
 order by linea;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero = 599251;

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 599251;

select *
  from articul
 where cod_art = 'BH 0.23-605';

-- linea de la bobina debe estar correcta en la orden
select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and art_cod_art = 'BH 0.32-171';

select *
  from wms_usuarios
 where nombre like '%LASTRERA%';

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 601410;

select * from vwms_fis_ubicacion_bolsa;

select * from vwms_fis_ubicacion_bolsa;

select * from wms_orden_sol;

select *
  from almacenes
 where nvl(tipo_alm, '0') in ('WMS');

select *
  from almacenes
 where cod_alm = '30';

select distinct tipo_alm from almacenes;

select *
  from pr_usualma
 where usuario = 'PEVISA'
   and cod_alm = '30';

select d.art_cod_art as art, a.cod_interno as cod_wms
     , round(d.rendimiento * o.cant_prog, 4) as total, d.cant_despachada, a.und as unidad, a.linea
     , substr(get_deslinea(a.linea), 1, 180) as deslin
  from pr_ot o
     , pr_ot_det d
     , pcarticul a
 where o.numero like :WMS_DEVOL_SOL.pr_referencia
   and o.nuot_tipoot_codigo in ('PR', 'VA') and o.estado between '1' and '5'
   and d.ot_numero = o.numero
   and a.cod_art = d.art_cod_art
   and exists (
   select w.cod_art from wms_alm_ubicacion w where w.cod_art = d.art_cod_art and estado <> '9'
   );


select *
  from view_salidas_pre_guias
 where not exists (
   select 1
     from kardex_g_guia_remision r
    where cod_alm = view_salidas_pre_guias.cod_alm
      and tp_transac = view_salidas_pre_guias.tp_transac
      and serie = view_salidas_pre_guias.serie
      and numero = view_salidas_pre_guias.numero
   )
   and cod_alm = '30'
   and tp_transac = '35'
   and serie = 140
   and numero in (
   3154
   );

select *
  from view_salidas_pre_guias
 where cod_alm = '30'
   and tp_transac = '35'
   and serie = 140
   and numero in (
   3154
   );

select *
  from wms_picking_alm
 where cod_art = 'BLAF 0.23-406N-T5';

select pd.ot_nuot_tipoot_codigo, pd.ot_nuot_serie, pd.ot_numero, p.formu_art_cod_art, pd.art_cod_art
     , pd.rendimiento
  from pr_ot p
     , pr_ot_det pd
     , articul a
 where p.nuot_tipoot_codigo = pd.ot_nuot_tipoot_codigo
   and p.nuot_serie = pd.ot_nuot_serie
   and p.numero = pd.ot_numero
   and a.cod_art = pd.art_cod_art
   --AND A.COD_LIN = PG.COD_LIN
   and pd.cod_lin in (
   select wl.linea
     from wms_lineas_solicitud wl
    where wl.tipo_sol = 'MATER'
   )
   and p.numero = 606821;

select *
  from view_vws_libera_orden
 where nuot_tipoot_codigo = 'PR'
   and nuot_serie = '8'
   and numero = 606821;

select pr.nuot_tipoot_codigo, pr.nuot_serie, pr.numero
     , cant_prog - cant_ingresado
  + nvl((
          select cant_ingresado
            from pr_ot p
           where p.nuot_tipoot_codigo = pr.nuot_tipoot_codigo
             and p.nuot_serie = pr.nuot_serie
             and p.numero = pr.numero
             and numero in
                 (
                   select w.numero
                     from wms_libera_orden_surte w
                    where w.nuot_tipo_ot = p.nuot_tipoot_codigo
                      and w.nuot_serie = p.nuot_serie
                      and w.numero = p.numero
                   )
          ),
        0) as cantfinal
  from pr_ot pr
 where estado < 9;

select *
  from planilla10.personal
 where apellido_paterno like '%YABAR%';

select *
  from planilla10.hr_personal
 where c_codigo = 'E1196';