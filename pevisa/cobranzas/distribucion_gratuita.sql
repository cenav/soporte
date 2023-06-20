-- documentos a sacar de cuentas por cobar
-- distribucion gratuita
select f.cod_cliente, c.nombre, f.tipdoc, f.serie_num, f.numero, f.fecha, f.moneda, f.importe
  from factcob f
       left join clientes c on f.cod_cliente = c.cod_cliente
 where extract(year from f.fecha) = 2023
   and extract(month from f.fecha) = 6
   and f.serie_num in ('F053', 'B053')
 order by tipdoc, numero;

-- eliminar de factcob
select *
  from factcob f
 where extract(year from f.fecha) = 2023
   and extract(month from f.fecha) = 6
   and f.serie_num in ('F053', 'B053')
 order by tipdoc, numero;

-- insert into pevisa.factcob ( cod_cliente, tipdoc, serie_num, numero, fecha, f_vencto, f_aceptacion
--                            , f_transfe, ano, mes, libro, voucher, item, tipo_referencia, serie_ref
--                            , nro_referencia, concepto, sistema_origen, vended, banco, l_agencia
--                            , l_refbco, l_condle, moneda, importe, tcam_imp, saldo, tcam_sal
--                            , numero_canje, estado, ctactble, importex, saldox, numero_factura_unix
--                            , cobrador, f_cobranza, cond_pag, fecha_origen, igv, gasban, f_incobrable
--                            , vended_origen, unidad_negocio, situacion, origen, imp_percep
--                            , por_percep, factor_dist)
-- values ( '10458799470', '01', 'F053', '5', date '2023-06-14', date '2023-06-14', date '2023-06-14'
--        , null, 2023, 6, null, null, null, 'P2', '24', '5', 'DIAZ CABREJOS SANDRA LISETH', 'VENT'
--        , '65', null, null, null, null, 'D', 315.00, 3.6480, 315.00, 3.6480, null, '0', '12122000'
--        , 0.00, 0.00, null, null, null, 'W', date '2023-06-14', null, null, null, null, null, null
--        , null, 0.00, 0.00, 1.000000);
