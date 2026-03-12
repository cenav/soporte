select *
  from articul
 where cod_art = 'BOLSA P2429';

select *
  from almacen
 where cod_art = 'BOLSA P2429';

select *
  from almacenes
 where cod_alm = '31';

select *
  from transacciones_almacen
 where descripcion like '%AJUSTE%';


select *
  from kardex_d
 where tp_transac = '28'
   and extract(year from fch_transac) = 2026
 order by fch_transac desc;


select d.cod_alm, d.cod_art
     , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
 where d.estado <> '9'
   and d.cod_alm in ('34', '35', '36', '38')
having sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) > 0
 group by d.cod_alm, d.cod_art;


-- salida por ajuste
declare
  k_trx_sal constant kardex_g.tp_transac%type := '28';
  k_ser_sal constant kardex_g.serie%type      := 1;
  k_fch     constant date                     := trunc(sysdate);

  l_nro_sal          kardex_g.numero%type;
begin
  for r in (
    select d.cod_alm
      from kardex_d d
     where d.estado <> '9'
       and d.cod_alm in ('34', '35', '36', '38')
    having sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) > 0
     group by d.cod_alm
     order by d.cod_alm
    )
  loop
    l_nro_sal := api_kardex_g.next_numero(k_trx_sal, k_ser_sal);

    dbms_output.put_line(r.cod_alm || '-' || k_trx_sal || '-' || k_ser_sal || '-' || l_nro_sal);

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
      , 'AJUSTE', null, null, null, null, 1, null, null, null, 0, 0, '1', '0'
      , 'D', 'S', '0', null, null, null, null, null, null, null, 0, 0, 0, null, null, 0
      , substr('AJUSTE', 1, 15), null, null, null, null, 0 /*----*/ , null, null, null, null
      , 0, 0);

    for rs in (
      select d.cod_alm, d.cod_art
           , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
        from kardex_d d
       where d.estado <> '9'
         and d.cod_alm = r.cod_alm
      having sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) > 0
       group by d.cod_alm, d.cod_art
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
        , substr('AJUSTE', 1, 30), null, null, 0, 0, 0, null, null, 0);
    end loop;

  end loop;
end;

-- 34-28-1-1465
-- 35-28-1-1466
-- 36-28-1-1467
-- 38-28-1-1468
select *
  from kardex_d
 where cod_alm = '38'
   and tp_transac = '28'
   and serie = 1
   and numero in (
   1468
   );
