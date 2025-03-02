select cod_alm, tp_transac, serie, numero, ser_doc_ref, nro_doc_ref
     , tipo_pguia || '-' || serie_pguia || '-' || numero_pguia
  from kardex_g
 where cod_alm = :x_almacen_de_facturacion
   ---AND   TP_TRANSAC = X_TRANSACCION_DE_FACTURACION
   and tp_transac = :p_transac
   and serie = substr(:x_codigo_barra, 3, 3)
   and numero = substr(:x_codigo_barra, 6, 7)
   and estado < 9;

select substr(:x_codigo_barra, 3, 3)
     , substr(:x_codigo_barra, 6, 7)
  from dual;

select *
  from kardex_g
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero = 39297;

select *
  from kardex_g
 where serie = 25
   and numero = 39297;


