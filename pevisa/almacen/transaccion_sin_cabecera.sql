declare
  l_count pls_integer := 0;

  cursor cr_sin_cabecera is
    select distinct d.cod_alm, tp_transac, d.serie, d.numero, d.fch_transac, d.pr_tipot, d.pr_numot
                  , o.abre01 as pedido, o.per_env as itemped
      from kardex_d d
           join pr_ot o
                on d.pr_tipot = o.nuot_tipoot_codigo
                  and o.nuot_serie = 1
                  and d.pr_numot = o.numero
     where d.pr_tipot = 'FC'
       and d.fch_transac = to_date('29/06/2024', 'dd/mm/yyyy')
       and d.estado != '9'
       and not exists(
       select *
         from kardex_g g
        where g.cod_alm = d.cod_alm
          and g.tp_transac = d.tp_transac
          and g.serie = d.serie
          and g.numero = d.numero
       )
     order by cod_alm, tp_transac, serie, numero;

begin
  for r in cr_sin_cabecera loop
    insert into kardex_g ( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref
                         , ser_doc_ref, nro_doc_ref, glosa, tp_relacion, cod_relacion
                         , nro_sucur, cond_pag, nro_lista, moneda, cod_vende, cliente_afecto
                         , por_desc1, por_desc2, motivo, estado, origen, ing_sal, flg_impr
                         , ubicacion, cod_transp, domicilio, ruc_transp, nombre, direccion
                         , ruc, tara_co, tara_bo, tara_ca, placa_transp, le_transp, cant_item
                         , num_importa, tipo_pguia, serie_pguia, numero_pguia, pr_procedencia
                         , pr_numped, nombre_archivo, nombre_archivo_ingreso, texto_1
                         , texto_2, numero_1, numero_2)
    values ( r.cod_alm, r.tp_transac, r.serie, r.numero, r.fch_transac, r.pr_tipot, 3, r.pr_numot
           , 'Surtido Piezas', null, null, null, null, null, null, null, null, 0.00, 0.00, '0', '2'
           , 'A', 'S', '0', null, null, null, null, null, null, null, 0.0000, 0.0000, 0.0000
           , '211118', null, 0, 'PED' || r.pedido, r.pr_tipot, '3', r.pr_numot, 'ORDPR', r.pedido
           , null, null, null, null, null, null);

    l_count := l_count + sql%rowcount;
  end loop;

  dbms_output.put_line('Total registros: ' || l_count);
end ;


select d.*
  from kardex_d d
       join pr_ot o
            on d.pr_tipot = o.nuot_tipoot_codigo
              and o.nuot_serie = 1
              and d.pr_numot = o.numero
 where d.pr_tipot = 'FC'
   and d.fch_transac = to_date('29/06/2024', 'dd/mm/yyyy')
   and d.estado != '9'
   and not exists(
   select *
     from kardex_g g
    where g.cod_alm = d.cod_alm
      and g.tp_transac = d.tp_transac
      and g.serie = d.serie
      and g.numero = d.numero
   )
--  and d.cod_art = 'CP-R-EFB Q85-90D23L'
 order by ing_sal desc;

select *
  from almacen
 where cod_art = 'CP-R-EFB Q85-90D23L';