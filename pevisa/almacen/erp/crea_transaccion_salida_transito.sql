select *
  from kardex_g
 where cod_alm = '72'
   and tp_transac = '10'
   and serie = 141
   and numero = 1427;

select *
  from kardex_d
 where cod_alm = '72'
   and tp_transac = '10'
   and serie = 141
   and numero = 1427;


declare
  k_alm constant kardex_g.tp_transac%type  := '72';
  k_trx constant kardex_g.tp_transac%type  := '35';
  k_ser constant kardex_g.serie%type       := 141;
  k_fch constant kardex_g.fch_transac%type := date '2026-04-24';
  l_nro          kardex_g.numero%type;
  l_i_s          kardex_g.ing_sal%type;
begin
  l_nro := api_kardex_g.next_numero(k_trx, k_ser);
  l_i_s := api_transacciones_almacen.onerow(k_trx).ingreso_salida;

  insert into pevisa.kardex_g
    ( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref, ser_doc_ref, nro_doc_ref, glosa
    , tp_relacion, cod_relacion, nro_sucur, cond_pag, nro_lista, moneda, cod_vende, cliente_afecto
    , por_desc1, por_desc2, motivo, estado, origen, ing_sal, flg_impr, ubicacion, cod_transp
    , domicilio, ruc_transp, nombre, direccion, ruc, tara_co, tara_bo, tara_ca, placa_transp
    , le_transp, cant_item, num_importa, tipo_pguia, serie_pguia, numero_pguia, pr_procedencia
    , pr_numped, nombre_archivo, nombre_archivo_ingreso, texto_1, texto_2, numero_1, numero_2)
  values
    ( k_alm, k_trx, k_ser, l_nro, k_fch, '35', 141, 1427, 'PIEZAS', 'C', '20100084768', '05'
    , null, 1, 'D', '30', null, 0.00, 0.00, '6', '3', '*', l_i_s, '0', null, null, null, null
    , 'PEVISA AUTO PARTS S.A.C.', null, null, null, null, null, null, null, 0, 'BS2404', null
    , null, null, 'SOLIMAT', null, null, null, null, null, null, null);

  insert into pevisa.kardex_d
    ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d, costo_s, fch_transac
    , por_desc1, por_desc2, imp_vvb, estado, cuenta69, origen, ing_sal, lote, conos, tara, flag
    , autonum, orden, pr_proveedor, pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
    , pr_canthabi, pr_tipot, pr_numot, pr_numped)
  values
    ( k_alm, k_trx, k_ser, l_nro, 'PL 1535-1', 1190.0000, 0.000000, 0.000000, k_fch, 0.00
    , 0.00, 0.000, '6', null, '*', l_i_s, null, null, null, null, null, null, null, null
    , null, null, null, null, 1190.0000, null, null, null);
end;