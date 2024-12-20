procedure descarga_kardex is
  --Total_Cantidad Number(10,4);
  nalm           integer;
  numeros_salida varchar2(80);
  x_tipo_tran_s  varchar2(2) := '27';
  x_serie_tran_s varchar2(4) := 3;
  numero_salida  number(12);
  x_alm_tran_s   varchar2(4) := 'D5';
  x_fecha_tran   date        := sysdate;
  numero_ingreso number(12);
  x_tipo_tran_i  varchar2(2) := '16';
  x_serie_tran_i varchar2(4) := 3;
  x_alm_tran_i   varchar2(4) := 'D2';
  x_item         number(4)   := 0;
-------------------------------------------
  cursor c1_picking is
    select distinct tk_serie, tk_numero, tipo, serie, numero, oms_tipo, oms_serie, oms_numero
      from wms_orden_sol_item
     where tk_serie = '2'
       and cant_pedido - saldo <> 0
       and estado = '8'
     order by 1, 2, 3, 4;
-------------------------------------------

  procedure genera_salida_kardex(
    x_tipo       varchar2
  , x_serie      varchar2
  , x_orden      number
  , x_tk_serie   varchar2
  , x_tk_tarea   number
  , x_oms_tipo   varchar2
  , x_oms_serie  varchar2
  , x_oms_numero number
  ) is
    -------------------------------------------
    cursor c1_picking_sal is
      select tipo, serie, numero, tk_serie, tk_numero, componente, (cant_pedido - saldo) as despacho
        from wms_orden_sol_item
       where tipo = x_tipo
         and serie = x_serie
         and numero = x_orden
         and oms_tipo = x_oms_tipo
         and oms_serie = x_oms_serie
         and oms_numero = x_oms_numero
         and tk_serie = x_tk_serie
         and tk_numero = x_tk_tarea
         and cant_pedido - saldo > 0
         and estado = '8'
       order by 1, 2, 3, 4, 5;
-------------------------------------------
  begin
    x_item := 0;
    for r2 in c1_picking_sal
    loop
      x_item := x_item + 1;
      if x_item = 1 then
        -- Obtenemos el Numerador
        select numero + 1
          into numero_salida
          from numdoc
         where tp_transac = x_tipo_tran_s
           and serie = x_serie_tran_s
           for update of numero;
        ----------
        update numdoc
           set numero =numero_salida
         where tp_transac = x_tipo_tran_s
           and serie = x_serie_tran_s;
        ----------------------------------------
        mensaje(x_alm_tran_s || '-' || x_tipo_tran_s || '-' || x_serie_tran_s || '-' ||
                numero_salida);
        insert into kardex_g
          ( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref, ser_doc_ref, nro_doc_ref
          , glosa, tp_relacion, cod_relacion, nro_sucur, cond_pag, nro_lista, moneda, cod_vende
          , cliente_afecto, por_desc1, por_desc2, motivo, estado, origen, ing_sal, flg_impr
          , ubicacion, cod_transp, domicilio, ruc_transp, nombre, direccion, ruc, tara_co, tara_bo
          , tara_ca, placa_transp, le_transp, cant_item, num_importa, tipo_pguia, serie_pguia
          , numero_pguia, pr_procedencia)
        values
          ( x_alm_tran_s, x_tipo_tran_s, x_serie_tran_s, numero_salida, x_fecha_tran, 'TK'
          , r2.tk_serie, r2.tk_numero, null, null, null, null, null, null, null, null, null, 0, 0
          , '0', 2, 'P', 'S', '0', null, null, null, null, null, null, null, 0, 0, 0, null, null, 0
          , 'OP/' || r2.numero, r2.tipo, r2.serie, r2.numero, 'ORDPR');
        ----							mensaje(X_ALM_TRAN_S ||'-'||X_TIPO_TRAN_S ||'-'||X_SERIE_TRAN_S ||'-'||NUMERO_SALIDA);
      end if;
      ---																					mensaje(X_ALM_TRAN_S ||'-'||X_TIPO_TRAN_S ||'-'||X_SERIE_TRAN_S ||'-'||NUMERO_SALIDA||'-'||r2.componente);
      insert into kardex_d
        ( cod_alm, tp_transac, serie, numero, fch_transac, cod_art, cantidad, costo_d, costo_s
        , por_desc1, por_desc2, imp_vvb, estado, cuenta69, origen, ing_sal, lote, conos, tara, flag
        , autonum, orden, pr_proveedor, pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
        , pr_canthabi, pr_tipot, pr_numot)
      values
        ( x_alm_tran_s, x_tipo_tran_s, x_serie_tran_s, numero_salida, x_fecha_tran, r2.componente
        , r2.despacho, 0, 0, 0, 0, 0, '2', null, 'P', 'S', null, null, null, null, null, null, null
        , null, null, null, 0, 0, 0, r2.tipo, r2.numero);
      nalm := 1;
      ---																	mensaje(X_ALM_TRAN_S ||'-'||X_TIPO_TRAN_S ||'-'||X_SERIE_TRAN_S ||'-'||NUMERO_SALIDA||'-'||r2.componente);

    end loop;
  end;
------------------------------------------------------
  procedure genera_ingreso_kardex(
    x_tipo       varchar2
  , x_serie      varchar2
  , x_orden      number
  , x_tk_serie   varchar2
  , x_tk_tarea   number
  , x_oms_tipo   varchar2
  , x_oms_serie  varchar2
  , x_oms_numero number
  ) is
    -------------------------------------------
    cursor c1_picking_ing is
      select tipo, serie, numero, tk_serie, tk_numero, componente, (cant_pedido - saldo) as despacho
        from wms_orden_sol_item
       where tipo = x_tipo
         and serie = x_serie
         and numero = x_orden
         and oms_tipo = x_oms_tipo
         and oms_serie = x_oms_serie
         and oms_numero = x_oms_numero
         and tk_serie = x_tk_serie
         and tk_numero = x_tk_tarea
         and cant_pedido - saldo > 0
         and estado = '8'
       order by 1, 2, 3, 4, 5;
-------------------------------------------
  begin
    x_item := 0;
    for r2 in c1_picking_ing
    loop
      x_item := x_item + 1;
      if x_item = 1 then
        -- Obtenemos el Numerador
        select numero + 1
          into numero_ingreso
          from numdoc
         where tp_transac = x_tipo_tran_i
           and serie = x_serie_tran_i
           for update of numero;
        ----------
        update numdoc
           set numero =numero_ingreso
         where tp_transac = x_tipo_tran_i
           and serie = x_serie_tran_i;
        ----------------------------------------
        mensaje(x_alm_tran_i || '-' || x_tipo_tran_i || '-' || x_serie_tran_i || '-' ||
                numero_ingreso);

        insert into kardex_g
          ( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref, ser_doc_ref, nro_doc_ref
          , glosa, tp_relacion, cod_relacion, nro_sucur, cond_pag, nro_lista, moneda, cod_vende
          , cliente_afecto, por_desc1, por_desc2, motivo, estado, origen, ing_sal, flg_impr
          , ubicacion, cod_transp, domicilio, ruc_transp, nombre, direccion, ruc, tara_co, tara_bo
          , tara_ca, placa_transp, le_transp, cant_item, num_importa, tipo_pguia, serie_pguia
          , numero_pguia, pr_procedencia)
        values
          ( x_alm_tran_i, x_tipo_tran_i, x_serie_tran_i, numero_ingreso, x_fecha_tran, 'TK'
          , r2.tk_serie, r2.tk_numero, null, null, null, null, null, null, null, null, null, 0, 0
          , '0', 2, 'P', 'I', '0', null, null, null, null, null, null, null, 0, 0, 0, null, null, 0
          , 'OP/' || r2.numero, r2.tipo, r2.serie, r2.numero, 'ORDPR');
        ---											mensaje(X_ALM_TRAN_I ||'-'||X_TIPO_TRAN_I ||'-'||X_SERIE_TRAN_I ||'-'||NUMERO_INGRESO);
      end if;
      insert into kardex_d
        ( cod_alm, tp_transac, serie, numero, fch_transac, cod_art, cantidad, costo_d, costo_s
        , por_desc1, por_desc2, imp_vvb, estado, cuenta69, origen, ing_sal, lote, conos, tara, flag
        , autonum, orden, pr_proveedor, pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
        , pr_canthabi, pr_tipot, pr_numot)
      values
        ( x_alm_tran_i, x_tipo_tran_i, x_serie_tran_i, numero_ingreso, x_fecha_tran, r2.componente
        , r2.despacho, 0, 0, 0, 0, 0, '2', null, 'P', 'I', null, null, null, null, null, null, null
        , null, null, null, 0, 0, 0, r2.tipo, r2.numero);
      nalm := 1;
    end loop;
  end;

  procedure finaliza_proceso(
    x_tipo       varchar2
  , x_serie      varchar2
  , x_numero     number
  , x_tk_serie   varchar2
  , x_tk_numero  number
  , x_oms_tipo   varchar2
  , x_oms_serie  varchar2
  , x_oms_numero number
  ) is
  begin
    /*
      UPDATE PR_OT
         SET ESTADO = 4
      WHERE NUOT_TIPOOT_CODIGO = X_TIPO
      AND   NUOT_SERIE         = X_SERIE
      AND   NUMERO             = X_NUMERO
      AND   ESTADO = '1';
      */
    -----
    update wms_orden_sol
       set estado = 3 --- CERRADO
     where tipo = x_tipo
       and serie = x_serie
       and numero = x_numero
       and oms_tipo = x_oms_tipo
       and oms_serie = x_oms_serie
       and oms_numero = x_oms_numero
       and tk_serie = x_tk_serie
       and tk_numero = x_tk_numero;
    ------
  end;

--------Main Program ----------------------------------------------
begin
  nalm := 0;
  for r in c1_picking
  loop
    ---	  	mensaje('1');
    genera_salida_kardex(r.tipo, r.serie, r.numero, r.tk_serie, r.tk_numero, r.oms_tipo,
                         r.oms_serie, r.oms_numero);
---mensaje('2');
    genera_ingreso_kardex(r.tipo, r.serie, r.numero, r.tk_serie, r.tk_numero, r.oms_tipo,
                          r.oms_serie, r.oms_numero);
---mensaje('3');
    finaliza_proceso(r.tipo, r.serie, r.numero, r.tk_serie, r.tk_numero, r.oms_tipo, r.oms_serie,
                     r.oms_numero);
---mensaje('4');
  end loop;
  -------------------------------------------------------------------------------
---mensaje('5');
  if nalm = 0 then
    util.aceptar('AL_AC', 'No existe Registros para procesar...');
  else
---    	mensaje('6');
    commit;
    mensaje('Proceso Terminado');
  end if;
exception
  when others then
    mal(sqlerrm);
end;
