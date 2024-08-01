--::::::::::::::::::::::::::::--
--   3. CAJA NO DISPONIBLE    --
--::::::::::::::::::::::::::::--
-- cambiar a estado 5
select *
  from produccion_armado_cajas
 where cod_caja = 1037161;

--::::::::::::::::::::::::::::--
--    Elimina Caja Armado     --
--::::::::::::::::::::::::::::--
select *
  from produccion_armado_cajas_his
 where cod_caja = '315533'
 order by estado;

--::::::::::::::::::::::::::::--
--      Cambia Cantidad       --
--::::::::::::::::::::::::::::--
select *
  from produccion_armado
 where numero_oa = 1046313;

select *
  from produccion_armado_cajas
 where cod_caja = 1045781;

select *
  from produccion_armado_cajas_det
 where cod_caja = 315533;

select id_linea_prod
  from produccion_armado
 where numero_oa = 1042842;