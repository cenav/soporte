-- 1245 en cada orden
-- 2280 - 1245 = 1035
select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero in (
                  602985, 602986
   );


-- obtener el correlativo y aumentarlo en 1 para el nuevo ingreso.
-- luego actualizar el correlativo en esta tabla.
select *
  from numdoc
 where tp_transac = '27'
   and serie = 3;

-- ultimo número usado
select *
  from kardex_g
 where tp_transac = '27'
   and serie = 3
 order by fch_transac desc;

-- transaccion donde se envió toda la descarga de almacén
-- que nos servirá como modelo para crear las demás transacciones
-- en otras ordenes
select *
  from kardex_g
 where cod_alm = 'D5'
   and tp_transac = '27'
   and serie = 3
   and numero = 160227;

select *
  from kardex_d
 where cod_alm = 'D5'
   and tp_transac = '27'
   and serie = 3
   and numero = 160227;


-- cambien el número de transacción, número de la orden
insert into pevisa.kardex_g
  ( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref, ser_doc_ref, nro_doc_ref, glosa
  , tp_relacion, cod_relacion, nro_sucur, cond_pag, nro_lista, moneda, cod_vende, cliente_afecto
  , por_desc1, por_desc2, motivo, estado, origen, ing_sal, flg_impr, ubicacion, cod_transp
  , domicilio, ruc_transp, nombre, direccion, ruc, tara_co, tara_bo, tara_ca, placa_transp
  , le_transp, cant_item, num_importa, tipo_pguia, serie_pguia, numero_pguia, pr_procedencia
  , pr_numped, nombre_archivo, nombre_archivo_ingreso, texto_1, texto_2, numero_1, numero_2)
values
  ( 'D5', '27', 3, 160241, timestamp '2025-04-29 08:07:34', 'TK', 2, 2192, null, null, null, null
  , null, null, null, null, null, 0.00, 0.00, '0', '2', 'P', 'S', '0', null, null, null, null, null
  , null, null, 0.0000, 0.0000, 0.0000, null, null, 0, 'OP/602986', 'PR', '8', 602986, 'ORDPR', null
  , null, null, null, null, null, null);


-- cambien el número de transacción, número de la orden, cantidad
insert into pevisa.kardex_d
  ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d, costo_s, fch_transac, por_desc1
  , por_desc2, imp_vvb, estado, cuenta69, origen, ing_sal, lote, conos, tara, flag, autonum, orden
  , pr_proveedor, pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob, pr_canthabi, pr_tipot
  , pr_numot, pr_numped)
values
  ( 'D5', '27', 3, 160241, 'BLAF 0.35-695N-T5', 1035, 0.000000, 0.000000
  , timestamp '2025-04-29 08:07:34', 0.00, 0.00, 0.000, '2', null, 'P', 'S', null, null, null, null
  , null, null, null, null, null, null, 0.00, 0.0000, 0.0000, 'PR', 602986, null);

select *
  from kardex_g
 where cod_alm = 'D2'
   and tp_transac = '16'
   and serie = 3
   and numero = 160200;

select *
  from kardex_d
 where cod_alm = 'D2'
   and tp_transac = '16'
   and serie = 3
   and numero = 160200;

-- cambien el número de transacción, número de la orden
insert into pevisa.kardex_g
  ( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref, ser_doc_ref, nro_doc_ref, glosa
  , tp_relacion, cod_relacion, nro_sucur, cond_pag, nro_lista, moneda, cod_vende, cliente_afecto
  , por_desc1, por_desc2, motivo, estado, origen, ing_sal, flg_impr, ubicacion, cod_transp
  , domicilio, ruc_transp, nombre, direccion, ruc, tara_co, tara_bo, tara_ca, placa_transp
  , le_transp, cant_item, num_importa, tipo_pguia, serie_pguia, numero_pguia, pr_procedencia
  , pr_numped, nombre_archivo, nombre_archivo_ingreso, texto_1, texto_2, numero_1, numero_2)
values
  ( 'D2', '16', 3, 160211, timestamp '2025-04-29 08:07:34', 'TK', 2, 2192, null, null, null, null
  , null, null, null, null, null, 0.00, 0.00, '0', '2', 'P', 'I', '0', null, null, null, null, null
  , null, null, 0.0000, 0.0000, 0.0000, null, null, 0, 'OP/602986', 'PR', '8', 602986, 'ORDPR', null
  , null, null, null, null, null, null);

-- cambien el número de transacción, número de la orden, cantidad
insert into pevisa.kardex_d
  ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d, costo_s, fch_transac, por_desc1
  , por_desc2, imp_vvb, estado, cuenta69, origen, ing_sal, lote, conos, tara, flag, autonum, orden
  , pr_proveedor, pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob, pr_canthabi, pr_tipot
  , pr_numot, pr_numped)
values
  ( 'D2', '16', 3, 160211, 'BLAF 0.35-695N-T5', 1035, 0.000000, 0.000000
  , timestamp '2025-04-29 08:07:34', 0.00, 0.00, 0.000, '2', null, 'P', 'I', null, null, null, null
  , null, null, null, null, null, null, 0.00, 0.0000, 0.0000, 'PR', 602986, null);
