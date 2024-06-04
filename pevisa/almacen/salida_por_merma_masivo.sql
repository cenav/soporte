select *
  from kardex_g
 where cod_alm = '79'
   and tp_transac = '24'
   and serie = 1
   and extract(year from fch_transac) = 2024;

select *
  from kardex_d
 where cod_alm = '79'
   and tp_transac = '24'
   and serie = 1
   and numero = 8527;

select *
  from kardex_g
 where cod_alm = '79'
   and tp_transac = '24'
   and serie = 1
   and numero = 8209;

select *
  from kardex_d
 where cod_alm = '79'
   and tp_transac = '24'
   and serie = 1
   and numero = 8209;

select cod_art, cantidad from tmp_carga_data;

declare
  k_alm constant kardex_g.cod_alm%type       := '79';
  k_tpo constant kardex_g.tp_transac%type    := '24';
  k_ser constant kardex_g.serie%type         := 1;
  k_fch constant kardex_g.fch_transac%type   := to_date('31/05/2024', 'dd/mm/yyyy');
  k_bol constant kardex_g.num_importa%type   := 'BM-2417';
  k_ref constant kardex_d.pr_referencia%type := 'Aprobado por gerencia Alm 79';

  l_nro          kardex_g.numero%type        := 0;
  l_mod          pls_integer                 := 0;
begin
  l_nro := api_numdoc.next_id(k_tpo, k_ser);

  insert into kardex_g ( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref
                       , ser_doc_ref, nro_doc_ref, glosa, tp_relacion, cod_relacion
                       , nro_sucur, cond_pag, nro_lista, moneda, cod_vende, cliente_afecto
                       , por_desc1, por_desc2, motivo, estado, origen, ing_sal, flg_impr
                       , ubicacion, cod_transp, domicilio, ruc_transp, nombre, direccion, ruc
                       , tara_co, tara_bo, tara_ca, placa_transp, le_transp, cant_item
                       , num_importa, tipo_pguia, serie_pguia, numero_pguia, pr_procedencia
                       , pr_numped, nombre_archivo, nombre_archivo_ingreso, texto_1, texto_2
                       , numero_1, numero_2)
  values ( k_alm, k_tpo, k_ser, l_nro, k_fch, null, null, null, null, null, null, null, null, null
         , null, null, null, 0.00, 0.00, '6', '0', 'D', 'S', '0', null, null, null, null, null, null
         , null, null, null, null, null, null, null, k_bol, null, null, null, null, null, null, null
         , null, null, null, null);

  l_mod := l_mod + sql%rowcount;
  dbms_output.put_line('kardex_g ==> ' || l_mod);

  l_mod := 0;
  for r in (select cod_art, cantidad from tmp_carga_data) loop
    insert into kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d
                         , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado
                         , cuenta69, origen, ing_sal, lote, conos, tara, flag, autonum, orden
                         , pr_proveedor, pr_referencia, pr_ordcomp, pr_codpza, pr_valvta
                         , pr_cosfob, pr_canthabi, pr_tipot, pr_numot, pr_numped)
    values ( k_alm, k_tpo, k_ser, l_nro, r.cod_art, r.cantidad, 0.000000, 0.000000
           , k_fch, 0.00, 0.00, 0.000, '0', null, 'D', 'S', null, null, null, null, null
           , null, null, k_ref, null, null, null, null, null, null, null, null);

    l_mod := l_mod + sql%rowcount;
  end loop;

  dbms_output.put_line('kardex_d ==> ' || l_mod);
end;