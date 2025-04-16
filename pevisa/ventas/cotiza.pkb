create or replace package body cotiza as

  procedure reordena_bosch(
    p_serie  number
  , p_numero number
  ) is
    /*
     -- Date  :10/06/2015  NEUMATICOS 2
     --  1. Busca Tabla  TAB_DESCUENTO_GPOLIN codigo_De_venta de los items de la cotizacion
     -- 2. Luego obtiene los descuentos de la Tabla TAB_DESCUENTO_GPOLIN
     -- 3.Recalcula pedido
     by v.v.
   */
    p_ubica       varchar2(15);
    p_dscto3      number(12, 2) := 0;
    p_iva         number(12, 2) := 0;
    p_tasa_seguro number(12, 2) := 0;
    p_flete       number(12, 2) := 0;
    p_categoria   number(3);
    p_ddescto1    number(12, 2) := 0;
    p_cliente     varchar2(20);
  begin
    -----  1 sacando valores del pedido -----------
    --- Ubicacion.
    --- Descuento 3 si cond_pago = "A"
    --- Tasa Seguro, Flete y Igv
    select -- c.SERIE,
      -- c.NUM_PED,
      -- c.FECHA,
      -- c.ESTADO,
      -- c.COD_CLIENTE,
      -- c.COND_PAG,
      -- n.COD_UBC,
      decode(substr(n.cod_ubc, 1, 2), '07', 'L',
             decode(substr(n.cod_ubc, 1, 4), '1501', 'L', 'P')) as ubica
         , decode(c.cond_pag, 'A', 2, 0) as dscto3
         , decode(c.cliente_afecto, 'S', i.valor, 0) as p_iva
         , c.tasa_seguro as p_tasa_seguro, c.flete as p_flete
         , nvl(n.grupo_bateria, 0) as categoria_cliente
         , c.cod_cliente
      into p_ubica, p_dscto3, p_iva, p_tasa_seguro, p_flete, p_categoria, p_cliente
      from cotizacion c
         , clientes n
         , impuesto i
     where c.serie = p_serie
       and c.num_ped = p_numero
       and n.cod_cliente = c.cod_cliente
       and i.codigo = '1';

    p_categoria := nvl(api_clientes_categoria.onerow(p_cliente, 'BCH').cod_categoria, 0);

    ----- 4 Actualiza Descuentos de Item del pedido  -----------
    declare
      -----
      ----- Agrupa por grupo_venta por "importes" o "cantidad" de acuerdo al Tipo de Rango
      ----   y  trae el descuento de acuerdo al grupo y ubicacion
      cursor c1_grupo_venta is
        select gp.cod_grupo_venta, gc.descripcion, gc.moneda_rango, gc.tipo_cliente, gc.tipo_rango
             , sum(i.cantidad) as kantidad, sum(round(i.cantidad * i.precio, 2)) as importes
             , get_rango_descuento(gp.cod_grupo_venta,
                                   p_ubica,
                                   decode(gc.tipo_rango, 'I',
                                          sum(round(i.cantidad * i.precio, 2)),
                                          sum(i.cantidad)),
                                   '1') as dd1
             , get_rango_descuento(gp.cod_grupo_venta,
                                   p_ubica,
                                   decode(gc.tipo_rango, 'I',
                                          sum(round(i.cantidad * i.precio, 2)),
                                          sum(i.cantidad)),
                                   '2') as dd2
          from itemcot i
             , articul a
             , tab_descuento_gpolin gp
             , tab_descuento_comercial gc
         where i.serie = p_serie
           and i.num_ped = p_numero
           and a.cod_art = i.cod_art
           and gp.cod_grupo = a.grupo
           and gp.cod_linea = a.cod_lin
           and gc.cod_grupo_venta = gp.cod_grupo_venta
         group by gp.cod_grupo_venta, gc.descripcion, gc.moneda_rango, gc.tipo_cliente
                , gc.tipo_rango
         order by 1;

      ----------------------------------------------------------
      cursor c2_items(
        w_grupo_vta varchar2
        ) is
        -----
        ----- Agrupa por grupo_venta Ddetallado
        -----
        select i.serie, i.num_ped, a.cod_art, a.grupo, a.cod_lin, gp.cod_grupo_venta
             , gc.descripcion
             , gc.moneda_rango, gc.tipo_cliente, gc.tipo_rango, sum(i.cantidad) as kantidad
             , sum(round(i.cantidad * i.precio, 2)) as importes
          from itemcot i
             , articul a
             , tab_descuento_gpolin gp
             , tab_descuento_comercial gc
         where i.serie = p_serie
           and i.num_ped = p_numero
           and a.cod_art = i.cod_art
           and gp.cod_grupo = a.grupo
           and gp.cod_linea = a.cod_lin
           and gc.cod_grupo_venta = gp.cod_grupo_venta
           and gc.cod_grupo_venta = w_grupo_vta
         group by i.serie, i.num_ped, a.cod_art, a.grupo, a.cod_lin, gp.cod_grupo_venta
                , gc.descripcion, gc.moneda_rango, gc.tipo_cliente, gc.tipo_rango
         order by 4;
      ----------------- Comienzo ---------------------------
    begin
      ---- pone cero los descuentos -----------
      update itemcot
         set por_desc1 = 0
           , por_desc2 = 0
           , por_desc3 = 0
       where serie = p_serie
         and num_ped = p_numero;

      ---- actualiza los descuentos con la tabla de Rangos ------
      /*   SE VA ARREGLAR PARA TOMAR DE LA TABLA DE RANGOS_LINEAS ------
        for rec in c1_grupo_venta
        loop
          for rec2 in c2_Items(rec.cod_grupo_venta)
          loop
             update itemcot set POR_DESC1 = rec.dd1, POR_DESC2 = rec.dd2, POR_DESC3 = p_dscto3
             where
                 serie = rec2.serie
             and num_ped = rec2.num_ped
             and cod_Art = rec2.cod_Art;
           end loop;
        end loop;
       */
      ---
      begin
        select nvl(descuento, 0)
          into p_ddescto1
          from categoria
         where cod_tipo = 'BCH'
           and cod_categoria = p_categoria;


        -----------------------------------------------------------------------------------------
        update itemcot
           set por_desc1 = p_ddescto1
         where serie = p_serie
           and num_ped = p_numero;

        -----------------------------------------------------------------------------------------
        ----------------SE ACTUALIZA DESCUENTO A CERO SI CODIGO ESTA EN LISTA DE REMATE  = LISTA  90 ------- 12/feb/2018------------------
        update itemcot
           set por_desc1 = 0
         where serie = p_serie
           and num_ped = p_numero
           and f_lista_precio(cod_art, 90) > 0;
        -----------------------------------------------------------------------------------------
      exception
        when others then
          p_ddescto1 := 0;
      end;

      ---
      ---
      ----- si tiene Descuento3 y Dscto2 =0  pone dscto2 = dscto3 y dscto3 = 0 --------
      update itemcot
         set por_desc2 = por_desc3
           , por_desc3 = 0
       where serie = p_serie
         and num_ped = p_numero
         and nvl(por_desc2, 0) = 0
         and nvl(por_desc3, 0) > 0;

      ------Precio sugerido -------
      update itemcot
         set por_desc1 = 0
           , por_desc2 = 0
           , por_desc3 = 0
       where serie = p_serie
         and num_ped = p_numero
         and nvl(precio_sugerido, 0) > 0;

      ------Precio renusa -------
      if p_cliente = '20100085578' then
        update itemcot
           set por_desc1 = 0
             , por_desc2 =0
             , por_desc3 = 0
         where serie = p_serie
           and num_ped = p_numero;
      end if;
      ---------------------------------------
    end;

    --------------------------------
    -- 5. RECALCULO ---
    --------------------------------
    declare
      cursor c1_itemped is
        select serie, num_ped, cod_art, cantidad, precio, por_desc1, por_desc2, por_desc3
             , round(cantidad * decode(precio_sugerido, 0, precio, precio_sugerido),
                     2) as total_linea
             , round((100 - por_desc1) * (100 - por_desc2) * (100 - por_desc3) / 1000000,
                     6) as factor_desc
             , precio_sugerido
          from itemcot i
         where i.serie = p_serie
           and i.num_ped = p_numero;

      --------------------------------------------
      x_total_bruto     number(12, 2) := 0;
      x_total_descuento number(12, 2) := 0;
      xtotal_valvta     number(12, 2) := 0;
      xtotal_seguro     number(12, 2) := 0;
      xtotal_flete      number(12, 2) := 0;
      xtotal_igv        number(12, 2) := 0;
      xtotal_pedido     number(12, 2) := 0;
      --------------------------------------------
    begin
      for rec in c1_itemped loop
        update itemcot
           set imp_vvb   = round(rec.total_linea * rec.factor_desc, 2)
             , imp_bruto = rec.total_linea
             , imp_dscto = rec.total_linea - round(rec.total_linea * rec.factor_desc, 2)
         where serie = rec.serie
           and num_ped = rec.num_ped
           and cod_art = rec.cod_art;

        ------------------ acumular -------------------------------------
        x_total_bruto := x_total_bruto + rec.total_linea;
        x_total_descuento :=
            x_total_descuento + (rec.total_linea - round(rec.total_linea * rec.factor_desc, 2));
        -------------------------------------------------------
      end loop;

      --------------- Totales -----------
      xtotal_valvta := x_total_bruto - x_total_descuento;
      xtotal_seguro := round(xtotal_valvta * p_tasa_seguro / 100, 2);
      xtotal_flete := p_flete * 1;
      xtotal_igv := round((xtotal_valvta + xtotal_seguro + xtotal_flete) * p_iva, 2);
      xtotal_pedido := xtotal_valvta + xtotal_seguro + xtotal_flete + xtotal_igv;

      -----------------Actualiza Pedido -------------------
      update cotizacion
         set total_valvta    = xtotal_valvta
           , total_bruto     = x_total_bruto
           , total_descuento = x_total_descuento
           , total_igv       = xtotal_igv
           , total_pedido    = xtotal_pedido
       where serie = p_serie
         and num_ped = p_numero;
      ------------------------------------
    end;

    commit;
  end;


  procedure retorna_emitida(
    p_doc    varchar2
  , p_serie  number
  , p_numero number
  ) is
  begin
    for r in (
      select c.serie, c.num_ped as num_cot, c.refe_pedido as num_ped, c.fecha, c.estado
        from cotizacion c
       where ((p_doc = 'C' and c.serie = p_serie and c.num_ped = p_numero) or
              (p_doc = 'P' and c.serie = p_serie and c.refe_pedido = p_numero))
      )
    loop
      update pedido
         set estado = '9'
       where serie = r.serie
         and num_ped = r.num_ped;

      update itemped
         set estado = '9'
           , saldo  = 0
       where serie = r.serie
         and num_ped = r.num_ped;

      update cotizacion
         set estado      = '0'
           , refe_pedido = null
       where serie = r.serie
         and num_ped = r.num_cot;

      update itemcot
         set estado = '0'
       where serie = r.serie
         and num_ped = r.num_cot;
    end loop;
  end;

end cotiza;
