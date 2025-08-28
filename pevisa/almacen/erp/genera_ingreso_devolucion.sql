select *
  from numdoc
 where tp_transac = '40'
   and serie = 1;

insert into pevisa.kardex_g
  ( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref, ser_doc_ref, nro_doc_ref, glosa
  , tp_relacion, cod_relacion, nro_sucur, cond_pag, nro_lista, moneda, cod_vende, cliente_afecto
  , por_desc1, por_desc2, motivo, estado, origen, ing_sal, flg_impr, ubicacion, cod_transp
  , domicilio, ruc_transp, nombre, direccion, ruc, tara_co, tara_bo, tara_ca, placa_transp
  , le_transp, cant_item, num_importa, tipo_pguia, serie_pguia, numero_pguia, pr_procedencia
  , pr_numped, nombre_archivo, nombre_archivo_ingreso, texto_1, texto_2, numero_1, numero_2)
values
  ( '03', '40', 1, 12273, date '2025-07-10', 'AR', 3, 1023935, null, null, null, null, null, null
  , null, null, null, 0.00, 0.00, '0', '2', 'P', 'I', '0', null, null, null, null, null, null, null
  , 0.0000, 0.0000, 0.0000, null, null, 0, 'FS 1408-1 GR', 'AR', '3', 1023935, 'ORDPR', null
  , null, null, null, null, null, null);


insert into pevisa.kardex_d
  ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d, costo_s, fch_transac, por_desc1
  , por_desc2, imp_vvb, estado, cuenta69, origen, ing_sal, lote, conos, tara, flag, autonum, orden
  , pr_proveedor, pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob, pr_canthabi, pr_tipot
  , pr_numot, pr_numped)
values
  ( '03', '40', 1, 12273, '1408GR', 15, 0.000000, 0.000000, date '2025-06-20', 0.00, 0.00
  , 0.000, '2', null, 'P', 'I', null, null, null, null, null, null, null, null, null, null, 0.00
  , 0.0000, 0.0000, 'AR', 1023935, null);


insert into pevisa.kardex_g
  ( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref, ser_doc_ref, nro_doc_ref, glosa
  , tp_relacion, cod_relacion, nro_sucur, cond_pag, nro_lista, moneda, cod_vende, cliente_afecto
  , por_desc1, por_desc2, motivo, estado, origen, ing_sal, flg_impr, ubicacion, cod_transp
  , domicilio, ruc_transp, nombre, direccion, ruc, tara_co, tara_bo, tara_ca, placa_transp
  , le_transp, cant_item, num_importa, tipo_pguia, serie_pguia, numero_pguia, pr_procedencia
  , pr_numped, nombre_archivo, nombre_archivo_ingreso, texto_1, texto_2, numero_1, numero_2)
values
  ( '08', '40', 1, 12274, date '2025-07-10', 'AR', 3, 1023935, null, null, null, null, null, null
  , null, null, null, 0.00, 0.00, '0', '2', 'P', 'I', '0', null, null, null, null, null, null, null
  , 0.0000, 0.0000, 0.0000, null, null, 0, 'FS 1408-1 GR', 'AR', '3', 1023935, 'ORDPR', null
  , null, null, null, null, null, null);

insert into pevisa.kardex_d
  ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d, costo_s, fch_transac, por_desc1
  , por_desc2, imp_vvb, estado, cuenta69, origen, ing_sal, lote, conos, tara, flag, autonum, orden
  , pr_proveedor, pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob, pr_canthabi, pr_tipot
  , pr_numot, pr_numped)
values
  ( '08', '40', 1, 12274, 'ETIQ E-02 BL', 15, 0.000000, 0.000000, date '2025-07-10', 0.00, 0.00
  , 0.000, '2', null, 'P', 'I', null, null, null, null, null, null, null, null, null, null, 0.00
  , 0.0000, 0.0000, 'AR', 1023935, null);