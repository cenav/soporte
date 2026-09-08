--::::::::::::::::::::::::::::--
--   3. CAJA NO DISPONIBLE    --
--::::::::::::::::::::::::::::--
-- cambiar a estado 5
select *
  from produccion_armado_cajas
 where cod_caja = 497475;

-- ESTADOS

-- IF X_ESTADO = 1 THEN
-- 		:PRODUCCION_ARMADO_CAJAS.X_ESTADO := 'ABIERTA';
-- SET_ITEM_PROPERTY('PRODUCCION_ARMADO_CAJAS.X_ESTADO', VISUAL_ATTRIBUTE, 'PRODUCCION');
-- ELSIF X_ESTADO = 2 THEN
-- 		:PRODUCCION_ARMADO_CAJAS.X_ESTADO := 'CERRADA';
-- SET_ITEM_PROPERTY('PRODUCCION_ARMADO_CAJAS.X_ESTADO', VISUAL_ATTRIBUTE, 'TERMINADO');
-- ELSIF X_ESTADO = 3 THEN
-- 		:PRODUCCION_ARMADO_CAJAS.X_ESTADO := 'OBSERVADA';
-- SET_ITEM_PROPERTY('PRODUCCION_ARMADO_CAJAS.X_ESTADO', VISUAL_ATTRIBUTE, 'OBSERVADO');
-- ELSIF X_ESTADO = 4 THEN
-- 		:PRODUCCION_ARMADO_CAJAS.X_ESTADO := 'REVISADA';
-- SET_ITEM_PROPERTY('PRODUCCION_ARMADO_CAJAS.X_ESTADO', VISUAL_ATTRIBUTE, 'REVISADO');
-- ELSIF X_ESTADO = 5 THEN
-- 		:PRODUCCION_ARMADO_CAJAS.X_ESTADO := 'PESADA';
-- SET_ITEM_PROPERTY('PRODUCCION_ARMADO_CAJAS.X_ESTADO', VISUAL_ATTRIBUTE, 'PESADO');
-- END IF;

--::::::::::::::::::::::::::::--
--    Elimina Caja Armado     --
--::::::::::::::::::::::::::::--
select *
  from produccion_armado_cajas_his
 where cod_caja = '497475'
 order by estado;

--::::::::::::::::::::::::::::--
--      Cambia Cantidad       --
--::::::::::::::::::::::::::::--
select *
  from produccion_armado
 where numero_oa = 1160367;

select *
  from produccion_armado_cajas
 where cod_caja = 467651;

select *
  from produccion_armado_cajas_det
 where cod_caja = 469290
   and numero_oa = 1164107;

--:::::::::::::::::::::::::::::::::::::::--
--  Consulta Orden Armado Pestaña Cajas  --
--:::::::::::::::::::::::::::::::::::::::--
select *
  from produccion_armado_log
 where cod_caja = 469290
   and numero_oa = 1164107;

select *
  from produccion_armado_log
 where numero_oa = 1160367
 order by item;

-- INSERT INTO PEVISA.PRODUCCION_ARMADO_LOG (NUMERO_OA, ITEM, FECHA, ID_RESPONSABLE, FORMU_ART_COD_ART, CANTIDAD, COD_CAJA, ID_LINEA_PROD) VALUES (1160367, 4, TIMESTAMP '2026-07-03 16:22:34', 'UARMADO', 'FS 95066 TG', 11, 488612, '07');

select id_linea_prod
  from produccion_armado
 where numero_oa = 1042842;

select *
  from produccion_armado_rev
 where cod_caja = 459570;

select *
  from produccion_armado_cajas_det
 where cod_caja = 459570;

select sysdate from dual;

--
select *
  from produccion_armado_cajas
 where cod_caja in (467651)
   and estado in (2, 3, 4, 5);


select distinct decode(substr(dato_agrupa, 1, 1), '2', 'LIMA', p.abrev_cli), dato_agrupa
  from produccion_armado_log l
     , produccion_armado p
 where l.numero_oa = p.numero_oa
   and cod_caja = 467651;

-- 471512 -> 1771339 -> 467684

select *
  from produccion_armado_log
 where cod_caja = 467651;

select *
  from produccion_armado
 where numero_oa = 1190017;


select *
  from produccion_armado p
 where id_linea_prod = '04'
   and nvl(p.estado, 0) in (0, 1, 2, 3, 4, 6)
   and exists(
   select *
     from pr_ot o
    where o.nuot_tipoot_codigo = 'AR'
      and o.numero = p.numero_oa
      and o.estado = '4'
   );


select *
  from produccion_armado
 where numero_oa in (
                     1128627, 1140096, 1140869, 1145057, 1147330, 1147397, 1147434, 1167155,
                     1168681, 1169022, 1170048, 1170202, 1174239, 1178386, 1181570, 1181571,
                     1185660, 1186258, 1189485, 1190004, 1190006, 1190011, 1190013, 1190015,
                     1190017, 1190019, 1190208
   )
 order by numero_oa;

select *
  from produccion_armado
 where numero_oa = 1175933;


-- INSERT INTO PEVISA.PRODUCCION_ARMADO_CAJAS_HIS (COD_CAJA, ESTADO, FECHA, OBSERVACION, USUARIO, LINEA_PROD, NUMERO_OA) VALUES (497475, '0', TIMESTAMP '2026-07-31 16:23:56', 'CAJA CREADA EN ETIQUETADO', 'DSALDANA', null, null);
-- INSERT INTO PEVISA.PRODUCCION_ARMADO_CAJAS_HIS (COD_CAJA, ESTADO, FECHA, OBSERVACION, USUARIO, LINEA_PROD, NUMERO_OA) VALUES (497475, '1', TIMESTAMP '2026-08-18 17:03:08', 'CAJA ABIERTA EN PRODUCCIÓN.', 'UARMADO', '05', 1186074);
-- INSERT INTO PEVISA.PRODUCCION_ARMADO_CAJAS_HIS (COD_CAJA, ESTADO, FECHA, OBSERVACION, USUARIO, LINEA_PROD, NUMERO_OA) VALUES (497475, '2', TIMESTAMP '2026-08-18 17:03:32', 'CAJA CERRADA EN PRODUCCIÓN.', 'UARMADO', '05', 1186074);
-- INSERT INTO PEVISA.PRODUCCION_ARMADO_CAJAS_HIS (COD_CAJA, ESTADO, FECHA, OBSERVACION, USUARIO, LINEA_PROD, NUMERO_OA) VALUES (497475, '4', TIMESTAMP '2026-08-24 16:05:17', 'CAJA REVISADA CORRECTAMENTE', 'UINSPECCION', 'IN', null);
-- INSERT INTO PEVISA.PRODUCCION_ARMADO_CAJAS_HIS (COD_CAJA, ESTADO, FECHA, OBSERVACION, USUARIO, LINEA_PROD, NUMERO_OA) VALUES (497475, '5', TIMESTAMP '2026-08-24 16:05:18', 'CAJA PESADA:10.7', 'UINSPECCION', null, null);
-- INSERT INTO PEVISA.PRODUCCION_ARMADO_CAJAS_HIS (COD_CAJA, ESTADO, FECHA, OBSERVACION, USUARIO, LINEA_PROD, NUMERO_OA) VALUES (497475, '6', TIMESTAMP '2026-08-25 18:45:02', 'CAJA INSERTADA EN PALETA: 18188', 'JPRADO', null, null);

