--::::::::::::::::::::::::::::--
--   3. CAJA NO DISPONIBLE    --
--::::::::::::::::::::::::::::--
-- cambiar a estado 5
select *
  from produccion_armado_cajas
 where cod_caja = 275747;

--::::::::::::::::::::::::::::--
--    Elimina Caja Armado     --
--::::::::::::::::::::::::::::--
select *
  from produccion_armado_cajas_his
 where cod_caja = '275747'
 order by estado;

select *
  from produccion_armado
 where numero_oa = 1032296;

select *
  from produccion_armado_cajas
 where cod_caja = 283179;


select *
  from produccion_armado
 where abrev_ped = 15852;

select *
  from view_prodterm_pedidos
 where pedido = 15692;