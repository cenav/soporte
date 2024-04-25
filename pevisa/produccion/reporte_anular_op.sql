-- reporte anular op
select cod_art, cod_lin, dsc_grupo, cant_requerida, consumo_mensual, consumo_anual, stock, saldo_op
     , numero_op
  from vw_articulo
 where cod_lin != 'ZZ';

