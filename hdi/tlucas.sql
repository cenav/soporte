select *
  from movglos
 where ano = 2023
   and mes = 7
   and libro = '46'
   and voucher in (
   70014
   );


select *
  from movdeta
 where ano = 2023
   and mes = 5
   and libro = '48'
   and voucher in (
   50020
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
   and mes = 6
   and tipo = '5'
   and voucher = 60008;

select *
  from movfide
 where ano = 2023
   and mes = 6
   and tipo = '5'
   and voucher = 60270;

select *
  from factcob
 where tipdoc = '01'
   and serie_num = 'E001'
   and numero = '271';

select *
  from factcob
 where cod_cliente = '20601149631'
   and tipdoc = '01'
   and serie_num = 'F051'
   and numero = '271';

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
 where cod_proveedor = '20100084768'
   and tipdoc = '01'
   and serie_num = 'E001'
   and numero = '0001307';

-- junio cancelacion
select *
  from cabfpag
 where ano = 2023
   and mes = 6
   and libro = '39'
   and voucher = 60001;

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
   and p_mes = 6
   and cta_cte_banco = '000-1820592'
   and voucher = '60001';

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

select *
  from planilla_cobranzas_h
 where numero_planilla = 5600411;

select *
  from planilla_cobranzas_i
 where numero_planilla = 5600411;

select *
  from planilla_cobranzas_d
 where numero_planilla = 5600411;

select *
  from factcob
 where tipdoc = 'A1'
   and numero = '5600411';

select codigo, descripcion
  from tablas_auxiliares
 where tipo = 40
   and indicador3 = 'V'
 order by codigo;

select *
  from tablas_auxiliares
 where tipo = 40
   and codigo in (
                  'J1', 'LC', 'LD', 'L1', '01'
   )
 order by codigo;

select *
  from nrodoc
 where tipodoc = 'FD';

select operacion, tipdoc, codigo, operacion_ant
  from tipo_operacion_h
 where tipdoc = 'L1'
--    and codigo = :cabe1.banco
 order by operacion, tipdoc;

select * from docuvent;

select * from modulo where descripcion like '%COMISION%';

select * from usuario_modulo where usuario = 'KJAUREGUI';

select *
  from vendedores
 order by cod_vendedor;

select * from modulo;

select *
  from usuario_modulo
 where usuario = 'YYOVERA';

select *
  from movglos
 where ano = 2023
   and mes = 7;

select * from kardex_g_guia_remision;

select *
  from planilla_cobranzas_h
 where numero_planilla = 5600349;

select p.numero_planilla, p.estado, p.voucher_c
  from planilla_cobranzas_h p
 where p.estado <> 9
   and p.numero_planilla = 5600349
   and (p.voucher_c is null or
        exists(
          select *
            from movfigl g
           where g.ano = p.aaaa_c
             and g.mes = p.mm_c
             and g.tipo = p.tipo_c
             and g.voucher = p.voucher_c
             and g.estado = '9'
          )
   )
 order by numero_planilla desc;

select *
  from usuarios_libros
 where usuario = 'YYOVERA';

select *
  from movfide_situacion_banco
 where p_ano = 2023
   and p_mes = 6
   and cta_cte_banco = '191-7394276-1-64'
   and voucher = '60065';

select * from modulo;

select *
  from usuario_modulo
 where modulo = 'COMISIONES';

select *
  from movglos
 where ano = (
   select ano_cont
     from paramco
   )
   and mes in (
   select distinct mes
     from view_mes_libro_a_descont
   )
   and libro in (
   select distinct v.libro
     from view_mes_libro_a_descont v
    where v.mes = movglos.mes
   )
   and estado = 1
   and ano = 2023
   and mes = 7
   and voucher = 70014;

select *
  from movglos
 where estado = '0'
   and ((nvl(pase_cta_cte_pro, 'N') = 'N'
   and nvl(pase_ctacte, 'N') = 'N'
          )
   or not exists (
     select 1
       from movdeta b
      where b.ano = movglos.ano
        and b.mes = movglos.mes
        and b.libro = movglos.libro
        and b.voucher = movglos.voucher
     ))
   and ((ano > to_number(:ano))
   or (ano = to_number(:ano)
     and mes >= to_number(:mes))
   );

select *
  from nrodoc
 where tipodoc = '01';

select profile, limit
  from dba_profiles
 where resource_name = 'IDLE_TIME';

select profile
  from dba_users
 where username = 'EMESTANZA';


select *
  from docuvent
 where tipodoc = '07'
--    and serie = 'F055'
   and numero = 3153;

select *
  from modulo
 where id_modulo = 'CIERRA_MES';

select *
  from usuario_modulo
 where usuario = 'ABAILON';

select *
  from caja_chica
 where serie = 4
   and numero = 23034;

select *
  from exfacturas
 where extract(year from fecha) = 2023;

select *
  from docuvent
 where serie = 'F055'
   and numero = '14556';

select *
  from factcob
 where serie_num = 'F055'
   and numero = '14556';

select *
  from docuvent
 where tipodoc = '07'
   and numero = '61240';

select *
  from saldo_banco
 order by fecha desc;

select * from vw_saldo_banco_mail;

declare
  l_fecha varchar2(30);
begin
  l_fecha := to_char(pkg_saldo_banco.ultima_fecha_carga(), 'DD/MM/YYYY');
  dbms_output.put_line(l_fecha);
end;

select *
  from movfigl
 where ano = 2023
   and mes = 8
   and tipo = '9'
   and voucher = 80002;

select *
  from movfide
 where ano = 2023
   and mes = 8
   and tipo = '9'
   and voucher = 80002;

select *
  from docuvent
 where tipodoc = '07'
   and serie = 'F051'
   and numero in (151, 152);


select *
  from itemdocu
 where tipodoc = '07'
   and serie = 'F051'
   and numero in (151, 152);


select *
  from lotes_envio_sunat
 where numero_lote between to_number(to_char(sysdate, 'RR')) * 10000 and to_number(to_char(sysdate, 'RR')) * 10000 + 9999
   and usuario_confirma_pago is null;


select *
  from lotes_envio_sunat
 where numero_lote = 230087;


insert into pevisa.lotes_envio_sunat ( numero_lote, fecha_envio, usuario_genera
                                     , numero_registros_lote, importe_total_lote, periodo_tributario
                                     , usuario_confirma_pago, fecha_confirma_pago, serie_planilla
                                     , numero_planilla)
values (230087, timestamp '2023-10-05 10:17:18', 'ECHINCHA', 1, 17, 202309, null, null, 1, 7092);


select *
  from orden_de_compra
 where serie = 13
   and num_ped = 7594;

select f.cod_cliente
     , l.nombre
     , f.vended
     , substr(abreviada, 1, 3) as destip
     , f.tipdoc
     , f.serie_num
     , f.numero
     , f.tcam_sal
     ,
    to_char(f.ano) || ' ' || to_char(f.mes) || ' ' || f.libro || ' ' || to_char(f.voucher) as amlv
     , f.tipo_referencia || ' ' || f.serie_ref || ' ' || f.nro_referencia as refe
     , f.fecha
     , f.f_vencto
     , f.moneda
     , decode(f.moneda, 'S', f.importe, 0) as imps
     , decode(f.moneda, 'D', f.importe, 0) as impd
     , nvl(sum(decode(f.moneda, 'S', decode(c.moneda, 'S', c.importe, c.importe_x),
                      decode(c.moneda, 'D', c.importe, c.importe_x))), 0) as pago
     , decode(f.moneda, 'S',
              (f.importe + nvl(sum(decode(c.moneda, 'S', c.importe, c.importe_x)), 0)), 0) as sals
     , decode(f.moneda, 'D',
              (f.importe + nvl(sum(decode(c.moneda, 'D', c.importe, c.importe_x)), 0)), 0) as sald
  from factcob f
     , cabfcob c
     , clientes l
     , tablas_auxiliares t
 where f.tipdoc = c.tipdoc(+)
   and f.serie_num = c.serie_num(+)
   and f.numero = c.numero(+)
   --AND      f.fecha <= &p_fecha_fin1
   and f.fecha <= to_date('20/06/2023', 'dd/mm/yyyy') --&p_fecha_fin1
   --AND      c.fecha(+) <= &p_fecha_fin2
   and c.fecha between to_date('21/08/2023', 'dd/mm/yyyy') and to_date('20/10/2023', 'dd/mm/yyyy')
   and l.cod_cliente = f.cod_cliente
   and f.tipdoc in ('01', '03', '07', '08', 'C2', 'C3', 'LP')
   and t.tipo = 02
   and t.codigo = f.tipdoc
   and f.vended = '24'--&p_cod_vend
   and not exists
   (
     select 1
       from documento_excluido_bono exc
      where exc.tipodoc = f.tipdoc
        and exc.serie = f.serie_num
        and exc.numero = f.numero
        and exc.proceso_exclusion in ('COMISION', 'TODO')
     )
having (f.importe
  + nvl(sum(decode(f.moneda, 'S', decode(c.moneda, 'S', c.importe, c.importe_x),
                   decode(c.moneda, 'D', c.importe, c.importe_x))), 0)) <>
       0
 group by f.cod_cliente, l.nombre, f.vended
        , substr(abreviada, 1, 3), f.tipdoc, f.serie_num
        , f.numero, f.tcam_sal,
     to_char(f.ano) || ' ' || to_char(f.mes) || ' ' || f.libro || ' ' || to_char(f.voucher)
        , f.tipo_referencia || ' ' || f.serie_ref || ' ' || f.nro_referencia, f.fecha, f.f_vencto
        , f.moneda, f.importe, f.tcam_imp
 order by f.vended, f.tipdoc, f.fecha, f.f_vencto;


select *
  from pagos_h
 where fecha = to_date('13/11/2023', 'dd/mm/yyyy');

select *
  from pagos_h
 where serie_planilla = 3
   and numero_planilla = 855;

select *
  from pagos_h
 where serie_planilla = 3
   and numero_planilla in (
                           000855, 000763, 000745, 000727, 000678, 000670
   );

select * from docuvent;