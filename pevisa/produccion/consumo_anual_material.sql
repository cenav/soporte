select cod_art, descripcion, cod_lin, cant_requerida, cant_faltante, stock, stock_requerida
     , saldo_op, numero_op, consumo_anual, consumo_mensual, frecuencia_meses, material
  from vw_articulo
 where cod_lin between :linea_del and :linea_al;