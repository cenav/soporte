insert into pevisa.kardex_g
  ( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref
  , ser_doc_ref, nro_doc_ref, glosa, tp_relacion, cod_relacion, nro_sucur
  , cond_pag, nro_lista, moneda, cod_vende, cliente_afecto, por_desc1
  , por_desc2, motivo, estado, origen, ing_sal, flg_impr, ubicacion
  , cod_transp, domicilio, ruc_transp, nombre, direccion, ruc, tara_co
  , tara_bo, tara_ca, placa_transp, le_transp, cant_item, num_importa
  , tipo_pguia, serie_pguia, numero_pguia, pr_procedencia, pr_numped
  , nombre_archivo, nombre_archivo_ingreso, texto_1, texto_2, numero_1
  , numero_2)
values
  ( 'D5', '27', 3, 164307, timestamp '2025-07-16 16:10:46', 'TK', 2, 4876, null, null, null
  , null, null, null, null, null, null, 0.00, 0.00, '0', '2', 'P', 'S', '0', null, null, null
  , null, null, null, null, 0.0000, 0.0000, 0.0000, null, null, 0, 'OP/603977', 'PR', '8'
  , 603977, 'ORDPR', null, null, null, null, null, null, null);


insert into pevisa.kardex_d
  ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d, costo_s, fch_transac, por_desc1
  , por_desc2, imp_vvb, estado, cuenta69, origen, ing_sal, lote, conos, tara, flag, autonum, orden
  , pr_proveedor, pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob, pr_canthabi, pr_tipot
  , pr_numot, pr_numped)
values
  ( 'D5', '27', 3, 164307, 'BH 0.23-230', 365.0000, 0.000000, 0.000000
  , timestamp '2025-07-16 16:10:46', 0.00, 0.00, 0.000, '2', null, 'P', 'S', null, null, null, null
  , null, null, null, null, null, null, 0.00, 0.0000, 0.0000, 'PR', 603977, null);


select *
  from relacion
 where tipodoc = 'PR'
   and numero = 603977;

select *
  from relacion
 where tipodoc_rel = '27'
   and serie_rel = '3'
   and numero_rel = 164307;

select *
  from kardex_d_otros
 where cod_alm = 'D5'
   and tp_transac = '27'
   and serie = 3
   and numero in (164307);