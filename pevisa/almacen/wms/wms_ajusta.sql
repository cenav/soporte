-- 983.0000 cant anterior
-- ajuste inventario wms
select *
  from kardex_d
 where cod_alm = 'D5'
   and tp_transac = '28'
   and estado != '9'
   and fch_transac >= to_date('05/12/2024', 'dd/mm/yyyy')
   and cod_art = 'RIB 92014';

select *
  from transacciones_almacen
 where descripcion like '%AJUSTE%';

select *
  from transacciones_almacen
 where tp_transac in ('16', '27');

select *
  from kardex_d
 where cod_alm = 'D5'
   and tp_transac = '27'
   and serie = 3
   and numero = 157010;

select *
  from kardex_g
 where cod_alm = 'D5'
   and tp_transac = '27'
   and serie = 3
   and numero = 157318;

select *
  from kardex_d
 where cod_alm = 'D5'
   and tp_transac = '27'
   and serie = 3
   and numero = 157318;

select *
  from kardex_g
 where cod_alm = 'D2'
   and tp_transac = '16'
   and serie = 3
   and numero = 157178;

select *
  from kardex_d
 where cod_alm = 'D2'
   and tp_transac = '16'
   and serie = 3
   and numero = 157178;


-- crea transaccion pendiente (tiene tarea cerrada pero no transaccion)
declare
  k_alm  constant kardex_d.cod_alm%type     := 'D5';
  k_tpo  constant kardex_d.tp_transac%type  := '27';
  k_ser  constant kardex_d.serie%type       := 3;
  k_fch  constant kardex_g.fch_transac%type := to_date('30/12/2024', 'dd/mm/yyyy');
  k_cant constant kardex_d.cantidad%type    := 362;

  l_nro_sal       kardex_g.numero%type      := 0;
  l_nro_ing       kardex_g.numero%type      := 0;
  i               pls_integer               := 1;

  cursor cr_op is
    select o.nuot_tipoot_codigo, o.nuot_serie, o.numero, o.abre01, d.art_cod_art
      from pr_ot o
           join pr_ot_det d
                on o.nuot_tipoot_codigo = d.ot_nuot_tipoot_codigo
                  and o.nuot_serie = d.ot_nuot_serie
                  and o.numero = d.ot_numero
     where o.nuot_tipoot_codigo = 'PR'
       and o.numero = 572725
       and d.art_cod_art = 'PL66100-1SR';
begin
  l_nro_sal := api_numdoc.next_id(k_tpo, k_ser);
  l_nro_ing := api_numdoc.next_id('16', k_ser);

  for r in cr_op loop
    if i = 1 then
      -- salida
      insert into kardex_g
        ( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref
        , ser_doc_ref, nro_doc_ref, glosa, tp_relacion, cod_relacion
        , nro_sucur, cond_pag, nro_lista, moneda, cod_vende, cliente_afecto
        , por_desc1, por_desc2, motivo, estado, origen, ing_sal, flg_impr
        , ubicacion, cod_transp, domicilio, ruc_transp, nombre, direccion
        , ruc, tara_co, tara_bo, tara_ca, placa_transp, le_transp, cant_item
        , num_importa, tipo_pguia, serie_pguia, numero_pguia, pr_procedencia
        , pr_numped, nombre_archivo, nombre_archivo_ingreso, texto_1
        , texto_2, numero_1, numero_2)
      values
        ( k_alm, k_tpo, k_ser, l_nro_sal, k_fch, r.nuot_tipoot_codigo, r.nuot_serie, r.numero
        , 'Surtido Piezas', null, null, null, null, null, null, null, null, 0.00
        , 0.00, '0', '2', 'A', 'S', '0', null, null, null, null, null, null, null, 0.0000, 0.0000
        , 0.0000, '211118', null, 0, 'OP/' || r.numero, r.nuot_tipoot_codigo, '3', r.numero, 'ORDPR'
        , r.abre01, null, null, null, null, null, null);

      -- ingreso
      insert into pevisa.kardex_g
        ( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref, ser_doc_ref, nro_doc_ref
        , glosa, tp_relacion, cod_relacion, nro_sucur, cond_pag, nro_lista, moneda, cod_vende
        , cliente_afecto, por_desc1, por_desc2, motivo, estado, origen, ing_sal, flg_impr, ubicacion
        , cod_transp, domicilio, ruc_transp, nombre, direccion, ruc, tara_co, tara_bo, tara_ca
        , placa_transp, le_transp, cant_item, num_importa, tipo_pguia, serie_pguia, numero_pguia
        , pr_procedencia, pr_numped, nombre_archivo, nombre_archivo_ingreso, texto_1, texto_2
        , numero_1, numero_2)
      values
        ( 'D2', '16', 3, l_nro_ing, k_fch, r.nuot_tipoot_codigo, r.nuot_serie, r.numero, null, null
        , null, null, null, null, null, null, null, 0.00, 0.00, '0', '2', 'P', 'I', '0', null, null
        , null, null, null, null, null, 0.0000, 0.0000, 0.0000, null, null, 0, 'OP/' || r.numero
        , r.nuot_tipoot_codigo, r.nuot_serie, r.numero, 'ORDPR', null, null, null, null, null, null
        , null);
    end if;

    -- salida detalle
    insert into pevisa.kardex_d
      ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d, costo_s, fch_transac
      , por_desc1, por_desc2, imp_vvb, estado, cuenta69, origen, ing_sal, lote, conos, tara, flag
      , autonum, orden, pr_proveedor, pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
      , pr_canthabi, pr_tipot, pr_numot, pr_numped)
    values
      ( k_alm, k_tpo, k_tpo, l_nro_sal, r.art_cod_art, k_cant, 0.000000, 0.000000
      , k_fch, 0.00, 0.00, 0.000, '2', null, 'P', 'S', null, null, null
      , null, null, null, null, null, null, null, 0.00, 0.0000, 0.0000
      , r.nuot_tipoot_codigo, r.numero, null);

    -- ingreso detalle
    insert into pevisa.kardex_d
      ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d, costo_s, fch_transac
      , por_desc1, por_desc2, imp_vvb, estado, cuenta69, origen, ing_sal, lote, conos, tara, flag
      , autonum, orden, pr_proveedor, pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
      , pr_canthabi, pr_tipot, pr_numot, pr_numped)
    values
      ( 'D2', '16', 3, l_nro_ing, r.art_cod_art, k_cant, 0.000000, 0.000000
      , k_fch, 0.00, 0.00, 0.000, '2', null, 'P', 'I', null, null, null
      , null, null, null, null, null, null, null, 0.00, 0.0000, 0.0000
      , r.nuot_tipoot_codigo, r.numero, null);

    i := i + 1;
  end loop;
end;