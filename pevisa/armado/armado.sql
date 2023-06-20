select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and numero in (
                  963780, 972088, 963578, 964360, 965275, 963622, 964247, 972324, 964411, 963613,
                  964155, 970177, 964267, 963100, 965101, 970500, 964269, 966703
   );

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'AR'
   and ot_numero = 704793;

select *
  from pr_ot
 where nuot_tipoot_codigo = 7304398;

select *
  from view_oa_cambio_de_piezas
 where numero in (730438, 803387, 809057);

select *
  from pr_ot_cambios_piezas
 where numero in (730438, 803387, 809057)
   and nuot_tipoot_codigo = 'AR';

-- INSERT INTO PEVISA.PR_OT_CAMBIOS_PIEZAS (ID_MOTIVO, NUMERO, NUOT_SERIE, NUOT_TIPOOT_CODIGO, ART_COD_ART, FECHA, USUARIO, IP_USUARIO, DETALLE, RESPUESTA, GLOSA, FECHA_RESPUESTA, CANTIDAD_FALTANTE, CANTIDAD_SOBRANTE, CANTIDAD_DETERIORADA, KARDEX_COD_ALM, KARDEX_TP_TRANSAC, KARDEX_SERIE, KARDEX_NUMERO, PR_NUMERO, PR_NUOT_SERIE, PR_NUOT_TIPOOT_CODIGO, PR_NOMBRE_TRABAJADOR, CALIDAD_USUARIO, CALIDAD_RESPUESTA, CALIDAD_FECHA, KARDEX_COD_ALM_FALLADO, KARDEX_TP_TRANSAC_FALLADO, KARDEX_SERIE_FALLADO, KARDEX_NUMERO_FALLADO, PR_NOMBRE_TRABAJADOR_ALMACEN, PR_COD_TRABAJADOR, PR_COD_TRABAJADOR_ALMACEN) VALUES ('PIEZA DETERIORADA', 809057, '3', 'AR', '54204AGR-HS', TIMESTAMP '2022-02-10 15:59:16', 'AMUNANTE', '10.0.0.134', 'D.D.1', null, 'D.D.1', null, null, null, 1.0000, null, null, null, null, null, '8', 'PR', 'LEVIS', 'ZGUEVARA', 'PASE ACEPTADO', TIMESTAMP '2022-02-10 16:27:32', null, null, null, null, null, null, null);
-- INSERT INTO PEVISA.PR_OT_CAMBIOS_PIEZAS (ID_MOTIVO, NUMERO, NUOT_SERIE, NUOT_TIPOOT_CODIGO, ART_COD_ART, FECHA, USUARIO, IP_USUARIO, DETALLE, RESPUESTA, GLOSA, FECHA_RESPUESTA, CANTIDAD_FALTANTE, CANTIDAD_SOBRANTE, CANTIDAD_DETERIORADA, KARDEX_COD_ALM, KARDEX_TP_TRANSAC, KARDEX_SERIE, KARDEX_NUMERO, PR_NUMERO, PR_NUOT_SERIE, PR_NUOT_TIPOOT_CODIGO, PR_NOMBRE_TRABAJADOR, CALIDAD_USUARIO, CALIDAD_RESPUESTA, CALIDAD_FECHA, KARDEX_COD_ALM_FALLADO, KARDEX_TP_TRANSAC_FALLADO, KARDEX_SERIE_FALLADO, KARDEX_NUMERO_FALLADO, PR_NOMBRE_TRABAJADOR_ALMACEN, PR_COD_TRABAJADOR, PR_COD_TRABAJADOR_ALMACEN) VALUES ('PIEZA DETERIORADA', 803387, '3', 'AR', '70064-CH GR', TIMESTAMP '2022-01-20 11:08:30', 'AMUNANTE', '10.0.0.134', 'D.D.2.1', null, 'D.D.2.1', null, null, null, 2.0000, null, null, null, null, null, '8', 'PR', 'SANDRA', 'JGONZALES', 'PASE ACEPTADO', TIMESTAMP '2022-01-20 11:45:40', null, null, null, null, null, null, null);
-- INSERT INTO PEVISA.PR_OT_CAMBIOS_PIEZAS (ID_MOTIVO, NUMERO, NUOT_SERIE, NUOT_TIPOOT_CODIGO, ART_COD_ART, FECHA, USUARIO, IP_USUARIO, DETALLE, RESPUESTA, GLOSA, FECHA_RESPUESTA, CANTIDAD_FALTANTE, CANTIDAD_SOBRANTE, CANTIDAD_DETERIORADA, KARDEX_COD_ALM, KARDEX_TP_TRANSAC, KARDEX_SERIE, KARDEX_NUMERO, PR_NUMERO, PR_NUOT_SERIE, PR_NUOT_TIPOOT_CODIGO, PR_NOMBRE_TRABAJADOR, CALIDAD_USUARIO, CALIDAD_RESPUESTA, CALIDAD_FECHA, KARDEX_COD_ALM_FALLADO, KARDEX_TP_TRANSAC_FALLADO, KARDEX_SERIE_FALLADO, KARDEX_NUMERO_FALLADO, PR_NOMBRE_TRABAJADOR_ALMACEN, PR_COD_TRABAJADOR, PR_COD_TRABAJADOR_ALMACEN) VALUES ('PIEZA DETERIORADA', 730438, '3', 'AR', 'ME 997357 MLS', TIMESTAMP '2022-01-19 16:09:29', 'AMUNANTE', '10.0.0.134', 'D.D.2.2', null, 'D.D.2.2', null, null, null, 1.0000, null, null, null, null, null, '8', 'PR', 'VERONICA', 'ZGUEVARA', 'PASE ACEPTADO', TIMESTAMP '2022-01-19 16:26:22', null, null, null, null, null, null, null);