create procedure ingresa_kardex_piezas is
  --Total_Cantidad Number(10,4);

  xtran_i               varchar2(2);
  xserie_i              number(3);
  x_numero_ingreso      number(8);

  nalm                  integer;
  x_transaccion_salida  varchar2(02);
  x_transaccion_ingreso varchar2(02);
  x_almacen_salida      varchar2(02);
  x_almacen_ingreso     varchar2(02);
  x_serie_salida        number(03);
  x_serie_ingreso       number(03);


  procedure genera_kardex is
    cursor cur_bb is
      select *
        from pr_ot_det
       where ot_nuot_tipoot_codigo = :PR_OT.nuot_tipoot_codigo
         and ot_nuot_serie = :PR_OT.nuot_serie
         and ot_numero = :PR_OT.numero
--      AND   CANT_DESPACHADA        > 0
         and estado < 9
         and cod_lin not between '800' and '899';

  begin
    -- Obtenemos el Numerador
    select numero + 1
      into x_numero_ingreso
      from numdoc
     where tp_transac = x_transaccion_ingreso
       and serie = x_serie_ingreso
       for update of numero;

    update numdoc
       set numero =x_numero_ingreso
     where tp_transac = x_transaccion_ingreso
       and serie = x_serie_ingreso;

    -- Insertamos cabecera de kardex
    insert into kardex_g
      ( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref, ser_doc_ref, nro_doc_ref
      , glosa, tp_relacion, cod_relacion, nro_sucur, cond_pag, nro_lista, moneda, cod_vende
      , cliente_afecto, por_desc1, por_desc2, motivo, estado, origen, ing_sal, flg_impr, ubicacion
      , cod_transp, domicilio, ruc_transp, nombre, direccion, ruc, tara_co, tara_bo, tara_ca
      , placa_transp, le_transp, cant_item, num_importa, tipo_pguia, serie_pguia, numero_pguia
      , pr_procedencia)
    values
      ( x_almacen_ingreso, x_transaccion_ingreso, x_serie_ingreso, x_numero_ingreso
      , :LR_KARDEX.fecha, :PR_OT.nuot_tipoot_codigo, :PR_OT.nuot_serie, :PR_OT.numero, null, null
      , null, null, null, null, null, null, null, 0, 0, '0', 2, 'P', 'I', '0', null, null, null
      , null, null, null, null, 0, 0, 0, null, null, 0, :LR_KARDEX.referencia
      , :PR_OT.nuot_tipoot_codigo, :PR_OT.nuot_serie, :PR_OT.numero, 'ORDPR');
    for bb in cur_bb loop
      -- Insertamos Detalle
      insert into kardex_d
        ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d, costo_s, fch_transac
        , por_desc1, por_desc2, imp_vvb, estado, cuenta69, origen, ing_sal, lote, conos, tara, flag
        , autonum, orden, pr_proveedor, pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
        , pr_canthabi, pr_tipot, pr_numot)
      values
        ( x_almacen_ingreso, x_transaccion_ingreso, x_serie_ingreso, x_numero_ingreso
        , bb.art_cod_art, bb.cant_formula, 0, 0, :LR_KARDEX.fecha, 0, 0, 0, '2', null, 'P', 'I'
        , null, null, null, null, null, null, null, null, null, null, 0, 0, 0
        , :PR_OT.nuot_tipoot_codigo, :PR_OT.numero);

      update pr_ot_det
         set cant_despachada = 0
           , saldo           = cant_formula
       where ot_nuot_tipoot_codigo = :PR_OT.nuot_tipoot_codigo
         and ot_nuot_serie = :PR_OT.nuot_serie
         and ot_numero = :PR_OT.numero
         and art_cod_art = bb.art_cod_art;

    end loop;
  end;


  procedure finaliza_proceso is
    xusuario varchar2(25);
  begin
    begin
      if :PR_OT.destino = '1' then -- EXPORTACION --
        begin
          if nvl(:PR_OT.per_env, 0) = 0 then -- NUMERO DE ITEM --
            begin
              update expedido_d
                 set estado_pk = '9'
                   , id        = 'AN'
               where numero = :PR_OT.abre01
                 and cod_art = :PR_OT.formu_art_cod_art;
            end;
          else
            begin
              update expedido_d
                 set estado_pk = '9'
                   , id        = 'AN'
               where numero = :PR_OT.abre01
                 and cod_art = :PR_OT.formu_art_cod_art
                 and nro = :PR_OT.per_env;
            end;
          end if;
        end;
      end if;
      if :PR_OT.destino = '2' then -- NACIONAL --
        begin
          if nvl(:PR_OT.per_env, 0) = 0 then -- NUMERO DE ITEM --
            begin
              update expednac_d
                 set estado_pk = '9'
                   , id        = 'AN'
               where numero = :PR_OT.abre01
                 and cod_art = :PR_OT.formu_art_cod_art;
            end;
          else
            begin
              update expednac_d
                 set estado_pk = '9'
                   , id        = 'AN'
               where numero = :PR_OT.abre01
                 and cod_art = :PR_OT.formu_art_cod_art
                 and nro = :PR_OT.per_env;
            end;
          end if;
        end;
      end if;
      update pr_ot
         set estado = 9
       where nuot_tipoot_codigo = :PR_OT.nuot_tipoot_codigo
         and nuot_serie = :PR_OT.nuot_serie
         and numero = :PR_OT.numero;
    end;

  end;


--------Main Program ----------------------------------------------
begin
  x_almacen_salida := '01';
  x_almacen_ingreso := '03';
  x_transaccion_salida := '50';
  x_transaccion_ingreso := '40';
  x_serie_salida := 1;
  x_serie_ingreso := 1;

  select count(*)
    into nalm
    from pr_ot_det
   where ot_nuot_tipoot_codigo = :PR_OT.nuot_tipoot_codigo
     and ot_nuot_serie = :PR_OT.nuot_serie
     and ot_numero = :PR_OT.numero
--   AND   CANT_DESPACHADA        > 0
     and estado < 9
     and cod_lin not between '800' and '899';

  if (nalm > 0) then
    genera_kardex;
  end if;

  finaliza_proceso;

  :global.ingreso_piezas :=
      ('Ing.Pza:' || ' ' || x_almacen_ingreso || '-' || x_transaccion_ingreso || '-' ||
       x_serie_ingreso || '-' || x_numero_ingreso);
  commit;

  mensaje(:global.ingreso || '  ' || :global.salida || '  ' || :global.ingreso_piezas);

  if nalm = 0 then
    util.aceptar('AL_AC', 'No existe Registros para procesar...');
  end if;
end;