select *
  from tab_lineas
 where linea in ('100', '101');

-- INSERT INTO PEVISA.TAB_LINEAS (LINEA, DESCRIPCION, INDICADOR, TIPO_USER, GRUPO, COD_TITULO, CLASE, TIPO, FACTOR1, FACTOR2, UND, UND2, TP_ART, FACTOR3, LINEA_UNIX, GRUPO_VENTA) VALUES ('100', 'REMATES QUE UNA VEZ ACABADO EL STOCK PASAN A SER OB', 'VO', 'L', 8, null, null, null, 1.000000, 1.000000, 'UND', 'UNIT', 'T', 3.850, 'A0', null);
-- INSERT INTO PEVISA.TAB_LINEAS (LINEA, DESCRIPCION, INDICADOR, TIPO_USER, GRUPO, COD_TITULO, CLASE, TIPO, FACTOR1, FACTOR2, UND, UND2, TP_ART, FACTOR3, LINEA_UNIX, GRUPO_VENTA) VALUES ('101', 'OFERTAS QUE UNA VEZ ACABADO EL STOCK PASAN A SER OB', 'VO', 'L', 8, null, null, null, 1.000000, 1.000000, null, null, 'T', 3.850, 'A1', null);

select d.cod_alm, d.cod_art
     , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
 where d.estado <> '9'
   and d.cod_art = :p_articulo
--    and trunc(d.fch_transac) <= to_date('31/08/2024', 'dd/mm/yyyy')
 group by d.cod_alm, d.cod_art;