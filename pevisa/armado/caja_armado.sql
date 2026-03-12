--::::::::::::::::::::::::::::--
--   3. CAJA NO DISPONIBLE    --
--::::::::::::::::::::::::::::--
-- cambiar a estado 5
select *
  from produccion_armado_cajas
 where cod_caja = 1103660;

--::::::::::::::::::::::::::::--
--    Elimina Caja Armado     --
--::::::::::::::::::::::::::::--
select *
  from produccion_armado_cajas_his
 where cod_caja = '1093630'
 order by estado;

--::::::::::::::::::::::::::::--
--      Cambia Cantidad       --
--::::::::::::::::::::::::::::--
select *
  from produccion_armado
 where numero_oa = 1151649;

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

select *
  from produccion_armado_his
 where numero_oa = 1136026;

select sysdate from dual;