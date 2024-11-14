-- si no existe en articul_pev pero sí en articul_mis
insert into articul_pev ( cod_art, linea, indicador, cod_unx, cod_planta, clase, tp, descripcion
                        , und, precio, visible, grupo, tipo, tipo_mov, usuario, indicador2
                        , fecha_crea, fecha_actu, dscto, oferta, stock, epend, ppend, uvta, pvta
                        , categoria, pedido, nuevo, stk_max, pedido_urg, ependmes, ependsig, nro_doc
                        , cuenta, partida, tipo_expo, aplica_exp, descri_cos, lin_sis, cod_fam, cant
                        , cprom, ulcosol, ulcodol, ulfecom, fob, cif, cder, id, precio2, neto
                        , consulta, prov, stock_cal, ppend_cal, flag_pedir, demora, descri_expo
                        , und_expo, marca, descripcion_expo, descripcion_expo_ingles)
select cod_art, linea, indicador, cod_unx, cod_base, 'MIS', 'PT', null, 'UND', precio, visible
     , grupo, tipo, tipo_mov, usuario, indicador2, fecha_crea, fecha_actu, dscto, oferta, stock
     , epend, ppend, uvta, pvta, 'D', 0, nuevo, stk_max, pedido_urg, ependmes, ependsig, null, null
     , null, null, null, dsunat, 0, 0, 0, 0, 0, 0, null, 0, 0, 0, null, precio2, neto, consulta
     , null, stock_cal, ppend_cal, null, 0, null, null, marca, descripcion_expo
     , descripcion_expo_ingles
  from articul_mis
 where cod_art = 'S4 55DH-H5-B';