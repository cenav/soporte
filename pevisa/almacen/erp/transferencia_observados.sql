-- Transferencia observados
declare
  k_trx_sal constant kardex_g.tp_transac%type := '27';
  k_ser_sal constant kardex_g.serie%type      := 1;

  k_trx_ing constant kardex_g.tp_transac%type := '16';
  k_ser_ing constant kardex_g.serie%type      := 1;

  k_alm_obs constant kardex_g.tp_transac%type := '48';

  k_fch     constant date                     := trunc(sysdate);

  l_nro_sal          kardex_g.numero%type;
  l_nro_ing          kardex_g.numero%type;
begin
  for r in (
    select vw.cod_alm, vw.descripcion
      from tmp_carga_data vw
     group by vw.cod_alm, vw.descripcion
     order by vw.cod_alm
    )
  loop
    l_nro_sal := api_kardex_g.next_numero(k_trx_sal, k_ser_sal);
    l_nro_ing := api_kardex_g.next_numero(k_trx_ing, k_ser_ing);

    dbms_output.put_line(r.cod_alm || '-' || k_trx_sal || '-' || k_ser_sal || '-' || l_nro_sal);
    dbms_output.put_line(k_alm_obs || '-' || k_trx_ing || '-' || k_ser_ing || '-' || l_nro_ing);

    ------------
    -- SALIDA --
    ------------
    insert into kardex_g
      ( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref, ser_doc_ref, nro_doc_ref
      , glosa, tp_relacion, cod_relacion, nro_sucur, cond_pag, nro_lista, moneda, cod_vende
      , cliente_afecto, por_desc1, por_desc2, motivo, estado, origen, ing_sal, flg_impr, ubicacion
      , cod_transp, domicilio, ruc_transp, nombre, direccion, ruc, tara_co, tara_bo, tara_ca
      , placa_transp, le_transp, cant_item, num_importa, tipo_pguia, serie_pguia, numero_pguia
      , pr_procedencia, pr_numped, nombre_archivo, nombre_archivo_ingreso, texto_1, texto_2
      , numero_1, numero_2)
    values
      ( r.cod_alm, k_trx_sal, k_ser_sal, l_nro_sal, k_fch, null, null, null
      , k_alm_obs || '-' || k_trx_ing || '-' || k_ser_ing || '-' || l_nro_ing, null, null, null
      , null, 1, null, null, null, 0, 0, '1', '0', 'D', 'S', '0', null, null, null, null, null, null
      , null, 0, 0, 0, null, null, 0, substr('OSBERVADOS', 1, 15), null, null, null, null
      , 0 /*----*/ , null, null, null, null
      , 0, 0);

    dbms_output.put_line(sql%rowcount);
    -------------
    -- INGRESO --
    -------------
    insert into kardex_g
      ( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref, ser_doc_ref, nro_doc_ref
      , glosa, tp_relacion, cod_relacion, nro_sucur, cond_pag, nro_lista, moneda, cod_vende
      , cliente_afecto, por_desc1, por_desc2, motivo, estado, origen, ing_sal, flg_impr, ubicacion
      , cod_transp, domicilio, ruc_transp, nombre, direccion, ruc, tara_co, tara_bo, tara_ca
      , placa_transp, le_transp, cant_item, num_importa, tipo_pguia, serie_pguia, numero_pguia
      , pr_procedencia, pr_numped, nombre_archivo, nombre_archivo_ingreso, texto_1, texto_2
      , numero_1, numero_2)
    values
      ( k_alm_obs, k_trx_ing, k_ser_ing, l_nro_ing, k_fch, null, null, null
      , r.cod_alm || '-' || k_trx_sal || '-' || k_ser_sal || '-' || l_nro_sal, null, null, null
      , null, 1, null, null, null, 0, 0, '0', '0', 'D', 'I', '0', null, null, null, null, null, null
      , null, 0, 0, 0, null, null, 0, substr('OSERVADOS', 1, 15), null, null, null, null, 0, null
      , null, null, null, 0, 0);

    dbms_output.put_line(sql%rowcount);

    for rs in (
      select vw.cod_alm, vw.descripcion, vw.cod_art, vw.stock
        from tmp_carga_data vw
       where vw.cod_alm = r.cod_alm
       order by vw.cod_alm, vw.stock desc
      )
    loop
      ------------
      -- SALIDA --
      ------------
      insert into kardex_d
        ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d, costo_s, fch_transac
        , por_desc1, por_desc2, imp_vvb, estado, cuenta69, origen, ing_sal, lote, conos, tara, flag
        , autonum, orden, pr_proveedor, pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
        , pr_canthabi, pr_tipot, pr_numot, pr_numped)
      values
        ( r.cod_alm, k_trx_sal, k_ser_sal, l_nro_sal, rs.cod_art, rs.stock, 0, 0, k_fch, 0
        , 0, 0, '0', '6910101', 'D', 'S', null, null, null, null, null, null, null
        , substr(k_alm_obs, 1, 30), null, null, 0, 0, 0, null, null, 0);
    end loop;

    dbms_output.put_line(sql%rowcount);

    for ri in (
      select vw.cod_alm, vw.descripcion, vw.cod_art, vw.stock
        from tmp_carga_data vw
       where vw.cod_alm = r.cod_alm
       order by vw.cod_alm, vw.stock desc
      )
    loop
      -------------
      -- INGRESO --
      -------------
      insert into kardex_d
        ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d, costo_s, fch_transac
        , por_desc1, por_desc2, imp_vvb, estado, cuenta69, origen, ing_sal, lote, conos, tara, flag
        , autonum, orden, pr_proveedor, pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
        , pr_canthabi, pr_tipot, pr_numot, pr_numped)
      values
        ( k_alm_obs, k_trx_ing, k_ser_ing, l_nro_ing, ri.cod_art, ri.stock, 0, 0, k_fch
        , 0, 0, 0, '0', '6910101', 'D', 'I', null, null, null, null, null, null, null
        , r.cod_alm, null, null, 0, 0, 0, null, null, 0);
    end loop;

    dbms_output.put_line(sql%rowcount);
  end loop;
end;