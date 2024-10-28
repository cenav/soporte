select *
  from solimat_g
 where serie = 1
   and numero = 194501;

select *
  from solimat_d
 where serie = 1
   and numero = 194501;

select *
  from kardex_g
 where tip_doc_ref = 'P2'
   and serie = 1
   and nro_doc_ref = 194501;

select *
  from kardex_d
 where cod_alm = '02'
   and tp_transac = '27'
   and serie = 1
   and numero = 1528581;

select *
  from kardex_d
 where cod_alm = '08'
   and tp_transac = '16'
   and serie = 1
   and numero = 204454;

-- 02	27	1	1542698
-- 08	16	1	204300
select *
  from kardex_d
 where cod_art = 'BOLSA 30.55'
   and tp_transac in ('27', '16')
   and cod_alm in ('08', '02')
 order by fch_transac desc;

-- ingreso por transeferencia (modelo)
select *
  from kardex_d
 where cod_alm = '08'
   and tp_transac = '16'
   and serie = 1
   and numero = 204300
   and cod_art = 'BOLSA 30.55';

select *
  from kardex_g
 where cod_alm = '08'
   and tp_transac = '16'
   and serie = 1
   and numero = 204300;


declare
  l_nro    kardex_g.numero%type;
  l_salida kardex_g%rowtype;

  cursor cur_salida is
    select *
      from kardex_d
     where cod_alm = '02'
       and tp_transac = '27'
       and serie = 1
       and numero = 1528581;

begin
  l_salida := api_kardex_g.onerow('02', '27', 1, 1528581);
  -- 08	16	1	204300
  l_nro := api_kardex_g.next_numero('16', 1);

  -- crea cabecera ingreso
  insert into pevisa.kardex_g ( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref
                              , ser_doc_ref, nro_doc_ref, glosa, tp_relacion, cod_relacion
                              , nro_sucur, cond_pag, nro_lista, moneda, cod_vende, cliente_afecto
                              , por_desc1, por_desc2, motivo, estado, origen, ing_sal, flg_impr
                              , ubicacion, cod_transp, domicilio, ruc_transp, nombre, direccion, ruc
                              , tara_co, tara_bo, tara_ca, placa_transp, le_transp, cant_item
                              , num_importa, tipo_pguia, serie_pguia, numero_pguia, pr_procedencia
                              , pr_numped, nombre_archivo, nombre_archivo_ingreso, texto_1, texto_2
                              , numero_1, numero_2)
  values ('08', '16', 1, l_nro, l_salida.fch_transac, 'P2', 1, l_salida.nro_doc_ref
         , 'TRANSFE ALMACEN  ' || l_salida.cod_alm || ' ( ' || l_salida.tp_transac || ' - ' ||
           l_salida.serie || ' - ' || l_salida.numero || ')', null, null, null, null, 1
         , null, null, null, 0.00, 0.00, '0', '0', 'P', 'I', '0', null, null, null, null, null, null
         , null, null, null, null, null, null, null, null, null, null, null, 'SOLIMAT', null, null
         , null, null, null, null, null);

  for r in cur_salida loop
    -- crea detalle ingreso
    insert into pevisa.kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d
                                , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado
                                , cuenta69, origen, ing_sal, lote, conos, tara, flag, autonum, orden
                                , pr_proveedor, pr_referencia, pr_ordcomp, pr_codpza, pr_valvta
                                , pr_cosfob, pr_canthabi, pr_tipot, pr_numot, pr_numped)
    values ( '08', '16', 1, l_nro, r.cod_art, r.cantidad, 0.000000, 0.000000, l_salida.fch_transac
           , 0.00, 0.00, 0.000, '0', null, 'D', 'I', null, null, null, null, null, null, null, null
           , null, null, null, null, null, null, null, null);
  end loop;

  dbms_output.put_line(l_nro);
end;


select *
  from kardex_g
 where tip_doc_ref = 'P2'
   and serie = 1
   and nro_doc_ref = 195946;

select *
  from kardex_d
 where cod_art = '180.1525CS-2-MU-1'
   and tp_transac in ('27', '16')
 order by fch_transac desc;

select *
  from kardex_d
 where cod_art = '290.4706ZN-MU-1'
   and tp_transac in ('27', '16')
 order by fch_transac desc;

select *
  from transacciones_almacen
 where tp_transac in ('16', '27');


select *
  from kardex_d
 where cod_alm = '02'
   and tp_transac = '27'
   and serie = 1
   and numero = 1528581
   and cod_art = 'BOLSA P1316';

declare
  -- 03	16	1	204406
  k_alm_ing constant kardex_g.cod_alm%type    := '03';
  k_trx_ing constant kardex_g.tp_transac%type := '16';
  k_ser_ing constant kardex_g.serie%type      := 1;
  k_nro_ing constant kardex_g.numero%type     := 204406;

  k_alm_sal constant kardex_g.cod_alm%type    := '05';
  k_trx_sal constant kardex_g.tp_transac%type := '27';
  k_ser_sal constant kardex_g.serie%type      := 1;
  l_nro_sal          kardex_g.numero%type;

  l_ing              kardex_g%rowtype;

  cursor cur_ingreso is
    select *
      from kardex_d
     where cod_alm = k_alm_ing
       and tp_transac = k_trx_ing
       and serie = k_ser_ing
       and numero = k_nro_ing;

begin
  l_ing := api_kardex_g.onerow(k_alm_ing, k_trx_ing, k_ser_ing, k_nro_ing);
  l_nro_sal := api_kardex_g.next_numero(k_trx_sal, k_ser_sal);

  -- crea cabecera salida
  insert into pevisa.kardex_g ( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref
                              , ser_doc_ref, nro_doc_ref, glosa, tp_relacion, cod_relacion
                              , nro_sucur, cond_pag, nro_lista, moneda, cod_vende, cliente_afecto
                              , por_desc1, por_desc2, motivo, estado, origen, ing_sal, flg_impr
                              , ubicacion, cod_transp, domicilio, ruc_transp, nombre, direccion, ruc
                              , tara_co, tara_bo, tara_ca, placa_transp, le_transp, cant_item
                              , num_importa, tipo_pguia, serie_pguia, numero_pguia, pr_procedencia
                              , pr_numped, nombre_archivo, nombre_archivo_ingreso, texto_1, texto_2
                              , numero_1, numero_2)
  values ( k_alm_sal, k_trx_sal, k_ser_sal, l_nro_sal, l_ing.fch_transac, 'P2', l_ing.ser_doc_ref
         , l_ing.nro_doc_ref, 'ARMADO', 'C', null, null, null, 1, null, null, null, 0.00, 0.00, '1'
         , '0', 'P', 'S', '0', null, null, null, null, null, null, null, null, null, null, null
         , null, null, 'SM :' || l_ing.ser_doc_ref || ' ' || l_ing.nro_doc_ref, null, null, null
         , 'SOLIMAT', null, null, null, null, null, null, null);

  for r in cur_ingreso loop
    -- crea detalle salida
    insert into pevisa.kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d
                                , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado
                                , cuenta69, origen, ing_sal, lote, conos, tara, flag, autonum, orden
                                , pr_proveedor, pr_referencia, pr_ordcomp, pr_codpza, pr_valvta
                                , pr_cosfob, pr_canthabi, pr_tipot, pr_numot, pr_numped)
    values ( k_alm_sal, k_trx_sal, k_ser_sal, l_nro_sal, r.cod_art, r.cantidad, 0.000000, 0.000000
           , r.fch_transac, 0.00, 0.00, 0.000, '0', null, 'P', 'S', null, null, null, null, null
           , null, null, null, null, null, null, null, null, null, null, null);
  end loop;

  dbms_output.put_line(l_nro_sal);
end;
