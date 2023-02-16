-- Un fvaor bajame un listado de los pedidos con nombre de cliente,
-- monto, y fecha de colocación con días de atraso xfa
-- Para vr los más antiguos
-- reporte pedidos pendientes
select cod_cliente, nombre, fch_pedido, trunc(sysdate - fch_pedido) as dias_retraso, pedido
     , pedido_item, valor, numero as nro_ot, fecha as fch_ot, cant_prog
     , formu_art_cod_art as cod_jgo, art_cod_art as cod_pza, cant_formula, rendimiento, cod_lin
     , stock
  from vw_ordenes_pedido_pendiente
 order by fch_pedido;