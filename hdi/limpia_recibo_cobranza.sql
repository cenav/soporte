-- no debe tener voucher o que este anulado
-- toman nota cobrador 04
select *
  from planilla_cobranzas_h
 where numero_planilla = :p_numero_planilla;

-- insert into pevisa.planilla_cobranzas_h ( numero_planilla, fecha, cod_cliente, cod_cobrador, moneda
--                                         , detalle, importe, importex, ano, mes, usuario
--                                         , fecha_registro, tipo_cambio, porcentaje, estado, aaaa_d
--                                         , mm_d, tipo, voucher_d, item_d, aaaa_c, mm_c, tipo_c
--                                         , voucher_c, item_c, orden_pago, fecha_pago
--                                         , constancia_deposito, fecha_deposito, creacion_quien
--                                         , creacion_cuando, creacion_donde, cambio, fechar)
-- values ( 1009327, date '2023-06-23', '20545440815', '04', null
--        , 'CLIENTE CANCELO CON EFECTIVO FACTURA F051-2666 USD 1,000.00', null, null, 2023, 6
--        , 'IOBLITAS', date '2023-06-23', 'V', 0.00, '0', 0, 0, null, 0, 0, null, null, null, null
--        , null, null, null, null, null, 'IOBLITAS', timestamp '2023-06-23 17:19:18', '30.0.0.44'
--        , 3.6710, date '2023-06-23');

select *
  from planilla_cobranzas_d
 where numero_planilla = :p_numero_planilla;

select *
  from planilla_cobranzas_i
 where numero_planilla = :p_numero_planilla;

-- borrar importe, fecha, estado = 0, imported = 0
select *
  from cobradores_recibos
 where codigo_cobrador = '04'
   and numero_recibo = :p_numero_planilla;

-- colocar numero menos uno anterior para que le aparezca el mismo numero que pide
select *
  from cobradores_rango_recibos
 where codigo_cobrador = '04'
   and :p_numero_planilla between primer_recibo and ultimo_recibo;

-- 1009335

------------------------------------
-- envia antonio, jesus hermoza, jose chirinos
select a.cod_lin, get_deslinea(a.cod_lin) as descri_linea, l.cod_art, a.peso_std as peso_kg
     , get_marca_articulo(l.cod_art) as marca
     , round((f_lista_precio(l.cod_art, 1) * 1.18), 2) as lista_dolar
     , round((f_lista_precio(l.cod_art, 80) * 1.18), 2) as lista_oferta, decode(
    f_lista_precio(l.cod_art, 80), 0, round((f_lista_precio(l.cod_art, 1) * 1.18), 2),
    round((f_lista_precio(l.cod_art, 80) * 1.18), 2)) as lista_televentas
     , decode(f_lista_precio(l.cod_art, 80), 0,
              round((round((f_lista_precio(l.cod_art, 1) * .95), 2) * 1.18), 2),
              round((f_lista_precio(l.cod_art, 80) * 1.18), 2)) as lista_flotas
     , decode(f_lista_precio(l.cod_art, 80), 0,
              round((round((f_lista_precio(l.cod_art, 1) * .94), 2) * 1.18), 2),
              round((f_lista_precio(l.cod_art, 80) * 1.18), 2)) as lista_bronce
     , decode(f_lista_precio(l.cod_art, 80), 0,
              round((round((f_lista_precio(l.cod_art, 1) * .925), 2) * 1.18), 2),
              round((f_lista_precio(l.cod_art, 80) * 1.18), 2)) as lista_plata
     , decode(f_lista_precio(l.cod_art, 80), 0,
              round((round((f_lista_precio(l.cod_art, 1) * .91), 2) * 1.18), 2),
              round((f_lista_precio(l.cod_art, 80) * 1.18), 2)) as lista_oro
     , decode(f_lista_precio(l.cod_art, 80), 0,
              round((round((f_lista_precio(l.cod_art, 1) * .895), 2) * 1.18), 2),
              round((f_lista_precio(l.cod_art, 80) * 1.18), 2)) as lista_safiro
     , decode(f_lista_precio(l.cod_art, 80), 0,
              round((round((f_lista_precio(l.cod_art, 1) * .88), 2) * 1.18), 2),
              round((f_lista_precio(l.cod_art, 80) * 1.18), 2)) as lista_diamante
     , decode(f_lista_precio(l.cod_art, 80), 0,
              round((round((f_lista_precio(l.cod_art, 1) * .8467), 2) * 1.18), 2),
              round((f_lista_precio(l.cod_art, 80) * 1.18), 2)) as lista_perla
     , round((f_lista_precio(l.cod_art, 70) * 1.18), 2) as lista_sodimac_soles
     , round((f_lista_precio(l.cod_art, 6) * 1.18), 2) as lista_neumaticos_motos_soles
     , round((f_lista_precio(l.cod_art, 90) * 1.18), 2) as lista_neuma_motos_soles_oferta
     , f_stock_almacen(l.cod_art, 'F0') as stock_f0, pr_vta_acum_unid_hdi(l.cod_art,
                                                                          (first_day(trunc(add_months(sysdate, -0)))),
                                                                          trunc(last_day(add_months(sysdate, -0)))) as venta_acum_und_mes_actual
  from lispred l
     , articul a
     , almacen k
 where l.cod_art = a.cod_art (+)
   and f_lista_precio(l.cod_art, 1) > 0
   and l.nro_lista = 1
   and l.cod_art = k.cod_art
   and k.cod_alm = 'F0'
   and a.grupo = '18'
   and a.cod_lin <> 'ZZ'
   and a.indicador <> 'XX';

-- lista 1 default dolares
-- lista 80 ofertas
select *
  from lispred
 where cod_art = '175/65R14H K424'
 order by nro_lista;

select *
  from lispreg
 where nro_lista = 1;


------ PARA  CHOQUEHUANCA  LISTA DE PRECIOS  SOLES -- CON IGV ----
select a.cod_lin, get_deslinea(a.cod_lin) as descri_linea, l.cod_art, a.peso_std as peso_kg
     , round((f_lista_precio(l.cod_art, 6) * 1.18), 2) as lista_soles
     , round((f_lista_precio(l.cod_art, 90) * 1.18), 2) as lista_oferta
     , round((f_lista_precio(l.cod_art, 70) * 1.18), 2) as lista_sodimac, decode(
    f_lista_precio(l.cod_art, 90), 0, round((f_lista_precio(l.cod_art, 6) * 1.18), 2),
    round((f_lista_precio(l.cod_art, 90) * 1.18), 2)) as lista_televentas
     , decode(f_lista_precio(l.cod_art, 90), 0,
              round((round((f_lista_precio(l.cod_art, 6) * .6111), 2) * 1.18), 2),
              round((f_lista_precio(l.cod_art, 90) * 1.18), 2)) as lista_flotas
     , decode(f_lista_precio(l.cod_art, 90), 0,
              round((round((f_lista_precio(l.cod_art, 6) * .5928), 2) * 1.18), 2),
              round((f_lista_precio(l.cod_art, 90) * 1.18), 2)) as lista_bronce
     , decode(f_lista_precio(l.cod_art, 90), 0,
              round((round((f_lista_precio(l.cod_art, 6) * .5805), 2) * 1.18), 2),
              round((f_lista_precio(l.cod_art, 90) * 1.18), 2)) as lista_plata
     , decode(f_lista_precio(l.cod_art, 90), 0,
              round((round((f_lista_precio(l.cod_art, 6) * .5683), 2) * 1.18), 2),
              round((f_lista_precio(l.cod_art, 90) * 1.18), 2)) as lista_oro
     , decode(f_lista_precio(l.cod_art, 90), 0,
              round((round((f_lista_precio(l.cod_art, 6) * .5592), 2) * 1.18), 2),
              round((f_lista_precio(l.cod_art, 90) * 1.18), 2)) as lista_safiro
     , decode(f_lista_precio(l.cod_art, 90), 0,
              round((round((f_lista_precio(l.cod_art, 6) * .55), 2) * 1.18), 2),
              round((f_lista_precio(l.cod_art, 90) * 1.18), 2)) as lista_diamante
----DECODE (F_LISTA_PRECIO(L.COD_ART,80), 0,ROUND((ROUND((F_LISTA_PRECIO(L.COD_ART,1)*.8467),2)*1.18),2),ROUND((F_LISTA_PRECIO(L.COD_ART,80)*1.18),2))   LISTA_PERLA
  from lispred l
     , articul a
     , almacen k
 where l.cod_art = a.cod_art (+)
   and f_lista_precio(l.cod_art, 1) > 0
   and l.nro_lista = 1
   and l.cod_art = k.cod_art
   and k.cod_alm = 'F0'
   and a.grupo = '27'
   and a.cod_lin not in ('ZZ', '515')
--AND A.COD_LIN IN ('144','225','226')
 order by a.cod_lin, l.cod_art;

select *
  from numdoc
 where tp_transac = '21';