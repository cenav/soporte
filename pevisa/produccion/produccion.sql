select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero in (
   584491
   );

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero in (
   582308
   );

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
   and numero = 573591
 order by fecha desc;


select * from pr_variables;

select *
  from kardex_d d
 where exists(
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
 where nuot_tipoot_codigo = 'AR'
   and numero in (
                  1018054, 1018055, 1018064, 1018066, 1018067, 1018062, 1018069, 1018070, 1018074,
                  1018080, 1018186, 1018206, 1018192, 1018193, 1018194, 1018195, 1018197, 1018199,
                  1018201, 1018204, 1018209, 1018208, 1018732, 1018737, 1018738, 1018741, 1018877,
                  1018185, 1018870, 1018744, 1018745, 1018742, 1018746, 1018748, 1018751, 1018755,
                  1018411, 1018760, 1019458, 1018864, 1018868, 1018879, 1018875, 1018882, 1018885,
                  1019357, 1019200, 1019354, 1019358, 1019359, 1019196, 1019367, 1019382, 1019379,
                  1019456, 1018346, 1019455, 1017896, 1017885, 1019134, 1017994, 1017903, 1019479,
                  1017897, 1017991, 1018006, 1018507, 1017997, 1018642, 1018015, 1017992, 1018005,
                  1018504, 1018498, 1018522, 1018635, 1018637, 1019285, 1018536, 1019297, 1019305,
                  1017923, 1019295, 1017943, 1019296, 1018541, 1018410, 1018421, 1018535, 1019202,
                  1017928, 1017934, 1019070, 1018405, 1018811, 1019206, 1018537, 1018166, 1018184,
                  1018590, 1018592, 1018721, 1018722, 1018840, 1018841, 1018348, 1018350, 1018172,
                  1018959, 1018972, 1017600, 1018012, 1018343, 1019026, 1019220, 1019221, 1019219,
                  1019218, 1018086, 1019243, 1019242, 1018803, 1018802, 1019320, 1019321, 1018087,
                  1019338, 1019340, 1018655, 1019345, 1018444, 1019424, 1017947, 1018570, 1019439,
                  1019447, 1018698, 1018900, 1018115, 1018097, 1018713, 1018712, 1017661, 1019312,
                  1018553, 1018114, 1018837, 1019397, 1018652, 1017761, 1018961, 1017771, 1017773,
                  1017776, 1018020, 1017851, 1017852, 1018028, 1017861, 1017862, 1019388, 1017872,
                  1018563, 1018564, 1017876, 1019117, 1017880, 1017881, 1017951, 1017962, 1018032,
                  1018796, 1018053, 1018470, 1018472, 1018853, 1018703, 1019417, 1018604, 1018692,
                  1018614, 1019112, 1017679, 1017818, 1019144, 1019249, 1018390, 1019262, 1019053,
                  1017974, 1018991, 1019343, 1017783, 1017785, 1019442, 1017789, 1018929, 1019331,
                  1017814, 1018819, 1019434, 1019043, 1017768, 1017659, 1018484, 1018824, 1018481,
                  1019280, 1017973, 1018363, 1019263, 1017820, 1018058, 1018207, 1018880, 1018871,
                  1019356, 1019463, 1019360, 1018749, 1017837, 1018750, 1019012, 1017989, 1019185,
                  1018516, 1019167, 1018789, 1019178, 1019290, 1018157, 1017940, 1018776, 1019091,
                  1017586, 1019210, 1018092, 1017609, 1019016, 1017662, 1017664, 1018726, 1018769,
                  1017749, 1017751, 1018846, 1019406, 1018779, 1019683, 1019413, 1018034, 1017688,
                  1018019, 1018675, 1018050, 1018042, 1018030, 1018480, 1018558, 1018441, 1018809,
                  1018855, 1018988, 1019228, 1017647, 1017960, 1017770, 1017815, 1018823, 1017727,
                  1018372, 1017799, 1018938, 1018939, 1018387, 1019353, 1017638, 1018945, 1018948,
                  1018367, 1017745, 1018149
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
   and not exists
   (
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
   and exists(
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
 where exists(
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
 where exists(
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
 where exists(
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