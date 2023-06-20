select *
  from movglos
 where ano = 2023
   and mes = 6
   and libro = '08'
   and voucher in (
   60072
   );

select *
  from movdeta
 where ano = 2023
   and mes = 6
   and libro = '08'
   and voucher in (
   60072
   );

select *
  from nrolibr
 where libro = '25'
   and ano = 2023
   and mes = 4;

select *
  from factpag
 where cod_proveedor = '99000038'
   and numero = '0000068-P1';

select *
  from plancta
 where cuenta in ('47112101', '18941100');

select *
  from movdeta
 where cuenta = '18941100';

select *
  from nrolibr
 where ano = 2023
   and libro = '25'
   and mes = 1;

begin
  pkg_cominac.genera_periodo(2022, 2, 'S');
end;

select cod_proceso
     , cod_concepto
     , cod_vendedor
     , tipodoc
     , nombre_doc
     , serie
     , numero
     , fecha
     , cod_cliente
     , nombre_cliente
     , item
     , cod_art
     , cod_lin
     , neto
     , soles
     , dolares
     , total_soles
     , total_dolares
     , cambio
     , total_cambio
     , porc_comision
     , comision
     , total_sin_igv
     , costo_soles
     , costo_dolares
     , cantidad
  from proceso_cominac_venta_det;

select *
  from pevisa.movglos
 where ano = 2023
   and mes = 2
   and libro = '08'
   and voucher in (
                   20398, 20399, 20400, 20401, 20402, 20403, 20405, 20406
   );

select *
  from gastos_de_viaje
 where id_vendedor = 'S3'
   and numero = 102;

select *
  from gastos_de_viaje_d
 where id_vendedor = 'S3'
   and numero = 102;

select *
  from centro_costo_motivo_viatico
 where cod_centro_costo = '02'
   and cod_motivo = '01';

select *
  from pla_control;

select *
  from plancta
 where cuenta = '69321104';

select *
  from gastos_de_viaje_habilitado_d
 where id_vendedor = 'S3'
   and numero = 102;

declare
  l_cuenta varchar2(30);
begin
  l_cuenta := fn_cuenta_contable_viatico('02', '08');
  dbms_output.put_line(l_cuenta);
end;

select *
  from prestamo_banco
 where cod_prestamo = '20123459';

select *
  from movfigl
 where ano = 2023
   and mes = 5
   and tipo = '5'
   and voucher = 50096;

select *
  from movfide
 where ano = 2023
   and mes = 5
   and tipo = '5'
   and voucher = 50096;

select *
  from factcob
 where cod_cliente = '20601149631'
   and tipdoc = '01'
   and serie_num = 'F051'
   and numero = '2487';

select *
  from factcob
 where cod_cliente = '20601149631'
   and tipdoc = 'A1'
   and serie_num = '1'
   and numero = '5600342';

select *
  from factpag
 where cod_proveedor = '20601149631'
   and tipdoc = '01'
   and serie_num = 'F051'
   and numero = '2278';

select *
  from cabfpag
 where cod_proveedor = '20111435473'
   and tipdoc = '01'
   and serie_num = 'E001'
   and numero = '0001307';

select *
  from factcob
 where serie_num = 'F051'
   and numero = '2278';

select *
  from cabfcob
 where serie_num = 'F051'
   and numero = '2278';

select *
  from movdeta
 where ano = 2023
   and mes = 3
   and libro = '09'
   and voucher = 93000601;

select *
  from prestamo_banco
 where cod_prestamo = '221213213';

select *
  from tab_bancos
 where cuenta_de_terceros = 'S'
 order by codigo_banco;

select *
  from tablas_auxiliares
 where codigo != '....'
   and tipo = '11'
 order by codigo;

select *
  from proveed
 where cod_proveed = '99000038';

select *
  from caja_chica
 where serie = 4
   and numero = 23007;

select *
  from factpag_canje
 where numero = '0000035';

select *
  from factpag_canje
 where nrocanje = '0000036';

select *
  from canjedoc_cpag;

select *
  from factpag
 where cod_proveedor = '99000038'
   and numero = '0000035';

select *
  from pagos_h
 where serie_planilla = 1
   and numero_planilla = 6727;

select *
  from pagos_i
 where serie_planilla = 1
   and numero_planilla = 6727;

select *
  from proveed
 where cod_proveed = '9900097';

select *
  from proveed_tipos_pedidos
 where cod_proveed = '9900097';

select *
  from caja_chica_d
 where serie = 4
   and numero = 23007;

select *
  from prestamo_banco
 where cod_prestamo = '0057496';

select *
  from factpag
 where cod_proveedor = '20111435473'
   and tipdoc = '01'
   and serie_num = 'E001'
   and numero = '0001307';

select *
  from cabfcob
 where tipdoc = '01'
   and serie_num = 'E001'
   and numero = '0001307';

select *
  from factpag
 where cod_proveedor = '20445396592'
--    and tipdoc = 'A1'
   and numero = '0000003';

select *
  from prestamo_banco
 where cod_prestamo = '3848548';

select *
  from nrolibr
 where ano = 2023
   and mes = 3
   and libro = '25';

select *
  from gastos_de_viaje
 where numero = 106
   and id_vendedor = 'H15';


select *
  from gastos_de_viaje_m
 where numero = 106
   and id_vendedor = 'H15';


select *
  from gastos_de_viaje_d
 where numero = 106
   and id_vendedor = 'H15';

select *
  from gastos_de_viaje_habilitado
 where numero = 106
   and id_vendedor = 'H15';

select *
  from gastos_de_viaje_habilitado_m
 where numero = 106
   and id_vendedor = 'H15';

select *
  from gastos_de_viaje_habilitado_d
 where numero = 106
   and id_vendedor = 'H15';

select *
  from kardex_d
 where extract(year from fch_transac) = 2023
   and cantidad = 0;

select * from paramin;

select *
  from factpag
 where tipdoc = '26'
   and numero = '19012023';

select *
  from factpag
 where tipdoc = '01'
   and serie_num = 'FQQ1'
   and numero = '0000427';

select *
  from planilla_cobranzas_h
 where numero_planilla = 1009325;

select *
  from factpag
 where numero = '0192521-1';

select *
  from logger_logs
 order by id desc;

select *
  from nrodoc
 where tipodoc in ('J1', 'J2');

select * from canjedoc_cpag;

select *
  from plancta
 where cuenta = '123104';

begin
  enviar_correo(
      msg_from => 'sistemas@pevisa.com.pe'
    , msg_to => 'cnavarro@pevisa.com.pe'
    , msg_subject => 'prueba talleres'
    , msg_text => 'pruebas'
    );
end;

select *
  from factpag
 where cod_proveedor = '99000038'
--    and tipdoc = '97'
   and numero = '0000053-P1';

select *
  from factpag
 where numero = '0000053-P1';

select *
  from movfide_situacion_banco
 where p_ano = 2023
   and p_mes = 5
   and cta_cte_banco = '0011-0949-01-00004585';

select *
  from usuarios_almacenes_perfil
 where usuario = 'JGARDOIS';

select *
  from recprov
 where tipodoc = 'RP'
   and numero = 2553;

select *
  from itemrec
 where tipodoc = 'RP'
   and numero = 2553;

select r.tipodoc || '-' || r.serie || '-' || r.numero as recibo, r.fecha
     , r.tip_doc_ref || '-' || ser_doc_ref || '-' || nro_doc_ref as referencia
     , decode(f.moneda, 'S', 'S/.', 'US$') as moneda, f.importe as pventa
     , sum(decode(r.moneda, 'S', i.importe, 0)) as importe_s
     , sum(decode(r.moneda, 'S', 0, i.importe)) as importe_d
     , sum(decode(r.moneda, 'S', i.imp_condona, 0)) as condona_s
     , sum(decode(r.moneda, 'S', 0, i.imp_condona)) as condona_d, t.descripcion as descvend
     , f.cod_cliente, r.tip_doc_canje || '-' || r.ser_doc_canje || '-' || r.nro_doc_canje as canje
  from recprov r
     , itemrec i
     , factcob f
     , tablas_auxiliares t
 where r.estado <> '9'
   and i.tipodoc = r.tipodoc
   and i.serie = r.serie
   and i.numero = r.numero
   and f.tipdoc = r.tip_doc_ref
   and f.serie_num = r.ser_doc_ref
   and f.numero = r.nro_doc_ref
   and t.tipo = 29
   and t.codigo = f.vended
   and r.tipodoc = 'RP'
   and r.numero = 2553
 group by r.tipodoc, r.serie, r.numero, r.fecha, f.moneda, f.importe, f.f_vencto, r.tip_doc_ref
        , r.ser_doc_ref, r.nro_doc_ref, r.dias_libre, f.vended, t.descripcion, f.cod_cliente
        , r.tip_doc_canje, r.ser_doc_canje, r.nro_doc_canje;


-- INSERT INTO PEVISA.ITEMREC (TIPODOC, SERIE, NUMERO, COD_ART, IMPORTE, IMP_CONDONA, CHECK_CONDONA, ULT_CALC_INT, PORVAL, VALOR, CREACION_QUIEN, CREACION_CUANDO, CREACION_DONDE) VALUES ('RP', 1, 2553, 'ND1', 93.7900, 0.0000, 'N', DATE '2023-06-15', 'P', 0.0006, 'RORELLANA', TIMESTAMP '2023-04-12 08:33:07', '25.0.3.85');
-- INSERT INTO PEVISA.ITEMREC (TIPODOC, SERIE, NUMERO, COD_ART, IMPORTE, IMP_CONDONA, CHECK_CONDONA, ULT_CALC_INT, PORVAL, VALOR, CREACION_QUIEN, CREACION_CUANDO, CREACION_DONDE) VALUES ('RP', 1, 2553, 'ND2', 94.4700, 0.0000, 'N', null, 'V', 0.0000, 'RORELLANA', TIMESTAMP '2023-04-12 08:33:07', '25.0.3.85');
-- INSERT INTO PEVISA.ITEMREC (TIPODOC, SERIE, NUMERO, COD_ART, IMPORTE, IMP_CONDONA, CHECK_CONDONA, ULT_CALC_INT, PORVAL, VALOR, CREACION_QUIEN, CREACION_CUANDO, CREACION_DONDE) VALUES ('RP', 1, 2553, 'ND3', 10.0000, 0.0000, 'N', null, 'V', 10.0000, 'RORELLANA', TIMESTAMP '2023-04-12 08:33:07', '25.0.3.85');

select *
  from movfide_situacion_banco
 where ano = 2023
   and mes = 5
   and voucher = 50240;

