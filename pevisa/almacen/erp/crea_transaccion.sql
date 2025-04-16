select *
  from kardex_g
 where cod_alm = '48'
   and tp_transac = '43'
   and serie = 1
   and numero = 45;


select *
  from kardex_d
 where cod_alm = '48'
   and tp_transac = '43'
   and serie = 1
   and numero = 45
   and cod_art = '180.1381NA';

select *
  from kardex_d
 where cod_alm = '48'
   and tp_transac = '43'
   and serie = 1
   and numero = 54;

select *
  from numdoc
 where tp_transac = '43'
   and serie = 1;

select *
  from embarques_d
 where numero_embarque = 5119
   and cod_art = 'AT-B-GM-070-HS MLS';


-- insert into pevisa.kardex_g
--   ( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref, ser_doc_ref, nro_doc_ref, glosa
--   , tp_relacion, cod_relacion, nro_sucur, cond_pag, nro_lista, moneda, cod_vende, cliente_afecto
--   , por_desc1, por_desc2, motivo, estado, origen, ing_sal, flg_impr, ubicacion, cod_transp
--   , domicilio, ruc_transp, nombre, direccion, ruc, tara_co, tara_bo, tara_ca, placa_transp
--   , le_transp, cant_item, num_importa, tipo_pguia, serie_pguia, numero_pguia, pr_procedencia
--   , pr_numped, nombre_archivo, nombre_archivo_ingreso, texto_1, texto_2, numero_1, numero_2)
-- values
--   ( '48', '43', 1, 55, timestamp '2025-03-17 17:51:33', null, null, 575, '5119', null, null, null
--   , null, 1, null, null, null, 0.00, 0.00, '0', '0', 'D', 'I', '0', null, null, null
--   , null, null, null, null, 0.0000, 0.0000, 0.0000, null, null, 0, 'T600', null, null, 0, 'PVR24004'
--   , 0, null, null, null, null, null, null);
--

insert into pevisa.kardex_d
  ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d, costo_s, fch_transac, por_desc1
  , por_desc2, imp_vvb, estado, cuenta69, origen, ing_sal, lote, conos, tara, flag, autonum, orden
  , pr_proveedor, pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob, pr_canthabi, pr_tipot
  , pr_numot, pr_numped)
values
  ( '48', '43', 1, 54, 'AT-B-GM-070-HS MLS', 50.0000, 0.000000, 0.000000, timestamp '2025-03-17 17:51:33'
  , 0.00, 0.00, 0.000, '0', '6910101', 'D', 'I', null, null, null, null, null, null, null
  , 'AT-B-GM-070-HS MLS', null, null, 0.00, 0.0000, 0.0000, null, null, 0);