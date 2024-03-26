select * from kardex_g;

select *
  from transacciones_almacen
 where tp_transac in ('28', '15');

select *
  from kardex_g
 where cod_alm = 'F0'
   and tp_transac = '28'
 order by fch_transac desc;

select *
  from kardex_d
 where cod_art = '300.590'
   and tp_transac in ('28', '15');

select *
  from kardex_d
 where tp_transac = '15'
   and cod_alm = 'F0'
   and numero = 1813
 order by fch_transac desc;

select *
  from inventario_fisico_d
 order by fecha desc;

select *
  from numdoc
 where tp_transac = '28'
   and serie = 1;

select *
  from kardex_g
 where tp_transac = '28'
   and serie = 1
   and numero = 995;

select *
  from kardex_d
 where cod_alm = 'F0'
   and tp_transac = '28'
   and serie = 1
   and numero = 995;

insert into pevisa.kardex_g ( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref , ser_doc_ref, nro_doc_ref, glosa, tp_relacion, cod_relacion, nro_sucur , cond_pag, nro_lista, moneda, cod_vende, cliente_afecto, por_desc1 , por_desc2, motivo, estado, origen, ing_sal, flg_impr, ubicacion , cod_transp, domicilio, ruc_transp, nombre, direccion, ruc, tara_co , tara_bo, tara_ca, placa_transp, le_transp, cant_item, num_importa , tipo_pguia, serie_pguia, numero_pguia, pr_procedencia, pr_numped) values ( 'F9', '28', 1, 996, date '2024-03-07', null, null, null, 'AJUSTE', null, null, null, null , 1, 'D', null, null, 0.00, 0.00, '0', '0', 'D', 'S', '0', null, null, '0', null, null, null , null, null, null, null, null, null, 0, 'AJUSTE', null, null, null, null, null);

insert into pevisa.kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado, cuenta69 , origen, ing_sal, lote, conos, tara, flag, autonum, orden, pr_proveedor , pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob , pr_canthabi, pr_tipot, pr_numot, pr_numped) values ( 'F9', '28', 1, 996, 'CVJ 1107-TY', 1.0000, 0.000000, 0.000000, date '2024-03-07' , 0.00, 0.00, 0.000, '0', '690', 'D', 'S', null, null, null, null, null, null, null, 'AJUSTE' , '0', '0', null, null, null, null, null, null);
insert into pevisa.kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado, cuenta69 , origen, ing_sal, lote, conos, tara, flag, autonum, orden, pr_proveedor , pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob , pr_canthabi, pr_tipot, pr_numot, pr_numped) values ( 'F9', '28', 1, 996, 'CVJ 1019-A-HY', 1.0000, 0.000000, 0.000000, date '2024-03-07' , 0.00, 0.00, 0.000, '0', '690', 'D', 'S', null, null, null, null, null, null, null, 'AJUSTE' , '0', '0', null, null, null, null, null, null);
insert into pevisa.kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado, cuenta69 , origen, ing_sal, lote, conos, tara, flag, autonum, orden, pr_proveedor , pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob , pr_canthabi, pr_tipot, pr_numot, pr_numped) values ( 'F9', '28', 1, 996, 'CVJ 1039-SK', 2.0000, 0.000000, 0.000000, date '2024-03-07' , 0.00, 0.00, 0.000, '0', '690', 'D', 'S', null, null, null, null, null, null, null, 'AJUSTE' , '0', '0', null, null, null, null, null, null);

select *
  from kardex_d
 where tp_transac = '15'
   and serie = 1
   and numero between 1824 and 1836;

