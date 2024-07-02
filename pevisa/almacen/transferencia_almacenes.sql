create procedure genera_ingreso is
  ln_count number(8);
  xglosa   varchar2(60);
  procedure kardex_g is
  begin

    xglosa :=
        'TRANSFE ALMACEN ' || ' ' || :KARDEX_G.cod_alm || ' ( ' || :KARDEX_G.tp_transac || ' - ' ||
        :KARDEX_G.serie || ' - ' || :KARDEX_G.xnumero || ')';
    insert into kardex_g ( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref, ser_doc_ref
                         , nro_doc_ref, glosa, nro_lista, por_desc1, por_desc2, motivo, estado
                         , origen, ing_sal, flg_impr, pr_procedencia)
    values ( :kardex_g.xcod_alm, :kardex_g.xtp_transac, :kardex_g.xserie, :kardex_g.xnumero
           , :kardex_g.fch_transac, :kardex_g.tip_doc_ref, :kardex_g.ser_doc_ref
           , :kardex_g.nro_doc_ref, xglosa, :kardex_g.nro_lista, 0, 0, '0', '0', :kardex_g.origen
           , 'I', '0', :kardex_g.pr_procedencia);
  exception
    when others then
      begin
        enviar_correo(
            'jdelatorre@pevisa.com.pe'
          , 'jdelatorre@pevisa.com.pe'
          , 'ERROR, INSERTAR, TRANSFERENCIA: (SM_DESPA) ' ||
            (:kardex_g.xcod_alm || '-' || :kardex_g.xtp_transac || '-' || :kardex_g.xserie || '-' ||
             :kardex_g.xnumero),
            sqlerrm
        );
      end;
      begin
        enviar_correo(
            'jdelatorre@pevisa.com.pe'
          , 'josedelatorrecueto@gmail.com'
          , 'ERROR, INSERTAR, TRANSFERENCIA: (SM_DESPA) ' ||
            (:kardex_g.xcod_alm || '-' || :kardex_g.xtp_transac || '-' || :kardex_g.xserie || '-' ||
             :kardex_g.xnumero),
            sqlerrm
        );
      end;
  end;

  procedure kardex_d is
  begin
    go_block('SOLIMAT_D');
    last_record;
    ln_count := get_block_property('SOLIMAT_D', query_hits);
    first_record;
    -- Recorremos el bloque.
    for i in 1..30 loop
      if :SOLIMAT_D.despacho > 0 then
        mensaje('INSERTADO INGRESO' || :SOLIMAT_D.cod_art);
        insert into kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d
                             , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado, cuenta69
                             , origen, ing_sal)
        values ( :kardex_g.xcod_alm, :kardex_g.xtp_transac, :kardex_g.xserie, :kardex_g.xnumero
               , :SOLIMAT_D.cod_art, :SOLIMAT_D.despacho, 0, 0, :kardex_g.fch_transac, 0, 0, 0, '0'
               , null, 'D', 'I');
        next_record;
      end if;
    end loop;
  end;

begin
  kardex_g;
--  KARDEX_D;
end;