select *
  from kardex_g
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 91
   and numero = 298;

select *
  from kardex_d
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 91
   and numero = 298;


insert into pevisa.kardex_g ( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref
                            , ser_doc_ref, nro_doc_ref, glosa, tp_relacion, cod_relacion, nro_sucur
                            , cond_pag, nro_lista, moneda, cod_vende, cliente_afecto, por_desc1
                            , por_desc2, motivo, estado, origen, ing_sal, flg_impr, ubicacion
                            , cod_transp, domicilio, ruc_transp, nombre, direccion, ruc, tara_co
                            , tara_bo, tara_ca, placa_transp, le_transp, cant_item, num_importa
                            , tipo_pguia, serie_pguia, numero_pguia, pr_procedencia, pr_numped)
values ( 'F0', '21', 91, 298, date '2023-05-16', 'P2', 20, 2487, null, 'C', '00000990019', null
       , '16', 1, 'D', '27', 'N', 0.00, 0.00, '1', '3', 'P', 'S', '0', '003', '20110964928'
       , 'AV. ELMER FAUCETT 3350 CALLAO.', '20110964928', 'GEOROCK SPA'
       , 'EVARISTO LILLO 78 71-72 LAS CONDES', '00000990019', null, null, null, '01', '01', null
       , null, '01', 'F054', 1, null, null);

insert into pevisa.kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d
                            , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado, cuenta69
                            , origen, ing_sal, lote, conos, tara, flag, autonum, orden, pr_proveedor
                            , pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
                            , pr_canthabi, pr_tipot, pr_numot, pr_numped)
values ( 'F0', '21', 91, 298, '0414799031', 8.0000, 0.000000, 0.000000, date '2023-05-16', 0.00
       , 0.00, 5063.520, '6', null, 'P', 'S', null, null, 0.00, null, null, null, null, null, null
       , null, null, null, null, null, null, null);

select *
  from almacen
 where cod_art = '0414799031';

select *
  from pedido_flujo
 where numero_kardex is not null;

select *
  from pedido_flujo
 where serie_kardex = 91
   and numero_kardex = 298;

select *
  from vendedores
 where cod_vendedor = '42';