select * from vw_detalle_orden_sol;

select * from vw_soli_general_wms_prod;

select * from wms_estado_solicitud order by id_estado;

-- numero de la tarea tk_serie tk_numero
select *
  from wms_orden_sol
 where tipo = 'PR'
   and serie = 2
   and numero in (611);

select *
  from wms_orden_sol
 where tipo = 'PR'
   and numero in (590817)
   and oms_numero = 1584;

select *
  from pr_ordenes_solicitud_oms
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 590817
   and oms_numero = 1584;

select * from wms_estado_solicitud;

-- numero de la tarea tk_serie tk_numero
select *
  from wms_orden_sol_item
 where tipo = 'PR'
   and numero = 575573;

-- tarea
select *
  from wms_picking_alm
 where tk_serie = 2
   and tk_numero = 1197
   and tk_item = 1;

-- solicita produccion wms saldo
select *
  from pr_ordenes_solicitud_oms
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 575573;
-- 378.000

-- 588283 y 565380

-- query de picking produccion > ordenes pendientes
select w.juego, get_deslinea(a.linea) as des_linea, w.estado, sum(w.cant_prog) as cantidad
  from wms_orden_sol w
     , pcarticul a
 where w.tipo = 'PR'
   and w.estado = '0'
   and a.cod_art = w.juego
 group by w.juego, get_deslinea(a.linea), w.estado
 order by juego;

-- :VW_DETALLE_ORDEN_SOL.saldo := :VW_DETALLE_ORDEN_SOL.cant_prog
--                              - :VW_DETALLE_ORDEN_SOL.cant_solicitada
--                              + :VW_DETALLE_ORDEN_SOL.CANT_REPROCESA;


-- cant_prog
select cantfinal
  from view_vws_libera_orden
 where nuot_tipoot_codigo = 'PR'
   and nuot_serie = 8
   and numero = 564561;


select pr.nuot_tipoot_codigo, pr.nuot_serie, pr.numero, cant_prog - cant_ingresado
  + nvl((
          select cant_ingresado
            from pr_ot p
           where p.nuot_tipoot_codigo = pr.nuot_tipoot_codigo
             and p.nuot_serie = pr.nuot_serie
             and p.numero = pr.numero
             and numero in (
             select w.numero
               from wms_libera_orden_surte w
              where w.nuot_tipo_ot = p.nuot_tipoot_codigo
                and w.nuot_serie = p.nuot_serie
                and w.numero = p.numero
             )
          ),
        0) as cantfinal
  from pr_ot pr
 where estado < 9
   and nuot_tipoot_codigo = 'PR'
   and nuot_serie = 8
   and numero = 564561;

select *
  from wms_libera_orden_surte
 where nuot_tipo_ot = 'PR'
   and nuot_serie = 8
   and numero = 564561;

-- cant_solicitada
select nvl(sum(cant_for), 0)
  from vw_soli_general_wms_prod
 where tipo_solicitud in ('WMS', 'PRODUCCION')
   and estado not in ('ANULADO')
   and tipo = 'PR'
   and serie = 8
   and numero = 564561
   and cod_art = 'RING 90003N';

select * --> cant_prog modificar por la cantidad según el rendimiento
  from pr_ordenes_solicitud_oms
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 541136;

-- cant_reprocesa
select nvl(sum(cant_pedir), 0) as cant_reprocesa
  from solicita_reproceso_ot p
     , solicita_reproceso_ot_det pd
 where p.id_solicitud = pd.id_solicitud
   and p.id_estado = '40' --APROBADO
   and p.ot_tpo = 'PR'
   and p.ot_ser = 8
   and p.ot_nro = 582934
   and pd.art_cod_art = 'RC 014';


select *
  from wms_orden_sol
--  where tipo = 'PR'
 where tk_serie = 3
   and tk_numero = 210;

select *
  from wms_orden_sol_item
 where tk_serie = 3
   and tk_numero = 210;

select *
  from wms_orden_sol
 where oms_numero = 201430;

select codigo, descripcion
  from tablas_auxiliares
 where tipo = '33'
   and codigo <> '....'
   and not exists (
   select 1
     from almacenes
    where tipo_alm = 'WMS'
      and almacenes.cod_alm = tablas_auxiliares.codigo
   )
 order by codigo;

select *
  from almacenes
 where cod_alm = 'D5';

select *
  from almacenes
 where tipo_alm = 'WMS';

select a.cod_alm, t.descripcion, a.nombre
  from pr_usualma a
     , tablas_auxiliares t
 where a.cod_alm = t.codigo
   and t.tipo = '33'
   and a.usuario = :PR_OT.xusuario
   and not exists (
   select 1
     from almacenes
    where tipo_alm = 'WMS'
      and almacenes.cod_alm = t.codigo
   )
 order by a.cod_alm;

select *
  from transacciones_almacen
 where tp_transac = '18';

select * from wms_rec_oms;

select *
  from wms_orden_sol
 where oms_tipo = 'WS'
   and oms_serie = 2
   and oms_numero = 611;


-- INSERT INTO PEVISA.WMS_ORDEN_SOL (TIPO, SERIE, NUMERO, FECHA_OT, JUEGO, NRO_PEDIDO, REF_CLIENTE, DESTINO, CANT_PROG, TOT_ITEMS, ESTADO, PICKER, TK_SERIE, TK_NUMERO, TK_ITEM, FECHA_REC, FECHA_DES, FECHA_ANU, OMS_TIPO, OMS_SERIE, OMS_NUMERO) VALUES ('PR', '8', 607314, TIMESTAMP '2025-04-30 14:53:57', 'CL-O PL95350-1ZN', null, null, null, 30.00, null, '8', '43469', '2', 2724, 1, TIMESTAMP '2025-05-14 11:29:03', null, null, 'WS', '2', 390);

select *
  from wms_orden_sol
 where tipo = 'PR'
   and numero = 602953;

select *
  from vw_solicitud_oms_pendientes
 where numero = 602953;

select *
  from wms_orden_sol_item
 where numero = 602953;

select * from wms_estado_solicitud;

select count(*)
  from pr_ot o
     , pr_ot_det d
 where o.numero like 607202
   and o.nuot_tipoot_codigo in ('PR', 'VA')
   and o.estado between '1' and '5'
   and d.ot_numero = o.numero
   and exists (
   select w.cod_art
     from wms_alm_ubicacion w
    where w.cod_art = d.art_cod_art
      and estado <> '9'
   );

select *
  from wms_alm_ubicacion
 where cod_art in (
                   'BH 0.23 - 300 ETIQ E-01', 'FOR3913', 'NI 2900 0.6-300', 'NI 2900 0.8-300'
   );

select *
  from transacciones_almacen
 where tp_transac = '84';

select *
  from tablas_auxiliares
 where tipo = '32'
   and codigo = '84';

  with transaccion_menor_iqf as
         (
           select pr.numero
                , ka.cod_alm
                , tp_transac
                , ka.serie
                , ka.numero as numero_kar
                , ka.fch_transac
                , pr.estado
                , pr.formu_art_cod_art
                , pr.fecha
                , row_number()
               over (partition by pr.numero
                 order by ka.fch_transac asc)
             as row_num
             from pr_ot pr
                  left join kardex_g ka
                            on pr.numero = ka.numero_pguia
                              and pr.nuot_tipoot_codigo = ka.tipo_pguia
                              and pr.nuot_serie = ka.serie_pguia
            where pr.nuot_tipoot_codigo in ('PR', 'VA')
              and pr.numero in (
              select distinct ot_numero
                from pr_ot_det
               where art_cod_art in (
                 select cod_art
                   from articul_iqf
                 )
              )
            order by pr.numero, ka.fch_transac
           )
select t.formu_art_cod_art, t.numero, t.fecha
     , t.cod_alm || '-' || t.tp_transac || '-' || t.serie || '-' || t.numero_kar as transaccion
     , e.descripcion, t.fch_transac
  from transaccion_menor_iqf t
       left join pr_estadopr e on t.estado = e.estado
 where row_num = 1;


-- devolucion vulcano
-- 611912 mal BH
-- 611915 bien

select *
  from wms_rec_devol
 where pr_referencia = 611912;

select *
  from wms_rec_devol
 where pr_referencia = 611915;

-- Libera orden producción para solicitud WMS
select *
  from pevisa.wms_libera_orden_surte
 where numero in (612596, 609168);

select p.numero, p.formu_art_cod_art, p.cant_prog, p.fecha, g.descripcion
     , substr(to_char(100000000 + p.numero), 2, 8) as orden_etiqueta
     , substr(to_char(100 + p.nuot_serie), 2, 2) as serie_etiqueta, p.nuot_tipoot_codigo
     , p.nuot_serie, nvl(peso_por_bolsa, 0) as peso_por_bolsa
  from pr_ot p
     , pr_grupos_lineas gl
     , pr_grupos g
     , pr_formu f
 where p.nuot_tipoot_codigo in ('PR', 'VA')
   and p.estado in (1, 2, 3, 4)
   and p.cod_lin = gl.cod_lin
   and gl.id_grupo = g.id
   and p.formu_art_cod_art = f.art_cod_art
   and p.numero = 12004
 order by p.numero;

select *
  from pr_formu
 where art_cod_art = 'CL-O 290.4325ZN';

select *
  from pr_ot
 where nuot_tipoot_codigo = 'VA'
   and numero = 12004;

select *
  from prod_subgrupo_linea_rel
 where id_linea = '1068';

select *
  from pr_grupos_lineas
 where cod_lin = '1068';

select *
  from transacciones_almacen
 where tp_transac in ('84', '19', '16', '27');

select *
  from almacenes
 where cod_alm in ('37', '30');

select *
  from pr_wkcieot
 where usuario = 'JJUAREZ';

select cod_art, cant_habilitada, cant_formula, consumo_real, rendimiento_real, limites, pasa
     , usuario
     , case when abs(rendimiento_real) > limites then 'SI' else 'NO' end as rendimiento_real_valido
  from pr_wkcieot
 where usuario = 'JJUAREZ';

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero = 614351;

select d.numero, d.cod_art, d.cantidad, a.cod_alm
  from kardex_d d
     , articul a
 where d.cod_art = a.cod_art
--AND D.COD_ALM = A.COD_ALM
   and pr_numot = 614351
   and pr_tipot = 'PR'
   and tp_transac in ('29', '22')
 order by d.cod_art;

select *
  from wms_orden_sol_item
 where numero = 614351
   and tk_numero is not null and tipo not in ('AR') and (
   (:blk_data.p_opc = 'P' and estado not in ('3', '8', '9'))
     or (estado like :blk_data.p_opc)
   );

select *
  from wms_orden_sol_item
 where tk_numero = 8849;


-- LOTE
select min(lote)
  from wms_alm_ubicacion a
 where cod_art like 'BAX C430 0.4-110'
   and referencia = '9127'
   and serie_ref = '2';


select *
  from wms_alm_ubicacion
 where cod_art like 'BAX C430 0.4-110'
   and referencia = '9127'
   and serie_ref = '2';

select get_deslinea(get_linea(d.cod_art)) as descripcion
     , substr(to_char(100000000 + d.lote), 2, 8) as orden_etiqueta
     , substr(to_char(100 + 1), 2, 2) as serie_etiqueta, 'PR', 8 as nuot_serie, 0 as peso_por_bolsa
  from wms_rec_devol d
 where d.lote = '90';

select *
  from wms_rec_devol
 where lote = '90';


select * from vwms_solicitud;

select *
  from wms_orden_rec_item
 where tipo = 'WR'
   and serie = 11
   and numero = 398;

select *
  from wms_orden_rec
 where tipo = 'WR'
   and serie = 11
   and numero = 398;
