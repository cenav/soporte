-- Transferencia por cambio de codigo
declare
  k_trx_sal constant kardex_g.tp_transac%type := '51';
  k_ser_sal constant kardex_g.serie%type      := 1;

  k_trx_ing constant kardex_g.tp_transac%type := '08';
  k_ser_ing constant kardex_g.serie%type      := 1;

  k_fch     constant date                     := trunc(sysdate);

  l_nro_sal          kardex_g.numero%type;
  l_nro_ing          kardex_g.numero%type;
begin
  for r in (
    select distinct a.cod_alm
      from almacen a
           join tmp_carga_data t on a.cod_art = t.cod_art
     where a.stock > 0
     order by a.cod_alm
    )
  loop
    l_nro_sal := api_kardex_g.next_numero(k_trx_sal, k_ser_sal);
    l_nro_ing := api_kardex_g.next_numero(k_trx_ing, k_ser_ing);

    dbms_output.put_line(r.cod_alm || '-' || k_trx_sal || '-' || k_ser_sal || '-' || l_nro_sal);
    dbms_output.put_line(r.cod_alm || '-' || k_trx_ing || '-' || k_ser_ing || '-' || l_nro_ing);

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
      , 'TRANSFERENCIA CAMBIO CODIGO', null, null, null, null, 1, null, null, null, 0, 0, '1', '0'
      , 'D', 'S', '0', null, null, null, null, null, null, null, 0, 0, 0, null, null, 0
      , substr('TRANSFERENCIA', 1, 15), null, null, null, null, 0 /*----*/ , null, null, null, null
      , 0, 0);

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
      ( r.cod_alm, k_trx_ing, k_ser_ing, l_nro_ing, k_fch, null, null, null
      , 'TRANSFERENCIA CAMBIO CODIGO', null, null, null, null, 1, null, null, null, 0, 0, '0', '0'
      , 'D', 'I', '0', null, null, null, null, null, null, null, 0, 0, 0, null, null, 0
      , substr('TRANFERENCIA', 1, 15), null, null, null, null, 0, null, null, null, null, 0, 0);

    for rs in (
      select a.cod_art, a.stock, t.cod_activo_fijo as cod_cambio
        from almacen a
             join tmp_carga_data t on a.cod_art = t.cod_art
       where a.stock > 0
         and a.cod_alm = r.cod_alm
       order by a.cod_art, a.cod_alm
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
        , substr(rs.cod_cambio, 1, 30), null, null, 0, 0, 0, null, null, 0);
    end loop;


    for ri in (
      select t.cod_activo_fijo as cod_cambio, sum(a.stock) as stock
           , listagg(a.cod_art, '|') within group (order by a.cod_art) as cod_art
        from almacen a
             join tmp_carga_data t on a.cod_art = t.cod_art
       where a.stock > 0
         and a.cod_alm = r.cod_alm
       group by t.cod_activo_fijo
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
        ( r.cod_alm, k_trx_ing, k_ser_ing, l_nro_ing, ri.cod_cambio, ri.stock, 0, 0, k_fch
        , 0, 0, 0, '0', '6910101', 'D', 'I', null, null, null, null, null, null, null
        , ri.cod_art, null, null, 0, 0, 0, null, null, 0);
    end loop;
  end loop;
end;

select a.cod_art, a.cod_alm, a.stock
  from almacen a
 where a.cod_art in ('PEV 090.385')
   and stock > 0
 order by a.cod_art, a.cod_alm;

-- stock 06 -> 465.0000
select a.cod_art, a.cod_alm, a.stock
  from almacen a
 where a.cod_art in ('PEV 115.385')
   and stock > 0
 order by a.cod_art, a.cod_alm;

select a.cod_art, a.cod_alm, a.stock
  from almacen a
 where a.cod_art in ('PEV 115.385', 'DUR 090.385')
 order by a.cod_art, a.cod_alm;

select *
  from transacciones_almacen
 where tp_transac in ('51', '08');


select distinct cod_alm
  from almacen
 where cod_art in ('PEV 090.385', 'DUR 090.385')
   and stock > 0
 order by cod_alm;


select a.cod_art, a.stock, t.cod_activo_fijo as cod_cambio
  from almacen a
       join tmp_carga_data t on a.cod_art = t.cod_art
 where a.cod_art in ('PEV 090.385', 'DUR 090.385')
   and a.stock > 0
   and a.cod_alm = '06'
 order by a.cod_art, a.cod_alm;


select cod_art, cod_activo_fijo
  from tmp_carga_data;


select *
  from almacenes
 where cod_alm = '58';


select *
  from almacen a
       join tmp_carga_data t on a.cod_art = t.cod_art
 where a.stock > 0
   and a.cod_alm = 'P1'
 order by a.cod_alm;


select a.cod_art, a.stock
  from almacen a
       join tmp_carga_data t on a.cod_art = t.cod_art
 where a.stock > 0
   and a.cod_alm = 'EY'
 order by a.cod_art, a.cod_alm;


select t.cod_activo_fijo as cod_cambio, sum(a.stock) as stock
     , listagg(a.cod_art, '|') within group (order by a.cod_art) as cod_art
  from almacen a
       join tmp_carga_data t on a.cod_art = t.cod_art
 where a.stock > 0
   and a.cod_alm = 'EY'
 group by t.cod_activo_fijo;


select cod_art, cod_activo_fijo
  from tmp_carga_data
 where cod_art = 'DUR 145.385';


select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'AR'
   and ot_numero in (
   1143035
   );


select *
  from tmp_carga_data
 where cod_art = 'SERV TROQ KRF 300.470-312B';