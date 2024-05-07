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
 where cod_caja = '275747'
 order by estado;

--::::::::::::::::::::::::::::--
--      Cambia Cantidad       --
--::::::::::::::::::::::::::::--
select *
  from produccion_armado
 where numero_oa = 1042842;

select *
  from produccion_armado_cajas
 where cod_caja = 317085;

select *
  from produccion_armado
 where abrev_ped = 15852;

select cod_local, descripcion, estado, direccion
  from locales;