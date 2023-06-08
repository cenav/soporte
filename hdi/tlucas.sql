select *
  from movglos
 where ano = 2023
   and mes = 5
   and libro = '10'
   and voucher in (
   50096
   );

select *
  from movdeta
 where ano = 2023
   and mes = 5
   and libro = '10'
   and voucher in (
   33118
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
   and mes = 3
   and tipo = '2'
   and voucher = 33118;

select *
  from factpag
 where cod_proveedor = '20100047218'
   and tipdoc = '26'
   and serie_num = '001'
   and numero = '3894990';

select *
  from cabfpag
 where cod_proveedor = '20111435473'
   and tipdoc = '01'
   and serie_num = 'E001'
   and numero = '0001307';

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
  from plancta
 where cuenta = '1892';

select *
  from error_log
 order by id_log desc;

select pag.cod_proveedor, pag.tipdoc, pag.serie_num, pag.numero, pag.moneda
     , bco.cod_banco, bco.cod_prestamo, cuo.nro_cuota, pag.tcam_sal, pag.ctactble
     , bco.ano, bco.mes, bco.tipo, bco.voucher, cuo.fecha_vcto
     , pag.f_vencto, bco.cuenta_interes, cuo.importe_valor_cuota, cuo.importe_capital
     , cuo.importe_interes
     , abs(pag.saldo) as saldo
  from prestamo_banco bco
     , prestamo_banco_cuota cuo
     , factpag pag
 where bco.cod_banco = cuo.cod_banco
   and bco.cod_prestamo = cuo.cod_prestamo
   and bco.cod_proveedor = pag.cod_proveedor
   and bco.tipdoc = pag.tipdoc
   and cuo.serie_num = pag.serie_num
   and cuo.numero = pag.numero
   and pag.saldo * -1 > 0.01
   and bco.estado != '9'
   and bco.cod_tipo_prestamo = 'LS'
   and bco.cod_prestamo = '0057496'
   and cuo.nro_cuota = 39
--    and pag.f_vencto = p_fecha
   --AND      pag.f_vencto = TO_DATE('04/01/2021', 'DD/MM/YYYY')
 order by pag.f_vencto, pag.numero;

select *
  from prestamo_banco
 where cod_tipo_prestamo = 'LS'
   and cod_prestamo = '0057496';

select *
  from usuarios_libros
 where usuario = 'VCHIPANA';

select *
  from prestamo_banco
 where cod_prestamo = 'C-QUILLIN85K';

select *
  from planilla_cobranzas_h
 where numero_planilla = 1009155;

select *
  from caja_chica
 where serie = 4
   and numero = 23017;

select *
  from caja_chica_d
 where serie = 4
   and numero = 23017;

select *
  from factcob
 where numero = 960
   and tipdoc = '01'
   and serie_num = 'F060';