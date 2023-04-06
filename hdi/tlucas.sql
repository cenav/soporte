select *
  from movglos
 where ano = 2023
   and mes = 1
   and libro = '25'
   and voucher in (10030);

select *
  from movdeta
 where ano = 2023
   and mes = 1
   and libro = '25'
   and voucher in (10030);

select *
  from usuarios_tipos
 where usuario = 'ECHINCHA';

select *
  from orden_de_compra
 where serie = 13
   and num_ped = 7126;

select *
  from itemord
 where serie = 13
   and num_ped = 7126;

select * from paramlg;

select * from proceso_cominac;

select *
  from proceso_cominac_venta_det
 where cod_proceso = 01939
   and cod_concepto = 2;

select *
  from cominac_concepto
 where cod_concepto in (1, 2);

select *
  from gastos_de_viaje
 where id_vendedor = 'H3'
   and numero = 141;

select *
  from gastos_de_viaje_d
 where id_vendedor = 'H3'
   and numero = 141;

select *
  from nrolibr
 where ano = 2023
   and libro = '25'
   and mes = 1;

begin
  pkg_cominac.genera_periodo(2022, 2, 'S');
end;

select cod_proceso, cod_concepto, cod_vendedor, tipodoc, nombre_doc, serie, numero, fecha
     , cod_cliente, nombre_cliente, item, cod_art, cod_lin, neto, soles, dolares, total_soles
     , total_dolares, cambio, total_cambio, porc_comision, comision, total_sin_igv, costo_soles
     , costo_dolares, cantidad
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

select * from pla_control;

select * from plancta where cuenta = '69321104';

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
   and mes = 2
   and tipo = '2'
   and voucher = 23187;

select *
  from movfide
 where ano = 2023
   and mes = 2
   and tipo = '2'
   and voucher = 23187;

select *
  from movdeta
 where ano = 2023
   and mes = 1
   and libro = '10'
   and voucher = 21307101;

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

select * from canjedoc_cpag;

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
  from movfigl
 where ano = 2023
   and mes = 1
   and tipo = '3'
   and voucher = 10005;

select *
  from movfide
 where ano = 2023
   and mes = 1
   and tipo = '3'
   and voucher = 10005;

select *
  from factpag
 where cod_proveedor = '99000038'
   and tipdoc = '26'
   and numero = '19012023';