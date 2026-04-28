--::::::::::::::::::::::::::::--
--   3. CAJA NO DISPONIBLE    --
--::::::::::::::::::::::::::::--
-- cambiar a estado 5
select *
  from produccion_armado_cajas
 where cod_caja = 470618;

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
 where cod_caja = '470618'
 order by estado;

--::::::::::::::::::::::::::::--
--      Cambia Cantidad       --
--::::::::::::::::::::::::::::--
select *
  from produccion_armado
 where numero_oa = 1158714;

select *
  from produccion_armado_cajas
 where cod_caja = 1045781;

select *
  from produccion_armado_cajas_det
 where cod_caja = 315533;

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
 where cod_caja in (470618, 455851);

