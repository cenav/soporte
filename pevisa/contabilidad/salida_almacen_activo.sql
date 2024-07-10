declare
  l_nro             numdoc.numero%type := 0;
  l_fecha           date               := trunc(sysdate);
  l_cambios_kardexd pls_integer        := 0;

  cursor cr_activos is
    select d.cod_alm, d.cod_art
         , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
      from kardex_d d
     where d.estado != '9'
       and exists(
       select *
         from tmp_carga_data t
        where d.cod_art = t.cod_activo_fijo
       )
       and exists(
       select *
         from activo_fijo af
        where d.cod_art = af.cod_activo_fijo
       )
    having sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) > 0
     group by d.cod_alm, d.cod_art;

begin
  l_nro := api_numdoc.next_id('22', 1);

  insert into kardex_g ( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref
                       , ser_doc_ref, nro_doc_ref, glosa, tp_relacion, cod_relacion, nro_sucur
                       , cond_pag, nro_lista, moneda, cod_vende, cliente_afecto, por_desc1
                       , por_desc2, motivo, estado, origen, ing_sal, flg_impr, ubicacion
                       , cod_transp, domicilio, ruc_transp, nombre, direccion, ruc, tara_co
                       , tara_bo, tara_ca, placa_transp, le_transp, cant_item, num_importa
                       , tipo_pguia, serie_pguia, numero_pguia, pr_procedencia, pr_numped
                       , nombre_archivo, nombre_archivo_ingreso, texto_1, texto_2, numero_1
                       , numero_2)
  values ( 'A1', '22', 1, l_nro, l_fecha, null, null, null, 'Salida por activacion de activo fijo'
         , null, null, null, null, null, null, null, null, 0.00, 0.00, '1', '0', 'I', 'S', '0'
         , null, null, null, null, null, null, null, null, null, null, null, null, null, null
         , null, null, null, null, null, null, null, null, null, null, null);

  for r in cr_activos loop

    insert into kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d
                         , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado, cuenta69
                         , origen, ing_sal, lote, conos, tara, flag, autonum, orden, pr_proveedor
                         , pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
                         , pr_canthabi, pr_tipot, pr_numot, pr_numped)
    values ( 'A1', '22', 1, l_nro, r.cod_art, r.stock, 0.000000, 0.000000, l_fecha, 0.00, 0.00
           , 0.000, '0', null, 'I', 'S', null, null, null, null, null, null, null
           , 'ACTIVACION ACTIVO FIJO', null, null, null, null, null, null, null, null);

    l_cambios_kardexd := l_cambios_kardexd + sql%rowcount;
  end loop;

  dbms_output.put_line(l_cambios_kardexd);
end;

select *
  from kardex_d
 where cod_alm = 'A1'
   and tp_transac = '22'
   and serie = 1
   and numero = 283759;

select *
  from activo_fijo af
 where exists(
   select *
     from tmp_carga_data t
    where af.cod_activo_fijo = t.cod_activo_fijo
   );

update activo_fijo af
   set af.activacion_almacen    = 'A1'
     , af.activacion_tp_transac = '22'
     , af.activacion_serie      = 1
     , af.activacion_numero     = 283759
 where exists(
   select *
     from tmp_carga_data t
    where af.cod_activo_fijo = t.cod_activo_fijo
   );


select *
  from kardex_g_historia
 where cod_alm = 'A1'
   and tp_transac = '22'
   and serie = 1
   and usuario = 'PEVISA'
   and fecha >= to_date('05/07/2024', 'dd/mm/yyyy');