select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
--    and estado != '8'
--    and estado = '9'
--    and estado not in ('1', '9')
   and numero in (
   652689
   );

--1426.0000

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 655283;

select *
  from ot_serv_d
 where pr_numero = 653139;

select *
  from solicita_cambio_ot
 where ot_nro = 654664;


-- 584839 estado 8
-- 589811 estado 3

select o.numero, o.formu_art_cod_art as pieza, o.nuot_tipoot_codigo as tipo, d.art_cod_art as art
     , d.rendimiento, round(d.rendimiento * o.cant_prog, 4) as total, d.cant_despachada, o.estado
  from pr_ot o
     , pr_ot_det d
 where o.numero like '%'
   and o.nuot_tipoot_codigo in ('PR', 'VA')
--    and o.estado between '1' and '5'
   and o.numero = 622851
   and d.ot_numero = o.numero
   and exists (
   select w.cod_art
     from wms_alm_ubicacion w
    where w.cod_art = d.art_cod_art
      and estado <> '9'
   )
 order by 1, 2, 3;


select d.art_cod_art as art, a.cod_interno as cod_wms
     , round(d.rendimiento * o.cant_prog, 4) as total, d.cant_despachada, a.und as unidad, a.linea
     , substr(get_deslinea(a.linea), 1, 180) as deslin
  from pr_ot o
     , pr_ot_det d
     , pcarticul a
 where o.numero like :pr_referencia
   and o.nuot_tipoot_codigo in ('PR', 'VA')
--    and o.estado between '1' and '5'
   and d.ot_numero = o.numero
   and a.cod_art = d.art_cod_art
   and exists (
   select w.cod_art
     from wms_alm_ubicacion w
    where w.cod_art = d.art_cod_art
      and estado <> '9'
   );


declare
  x_count number;
begin
  select count(*)
    into x_count
    from pr_ot o
       , pr_ot_det d
   where o.numero like :wms_devol_sol.pr_referencia
     and o.nuot_tipoot_codigo in ('PR', 'VA')
--      and o.estado between '1' and '5'
     and d.ot_numero = o.numero and exists (
     select w.cod_art from wms_alm_ubicacion w where w.cod_art = d.art_cod_art and estado <> '9'
     );

  if x_count = 0 then
    mal('Orden no Despachada en almacen D5...');
  end if;
end;


select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 654671;

select *
  from transacciones_almacen
 where tp_transac = '27';

select numero, fecha, usuario, observacion as ip
  from pr_ot_impresion
 where nuot_tipoot_codigo = 'PR'
   and numero in (
                  657453, 657450, 657451
   );

commit

select *
  from pr_ot_impresion
 where nuot_tipoot_codigo = 'PR'
   and numero in (
                  614709, 614710, 614711, 614712, 614713, 614714, 614715, 614716, 614717, 614718,
                  614719, 614720, 614721, 614722, 614723
   );

select *
  from solicita_emision_ot
 where numero = 2520;

select *
  from pr_trasab_estado
 where tipo = 'VA'
   and numero in (
   11973
   )
 order by fecha;



select *
  from pr_ot_historia
 where nuot_tipoot_codigo = 'PR'
   and numero in (
   657607
   );

select *
  from pr_ot_anulacion
 where nuot_tipoot_codigo = 'PR'
   and trunc(fecha) = to_date('25/08/2025', 'dd/mm/yyyy');

/*
GRAF08
589569 90.84
606357 425.67
606358 252
606359 todo le restante
*/

select *
  from pr_forsec
 where cod_art = '90035CS-1';


select * from pr_ot_sec;

select *
  from articul
 where cod_art in (
   'FOR3931'
   );

select *
  from tab_lineas
 where linea = '1648';


select *
  from prod_subgrupo_linea_rel
 where id_subgrupo in ('S042', 'S043')
   and id_linea = '1648';

select *
  from pr_ot
 where nuot_tipoot_codigo = 'VA'
   and numero = 12004;

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 654969;

select * from vw_detalle_orden_sol_mat;

select *
  from vw_detalle_orden_sol_mat
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 595553;

select nvl(sum(cant_for), 0)
  from vw_soli_general_wms_prod
 where tipo_solicitud in ('WMS', 'PRODUCCION')
   and estado not in ('ANULADO')
   and tipo = :ot_nuot_tipoot_codigo
   and serie = :ot_nuot_serie
   and numero = :ot_numero
   and cod_art = :art_cod_art;

select *
  from articul
 where cod_art in (
   'BH 0.23-245'
   );

select *
  from wms_lineas_solicitud
 where tipo_sol = 'MATER'
 order by lpad(linea, 4, '0');

select *
  from wms_lineas_solicitud
 where linea = '2044';

select *
  from tab_lineas
 where linea = '852';

-- 2044
-- 2591

select * from tfamlin;

alter trigger tbu_pr_ot_cambio_anulado disable;

select * from pr_estadopr;

select * from pr_variables;

select *
  from pr_ot_bolsas
 where numero = 583452
   and nuot_tipoot_codigo = 'PR';

-- 1081223 AR

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'VA'
   and ot_numero in (
   11172
   );

-- 0.8320
-- 21.0000
-- 21.0000

select *
  from articul
 where cod_art = 'R-23682-30020';

select *
  from pr_formu
 where art_cod_art = 'FOR3827';

/*
INSERT INTO PEVISA.PR_OT_DET (CANT_FORMULA, CANT_USADA, COST_FORMULA, COST_USADA, ALMACEN, OT_NUMERO, OT_NUOT_SERIE, OT_NUOT_TIPOOT_CODIGO, ART_COD_ART, CANT_DESPACHADA, RENDIMIENTO, COD_LIN, PR_SECUENCIA, FLAG_KARDEX, ESTADO, PRIORIDAD, FECHA_PRIORIDAD, CANT_SURTIDA, SALDO) VALUES (4.6643, 0.0000, 0.0000, 0.0000, '02', 584491, '8', 'PR', 'SOL 1001', 4.6643, 0.5500, '2141', null, null, '1', 0, null, 0.0000, 0.0000);
INSERT INTO PEVISA.PR_OT_DET (CANT_FORMULA, CANT_USADA, COST_FORMULA, COST_USADA, ALMACEN, OT_NUMERO, OT_NUOT_SERIE, OT_NUOT_TIPOOT_CODIGO, ART_COD_ART, CANT_DESPACHADA, RENDIMIENTO, COD_LIN, PR_SECUENCIA, FLAG_KARDEX, ESTADO, PRIORIDAD, FECHA_PRIORIDAD, CANT_SURTIDA, SALDO) VALUES (16.9611, 0.0000, 0.0000, 0.0000, '02', 584491, '8', 'PR', 'RES 711', 17.2100, 2.0000, '2121', null, null, '1', 0, null, 0.0000, 0.0000);
INSERT INTO PEVISA.PR_OT_DET (CANT_FORMULA, CANT_USADA, COST_FORMULA, COST_USADA, ALMACEN, OT_NUMERO, OT_NUOT_SERIE, OT_NUOT_TIPOOT_CODIGO, ART_COD_ART, CANT_DESPACHADA, RENDIMIENTO, COD_LIN, PR_SECUENCIA, FLAG_KARDEX, ESTADO, PRIORIDAD, FECHA_PRIORIDAD, CANT_SURTIDA, SALDO) VALUES (24.7633, 0.0000, 0.0000, 0.0000, '02', 584491, '8', 'PR', 'SOL 814', 29.2700, 2.9200, '2148', null, null, '1', 0, null, 0.0000, 0.0000);
INSERT INTO PEVISA.PR_OT_DET (CANT_FORMULA, CANT_USADA, COST_FORMULA, COST_USADA, ALMACEN, OT_NUMERO, OT_NUOT_SERIE, OT_NUOT_TIPOOT_CODIGO, ART_COD_ART, CANT_DESPACHADA, RENDIMIENTO, COD_LIN, PR_SECUENCIA, FLAG_KARDEX, ESTADO, PRIORIDAD, FECHA_PRIORIDAD, CANT_SURTIDA, SALDO) VALUES (0.5088, 0.0000, 0.0000, 0.0000, '02', 584491, '8', 'PR', 'ESP 1030', 0.0000, 0.0600, '2121', null, null, '1', 0, null, 0.0000, 0.0000);
INSERT INTO PEVISA.PR_OT_DET (CANT_FORMULA, CANT_USADA, COST_FORMULA, COST_USADA, ALMACEN, OT_NUMERO, OT_NUOT_SERIE, OT_NUOT_TIPOOT_CODIGO, ART_COD_ART, CANT_DESPACHADA, RENDIMIENTO, COD_LIN, PR_SECUENCIA, FLAG_KARDEX, ESTADO, PRIORIDAD, FECHA_PRIORIDAD, CANT_SURTIDA, SALDO) VALUES (0.6784, 0.0000, 0.0000, 0.0000, '02', 584491, '8', 'PR', 'ESP 1029', 0.0000, 0.0800, '2121', null, null, '1', 0, null, 0.0000, 0.0000);
INSERT INTO PEVISA.PR_OT_DET (CANT_FORMULA, CANT_USADA, COST_FORMULA, COST_USADA, ALMACEN, OT_NUMERO, OT_NUOT_SERIE, OT_NUOT_TIPOOT_CODIGO, ART_COD_ART, CANT_DESPACHADA, RENDIMIENTO, COD_LIN, PR_SECUENCIA, FLAG_KARDEX, ESTADO, PRIORIDAD, FECHA_PRIORIDAD, CANT_SURTIDA, SALDO) VALUES (0.4240, 0.0000, 0.0000, 0.0000, '02', 584491, '8', 'PR', 'ESP 1028', 0.0000, 0.0500, '2121', null, null, '1', 0, null, 0.0000, 0.0000);
*/


select *
  from kardex_d
 where cod_art = '200.4081NA';

select *
  from solicita_cambio_ot
 where ot_tpo = 'VA'
   and ot_nro = 10987;

-- INSERT INTO PEVISA.PR_OT_DET (CANT_FORMULA, CANT_USADA, COST_FORMULA, COST_USADA, ALMACEN, OT_NUMERO, OT_NUOT_SERIE, OT_NUOT_TIPOOT_CODIGO, ART_COD_ART, CANT_DESPACHADA, RENDIMIENTO, COD_LIN, PR_SECUENCIA, FLAG_KARDEX, ESTADO, PRIORIDAD, FECHA_PRIORIDAD, CANT_SURTIDA, SALDO) VALUES (1330.6800, 0.0000, 0.0000, 0.0000, '06', 579422, '8', 'PR', 'ETIQ E-01', 0.0000, 1.0000, '871', null, null, '1', 0, null, 0.0000, 0.0000);

select *
  from pr_trasab_estado
 where tipo = 'PR'
   and numero = 572610
 order by fecha desc;


select * from pr_variables;

select *
  from kardex_d d
 where exists (
   select *
     from kardex_g g
    where g.cod_alm = d.cod_alm
      and g.tp_transac = d.tp_transac
      and g.serie = d.serie
      and g.numero = d.numero
      and g.tipo_pguia = 'PR'
      and g.serie_pguia = 8
      and g.numero_pguia in (579422)
   )
 order by ing_sal;

select *
  from kardex_d
 where pr_tipot = 'PR'
   and pr_numot = 579422;

-----------------------
--  modulos emision  --
-----------------------
select *
  from pr_trasab_estado
 where tipo = 'PR'
   and numero in (
                  577016, 578259, 578260
   );

select *
  from solicita_emision_ot
 where ot_numero = 576647;

select *
  from emite_op_log
 where tipo = 'PR'
   and numero = 576647;

--  estado anterior de una orden
select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero in (
   536668
   );

--  estado anterior de una orden
select *
  from pr_trasab_estado
 where tipo = 'PR'
   and numero in (
   576647
   )
 order by numero, fecha desc;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero in (
   562115
   );

select * from pr_estados;

select * from pr_estadopr;

select *
  from kardex_g
 where cod_alm = '30'
   and tp_transac = '18'
   and serie = 2
   and numero = 544031;

select *
  from kardex_d
 where cod_alm = '30'
   and tp_transac = '18'
   and serie = 2
   and numero = 544031;

-- parametro ano mes
select * from pr_para_pro;

select *
  from proveed
 where cod_proveed = '';

select *
  from cliente_grupo
 where grupo = 'B003';

select * from grupo_cliente;

select cod_cliente, nombre
  from clientes
 where cod_cliente in (
                       '20273061526', '20455719390', '20600574907', '20600637372', '20600711335',
                       '20600898214', '20601014956', '20601041163', '20608545591', '20602035906'
   )
 minus
select cod_cliente, nombre
  from clientes
 where grupo = 'B018';

select *
  from clientes
 where grupo = 'B018'
   and cod_cliente in (
                       '20273061526', '20455719390', '20600574907', '20600637372', '20600711335',
                       '20600898214', '20601014956', '20601041163', '20608545591', '20602035906'
   );

select cod_cliente, nombre
  from clientes
 where grupo = 'B018'
   and cod_cliente in (
                       '20273061526', '20455719390', '20600574907', '20600637372', '20600711335',
                       '20600898214', '20601014956', '20601041163', '20608545591', '20602035906'
   );

select *
  from planilla10.personal
 where c_codigo = 'E42889';

select *
  from planilla10.t_cargo
 where c_cargo = 'TMMT';

select *
  from planilla10.t_sector
 where c_sector = '40';

select * from locales;

select *
  from pr_ot_impresion
 where nuot_tipoot_codigo = 'PR'
   and numero in (
   583526
   );

select *
  from pr_ot_impresion
 where nuot_tipoot_codigo = 'PR'
   and numero between 505341 and 505419;

  with op_curso as (
    select cod_art
         , sum(saldo) as saldo_op
         , listagg(numero || '(' || estado || ',' || cant_prog || ')', ' | ')
                   within group ( order by estado, numero) as numero_op
      from vw_ordenes_curso
     where nuot_tipoot_codigo = 'PR'
     group by cod_art
    )
     , requerimiento as (
    select cod_art
         , sum(cant_requerida) as cant_requerida
         , sum(cant_separado) as cant_separado
         , sum(faltante) as cant_faltante
         , sum(stock) as stock_requerida
      from vw_requerimiento_articulo
     group by cod_art
    )
     , stock_art as (
    select cod_art, sum(stock) as stock
      from almacen
     group by cod_art
    )
select a.cod_art, a.descripcion, a.cod_lin, g.id_grupo, g.dsc_grupo
     , r.cant_requerida, r.cant_separado, r.cant_faltante
     , nvl(s.stock, 0) as stock, r.stock_requerida, o.numero_op, o.saldo_op
     , c.consumo_anual, c.consumo_mensual, c.frecuencia_meses
     , a.s_act - r.cant_separado as cant_disponible
  from articul a
       left join op_curso o on a.cod_art = o.cod_art
       left join requerimiento r on a.cod_art = r.cod_art
       left join stock_art s on a.cod_art = s.cod_art
       left join vw_articulo_consumo c on a.cod_art = c.cod_art
       left join vw_articulo_grupo g on a.cod_art = g.cod_art;

select cod_art
     , sum(saldo) as saldo_op
     , listagg(numero || '(' || estado || ',' || cant_prog || ')', ' | ')
               within group ( order by estado, numero) as numero_op
  from vw_ordenes_curso
 where nuot_tipoot_codigo = 'PR'
 group by cod_art;

select *
  from vw_articulo
 where cod_art = '1015TG';

select *
  from pr_consd
 where cod_art = '300.506SR';

declare
  orden pr_ot%rowtype;
begin
  emite.op('65000S', 1, false, orden);
end;

select *
  from error_log
 order by id_log desc;

select f.art_cod_art, f.cantidad, f.almacen, a.descripcion, a.c_pro
     , f.cod_lin, f.pr_secuencia
  from pr_for_ins f
     , articul a
 where formu_art_cod_art = '65000S'
   and formu_receta = 1
   and art_cod_art = cod_art
   and rtrim(a.flag_cal) is null;

select * from pr_for_ins;

select *
  from pr_formu f
 where f.vigencia = 1
   and f.art_cod_art = '65000S';

select *
  from planilla10.t_cargo
 where c_cargo = 'OIQ';

select *
  from planilla10.t_cargo
 where descripcion like '%IQ%';

select *
  from responsabilidad_cargo
 where id_cargo in ('MLS', 'OM', 'OP', 'OSL', 'OIQ');


select *
  from reparacion
 where numero = 4024;

select cod_art, cant_faltante, saldo_op, numero_op, stock, stock_requerida
  from vw_articulo
 where cod_art = '180.654FIB';

select *
  from pr_ot
 where abre01 = '15758'
   and nuot_tipoot_codigo = 'AR';

select pa.numero, pa.nuot_serie, pa.nuot_tipoot_codigo, pa.cant_prog, pa.receta
     , pa.formu_art_cod_art, pa.plazo, pa.fecha_plazo, pa.per_env, pa.abre01, pa.abre02, pa.destino
     , pa.cod_eqi, pa.empaque, pa.embalaje, pa.prioridad, pa.cod_lin, pa.pais
     , get_grupo_ventas_marcas(pa.formu_art_cod_art) as marca
  from pr_ot pa
     , articul a
     , pr_formu f
 where pa.origen = 'PLANEADA'
   and pa.nuot_tipoot_codigo = 'PA'
   and pa.destino in ('1', '2')
   and pa.formu_art_cod_art = a.cod_art
   and f.art_cod_art = pa.formu_art_cod_art
   and f.receta = 1
   and pa.abre01 = '15758'
   and pa.nuot_tipoot_codigo = 'PA'
   and not exists (
   select distinct 1
     from pr_for_ins i
        , articul a
    where i.formu_art_cod_art = pa.formu_art_cod_art
      and i.art_cod_art = a.cod_art
      and a.cod_lin in
          (
            select cod_lin
              from pr_grupos_lineas_desarrollo
             union
            select '1980'
              from dual
             union
            select 'ZZ'
              from dual
            )
   );

select *
  from pr_num_ot
 where tipoot_codigo = 'AR'
   and serie = 3;

select *
  from pr_ot
 where numero = 915811
   and nuot_tipoot_codigo = 'AR';

select max(numero)
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and nuot_serie = 3;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and fecha >= to_date('01/06/2023', 'dd/mm/yyyy')
 order by cant_prog desc;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero = 513326;

select *
  from solicita_emision
 where numero = 1256;

select distinct a.cod_lin
  from solicita_emision_det s
       join articul a on s.cod_art = a.cod_art
 where s.numero = 1256;

select *
  from solicita_emision_ot
 where numero = 513326;

select *
  from solicita_cambio_ot
 where ot_nro = 513326;

select *
  from emite_op_log
 where numero = 513326;

  with estado_inicial as (
    select tipo, serie, numero, fecha
      from pr_trasab_estado
     where tipo = 'PR'
       and serie = 8
       and numero = 512106
       and estado = 1
    )
select o.numero, o.fecha, o.estado
  from pr_ot o
       join estado_inicial i
            on o.nuot_tipoot_codigo = i.tipo
              and o.nuot_serie = i.serie
              and o.numero = i.numero
 where o.nuot_tipoot_codigo = 'PR'
   and i.fecha >= sysdate - 16
   and o.estado != '9'
 order by o.fecha;

select *
  from pr_trasab_estado
 where tipo = 'PR'
   and serie = 8
   and numero = 512106
   and estado = 1;

select *
  from pr_trasab_estado
 where tipo = 'PR'
   and serie = 8
   and numero = 513298
   and estado = 1;

-- ordenes emitidas hace 15 dias
select o.numero, o.fecha, o.formu_art_cod_art, o.cod_lin, o.estado, o.cant_prog, o.usuario
  from pr_ot o
 where o.nuot_tipoot_codigo = 'PR'
   and o.fecha >= sysdate - 16
   and o.estado != '9'
 order by cant_prog desc, o.fecha;

select *
  from emite_op_log
 where creacion_quien = 'JCABEZAS'
 order by creacion_cuando desc;

select *
  from emite_op_log
 where numero = 514563;

select *
  from emite_op_log
 where cod_art = '400.973';

select * from vw_ordenes_curso;

-- cantidad en curso de op generadas por el modulo de emision max 100
select c.cod_art, c.saldo, c.numero
  from vw_ordenes_curso c
 where c.nuot_tipoot_codigo = 'PR'
   and c.cod_art = '400.973'
   and exists (
   select 1
     from emite_op_log e
    where c.nuot_tipoot_codigo = e.tipo
      and c.numero = e.numero
   );

select p.numero, p.formu_art_cod_art, p.cant_prog, p.fecha, g.descripcion
     , substr(to_char(100000000 + p.numero), 2, 8) as orden_etiqueta
     , substr(to_char(100 + p.nuot_serie), 2, 2) as serie_etiqueta, p.nuot_tipoot_codigo
     , p.nuot_serie, nvl(peso_por_bolsa, 0) as peso_por_bolsa
  from pr_ot p
     , articul a
     , pr_grupos_lineas gl
     , pr_grupos g
     , pr_formu f
 where p.nuot_tipoot_codigo = 'AR'
   and p.nuot_serie = 3
   and p.estado in ('1', '3')
   and p.formu_art_cod_art = a.cod_art
   and a.cod_lin = gl.cod_lin
   and gl.id_grupo = g.id
   and g.id = '11'
   and p.formu_art_cod_art = f.art_cod_art
 order by p.numero;

select *
  from gastos_de_viaje
 where id_vendedor = 'M1'
   and numero = 123;

select *
  from gastos_de_viaje_m
 where id_vendedor = 'M1'
   and numero = 123;

select *
  from gastos_de_viaje_d
 where id_vendedor = 'M1'
   and numero = 123;

select *
  from gastos_de_viaje_habilitado
 where id_vendedor = 'M1'
   and numero = 123;

select *
  from gastos_de_viaje_habilitado_d
 where id_vendedor = 'M1'
   and numero = 123;

select *
  from kardex_d
 where cod_alm = 'D2'
   and tp_transac = '18'
   and serie = 2
   and numero = 536898;

select *
  from kardex_d
 where pr_tipot = 'PR'
   and pr_numot = 451073;

select *
  from kardex_g_historia
 where cod_alm = 'D2'
   and tp_transac = '29'
   and serie = 1
   and numero = 1686257;

select *
  from lg_itemjam
 where num_importa = 'PVM23025';

select d.cod_art, d.cantidad, d.aprobado
     , listagg(o.ot_numero, ' | ') within group ( order by o.ot_numero) as ordenes
  from solicita_emision_det d
       left join solicita_emision_ot o on d.numero = o.numero and d.item = o.item
 where d.numero = 910
 group by d.cod_art, d.cantidad, d.aprobado;

select *
  from solicita_emision_det
 where numero = 910;

select *
  from solicita_emision_det
 where ot_numero = 527657;

select *
  from solicita_emision_ot
 where ot_numero = 527657;

select *
  from linea_cambio_cantidad
 where cod_lin = '1615'
 order by cod_lin;

select to_char(pr_numot) as pr_numot, cod_art, cantidad
     , to_char(fch_transac, 'DD/MM/YYYY') as fecha, fch_transac
  from kardex_d
 where tp_transac = '18'
   and cod_alm = :xalmacen
   and cod_art = :art_cod_art
   and pr_tipot = :pr_tipo_orden
 order by fch_transac desc;

select *
  from transacciones_almacen
 where tp_transac = '18';

select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR' and estado < '3' and formu_art_cod_art in (
   select cod_art from articul where cod_lin not in ('1970', '1971', '1972')
   );

select *
  from pr_ot
 where abre01 = '370'
   and per_env = '189'
   and nuot_tipoot_codigo = 'AR';

select *
  from solicita_cambio_ot
 where ot_nro = 451073;


create or replace view vw_grupos_lineas_prod as
select g.id as cod_grupo, g.descripcion as dsc_grupo, l.cod_lin, l.tp_art, f.cod_fam
     , f.descripcion as dsc_fam
  from pr_grupos g
       join pr_grupos_lineas l on g.id = l.id_grupo
       join tfamlin f on l.tp_art = f.tp_art and l.cod_fam = f.cod_fam and l.cod_lin = f.cod_lin;

select cod_grupo, dsc_grupo, cod_lin, tp_art, cod_fam, dsc_fam
  from vw_grupos_lineas_prod
 where cod_grupo = '02';

select *
  from linea_sin_tope_emision
 where cod_lin = '1604';

select * from linea_cambio_cantidad;

select *
  from pr_ot
 where formu_art_cod_art = 'PL 86067-1NA';

select *
  from vacaciones
 where numero = 18403;

select *
  from pr_ot_sec
 where cod_art = '180.1382ZN';

select *
  from vendedores
 order by cod_vendedor;

select *
  from pr_trasab_estado
 where tipo = 'PR'
   and numero = 536050;

select *
  from solicita_emision_ot
 where ot_numero = 536050;

select *
  from solicita_emision_det
 where ot_numero = 536050;

select *
  from emite_op_log
 where numero = 536050;

select *
  from pr_trasab_estado
 where tipo = 'PR'
   and numero in (536067, 536065);

select ua.cod_alm as cod_alm, a.descripcion as descripcion
  from usuarios_almacenes ua
     , almacenes a
 where usuario = 'KCASTILLO'
   and ua.cod_alm = a.cod_alm
   and nvl(ua.estado, 0) = 1
 order by 1;

select *
  from usuarios_almacenes
 where usuario = 'MDIAZH';

---------------------------------

select *
  from pr_prioridad_tmp_30
 where canti = 0
 order by fecha desc;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and numero = 1025879;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and cant_prog = 0
   and estado != '0';

select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and cant_prog = 0
   and estado = '1';

select id_vendedor, nombre_vendedor
     , sum(monto_completo) as monto_completo
     , sum(monto_incompleto) as monto_incompleto
     , sum(monto_pendiente) as monto_pendiente
     , sum(monto_saos_por_armar) as monto_saos_por_armar
     , sum(prioridad) as prioridad
     , sum(rojo_a_facturar) as rojo_a_facturar
  from view_prioridades_pendientes_30
 where prioridad = 4859
 group by id_vendedor, nombre_vendedor;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero = 536512;

select *
  from vw_articulo
 where cod_art = 'PPQ 3753';

select f.formu_art_cod_art, f.art_cod_art
  from pr_for_ins f
       join articul a on f.art_cod_art = a.cod_art
 where (a.cod_lin in ('1601', '2004', '2005')
   or (a.cod_lin between '1620' and '1634')
   or (a.cod_lin between '2010' and '2019'))
   and f.formu_art_cod_art = 'PPQ 3753'
   and length(a.cod_lin) = 4;

select f.formu_art_cod_art
     , listagg(f.art_cod_art, ' | ') within group ( order by f.art_cod_art) as material
  from pr_for_ins f
       join articul a on f.art_cod_art = a.cod_art
 where (a.cod_lin in ('1601', '2004', '2005')
   or (a.cod_lin between '1620' and '1634')
   or (a.cod_lin between '2010' and '2019'))
   and length(a.cod_lin) = 4
   and f.formu_art_cod_art = 'PPQ 3753'
 group by f.formu_art_cod_art;

select numero, formu_art_cod_art, cant_prog, cant_ingresado
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and estado in (1, 2, 3, 4, 5, 8)
   and numero = 545908
 order by 2;


select a.cod_art, a.descripcion, x.cod_alm, x.stock
  from articul a
     , almacen x
 where a.cod_art <> 'CAJA EXT 059X24X25'
   and a.cod_art = x.cod_art
   and x.cod_alm = '01';

select *
  from almacen
 where cod_art = 'CAJA SERV 059X24X25-P';

select *
  from vw_articulo
 where cod_art = '380.744';

select dsc_grupo, sum(cant_faltante) as faltante
  from vw_articulo
 where id_grupo = '05'
 group by dsc_grupo;

create view vw_requerimiento as
  with requerimiento as (
    select cod_art, sum(cant_requerida) as cant_requerida
         , sum(cant_separado) as cant_separado, sum(faltante) as cant_faltante
         , sum(stock) as stock_requerida
      from vw_requerimiento_articulo
     group by cod_art
    )
select a.cod_art, a.descripcion, a.cod_lin, g.id_grupo, g.dsc_grupo, r.cant_requerida
     , r.cant_separado, r.cant_faltante, r.stock_requerida
     , a.s_act - r.cant_separado as cant_disponible, a.pr_golpez as golpes
     , a.pr_golpza as cavidades
  from articul a
       left join requerimiento r on a.cod_art = r.cod_art
       left join vw_articulo_grupo g on a.cod_art = g.cod_art;

create public synonym vw_requerimiento for vw_requerimiento;

select *
  from vw_requerimiento
 where cod_art = '380.744';

select *
  from pr_ot_cierre_libre
 where numero = 546199;

select *
  from tab_lineas
 where linea = 'ZZ';

select *
  from tab_lineas
 where descripcion like '%DESCONT%';

select * from vw_standard_emision;

select cod_personal, sf_nom_personal(cod_personal) as nombre
  from comision_ingeniero
 order by sf_nom_personal(cod_personal);

select *
  from almacenes
 where cod_alm = '05';

select *
  from vacaciones
 where numero = 19032;

select *
  from vacaciones_idtecflex
 where numero = 19032;

select *
  from estado_vacaciones
 order by id_estado;

select *
  from pr_ot_impresion
 where nuot_tipoot_codigo = 'PR';

select * from tipo_linea;

select *
  from tab_lineas_tipo_linea
 where cod_tipo = 3;

-- cavidades
select dsc_grupo, cod_art, cod_lin, cavidades
  from vw_articulo
 where dsc_grupo = 'JEBE'
   and cod_lin <> 'ZZ';

select codigo_etiqueta, descripcion
  from etiquetas_armado
 where codigo_etiqueta <> 'E-02_03'
 order by 1;

select *
  from etiquetas_armado
 where codigo_etiqueta = 'E-13_01';

select *
  from etiquetas_armado
 where codigo_etiqueta like 'E-13%';

select *
  from etiquetas_articulos_clientes
 where codigo_articulo = 'KIT SB HS 92055-01 WO/H'
   and codigo_etiqueta = 'E-13_01';

select c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17, c18, c19, c20
     , c21, c22, c23, c24, c25, c26, c27, c28, c29, c30, c31, c32, c33, c34, c35, c36, c37, c38, c39
     , c40, c41, c42, c43, c44, c45, c46, c47, c48, c49, c50, c51, c52, c53, c54, c55, c56, c57, c58
     , c59, c60, c61, c62, c63, c64, c65, c66, c67, c68, c69, c70, c71, c72, c73, c74, c75, c76, c77
     , c78, c79, c80, c81, c82, c83, c84, c85, c86, c87, c88, c89, c90
  from etiquetas_armado
 where codigo_etiqueta = 'E-13_01'
 union all
select c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17, c18, c19, c20
     , c21, c22, c23, c24, c25, c26, c27, c28, c29, c30, c31, c32, c33, c34, c35, c36, c37, c38, c39
     , c40, c41, c42, c43, c44, c45, c46, c47, c48, c49, c50, c51, c52, c53, c54, c55, c56, c57, c58
     , c59, c60, c61, c62, c63, c64, c65, c66, c67, c68, c69, c70, c71, c72, c73, c74, c75, c76, c77
     , c78, c79, c80, c81, c82, c83, c84, c85, c86, c87, c88, c89, c90
  from etiquetas_articulos_clientes
 where codigo_articulo = 'KIT SB HS 92055-01 WO/H'
   and codigo_etiqueta = 'E-13_01';


select *
  from pcarticul
 where cod_art in ('ACLAB-018', 'ACLAB-019');

select *
  from articul
 where cod_art in ('ACLAB-018', 'ACLAB-019');

-- programa etiquetas
select *
  from etiquetas_armado
 where codigo_etiqueta = 'E-13_01';

select *
  from etiquetas_articulos_clientes
 where codigo_etiqueta = 'E-13_01'
   and codigo_articulo = 'SB CH 70024 MLS';

select user, ot.numero
  from etiquetas_articulos_clientes eac
     , expedidos e
     , pr_ot ot
 where eac.codigo_articulo = 'SB CH 70024 MLS'
   and eac.codigo_cliente = '992073'
   and eac.codigo_etiqueta = 'E-13_01'
   and eac.codigo_cliente = e.cod_cliente
   and ot.abre01 = e.numero
   and ot.nuot_serie = '3'
   and ot.nuot_tipoot_codigo = 'AR'
   and ot.numero = 1050251
   and ot.formu_art_cod_art = eac.codigo_articulo;

select *
  from etiquetas_articulos_clientes
 where codigo_etiqueta = 'E-13_01'
   and codigo_articulo = 'SB CH 70024 MLS';

select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and nuot_serie = 3
   and numero = 1050251;

-- orden
select p.numero, p.abre01 as pedido, p.abre02, p.prioridad, p.formu_art_cod_art, p.cant_prog
     , e.fecha, p.nuot_tipoot_codigo, p.nuot_serie, e.cod_cliente, p.estado
  from pr_ot p
     , expedidos e
     , etiquetas_articulos_clientes eac
 where p.nuot_tipoot_codigo = 'AR'
   and p.abre01 = e.numero
   and p.estado >= 1
   and p.estado <= 9
   and eac.codigo_cliente = e.cod_cliente
   and eac.codigo_articulo = p.formu_art_cod_art
   and eac.codigo_etiqueta = 'E-13_01'
   and p.numero = 1050251
 order by p.numero, p.prioridad, p.abre01;

-- etiquetas
select codigo_etiqueta, descripcion
  from etiquetas_armado
 where codigo_etiqueta <> 'E-02_03'
   and codigo_etiqueta = 'E-13 01'
 order by 1;

select * from txt_etiquetas;

-- existe
select *
  from etiquetas_texto
 where codigo_etiqueta = 'E-02_01BL';

-- no existe
select *
  from etiquetas_texto
 where codigo_etiqueta = 'E-13_01';

-- nueva etiqueta
select *
  from etiquetas_texto
 where codigo_etiqueta = 'E-27_03';

select *
  from etiquetas_ordenes
 where numero_orden = 1050251;

select *
  from plancta
 where cuenta like '25%';

select * from pr_estados;

select * from lg_dua;

select *
  from solicita_cambio_trx_det
 where num_importa_old like '%1046313%';

select *
  from solicita_cambio_trx
 where detalle like '%1046313%';


select distinct o.nuot_tipoot_codigo as tipo, o.nuot_serie as serie, o.numero, o.fecha
              , d.art_cod_art, d.cod_lin
  from pr_ot o
       join pr_ot_det d
            on o.nuot_tipoot_codigo = d.ot_nuot_tipoot_codigo
              and o.nuot_serie = d.ot_nuot_serie
              and o.numero = d.ot_numero
 where exists (
   select *
     from pr_trasab_estado e
    where e.usuario = 'ALBERTO'
      and trunc(e.fecha) = to_date('26/08/2024', 'dd/mm/yyyy')
      and e.tipo = o.nuot_tipoot_codigo
      and e.serie = o.nuot_serie
      and e.numero = o.numero
   )
   and d.art_cod_art like '%MAH%'
 order by numero;


select distinct o.nuot_tipoot_codigo as tipo, o.nuot_serie as serie, o.numero
  from pr_ot o
 where exists (
   select *
     from pr_trasab_estado e
    where e.usuario = 'ALBERTO'
      and trunc(e.fecha) = to_date('26/08/2024', 'dd/mm/yyyy')
      and e.tipo = o.nuot_tipoot_codigo
      and e.serie = o.nuot_serie
      and e.numero = o.numero
   )
 minus
select distinct o.nuot_tipoot_codigo as tipo, o.nuot_serie as serie, o.numero
  from pr_ot o
       join pr_ot_det d
            on o.nuot_tipoot_codigo = d.ot_nuot_tipoot_codigo
              and o.nuot_serie = d.ot_nuot_serie
              and o.numero = d.ot_numero
 where exists (
   select *
     from pr_trasab_estado e
    where e.usuario = 'ALBERTO'
      and trunc(e.fecha) = to_date('26/08/2024', 'dd/mm/yyyy')
      and e.tipo = o.nuot_tipoot_codigo
      and e.serie = o.nuot_serie
      and e.numero = o.numero
   )
   and d.art_cod_art like '%MAH%'
 order by numero;

select *
  from tab_lineas
 where linea = '812';

-- ordenes validacion estado 1
select nuot_tipoot_codigo as tipo, nuot_serie as serie, numero, estado, cant_prog, fecha
     , formu_art_cod_art, observacion
  from pr_ot
 where nuot_tipoot_codigo = 'VA'
   and estado = 1
 order by fecha desc;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero in (
                  527828, 527828, 527828, 557910, 557910, 557910, 568984, 568984, 568984, 582154,
                  582154, 582154, 582418, 582418, 582418, 580720, 580720, 580720, 580889, 580889,
                  580889, 581293, 581293, 581293, 540356, 540357, 541587, 541587, 541588, 541588,
                  541589, 541589, 542498, 542498, 542499, 542499, 549373, 574050, 574051, 574052,
                  574748, 580184, 580185, 561041, 561041, 561041, 561041, 561041, 564028, 564028,
                  564028, 564028, 564028, 564110, 564110, 564110, 564110, 564221, 564221, 564221,
                  564221, 574637, 574637, 574637, 574654, 574654, 574654, 574654, 574654, 574654,
                  579402, 579402, 579402, 579402, 580005, 580005, 580005, 580006, 580006, 580006,
                  580009, 580009, 580009, 580015, 580015, 580015, 580075, 580075, 580075, 580075,
                  580078, 580078, 580078, 580079, 580079, 580079, 580102, 580102, 580102, 580102,
                  514449, 514449, 514449, 514449, 514449, 514449, 514449, 514449, 514449, 541586,
                  541586, 541586, 541586, 541586, 541586, 541586, 542551, 542551, 542551, 542551,
                  542551, 542551, 542551, 556818, 556818, 556818, 556818, 556818, 556818, 556818,
                  556818, 556818, 556818, 556818, 556818, 556818, 556818, 556818, 564869, 564869,
                  564869, 564869, 564869, 564869, 564869, 565270, 565270, 565270, 565270, 565270,
                  565270, 565270, 565367, 565367, 565367, 565367, 565367, 565367, 565367, 565829,
                  565829, 565829, 565829, 565829, 565829, 565829, 565829, 565829, 578813, 578813,
                  578813, 578813, 578813, 578813, 578813, 578818, 578818, 578818, 578818, 578818,
                  578818, 578818, 578818, 580590, 580590, 580590, 580590, 580590, 580590, 580590,
                  580590, 580600, 580600, 580600, 580600, 580600, 580600, 580600, 580600, 581290,
                  581290, 581290, 581290, 581290, 581290, 562559, 562661, 578408, 578409, 578470,
                  578471, 578472, 578482, 578483, 578484, 578485, 578549, 578550, 578551, 578552,
                  578579, 578580, 578597, 578607, 578614, 578729, 578738, 580373, 580374, 580375,
                  580376, 580378, 580380, 580384, 580385, 580386, 580387, 580389, 580390, 580391,
                  580392, 580393, 580394, 580395, 580396, 580397, 580422, 581034, 581270, 581271,
                  582318, 582319, 581048, 581049, 582177, 581210, 581210, 581210, 582408, 582408,
                  582408, 581175, 581175, 539463, 539463, 539463, 539463, 543669, 543669, 543669,
                  543669, 543669, 543669, 543669, 548166, 548166, 548166, 555997, 555997, 555997,
                  555997, 556469, 556469, 556469, 556469, 560946, 560946, 560946, 562096, 562096,
                  562096, 562096, 562410, 562410, 562410, 563118, 563118, 563118, 563118, 563118,
                  563304, 563304, 563304, 563304, 563304, 563429, 563429, 563429, 567555, 567555,
                  567555, 567555, 567555, 570481, 570481, 570481, 570481, 570481, 570482, 570482,
                  570482, 570482, 570482, 571168, 571168, 571168, 571168, 571221, 571221, 571221,
                  571223, 571223, 571223, 571224, 571224, 571224, 571225, 571225, 571225, 571225,
                  571226, 571226, 571226, 571226, 571279, 571279, 571279, 571279, 571281, 571281,
                  571281, 571281, 571496, 571496, 571496, 571496, 571619, 571619, 571619, 571619,
                  571671, 571671, 571671, 571671, 571799, 571799, 571799, 571799, 571892, 571892,
                  571892, 572023, 572023, 572023, 572064, 572064, 572064, 572064, 572076, 572076,
                  572076, 572076, 572158, 572158, 572158, 572159, 572159, 572159, 572196, 572196,
                  572196, 572329, 572329, 572329, 575750, 575750, 575750, 576446, 576446, 576446,
                  576689, 576689, 576689, 576689, 579245, 579245, 579245, 579254, 579254, 579254,
                  579254, 579254, 579254, 579323, 579323, 579323, 579323, 580296, 580296, 580296,
                  580307, 580307, 580307, 580307, 580308, 580308, 580308, 580308, 580443, 580443,
                  580443, 580443, 580443, 580443, 580445, 580445, 580445, 580445, 580445, 580445,
                  580452, 580452, 580452, 580452, 580559, 580559, 580559, 580559, 580630, 580630,
                  580630, 580796, 580796, 580796, 580796, 580796, 580964, 580964, 580964, 580964,
                  581011, 581011, 581011, 581037, 581037, 581037, 581037, 581165, 581165, 581165,
                  581260, 581260, 581260, 581446, 581446, 581446, 581446, 581508, 581508, 581508,
                  581543, 581543, 581543, 581586, 581586, 581586, 581588, 581588, 581588, 581629,
                  581629, 581629, 581805, 581805, 581805, 581805, 581827, 581827, 581827, 581827,
                  581828, 581828, 581828, 581828, 581953, 581953, 581953, 582107, 582107, 582107,
                  582107, 582108, 582108, 582108, 582108, 582109, 582109, 582109, 582109, 582110,
                  582110, 582110, 582110, 582119, 582119, 582119, 582120, 582120, 582120, 582184,
                  582184, 582187, 582187, 582187, 582188, 582188, 582188, 582188, 582189, 582189,
                  582189, 582198, 582198, 582198, 582201, 582201, 582201, 582208, 582208, 582208,
                  582209, 582209, 582209, 582209, 582210, 582210, 582210, 582210, 582211, 582211,
                  582211, 582211, 582228, 582228, 582228, 582365, 582365, 582365, 582367, 582367,
                  582367, 577848, 577848, 582300, 582300, 582340, 582340, 582340, 557234, 557234,
                  557234, 563681, 563681, 563681, 563681, 563681, 563681, 564318, 564318, 564318,
                  564395, 564395, 564395, 564395, 564395, 564406, 564406, 564406, 573645, 573645,
                  573645, 573646, 573646, 573646, 573649, 573649, 573649, 573731, 573731, 573731,
                  576830, 576830, 576830, 576830, 580339, 580339, 580339, 580339, 565573, 565573,
                  565573, 574300, 574300, 574300, 574300, 579555, 579555, 579555, 581255, 581255,
                  581255, 582206, 582206, 582206, 562368, 562368, 562368, 568059, 568059, 568059,
                  568516, 568516, 568516, 568546, 568546, 568546, 576181, 576181, 576181, 580352,
                  580352, 580352, 580543, 580543, 580543, 580884, 580885, 580957, 580957, 580957,
                  580958, 580993, 580993, 580993, 580993, 581081, 581081, 581081, 581172, 581172,
                  581172, 581217, 581217, 581217, 581218, 581218, 581218
   );

update pr_ot
   set fecha_cierre = to_date('30/09/2024', 'dd/mm/yyyy')
     , estado       = '8'
 where nuot_tipoot_codigo = 'PR'
   and numero in (
                  527828, 527828, 527828, 557910, 557910, 557910, 568984, 568984, 568984, 582154,
                  582154, 582154, 582418, 582418, 582418, 580720, 580720, 580720, 580889, 580889,
                  580889, 581293, 581293, 581293, 540356, 540357, 541587, 541587, 541588, 541588,
                  541589, 541589, 542498, 542498, 542499, 542499, 549373, 574050, 574051, 574052,
                  574748, 580184, 580185, 561041, 561041, 561041, 561041, 561041, 564028, 564028,
                  564028, 564028, 564028, 564110, 564110, 564110, 564110, 564221, 564221, 564221,
                  564221, 574637, 574637, 574637, 574654, 574654, 574654, 574654, 574654, 574654,
                  579402, 579402, 579402, 579402, 580005, 580005, 580005, 580006, 580006, 580006,
                  580009, 580009, 580009, 580015, 580015, 580015, 580075, 580075, 580075, 580075,
                  580078, 580078, 580078, 580079, 580079, 580079, 580102, 580102, 580102, 580102,
                  514449, 514449, 514449, 514449, 514449, 514449, 514449, 514449, 514449, 541586,
                  541586, 541586, 541586, 541586, 541586, 541586, 542551, 542551, 542551, 542551,
                  542551, 542551, 542551, 556818, 556818, 556818, 556818, 556818, 556818, 556818,
                  556818, 556818, 556818, 556818, 556818, 556818, 556818, 556818, 564869, 564869,
                  564869, 564869, 564869, 564869, 564869, 565270, 565270, 565270, 565270, 565270,
                  565270, 565270, 565367, 565367, 565367, 565367, 565367, 565367, 565367, 565829,
                  565829, 565829, 565829, 565829, 565829, 565829, 565829, 565829, 578813, 578813,
                  578813, 578813, 578813, 578813, 578813, 578818, 578818, 578818, 578818, 578818,
                  578818, 578818, 578818, 580590, 580590, 580590, 580590, 580590, 580590, 580590,
                  580590, 580600, 580600, 580600, 580600, 580600, 580600, 580600, 580600, 581290,
                  581290, 581290, 581290, 581290, 581290, 562559, 562661, 578408, 578409, 578470,
                  578471, 578472, 578482, 578483, 578484, 578485, 578549, 578550, 578551, 578552,
                  578579, 578580, 578597, 578607, 578614, 578729, 578738, 580373, 580374, 580375,
                  580376, 580378, 580380, 580384, 580385, 580386, 580387, 580389, 580390, 580391,
                  580392, 580393, 580394, 580395, 580396, 580397, 580422, 581034, 581270, 581271,
                  582318, 582319, 581048, 581049, 582177, 581210, 581210, 581210, 582408, 582408,
                  582408, 581175, 581175, 539463, 539463, 539463, 539463, 543669, 543669, 543669,
                  543669, 543669, 543669, 543669, 548166, 548166, 548166, 555997, 555997, 555997,
                  555997, 556469, 556469, 556469, 556469, 560946, 560946, 560946, 562096, 562096,
                  562096, 562096, 562410, 562410, 562410, 563118, 563118, 563118, 563118, 563118,
                  563304, 563304, 563304, 563304, 563304, 563429, 563429, 563429, 567555, 567555,
                  567555, 567555, 567555, 570481, 570481, 570481, 570481, 570481, 570482, 570482,
                  570482, 570482, 570482, 571168, 571168, 571168, 571168, 571221, 571221, 571221,
                  571223, 571223, 571223, 571224, 571224, 571224, 571225, 571225, 571225, 571225,
                  571226, 571226, 571226, 571226, 571279, 571279, 571279, 571279, 571281, 571281,
                  571281, 571281, 571496, 571496, 571496, 571496, 571619, 571619, 571619, 571619,
                  571671, 571671, 571671, 571671, 571799, 571799, 571799, 571799, 571892, 571892,
                  571892, 572023, 572023, 572023, 572064, 572064, 572064, 572064, 572076, 572076,
                  572076, 572076, 572158, 572158, 572158, 572159, 572159, 572159, 572196, 572196,
                  572196, 572329, 572329, 572329, 575750, 575750, 575750, 576446, 576446, 576446,
                  576689, 576689, 576689, 576689, 579245, 579245, 579245, 579254, 579254, 579254,
                  579254, 579254, 579254, 579323, 579323, 579323, 579323, 580296, 580296, 580296,
                  580307, 580307, 580307, 580307, 580308, 580308, 580308, 580308, 580443, 580443,
                  580443, 580443, 580443, 580443, 580445, 580445, 580445, 580445, 580445, 580445,
                  580452, 580452, 580452, 580452, 580559, 580559, 580559, 580559, 580630, 580630,
                  580630, 580796, 580796, 580796, 580796, 580796, 580964, 580964, 580964, 580964,
                  581011, 581011, 581011, 581037, 581037, 581037, 581037, 581165, 581165, 581165,
                  581260, 581260, 581260, 581446, 581446, 581446, 581446, 581508, 581508, 581508,
                  581543, 581543, 581543, 581586, 581586, 581586, 581588, 581588, 581588, 581629,
                  581629, 581629, 581805, 581805, 581805, 581805, 581827, 581827, 581827, 581827,
                  581828, 581828, 581828, 581828, 581953, 581953, 581953, 582107, 582107, 582107,
                  582107, 582108, 582108, 582108, 582108, 582109, 582109, 582109, 582109, 582110,
                  582110, 582110, 582110, 582119, 582119, 582119, 582120, 582120, 582120, 582184,
                  582184, 582187, 582187, 582187, 582188, 582188, 582188, 582188, 582189, 582189,
                  582189, 582198, 582198, 582198, 582201, 582201, 582201, 582208, 582208, 582208,
                  582209, 582209, 582209, 582209, 582210, 582210, 582210, 582210, 582211, 582211,
                  582211, 582211, 582228, 582228, 582228, 582365, 582365, 582365, 582367, 582367,
                  582367, 577848, 577848, 582300, 582300, 582340, 582340, 582340, 557234, 557234,
                  557234, 563681, 563681, 563681, 563681, 563681, 563681, 564318, 564318, 564318,
                  564395, 564395, 564395, 564395, 564395, 564406, 564406, 564406, 573645, 573645,
                  573645, 573646, 573646, 573646, 573649, 573649, 573649, 573731, 573731, 573731,
                  576830, 576830, 576830, 576830, 580339, 580339, 580339, 580339, 565573, 565573,
                  565573, 574300, 574300, 574300, 574300, 579555, 579555, 579555, 581255, 581255,
                  581255, 582206, 582206, 582206, 562368, 562368, 562368, 568059, 568059, 568059,
                  568516, 568516, 568516, 568546, 568546, 568546, 576181, 576181, 576181, 580352,
                  580352, 580352, 580543, 580543, 580543, 580884, 580885, 580957, 580957, 580957,
                  580958, 580993, 580993, 580993, 580993, 581081, 581081, 581081, 581172, 581172,
                  581172, 581217, 581217, 581217, 581218, 581218, 581218
   );

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero = 527828;

select *
  from vacaciones
 where numero = 19496;

select distinct usuario
  from solicita_cambio_ot
 where extract(year from fch_solicitud) = 2024;

select u.email
  from usuario_modulo_alterno m
       join usuarios u on m.id_alterno = u.usuario
 where m.id_alterno = 'DNUNEZM'
   and m.id_modulo = 'CAMBIO_OT'
   and m.id_usuario = 'CNINAMANGO';

select *
  from usuarios
 where usuario = 'DNUNEZM';

select *
  from usuario_modulo
 where usuario = 'DNUNEZM'
   and modulo = 'CAMBIO_OT';

select *
  from usuario_modulo_alterno
 where id_modulo = 'CAMBIO_OT';


-- ordenes estado 2 o 3
select numero, fecha, estado, cant_prog, formu_art_cod_art as codigo, cod_lin
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and estado in ('2', '3')
   and cod_lin in (
                   '1021', '1022', '1023', '1024', '1025', '1026', '1860', '1861'
   );

select *
  from pr_ot_bolsas
 where nuot_tipoot_codigo = 'PR'
   and numero = 583244;

-- INSERT INTO PEVISA.PR_OT_BOLSAS (NUMERO, NUOT_SERIE, NUOT_TIPOOT_CODIGO, BOLSA, FECHA, CANTIDAD, USUARIO, OBSERVACION, ESTADO, ID_TRABAJADOR, ID_ETIQUETA) VALUES (583244, '8', 'PR', 1, TIMESTAMP '2024-10-24 14:50:57', 4, 'JJUAREZ', '25.0.3.162', 1, '44736038', '08005832440001');

select *
  from pr_ot_bolsas
 where nuot_tipoot_codigo = 'PR'
   and numero = 578623;

-- ingresa pieza
select o.numero as numero_ot, o.formu_art_cod_art as art_cod_art, o.cant_prog
     , o.nuot_tipoot_codigo as tip_ot, o.nuot_serie as serie_ot, o.estado, o.fecha
  from pr_ot o
     , articul a
 where o.formu_art_cod_art = a.cod_art
   and o.nuot_tipoot_codigo = 'PR'
   and o.estado not in ('8', '9')
--    and extract(year from o.fecha) = 2024
--    and extract(month from o.fecha) = 8
 order by o.numero desc;

select *
  from cambdol
 where fecha = to_date('08/05/2024', 'dd/mm/yyyy')
 order by fecha desc;

select sysdate from dual;

select * from vw_articulo;

select cod_art, sum(saldo) as saldo_ov
     , listagg(numero || '(' || estado || ', ' || cant_prog || ')', ' | ')
               within group (order by estado, numero) as numero_ov
  from vw_ordenes_curso
 where nuot_tipoot_codigo = 'VA'
 group by cod_art;

select f.cod_art, a.cod_lin, f.cod_for, f.canti
  from pcmasters m
       join pcformulas f on m.cod_art = f.cod_art
       join articul a on m.cod_art = a.cod_art
 where f.cod_for in ('FOR3919', 'FOR3818', 'FOR3828', 'POB 516')
 order by cod_for;

select * from capacitacion;

select *
  from pr_ot_bolsas
 where nuot_tipoot_codigo = 'PR'
   and numero = 588293;

select numero, formu_art_cod_art, cant_prog, prioridad, nuot_tipoot_codigo, fecha, boling
  from pr_ot
 where nuot_tipoot_codigo in ('PR') and estado = 1
   and numero = 588299
   and not exists (
   select 1
     from pr_ot_anulacion
    where numero = pr_ot.numero
      and nuot_tipoot_codigo = pr_ot.nuot_tipoot_codigo
      and nuot_serie = pr_ot.nuot_serie
   )
 order by numero;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero = 588299;

select *
  from pr_ot_anulacion
 where nuot_tipoot_codigo = 'PR'
   and numero = 588299;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero = 588299;


select *
  from pr_ot
 where nuot_tipoot_codigo in ('PR')
   and estado = 1
   and numero = 588299
   and not exists (
   select 1
     from pr_ot_anulacion
    where numero = pr_ot.numero
      and nuot_tipoot_codigo = pr_ot.nuot_tipoot_codigo
      and nuot_serie = pr_ot.nuot_serie
   )
--    and not exists (select 1
--                      from kardex_g
--                     where numero_pguia = pr_ot.numero
--                       and serie_pguia = pr_ot.nuot_serie
--                       and tipo_pguia = pr_ot.nuot_tipoot_codigo
--                       and estado < 9)
   and numero not in
       (
         select pr.numero
           from pr_ordenes_partidas pr
          where pr.nuot_tipoot_codigo = 'PR'
         );

select *
  from pr_ordenes_partidas
 where nuot_tipoot_codigo = 'PR'
   and numero = 588299;

select numero, formu_art_cod_art, cant_prog, prioridad, nuot_tipoot_codigo, fecha, boling
  from pr_ot
 where nuot_tipoot_codigo in ('PR')
   and estado = 1
   and not exists (
   select 1
     from pr_ot_anulacion
    where numero = pr_ot.numero
      and nuot_tipoot_codigo = pr_ot.nuot_tipoot_codigo
      and nuot_serie = pr_ot.nuot_serie
   )
 order by numero;

select *
  from pr_ot
 where nuot_tipoot_codigo in ('PR')
   and estado = 1
   and not exists (
   select 1
     from pr_ot_anulacion
    where numero = pr_ot.numero
      and nuot_tipoot_codigo = pr_ot.nuot_tipoot_codigo
      and nuot_serie = pr_ot.nuot_serie
   )
   and not exists (
   select 1
     from kardex_g
    where numero_pguia = pr_ot.numero
      and serie_pguia = pr_ot.nuot_serie
      and tipo_pguia = pr_ot.nuot_tipoot_codigo
      and estado < 9
   );

select distinct pk_tipo, pk_serie, pk_numero, g.cod_cliente, c.nombre, g.estado, scod_alm, sguia_tp
              , sguia_serie, sguia_numero, sguia_fecha, transporte_medio
  from pk_glosa g
     , exclientes c
 where g.cod_cliente = c.cod_cliente
   and g.estado = '7'
   and scod_alm is not null
   and sguia_tp is not null
   and sguia_serie is not null
   and sguia_numero is not null
   and pk_tipo = 'PK'
   and pk_serie = '1'
   and pk_numero = :x_numero;

select *
  from pk_glosa
 where estado = '7'
   and extract(year from fecha) = 2024;

select *
  from pk_gnumero
 where pk_numero = 59058;

select *
  from pk_glosa
 where pk_numero = 59058;

select cod_art, cantidad from tmp_carga_data;

select sum(cantidad) from tmp_carga_data;

select *
  from vw_detalle_orden_sol
 where ot_numero = 589617;

select *
  from vw_detalle_orden_sol
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_nuot_serie = 8
   and not exists (
   select 1
     from pr_ot po
    where po.nuot_tipoot_codigo = vw_detalle_orden_sol.ot_nuot_tipoot_codigo
      and po.numero = vw_detalle_orden_sol.ot_numero
      and po.estado < 8
   )
 order by ot_numero desc;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero = 2103610;


select gt.id_grupo
  from grupos_tipo_solicitud gt
 where gt.tipo_sol = 'PIEZA';

select pd.ot_nuot_tipoot_codigo, pd.ot_nuot_serie, pd.ot_numero, p.formu_art_cod_art, pd.art_cod_art
     , pd.rendimiento, pd.cod_lin
  from pr_ot p
     , pr_ot_det pd
     , articul a
     , pr_grupos_lineas pg
 where p.nuot_tipoot_codigo = pd.ot_nuot_tipoot_codigo
   and p.nuot_serie = pd.ot_nuot_serie
   and p.numero = pd.ot_numero
   and a.cod_art = pd.art_cod_art
   and a.cod_lin = pg.cod_lin
   and (
   pg.id_grupo in (
     select gt.id_grupo
       from grupos_tipo_solicitud gt
      where gt.tipo_sol = 'PIEZA'
     ) or pd.cod_lin in ('1804', '1440'))
   and p.numero = 589580;

select *
  from pr_grupos_lineas
 where cod_lin in ('1804', '1440');

select *
  from grupos_tipo_solicitud
 where tipo_sol = 'PIEZA';

select *
  from grupos_tipo_solicitud
 where id_grupo = '%';

select *
  from pr_ot_det
 where cod_lin = '1809'
   and ot_nuot_tipoot_codigo = 'PR'
 order by ot_numero desc;

select * from vw_resumen_solicitud_vwm;

/*
CREATE OR REPLACE FORCE VIEW "PEVISA"."VW_RESUMEN_SOLICITUD_VWM" ("ART_COD_ART", "TOTAL") AS
SELECT pd.ART_COD_ART, NVL (SUM (cant_sol), 0) total
  FROM PEVISA.PR_OT_DET pd
         --agregado para colocar la cantidad que requiere produccion...
       LEFT JOIN TMP_FILTRO_PLAN_PROD_DETALLE tm
                 ON     pd.OT_NUOT_TIPOOT_CODIGO = tm.OT_NUOT_TIPOOT_CODIGO
                   AND pd.OT_NUOT_SERIE = tm.OT_NUOT_SERIE
                   AND pd.OT_NUMERO = tm.OT_NUMERO
                   AND pd.ART_COD_ART = tm.ART_COD_ART
 WHERE     pd.OT_NUOT_TIPOOT_CODIGO IN
           (SELECT OT_NUOT_TIPOOT_CODIGO
              FROM TMP_FILTRO_PLAN_PROD_DETALLE)
   AND pd.OT_NUOT_SERIE IN (SELECT OT_NUOT_SERIE
                              FROM TMP_FILTRO_PLAN_PROD_DETALLE)
   AND pd.ot_numero IN (SELECT t.ot_numero
                          FROM TMP_FILTRO_PLAN_PROD_DETALLE t)
HAVING     GET_GRUPO_PIEZA (pd.ART_COD_ART) IN
           (SELECT ID_GRUPO
              FROM GRUPOS_TIPO_SOLICITUD
             WHERE TIPO_SOL = 'PIEZA')
   AND pd.ART_COD_ART IN (SELECT t.art_cod_art
                            FROM TMP_FILTRO_PLAN_PROD_DETALLE t)
 GROUP BY pd.ART_COD_ART;
*/

select *
  from vw_detalle_orden_sol
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 585385
   and art_cod_art = '290.3902S';

select nvl(sum(cant_for), 0)
  from vw_soli_general_wms_prod
 where tipo_solicitud in ('WMS', 'PRODUCCION')
   and estado not in ('ANULADO')
   and tipo = 'PR'
   and serie = 8
   and numero = 585385
   and cod_art = '290.3902S';


select *
  from vw_soli_general_wms_prod
 where tipo_solicitud in ('WMS', 'PRODUCCION')
   and estado not in ('ANULADO')
   and tipo = 'PR'
   and serie = 8
   and numero = 585385
   and cod_art = '290.3902S';

select *
  from wms_orden_sol
 where tipo = 'PR'
   and numero = 585385;

select *
  from wms_orden_oms_item
 where ot_tipo = 'PR'
   and ot_numero = 585385;

-- reporte clo
select cod_art, descripcion, cod_lin, pr_observacion
  from articul
 where cod_art like 'CL-O%';

select *
  from pcformulas
 where cod_for = '200.2560CS-1';

select to_char(d.fch_transac, 'YYYY') as ano, to_char(d.fch_transac, 'MM') as mes, d.cod_art
     , a.cod_lin, p.formu_art_cod_art, sum(d.cantidad) as cantidad, sum(p.cant_prog) as cant_prog
  from kardex_d_consumo d
     , articul a
     , tmp_faltantes f
     , pr_ot p
 where f.cod_art = a.cod_art
   and d.cod_art = a.cod_art
   and d.tp_transac in ('22', '29')
   and d.fch_transac >= to_date('01/01/2024', 'dd/mm/yyyy')
   and d.fch_transac <= to_date('31/12/2024', 'dd/mm/yyyy')
   and p.nuot_tipoot_codigo = d.pr_tipot
   and p.numero = d.pr_numot
 group by to_char(d.fch_transac, 'YYYY'), to_char(d.fch_transac, 'MM'), d.cod_art, a.cod_lin
        , p.formu_art_cod_art;


select to_char(d.fch_transac, 'YYYY') as ano, to_char(d.fch_transac, 'MM') as mes, d.cod_art
     , a.cod_lin, p.formu_art_cod_art, sum(d.cantidad) as cantidad, sum(p.cant_prog) as cant_prog
  from kardex_d_consumo d
     , articul a
     , pr_ot p
 where d.cod_art = a.cod_art
   and d.tp_transac in ('22', '29')
   and d.fch_transac >= to_date('01/01/2024', 'dd/mm/yyyy')
   and d.fch_transac <= to_date('31/12/2024', 'dd/mm/yyyy')
   and p.nuot_tipoot_codigo = d.pr_tipot
   and p.numero = d.pr_numot
   and a.cod_art = '95242TG'
 group by to_char(d.fch_transac, 'YYYY'), to_char(d.fch_transac, 'MM'), d.cod_art, a.cod_lin
        , p.formu_art_cod_art;

select * from kardex_d_consumo;

select *
  from vacaciones
 where numero = 19798;

select * from paramfa;

select * from pr_grupos;

select * from articul_varios;

select * from tmp_programa_ordenes_ingresos;

select *
  from pr_ot_cierres
 where nuot_tipoot_codigo = 'VA'
   and numero = 11176;

-- ingresos por produccion 2024
select d.cod_alm, w.descripcion as almacen, d.tp_transac, t.descripcion as transaccion, a.cod_art
     , sum(case extract(month from d.fch_transac) when 01 then d.cantidad else 0 end) as ene
     , sum(case extract(month from d.fch_transac) when 02 then d.cantidad else 0 end) as feb
     , sum(case extract(month from d.fch_transac) when 03 then d.cantidad else 0 end) as mar
     , sum(case extract(month from d.fch_transac) when 04 then d.cantidad else 0 end) as abr
     , sum(case extract(month from d.fch_transac) when 05 then d.cantidad else 0 end) as may
     , sum(case extract(month from d.fch_transac) when 06 then d.cantidad else 0 end) as jun
     , sum(case extract(month from d.fch_transac) when 07 then d.cantidad else 0 end) as jul
     , sum(case extract(month from d.fch_transac) when 08 then d.cantidad else 0 end) as ago
     , sum(case extract(month from d.fch_transac) when 09 then d.cantidad else 0 end) as sep
     , sum(case extract(month from d.fch_transac) when 10 then d.cantidad else 0 end) as oct
     , sum(case extract(month from d.fch_transac) when 11 then d.cantidad else 0 end) as nov
     , sum(case extract(month from d.fch_transac) when 12 then d.cantidad else 0 end) as dic
     , sum(d.cantidad) as total
  from kardex_d d
       join articul a on d.cod_art = a.cod_art
       left join almacenes w on d.cod_alm = w.cod_alm
       left join transacciones_almacen t on d.tp_transac = t.tp_transac
 where a.cod_lin in (
                     '800', '801', '810', '826', '829', '852', '854'
   )
   and extract(year from d.fch_transac) = 2024
   and d.tp_transac = '18'
--    and w.descripcion not like '%FAUCETT%'
--    and a.cod_art = 'PHD 115.770'
 group by d.cod_alm, d.tp_transac, a.cod_art, w.descripcion, t.descripcion
 order by cod_art;

select * from almacenes;

select *
  from emite_op_log
 where not exists (
   select 1
     from pr_ot
    where numero = emite_op_log.numero
      and estado = '9'
   )
   and creacion_quien = 'PEVISA'
 order by creacion_cuando desc;

select *
  from permiso
 where numero = 69431;

select * from estado_permiso;

select *
  from pr_ot_cierres
 where nuot_tipoot_codigo = 'VA'
   and numero = 50;

select *
  from pr_usualma
 where usuario = 'ADESCARTES'
   and cod_alm = '30';

select *
  from pr_ot_bolsas
 where numero = 606595;

select t.abreviada, t.codigo
  from pr_tip_ot t
 where t.codigo in (
   select c.ot_tipo
     from tipo_cambio_ot c
    where c.id_tipo = :global.tipo
   );

select *
  from tipo_cambio_ot c;


select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero in (
   602873
   )
 union all
select *
  from pr_ot
 where nuot_tipoot_codigo = 'VA'
   and numero in (
   11509
   );


select *
  from pr_ot
 where nuot_tipoot_codigo = 'VA'
   and extract(year from fecha) = 2025
   and extract(month from fecha) = 04;

select *
  from pr_ot_bolsas
 where nuot_tipoot_codigo = 'PR'
   and numero = 599253;

select *
  from articul_consumo
 where cod_art = '39/64" IB';

select *
  from articul
 where cod_art = '26/64" IB';

select t.codigo, t.descripcion, t.indicador1
  from tablas_auxiliares t
 where t.tipo = 33
   and t.codigo in (
   select cod_alm
     from pr_usualma
    where cod_alm = t.codigo
      and usuario = 'DNUNEZM'
   )
   and t.codigo in (
   select distinct cod_alm_origen
     from traslados_almacenes
   );

select *
  from pr_usualma
 where usuario = 'DNUNEZM'
 order by cod_alm;

select *
  from pr_usualma
 where usuario = 'PEVISA'
 order by cod_alm;

select n.serie, n.automatico
  from numdoc n
     , almacen_trasaccion_serie t
 where n.tp_transac = '35'
   and n.tp_transac = t.tp_transac
   and t.cod_alm = '15'
   and n.serie = t.serie
 order by 1;

select *
  from almacen_trasaccion_serie
 where cod_alm = '03';

select *
  from almacen_trasaccion_serie
 where serie = '141';

select ta.cod_alm_destino, a.descripcion
  from traslados_almacenes ta
     , almacenes a
 where ta.cod_alm_destino = a.cod_alm
   and ta.cod_alm_origen = '15'
 order by 1;

select *
  from pr_usualma
 where usuario = 'DRODRIGUEZS'
   and cod_alm in ('D2', 'ES');

-- hgns1.hostgator.com
-- hgns2.hostgator.com

select *
  from ruta_docvirtual
 where docvirtual = 'DESARROLLO';

select *
  from pr_for_ins
 where formu_art_cod_art = '90035CS-2/0.50';

select *
  from articul
 where cod_art = 'LAF 0.5-1219-2438GZ';

select *
  from articul
 where cod_art = 'FOR3919';

select distinct usuario
  from vw_solicita_cambio_ot
 order by usuario;

select *
  from wms_lineas_solicitud
 where tipo_sol = 'MATER';

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_nuot_serie = 8
   and ot_numero = 608191;

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_nuot_serie = 8
--    and exists (
--    select *
--      from wms_lineas_solicitud
--     where tipo_sol = 'MATER'
--       and linea = pr_ot_det.cod_lin
--    )
 order by ot_numero desc;



select nvl(sum(wd.cant_pedido), '0')
  from wms_orden_sol w
     , wms_orden_sol_item wd
 where w.tipo = wd.tipo
   and w.serie = wd.serie
   and w.numero = wd.numero
   and nvl(w.estado, '0') in (0, 1, 2, 8)
   and nvl(wd.estado, '0') in (0, 1, 2, 8)
   and componente = 'BH 0.32-184';

select nvl(sum(wd.cant_pedido), '0')
  from wms_orden_sol w
     , wms_orden_sol_item wd
 where w.tipo = wd.tipo and w.serie = wd.serie and w.numero = wd.numero
   and nvl(w.estado, '0') in (0, 1, 2, 8) and nvl(wd.estado, '0') in (0, 1, 2, 8)
   and componente = 'BH 0.32-184'
   --TOMAR EL STOCK DE ALMACEN DESCARTES... D5
   and alm = '30'
   and nvl(w.estado, '0') not in (9);

-- juarez.25

select wd.*
  from wms_orden_sol w
     , wms_orden_sol_item wd
 where w.tipo = wd.tipo and w.serie = wd.serie and w.numero = wd.numero
   and nvl(w.estado, '0') in (0, 1, 2, 8) and nvl(wd.estado, '0') in (0, 1, 2, 8)
   and componente = 'BH 0.32-184'
   --TOMAR EL STOCK DE ALMACEN DESCARTES... D5
   and alm = '30'
   and nvl(w.estado, '0') not in (9);

select * from wms_estado_solicitud;

-- orden de produccion de muestra para cambio de cantidad WMS
select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and nuot_serie = 8
   and numero = 563592;

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_nuot_serie = 8
   and ot_numero = 563592;

select *
  from solicita_cambio_ot
 where ot_tpo = 'PR'
   and ot_nro = 607551;

select *
  from solicita_cambio_ot_log
 where id_solicitud = 21945;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and estado = 1;

select *
  from articul
 where cod_art = 'CRYO 330MM/19MIC';

select *
  from pr_ot_det d
 where d.ot_nuot_tipoot_codigo = 'PR'
   and d.art_cod_art = 'CRYO 330MM/15MIC'
   and exists (
   select *
     from pr_ot o
    where o.nuot_tipoot_codigo = d.ot_nuot_tipoot_codigo
      and o.nuot_serie = d.ot_nuot_serie
      and o.numero = d.ot_numero
      and o.estado in (2)
   );

-- Ordenes cambiadas de material para Diana Contreras
select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero in (
                     513807, 522700, 528659, 542361, 542570, 551456, 551487, 551518, 553341, 553342,
                     553507, 553627, 553628, 553675, 556236, 556275, 559621, 564474, 564486, 564528,
                     564871, 565242, 565278, 565309, 565353, 565418, 565727, 565776, 565785, 565831,
                     565834, 566071, 566097, 570073, 570404, 572477, 572478, 572479, 572480, 572815,
                     573034, 575450, 577019, 578078, 579435, 580967, 580968, 582916, 582976, 583268,
                     584828, 585383, 585412, 586048, 586226, 586227, 586356, 586441, 590734, 591104,
                     591293, 591294, 591295, 591419, 591426, 591763, 591994, 592094, 592096, 592098,
                     592181, 592448, 592532, 592533, 592651, 592692, 592775, 592797, 592849, 600450,
                     600457, 603205, 603705, 604017, 607907
   )
   and art_cod_art = 'CRYO 330MM/15MIC';

select cod_concepto
  from cominac_contrato_item
 where cod_contrato = 17018;

select *
  from cominac_concepto_excluye_clie
 where cod_concepto in (
                        12, 13, 14, 15, 16, 23, 59, 94, 103, 115, 116, 123, 203, 210, 249, 298, 333,
                        366, 390, 403, 428, 479, 487
   );

insert into cominac_concepto_excluye_clie(cod_concepto, cod_cliente)
select cod_concepto, '20601479886'
  from cominac_contrato_item
 where cod_contrato = 17018;

select *
  from clientes
 where cod_cliente = '20601479886';

-- 610229
select p.numero, p.formu_art_cod_art, p.cant_prog, p.fecha, g.descripcion
     , substr(to_char(100000000 + p.numero), 2, 8) as orden_etiqueta
     , substr(to_char(100 + p.nuot_serie), 2, 2) as serie_etiqueta, p.nuot_tipoot_codigo
     , p.nuot_serie, nvl(peso_por_bolsa, 0) as peso_por_bolsa
  from pr_ot p
     , pr_grupos_lineas gl
     , pr_grupos g
     , pr_formu f
 where p.nuot_tipoot_codigo = 'PR'
   and p.estado in (1, 2, 3, 4)
   and p.cod_lin = gl.cod_lin
   and gl.id_grupo = g.id
   and p.formu_art_cod_art = f.art_cod_art
 order by p.numero;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero = 610229;

select cod_art, nvl(sum(stock), 0) as stock_03
  from almacen
 where cod_alm in ('03', '05')
 group by cod_art;

select * from almacen;

select o.formu_art_cod_art as pieza, d.art_cod_art as cod_art, d.rendimiento, d.cod_lin
     , cant_formula - cant_surtida as total, almacen
  from pr_ot_det d
     , pr_ot o
 where d.ot_numero = o.numero
   and d.ot_nuot_serie = o.nuot_serie
   and d.ot_nuot_tipoot_codigo = o.nuot_tipoot_codigo
   and d.ot_numero = 1110096
   and d.ot_nuot_serie = 3
   and cant_formula - cant_surtida > 0
   and d.estado <> 9
 order by d.cod_lin;


select numero, fecha, estado, cant_prog, nuot_serie, nuot_tipoot_codigo as tipo, formu_art_cod_art
     , serie_ot_fab, numero_ot_fab, abre01, abre02, cod_eqi, pais, empaque, usuario, origen
     , prioridad, fecha_prioridad, destino
  from pr_ot
 where nuot_tipoot_codigo in ('AR', 'PA', 'SA') -- SOLO ARMADOS
   and estado < 6
   and numero = 1110096
 order by prioridad, numero;

select *
  from pr_ot_det
 where ot_numero = 1110096
   and ot_nuot_serie = 3
   and estado <> 9;

select count(1)
  from articul
 where cod_art = '90010SB';

select get_stock_corrida_produccion('ARO 66110'), nvl(pr_stk_separado, 0)
  from articul
 where cod_art = 'ARO 66110';

select *
  from articul
 where cod_art = '90010SB'
   and s_act = pr_stk_separado;

select *
  from articul
 where s_act = pr_stk_separado
   and cod_art like 'ARO 66110';

select *
  from articul
 where s_act = pr_stk_separado;

select *
  from articul
 where s_act = pr_stk_separado;

select *
  from pr_ot_impresion
 where nuot_tipoot_codigo = 'PR'
   and numero = 603994;

select *
  from pr_ot_bolsas
 where numero = 603994;

select * from pr_forsec;

select sysdate from dual;

select *
  from amonestacion
 where numero = 680;

-- 16964

-- pedido de muestras
select *
  from vw_ordenes_pedido_pendiente
 where pedido = 16968;

-- pedido de muestras
select *
  from expedidos
 where numero = 16968;


select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and numero = 1126093;

select *
  from pr_ot_impresion
 where nuot_tipoot_codigo = 'AR'
   and numero = 1126093;

select *
  from pr_ot
 where abre01 = '16865'
   and per_env = 103;

select *
  from expedido_d
 where numero = 16865
   and nro in (103, 99);

select *
  from kardex_d
 where cod_alm = '30'
   and tp_transac = '18'
   and serie = 2
   and numero = 623771;

select *
  from kardex_g_historia
 where cod_alm = '30'
   and tp_transac = '18'
   and serie = 2
   and numero = 623771;

select *
  from kardex_d
 where cod_alm = '30'
   and tp_transac = '18'
   and serie = 2
   and numero = 623771;

select *
  from kardex_g_historia
 where cod_alm = '30'
   and tp_transac = '18'
   and serie = 2
   and numero = 623771;

select *
  from tab_lineas
 where linea = '1309';

select *
  from pr_embarques
 where ano_embarque = 2025
   and mes_embarque = 11;

select * from exparamexpo;

select *
  from pr_embarques
     , exparamexpo
 where ano_embarque = to_char(sysdate, 'YYYY')
   and mes_embarque = to_char(sysdate, 'MM')
   and id_pedido = 16940;


select *
  from pr_ot_historia
 where nuot_tipoot_codigo = 'PR'
   and numero = 630220;

select *
  from pr_ot_historia
 where nuot_tipoot_codigo = 'PR'
   and numero in (630220, 627261);

select lg.num_importa as numero, o.tipo as serie, lg.fecha as fecha_orden, lg.nombre
     , d.fch_transac as ingreso
  from lg_vpedjam lg
     , kardex_g g
     , kardex_d d
     , lg_pedjam o
 where lg.cod_art = d.cod_art
   and f_pieza_nueva_tg(d.cod_art) = :art_cod_art
   and lg.num_importa = d.pr_referencia
   and d.tp_transac = '11'
   and d.estado < 9
   and g.cod_alm = d.cod_alm
   and g.tp_transac = d.tp_transac
   and g.serie = d.serie
   and g.numero = d.numero
   and lg.num_importa = d.pr_referencia
   and lg.num_importa = o.num_importa
 order by 1;

select *
  from lg_vpedjam
 where extract(year from fecha) = 2025;

select *
  from pevisa.pr_ot
 where nuot_tipoot_codigo = 'PR'
   and cant_merma > 0
 order by fecha desc;


-- solo líneas para poder emitir manual
-- FOR y BATCH
select *
  from prod_subgrupo_linea_rel
 where id_subgrupo in ('S042', 'S043');

select *
  from articul
 where cod_lin = '1601';

select cod_art, (nvl(consumo_mensual, 0) * 2) - nvl(stock, 0) - nvl(saldo_op, 0) +
                nvl(cant_requerida, 0) as maximo_emitir
  from vw_articulo
 where
   (nvl(consumo_mensual, 0) * 2) - nvl(stock, 0) - nvl(saldo_op, 0) + nvl(cant_requerida, 0) > 10;


select *
  from vw_articulo_requerimiento
 where cod_lin between '1630' and '1633';


select *
  from articul
 where cod_lin = '1630';


  with op_curso
    as (
      select cod_art, sum(saldo) as saldo_op, listagg(
          numero || '(' || estado || ' ' || cant_prog || ')',
          ' | ')
          within group (order by estado, numero)
        as numero_op
        from vw_ordenes_curso
       where nuot_tipoot_codigo = 'PR'
       group by cod_art
      )
     , requerimiento as (
--       select cod_art
--            , 0 as cant_requerida
--            , 0 as cant_separado
--            , 0 as cant_faltante
--            , 0 as stock_requerida
--         from articul
      select cod_art, sum(cant_requerida) as cant_requerida, sum(cant_separado) as cant_separado
           , sum(faltante) as cant_faltante, sum(stock) as stock_requerida
        from pevisa.vw_requerimiento_articulo
       group by cod_art
      )
     , stock_art as (
      select cod_art, sum(stock) as stock
        from almacen
       group by cod_art
      )
     , ribete as (
      select f.formu_art_cod_art, listagg(f.art_cod_art, ' | ')
                                          within group (order by f.art_cod_art) as ribete
        from pevisa.pr_for_ins f
           , pevisa.articul a
       where f.art_cod_art = a.cod_art and (a.cod_lin in
                                            ('1431', '1432', '1433', '1434', '1435', '1436',
                                             '1437'))
       group by f.formu_art_cod_art
      )
     , anillo as (
      select f.formu_art_cod_art, listagg(f.art_cod_art, ' | ')
                                          within group (order by f.art_cod_art) as anillo
        from pevisa.pr_for_ins f
           , pevisa.articul a
       where f.art_cod_art = a.cod_art and (a.cod_lin in ('1445'))
       group by f.formu_art_cod_art
      )
     , aro_fire_ring as (
      select f.formu_art_cod_art, listagg(f.art_cod_art, ' | ')
                                          within group (order by f.art_cod_art) as aro_fire
        from pevisa.pr_for_ins f
           , pevisa.articul a
       where f.art_cod_art = a.cod_art and (a.cod_lin in ('1450', '1455', '922'))
       group by f.formu_art_cod_art
      )
     , material as (
      select f.formu_art_cod_art, listagg(f.art_cod_art, ' | ')
                                          within group (order by f.art_cod_art)
        as art_cod_art
           , listagg(round(c.consumo_anual), ' | ')
                     within group (order by c.consumo_anual)
        as consumo_anual_material
        from pr_for_ins f
             join articul a on f.art_cod_art = a.cod_art
             join vw_articulo_consumo c on f.art_cod_art = c.cod_art
       where (a.cod_lin in ('1601', '2004', '2005')
         or (a.cod_lin between '1620' and '1634')
         or (a.cod_lin between '2010' and '2019'))
         --or (a.cod_lin in ('1431','1432','1433','1434','1435','1436','1437','1445','1450','1455'))
         and length(a.cod_lin) = 4
       group by f.formu_art_cod_art
      )
select a.cod_art, a.descripcion, a.cod_lin
     , g.id_grupo, g.dsc_grupo, r.cant_requerida
     , r.cant_separado, r.cant_faltante, nvl(s.stock, 0) as stock, r.stock_requerida, o.numero_op
     , o.saldo_op, c.consumo_anual, c.consumo_mensual, c.frecuencia_meses
     , a.s_act - r.cant_separado as cant_disponible, a.pr_golpez as golpes, a.pr_golpza as cavidades
--      , m.art_cod_art as material, m.consumo_anual_material
     , pl.cod_plancha as maquina
     , a.pr_medpza as ubicacion_art, a.pr_observacion, rb.ribete, an.anillo, fr.aro_fire
  from articul a
       left join op_curso o on a.cod_art = o.cod_art
       left join requerimiento r on a.cod_art = r.cod_art
       left join stock_art s on a.cod_art = s.cod_art
--        left join material m on a.cod_art = m.formu_art_cod_art
       left join ribete rb on a.cod_art = rb.formu_art_cod_art
       left join anillo an on a.cod_art = an.formu_art_cod_art
       left join aro_fire_ring fr on a.cod_art = fr.formu_art_cod_art
       left join vw_articulo_consumo c on a.cod_art = c.cod_art
       left join vw_articulo_grupo g on a.cod_art = g.cod_art
       left join arti_plancha pl on a.cod_art = pl.cod_art
 where cod_lin = '1630';



select tipo_pguia, serie_pguia, numero_pguia, tip_doc_ref
  from kardex_g
 where cod_alm = :NEW.cod_alm
   and tp_transac = :NEW.tp_transac
   and serie = :NEW.serie
   and numero = :NEW.numero;

/*
IF X_WMS = 'TK' THEN X_TIPO_ORDEN:='TK'; END IF;
IF (NVL(X_TIPO_ORDEN,'0') = 'PR') THEN
       IF (F_INGR_PROD_MENOR_A_PROGRAMADO ( X_TIPO_ORDEN, X_SERIE_ORDEN, X_NUMERO_ORDEN, :NEW.CANTIDAD) = 'SI')
       THEN
            RAISE_APPLICATION_ERROR(-20001, :NEW.COD_ART || ' Cant prod: ' || :NEW.CANTIDAD || ' > a la programada OP: '|| X_NUMERO_ORDEN|| '='||(:NEW.COD_ALM ||'-'||:NEW.TP_TRANSAC ||'-'|| :NEW.SERIE ||'-'||:NEW.NUMERO));
END IF;
END IF;
*/

select * from view_oa_cambio_de_piezas;

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero in (
                     592791, 592742, 592407, 592406, 591622, 591620, 591961, 591960, 592339, 592338,
                     592337, 591641, 592811, 591613, 591612, 591611, 592345, 592344, 592579, 592578,
                     592743, 591646, 591645, 592805, 592825, 592834, 592774, 592530, 591922, 591920,
                     592593, 592592, 591373, 592855, 592087, 592085, 592245, 592244, 592007, 592009,
                     592008, 592589, 592159, 592158, 592157, 592840, 592771, 592773, 592876, 591973,
                     591972, 591971, 592012, 592854, 592120, 592119, 592118, 592090, 592089, 592654,
                     603465, 603464, 604014, 603843, 603555, 603554, 603873, 603872, 603707, 603852,
                     603851, 604012, 603952, 603491, 603969, 603594, 603849, 603848, 603912, 603489,
                     603909, 603945, 603985, 603965, 603980, 608990, 609095, 609016, 609038, 609097,
                     611540, 611553, 611452, 611418, 611444, 611563, 612008, 622942, 622943, 622885,
                     622838, 622660, 622735, 622798, 622810, 622809, 622727, 622728, 622726, 622731,
                     622652, 622747, 630062, 630041, 629941, 629975, 630038, 630028, 629937, 629938,
                     629939, 629970, 629971, 630530, 630958, 630959, 635213, 647401, 647196, 647394,
                     647203, 647268, 647307, 647308, 647311, 647312, 647309, 647291, 647391, 647299,
                     647064, 647306, 647302, 647301, 647300, 647430, 647432, 647392, 647128, 647100,
                     647397, 647509, 647145, 647507, 647360, 647363, 647126, 647437, 647444, 647384,
                     647098, 647200, 647201, 647199, 647274, 647197, 647198, 647383, 647381, 647129,
                     647303, 647271, 647376, 647101, 647102, 647518, 647305, 647532, 647333, 647404,
                     647405, 647051, 647515, 647426, 647502, 647147, 647144, 647358, 647329, 647116,
                     647364, 647365, 647195, 647513, 647362, 647118, 647119, 647127, 647361, 647273,
                     647205, 647206, 647503, 647504, 647269, 647099, 647350, 647407, 647409, 647314,
                     647321, 647112, 647204, 647266, 647369, 647440, 647442, 647210, 647247, 647471,
                     647249, 647250, 647410, 647412, 647213, 647255, 647125, 647467, 647469, 647470,
                     647472, 647222, 647214, 647246, 647242, 647244, 647207, 647208, 647243, 647283,
                     647110, 647109, 647389, 647245, 647076, 647218, 647464, 647460, 647192, 647521,
                     647221, 647219, 647061, 647484, 647486, 647488, 647482, 646056, 647474, 647062,
                     647124, 647060, 647476, 647114, 647063, 647475, 647191, 647193, 647194, 648322,
                     648284, 648306, 648314, 648303, 648329, 648275, 648315, 648285, 648288, 648318,
                     648308, 648263, 648317, 648299, 648302, 648307, 648274, 648300, 648319, 648259,
                     648255, 648766, 648793, 648779, 648777, 648784, 648756, 648747, 648763, 648775,
                     648765, 648754, 648796, 648794, 648761, 648792, 648780, 648781, 648757, 648767,
                     648799, 648768, 648800, 648774, 648748, 648797, 648770, 648783, 648760, 648764
   );


select d.*
  from pr_ot o
       join pr_ot_det d
            on o.nuot_tipoot_codigo = d.ot_nuot_tipoot_codigo
              and o.nuot_serie = d.ot_nuot_serie
              and o.numero = d.ot_numero
 where o.nuot_tipoot_codigo = 'PR'
   and o.estado = '1'
   and d.art_cod_art like '%SLIM%';

select *
  from articul
 where cod_art = 'FOR3202';

select *
  from prod_grupo_subgrupo_rel
 where id_grupo = 'G011';

select *
  from prod_subgrupo_linea_rel
 where id_subgrupo in ('S006', 'S025');


select *
  from prod_megagrupo
 where id_megagrupo = 'M002';

select *
  from prod_grupo
 where id_grupo = 'G011';

select *
  from prod_subgrupo
 where id_subgrupo in ('S006', 'S025');

select m.id_megagrupo, g.id_grupo, g.id_subgrupo, l.id_linea
  from prod_megagrupo_grupo_rel m
       join prod_grupo_subgrupo_rel g
            on m.id_megagrupo = g.id_megagrupo
              and m.id_grupo = g.id_grupo
       join prod_subgrupo_linea_rel l
            on g.id_subgrupo = l.id_subgrupo
 where m.id_megagrupo = 'M002'
   and g.id_grupo = 'G011'
 order by id_subgrupo;


select m.id_megagrupo, g.id_grupo, g.id_subgrupo, l.id_linea
  from prod_megagrupo_grupo_rel m
       join prod_grupo_subgrupo_rel g
            on m.id_megagrupo = g.id_megagrupo
              and m.id_grupo = g.id_grupo
       join prod_subgrupo_linea_rel l
            on g.id_subgrupo = l.id_subgrupo
 where m.id_megagrupo = 'M002'
   and g.id_grupo != 'G011'
 order by id_subgrupo;


select *
  from pcmasters
 where cod_art = '41015MLS';

select *
  from pcformulas
 where cod_art = '41015MLS';

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero = 654664;

select *
  from pr_ot_historia
 where nuot_tipoot_codigo = 'PR'
   and numero = 654664;


select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 654664;


select *
  from log_auditoria
 where tabla = 'PR_OT_DET'
   and cod_id_pk = 'PR-654664';

select *
  from pr_for_ins
 where formu_art_cod_art = 'FOR3805'
   and art_cod_art = 'POB 514';


select *
  from pr_formu
 where art_cod_art = 'FOR3805';


select *
  from pr_formu f
 where f.vigencia = 1
   and f.art_cod_art = 'FOR3805';


select f.art_cod_art, f.cantidad, f.almacen, a.descripcion, a.c_pro, f.cod_lin, f.pr_secuencia
  from pr_for_ins f
     , articul a
 where formu_art_cod_art = 'FOR3805'
   and f.art_cod_art = a.cod_art
   and formu_receta = 1
   and art_cod_art = cod_art
   and rtrim(a.flag_cal) is null
   --CONDICION NUEVA DE NO CONSIDERAR EL GRUPO DE SLIM
   --and GET_GRUPO_PIEZA(f.ART_COD_ART) not in ('29')
   and f.art_cod_art not in (
   select distinct cod_servicio
     from lg_precios_servi_limp
   );

select (round((0.0380 * :p_cantidad) / :p_lote, 4))
  from dual;

begin
  p_corrida_previo_02();
end;

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_nuot_serie = 8
   and ot_numero = 650509
   and cant_despachada > 0;

select *
  from planilla10.t_cargo
 where c_cargo like '%ANALISTA%';

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 655386;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero = 655386;

select *
  from planilla10.personal
 where c_codigo in (
                    'E43895', 'E43970', 'E43981', 'E44003'
   );

select *
  from planilla10.t_cargo
 where c_cargo in ('OPAC', 'OPAL');

select *
  from planilla10.t_cargo
 where c_cargo in (
                   'OPK', 'OPAL', 'AALM', 'OIQ', 'COA'
   );


select *
  from almacen
 where cod_alm in (
                   '34', '35', '35', '36', '36', '36', '36', '36', '36', '36', '38', '38', '38'
   )
   and stock > 0;


select *
  from almacenes
 where cod_alm = '32';

select *
  from transacciones_almacen
 where tp_transac in ('03', '05');

select *
  from tablas_auxiliares
 where tipo = '32'
   and codigo in ('03', '05');

select *
  from transacciones_almacen
 where tp_transac in ('16', '19');

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero in (
                     655207, 655208, 655209, 655211, 655212, 656696, 656701, 655227, 655228, 655230,
                     655231, 655232, 655233, 655243, 655244, 656705
   )
   and art_cod_art like 'SER%';