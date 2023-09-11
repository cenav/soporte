select *
  from movglos
 where ano = 2023
   and mes = 6
   and libro = '08'
   and voucher in (
   80002
   );

-- 11/05/2023
select *
  from movdeta
 where ano = 2023
   and mes = 3
   and libro = '25'
   and voucher in (
   30027
   );

select *
  from movglos_anexos
 where ano = 2023
   and mes = 5
   and libro = '08'
   and voucher in (
                   50057, 50048
   );

select *
  from factpag
 where cod_proveedor = '20100053455'
   and numero = '20126815-1';

-- 2023	5	08	50057	42121000	V		20606109343	01	0005465	2023-05-11	EVENTO DIA DE LA MADRE	0.00	66.00	0.00	17.94	0	5	N	CCALLE	2023-05-19 14:00:09	TRAN	F041		3.6780

select *
  from movdeta
 where ano = 2023
   and libro = '60'
   and tipo_referencia = '07'
   and nro_referencia in (
   '90'
   )
   and relacion = '20510990448';

select *
  from factcob
 where cod_cliente = '20430500521'
   and numero = '0029';

select *
  from factcob
 where cod_cliente = '20510990448'
   and nro_referencia = '90';

select *
  from factpag
 where cod_proveedor = '93590880'
   and numero in ('0000077');

select *
  from plancta
 where cuenta = '42122300';

select *
  from plancta
 where cuenta in ('77611101', '93611101');

-- 77611101
-- 93611101

select *
  from plancta
 where descripcion like '%cambio%';

select sign(-7000) as negativo, sign(0) as cero, sign(3000) as positivo
  from dual;

select *
  from cominac_concepto
 where cod_concepto = '173';

create public synonym cominac_filtro for cominac_filtro;

select *
  from docuvent
 where cod_vende = '20'
   and fecha > to_date('01/12/2022', 'dd/mm/yyyy');

select *
  from proceso_cominac;

select *
  from proceso_cominac_concepto;

select *
  from proceso_cominac_venta_det;

-- select case :p_moneda when 'S' then nvl(sum(total_soles), 0) else nvl(sum(total_dolares), 0) end
--   from vw_venta_detalle
--  where ((:cod_tipo_venta = 'INDI'
--    and cod_vende = :p_cod_vendedor)
--    or (:cod_tipo_venta = ''
--      and cod_vende like '%')
--    or (:cod_tipo_venta = ''
--      and cod_vende in (
--        select cod_vendedor
--          from cominac_concepto_venta_grupal
--         where cod_concepto = :cod_concepto
--        )))
--    and fecha between to_date('21/12/2022', 'dd/mm/yyyy') and to_date('20/01/2023', 'dd/mm/yyyy')
--    and ((:lineas = 'TODO'
--    and nvl(cod_lin, '000') like '%')
--    or (:lineas = 'ESTABLECIDO'
--      and cod_lin in (
--        select cod_linea
--          from cominac_concepto_linea
--         where cod_concepto = :cod_concepto
--        ))
--    or (:lineas = 'GRUPO'
--      and cod_lin in (
--        select l.linea
--          from cominac_concepto_grupo g
--               join tab_lineas l on g.cod_grupo = l.grupo
--         where g.cod_concepto = :cod_concepto
--        ))
--    or (:lineas = 'MEGAGRUPO'
--      and cod_lin in (
--        select l.linea
--          from cominac_concepto_megagrupo g
--               join tab_grupos r on g.cod_megagrupo = r.ind_vta1
--               join tab_lineas l on r.grupo = l.grupo
--         where g.cod_concepto = :cod_concepto
--        ))
--    or (:lineas = 'SERIE'
--      and serie in (
--        select serie
--          from cominac_concepto_serie
--         where cod_concepto = :cod_concepto
--        ))
--    or (:lineas = 'INDICADOR'
--      and indicador in (
--        select indicador
--          from cominac_concepto_indicador
--         where cod_concepto = :cod_concepto
--        )))
--    and (cod_cliente in (
--    select cod_cliente
--      from cominac_concepto_cliente
--     where cod_concepto = :cod_concepto
--    ) or (
--           select count(*) from cominac_concepto_cliente where cod_concepto = :cod_concepto
--           ) = 0)
--    and cod_cliente not in (
--    select cod_cliente
--      from cominac_concepto_excluye_clie
--     where cod_concepto = :cod_concepto
--    )
--    and cod_lin not in (
--    select x.cod_linea
--      from cominac_excluye_linea x
--     where x.cod_concepto = :cod_concepto
--    );

select cod_cliente
  from cominac_concepto_cliente
 where cod_concepto = :cod_concepto;

select *
  from proceso_cominac_venta_det
 where cod_proceso = 1904
   and cod_concepto = 1;


select *
  from pevisa.movdeta
 where nro_referencia = '0076761';

select *
  from movdeta
 where tipo_referencia = '91';

select *
  from pla_control;

select *
  from pevisa.gastos_de_viaje_habilitado
 where id_vendedor = '65'
   and numero = 171;

select *
  from pevisa.gastos_de_viaje_habilitado
 where id_vendedor = '65'
   and numero = 171;

select *
  from pevisa.gastos_de_viaje_habilitado
 where id_vendedor = '65'
   and numero = 171;

select *
  from pevisa.gastos_de_viaje_habilitado_m
 where id_vendedor = '65'
   and numero = 171;

select *
  from pevisa.gastos_de_viaje_habilitado_d
 where id_vendedor = '65'
   and numero = 171;

select *
  from pevisa.gastos_de_viaje
 where id_vendedor = '65'
   and numero = 179;

select *
  from pevisa.gastos_de_viaje_m
 where id_vendedor = '65'
   and numero = 171;

select *
  from pevisa.gastos_de_viaje_d
 where id_vendedor = '65'
   and numero = 171;

select *
  from prestamo_banco
 where cod_prestamo = '20126815-1';

select *
  from tab_bancos
 where codigo_banco = '04';

select *
  from ctabnco
 where banco = '04';

select *
  from prestamo_banco_cuota
 where cod_prestamo = '0003CM5';

insert into prestamo_banco
select cod_banco
     , '0003CM5'
     , fecha
     , estado
     , importe_prestamo
     , moneda
     , tasa_interes
     , cod_tipo_prestamo
     , ano
     , mes
     , tipo
     , voucher
     , item
     , asiento_generado_quien
     , asiento_generado_cuando
     , cod_derivado
     , debito_auto
     , contrato
     , cod_proveedor
     , tipdoc
     , importe_neto
     , tasa_igv
     , contrato_derivado
     , cod_penalidad
     , estructuracion
     , cod_interes_leasing
     , cod_motivo
     , nombre_archivo
     , cod_unidad_negocio
  from prestamo_banco
 where cod_prestamo = '0001CM5';

insert into prestamo_banco_cuota
select cod_banco
     , '0003CM5'
     , nro_cuota
     , fecha_vcto
     , importe_saldo_capital
     , importe_capital
     , importe_interes
     , importe_cuota
     , serie_num
     , numero
     , importe_portes
     , importe_igv
     , importe_comision
     , importe_gastos
     , importe_valor_cuota
     , tipdoc_cp
     , serie_cp
     , numero_cp
     , fecha_debito_banco
     , importe_capital_real
     , importe_interes_real
     , importe_valor_cuota_real
     , importe_portes_real
     , importe_igv_real
     , importe_comision_real
     , importe_gastos_real
     , importe_cuota_real
     , opcion_de_compra
  from prestamo_banco_cuota
 where cod_prestamo = '0001CM5';

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
  from factcob
 where cod_cliente = '20511623660'
   and tipdoc = 'LC'
   and numero = '57278';


select *
  from factpag
 where cod_proveedor = '20609623277'
--    and serie_num = '0000'
   and numero = '0001CM8';

select *
  from articul
 where cod_art = 'SERV_HD';

select *
  from caja_chica
 where numero = 23029;

select *
  from caja_chica_d
 where numero = 23029;

select *
  from pevisa.gastos_de_viaje
 where id_vendedor = '67'
   and numero = 143;

select *
  from pevisa.gastos_de_viaje
 where id_vendedor = '67'
   and numero = 143;

select *
  from factcob
 where tipdoc = 'A1'
   and serie_num = '1'
   and numero = '0000003';

select *
  from cabfcob
 where tipdoc = 'A1'
   and serie_num = '1'
   and numero = '0000004';

select *
  from prestamo_banco
 where cod_prestamo = '3848548';

select *
  from pevisa.plancta
 where cuenta = '37312100';

select *
  from pevisa.plancta
 where cuenta like '37%';

select codigo, descripcion, indicador1
  from tablas_auxiliares
 where tipo = '33'
   and codigo like 'F%';

select codigo, descripcion, indicador1
  from tablas_auxiliares
 where tipo = '33'
   and codigo like 'F0';

-- Vulcano Nº 210 – Ate

select nro_sucur, direccion
  from sucursales
 where cod_cliente in (
   select c_empleador
     from pla_control
   );

select *
  from sucursales
 where cod_cliente = '20610114041';

select *
  from cominac_concepto
 where cod_concepto = 363;

select *
  from pevisa.cominac_concepto
 where cod_concepto in (361, 362, 364, 365, 366);

select *
  from proceso_cominac
 where periodo_ano = 2023
   and periodo_mes = 2;

select *
  from pevisa.tab_grupos
 where grupo = '138';

select *
  from vendedores
 where cod_vendedor = 'H14';

select *
  from vw_cominac_consulta;

select *
  from lg_factura_comercial
 where numero_embarque = 40;

select *
  from importacion_registro_facturas
--  where :FACTURA_COMERCIAL.cod_proveed_grupo = :SELECCION.codigo_proveedor
 where cod_proveed = '99000032'
   and numero = 'IN076761'
   and voucher is null;

select *
  from pevisa.proveed
 where nombre like '%HARTRIDGE%';

select *
  from pevisa.paramin;


select f.cod_proveedor
     , l.nombre
     , f.concepto
     , substr(t.abreviada, 1, 3) as abre
     , f.tipdoc || ' ' || f.serie_num || ' ' || f.numero as doc
     ,
    to_char(f.ano) || ' ' || to_char(f.mes) || ' ' || f.libro || ' ' || to_char(f.voucher) as amlv
     , f.tipo_referencia || ' ' || f.serie_ref || ' ' || f.nro_referencia as refe
     , f.fecha
     , f.f_vencto
     , decode(f.moneda, 'S', 'S/.', 'US$') as mon
     , f.pventa as importf
     , f.tcam_sal
     , f.pventax
     , f.pventa + nvl(sum(decode(c.moneda, 'D', c.importe, c.importe_x)), 0) as saldo_d
     , round(
    ((f.pventa + nvl(sum(decode(c.moneda, 'D', c.importe, c.importe_x)), 0)) * f.tcam_sal),
    2) as saldo_en_soles
     , f.moneda
     , f.tcam_sal
     , f.tipdoc
     , f.numero
     , f.ctactble
  from factpag f
     , cabfpag c
     , proveed l
     , tablas_auxiliares t
 where f.cod_proveedor like :PRO
   and ((f.ano * 100) + f.mes) <= ((:P_ANO * 100) + :P_MES)
   and f.tipdoc like :PROV
   and c.tipdoc(+) = f.tipdoc
   and c.serie_num(+) = f.serie_num
   and c.numero(+) = f.numero
   and ((c.ano(+) * 100) + c.mes(+)) <= ((:P_ANO * 100) + :P_MES)
   and c.cod_proveedor(+) = f.cod_proveedor
   and l.cod_proveed = f.cod_proveedor
   and t.tipo(+) = 02
   and t.codigo(+) = f.tipdoc
   and f.ctactble like :P_CUENTA
having (f.pventa + nvl(sum(decode(f.moneda, 'S', decode(c.moneda, 'S', c.importe, c.importe_x),
                                  decode(c.moneda, 'D', c.importe, c.importe_x))), 0)) <> 0
 group by f.ctactble, f.cod_proveedor, l.nombre, f.concepto, substr(t.abreviada, 1, 3)
        , f.tipdoc || ' ' || f.serie_num || ' ' || f.numero,
     to_char(f.ano) || ' ' || to_char(f.mes) || ' ' || f.libro || ' ' || to_char(f.voucher)
        , f.tipo_referencia || ' ' || f.serie_ref || ' ' || f.nro_referencia, f.fecha, f.f_vencto
        , decode(f.moneda, 'S', 'S/.', 'US$'), f.pventa, f.pventax, f.moneda, f.tcam_sal, f.tipdoc
        , f.numero
 order by f.ctactble, l.nombre, f.tipdoc || '-' || f.numero;

select *
  from pevisa.factpag
 where cod_proveedor = '20524801591'
   and numero = '0000213';
--    and serie_num = '001';
--    and tipdoc = '03';

select *
  from ctabnco_parametros
 where id_cuenta = '11';

select *
  from ctabnco_unidad_de_negocio
 where codigo_unidad_negocio = '01';

select *
  from orden_de_venta
 where numero = 6738;

select *
  from orden_de_venta_historia
 where numero = 6738;

select *
  from lg_factura_comercial
 where numero_embarque = 54;

alter user pevisa identified by "hdi4041";

select *
  from pla_control;

select *
  from kardex_g
 where cod_alm = 'FQ'
   and tp_transac = '21'
   and serie = 81
   and numero = 864;

select *
  from kardex_d
 where cod_alm = 'FQ'
   and tp_transac = '21'
   and serie = 81
   and numero = 864;

select *
  from paramin;

select *
  from gastos_de_viaje_motivos
 order by cod_motivo;

select *
  from nrolibr
 where ano = 2023
   and mes = 1;

select *
  from nrolibr
 where ano = 2022
   and mes = 12;

select *
  from vw_personal;

select *
  from lg_factura_comercial
 where numero_embarque = 54;

select *
  from articul
 where cod_art in (
   'HDI-01-01-01-06-02-07'
   );

select *
  from pcarticul
 where cod_art in (
   'HDI-01-01-01-06-02-07'
   );

select *
  from pcarticul
 where cod_art like 'HDI-01%';

select *
  from tmp_inve_val
 where cod_art in (
   'HDI-01-01-01-06-02-07'
   );

select nvl(a.cta, '20') as cta
     , l.descripcion as des_cuenta
     , t.cod_lin as cod_lin
     , t.cod_art
     , sum(decode(tipo, 0, totalr, 0)) as stk_ini
     , sum(decode(tipo, 1, totalr, 0)) as compras
     , sum(decode(tipo, 2, totalr, 0)) as ot_ingre
     , sum(decode(tipo, 3, totalr, 0)) as sal_vta
     , sum(decode(tipo, 4, totalr, 0)) as sal_consu
     , sum(decode(tipo, 5, totalr, 0)) as devol
     , sum(decode(tipo, 6, totalr, 0)) as transfer
     , sum(decode(tipo, 7, totalr, 0)) as mermas
     , sum(decode(tipo, 8, totalr, 0)) as ot_salidas
     , sum(decode(tipo, 0, totalr, 0)) +
       sum(decode(tipo, 1, totalr, 0)) +
       sum(decode(tipo, 2, totalr, 0)) -
       sum(decode(tipo, 3, totalr, 0)) -
       sum(decode(tipo, 4, totalr, 0)) +
       sum(decode(tipo, 5, totalr, 0)) -
       sum(decode(tipo, 6, totalr, 0)) -
       sum(decode(tipo, 7, totalr, 0)) -
       sum(decode(tipo, 8, totalr, 0)) as total
     , descri_linea
  from tmp_inve_val t
     , pcarticul a
     , plancta l
 where usuario = user
   and a.cod_art(+) = t.cod_art
   and l.cuenta(+) = a.cta
 group by nvl(a.cta, '20'), l.descripcion, t.cod_lin, t.cod_art, descri_linea
 order by 1, 2, 3;

select *
  from plancta
 where cuenta like '335%';

select *
  from activo_fijo
 where cod_activo_fijo = 'HDI-01-01-01-06-02-07';

select *
  from usuario_modulo
 where usuario = 'EMESTANZA';

select *
  from cotizacion;

select *
  from pedido
 where num_ped = 2361
   and serie = 20;

select *
  from kardex_d
 where extract(year from fch_transac) = 2023
   and cantidad = 0;

select h.*
  from planilla_cobranzas_h h
 where numero_planilla in (
   1009325
   );

select d.*
  from planilla_cobranzas_d d
 where numero_planilla in (
   5610641
   );

select *
  from factpag
 where tipdoc = '01'
   and serie_num = 'F052'
   and numero = '0000596';

select *
  from gastos_de_viaje
 where numero = 102
   and id_vendedor = 'C2';

select *
  from gastos_de_viaje_habilitado
 where numero = 102
   and id_vendedor = 'C2';



select *
  from vendedores
 where cod_vendedor = 'C2';


select *
  from movglos
 where ano = 2023
   and mes = 4
   and libro = '08'
   and voucher in (40183);

select *
  from movdeta
 where ano = 2023
   and mes = 4
   and libro = '08'
   and voucher in (40183);

select *
  from planilla_cobranzas_h
 where numero_planilla = 5610550;

select *
  from nrodoc
 where tipodoc = 'DT';

select *
  from plancta
 where cuenta = '12121003';

select *
  from factpag
 where numero = '00216831-1';

select *
  from docuvent
 where tipodoc = '01'
   and serie = 'F091'
   and numero = '336';

select *
  from itemdocu
 where tipodoc = '01'
   and serie = 'F091'
   and numero = '336';

select *
  from itemdocu
 where tipodoc = '01'
   and serie = 'F081'
   and numero = '1752';

select *
  from factcob
 where tipdoc = 'A1'
   and serie_num = '1'
   and numero = '0000009';

select *
  from factpag
 where serie_num = 'E001'
   and numero = '0000011';

select *
  from movdeta
 where tipo_referencia = '01'
   and serie = 'F081'
   and nro_referencia = '1752';

select col_compras, auto_mas
  from plancta
 where cuenta = '12212300';

select *
  from nrodoc
 where tipodoc = 'DT'
   and serie = 2;

select *
  from plancta
 where cuenta = '12122003';

select *
  from plancta
 where descripcion like '%traccion%';

-- 12121003
select *
  from factcob
 where tipdoc = 'DT'
   and serie_num = 2
   and numero = 19;



select *
  from ctabnco
 where codigo = 53;

select *
  from movfigl
 where ano = 2023
   and mes = 4
   and tipo = '5'
   and voucher = 40463;

select *
  from planilla_cobranzas_d
 where numero_planilla = 5610799;

select *
  from vendedores
 where cod_vendedor = '24';


select *
  from movfide_situacion_banco
 where p_ano = 2023
   and p_mes = 6
   and cta_cte_banco = '191-7394276-1-64';

select estado
  from salcaj
 where ano = 2023
   and mes = 5
   and cuenta = '19';


select *
  from salcaj
 where ano = 2023
   and mes = 3
   and cuenta = '19';

select *
  from ctabnco
 where codigo in ('09', '10');

select *
  from saldo_banco
 where cod_ctabnco in ('09', '10')
 order by fecha;

select *
  from movglos
 where ano = 2023
   and mes = 3
   and libro = '60'
   and voucher = 30233;

select *
  from movdeta
 where ano = 2023
   and mes = 3
   and libro = '60'
   and voucher = 30233;

select *
  from movdeta
 where cuenta = '10412002';

select *
  from factcob
 where serie_num = '2'
   and numero = '106';

select * from tab_grupos;

select *
  from tab_lineas
 where linea like 'D53%';

select *
  from lpred_fam;

select *
  from vendedores
 where cod_vendedor = '27';

select *
  from nrodoc
 where tipodoc = 'J1';

select *
  from prestamo_banco
 where cod_prestamo = '3848548';

select *
  from kardex_g_historia
 where serie = 91
   and numero = 398;

select *
  from pedido
 where num_ped = 2762;

select *
  from kardex_g
 where serie = 91
   and numero = 390;

select *
  from relacion
 where serie = 91
   and numero = 390;

select *
  from kardex_g
 where estado not in ('6', '9')
   and tip_doc_ref = 'P2'
   and ser_doc_ref = '20'
   and nro_doc_ref = '2763';

select *
  from kardex_d
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 91
   and numero = 399;

select *
  from kardex_g
 where ser_doc_ref = '20'
   and nro_doc_ref = '2763';


select *
  from kardex_g_historia
 where glosa like '%ESTADO%';


select *
  from kardex_g_historia
 where tipo_evento like '%ESTADO%';


select *
  from kardex_g_historia
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 91
   and numero = 399;

select *
  from kardex_g_historia
 where glosa is not null;

select *
  from error_log
 order by id_log desc;

select *
  from usuarios_libros
 where usuario = 'RORELLANA';

select * from nrolibr;

select * from nrolibr;

select *
  from letras
 where nrolet = 1198;

select *
  from factcob
 where numero = 1198
   and cod_cliente = '20607365351';

select pag.cod_proveedor, pag.tipdoc
     , pag.serie_num, pag.numero
     , pag.moneda, nvl(mvf.banco, '01') as banco
     , bco.cod_banco, pag.tcam_sal
     , pag.ctactble, bco.ano
     , bco.mes, bco.tipo
     , bco.voucher, nvl(cuo.importe_interes, 0) + nvl(cuo.importe_comision, 0) +
                    nvl(cuo.importe_gastos, 0) as interes
     , abs(pag.saldo) as saldo
     , bco.cod_unidad_negocio
  from prestamo_banco bco
     , prestamo_banco_cuota cuo
     , factpag pag
     , movfigl mvf
 where bco.cod_banco = cuo.cod_banco
   and bco.cod_prestamo = cuo.cod_prestamo
   and bco.cod_proveedor = pag.cod_proveedor
   and bco.tipdoc = pag.tipdoc
   and cuo.serie_num = pag.serie_num
   and cuo.numero = pag.numero
   and bco.ano = mvf.ano(+)
   and bco.mes = mvf.mes(+)
   and bco.tipo = mvf.tipo(+)
   and bco.voucher = mvf.voucher(+)
   and pag.f_vencto = to_date('15/05/2023', 'dd/mm/yyyy')
   and bco.cod_tipo_prestamo not in ('LS', 'TR')
   and pag.saldo != 0;

select *
  from plancta
 where cuenta = '93941000';

select *
  from unidad_negocio_cuenta
 where cod_tipo = 'OTRAS_CARGAS_FINANCIERAS';

select cuenta
  from ctabnco
 where banco = '02'
   and moneda = 'D'
   and cod_proveedor is not null;

select *
  from ctabnco
 where banco = '02'
   and moneda = 'D';

select * from ctabnco where cod_proveedor is not null;

select *
  from proveed
 where nombre like '%CREDITO%';

select *
  from usuarios_tipos
 where usuario = 'SCASTRO';

select operacion, tipdoc, codigo, operacion_ant
  from tipo_operacion_h
 where tipdoc = 'L1'
   and codigo = '13'
 order by operacion, tipdoc;

select descripcion, indicador1
  from tablas_auxiliares
 where tipo = 90
   and codigo = 'CC';

select *
  from usuarios_libros
 where usuario = 'VCHIPANA';

select *
  from factpag
 where numero = '35466026-1'
   and serie_num = '001';

select *
  from prestamo_banco
 where cod_prestamo = '35466026-1';

select *
  from error_log
 order by id_log desc;

select *
  from ctabnco
 where banco = '04';

select *
  from ctabnco
 where codigo = '19';

select *
  from plancta
 where cuenta = '10412207';

select cuenta
  from ctabnco
 where banco = '11'
   and moneda = 'D'
   and cod_proveedor is not null;

select *
  from proveed
 where cod_proveed = '20100053455';

select pag.cod_proveedor, pag.tipdoc
     , pag.serie_num, pag.numero
     , pag.moneda, nvl(mvf.banco, '01') as banco
     , bco.cod_banco, pag.tcam_sal
     , pag.ctactble, bco.ano
     , bco.mes, bco.tipo
     , bco.voucher, nvl(cuo.importe_interes, 0) + nvl(cuo.importe_comision, 0) +
                    nvl(cuo.importe_gastos, 0) as interes
     , abs(pag.saldo) as saldo
     , bco.cod_unidad_negocio
  from prestamo_banco bco
     , prestamo_banco_cuota cuo
     , factpag pag
     , movfigl mvf
 where bco.cod_banco = cuo.cod_banco
   and bco.cod_prestamo = cuo.cod_prestamo
   and bco.cod_proveedor = pag.cod_proveedor
   and bco.tipdoc = pag.tipdoc
   and cuo.serie_num = pag.serie_num
   and cuo.numero = pag.numero
   and bco.ano = mvf.ano(+)
   and bco.mes = mvf.mes(+)
   and bco.tipo = mvf.tipo(+)
   and bco.voucher = mvf.voucher(+)
   and pag.f_vencto >= to_date('01/06/2023', 'dd/mm/yyyy')
   and bco.cod_tipo_prestamo not in ('LS', 'TR')
   and pag.saldo != 0;

select *
  from unidad_negocio_cuenta
 where cod_unidad_negocio = '02';

select *
  from plancta
 where cuenta like '7%';

select *
  from plancta
 where cuenta = '77611001';

select * from cuenta_asiento_auto;

select *
  from planilla_cobranzas_h
 where numero_planilla = 5611064;

select *
  from orden_de_compra
 where serie = 14
   and num_ped = 295;

select * from pla_control;

select * from cuenta_asiento_auto;

select *
  from docuvent
 where tipodoc = '01'
   and serie = 'F055'
   and numero = 2;

select *
  from itemdocu
 where tipodoc = '01'
   and serie = 'F055'
   and numero = 2;

select *
  from factcob
 where cod_cliente = '00000990019';

select *
  from docuvent
 where serie = 'F055'
   and numero in (2, 3);

select *
  from itemdocu
 where serie = 'F055'
   and numero in (2, 3);

select cod_alm, descripcion
  from almacenes
 where cod_alm in (
   select distinct cod_alm
     from usuarios_almacenes_perfil
    where usuario = user
      and cod_alm like 'F%'
       or cod_alm like 'R%' or cod_alm like 'H%' or cod_alm like 'A%'
   )
 order by cod_alm;

-- insert into usuarios_almacenes_perfil

insert into usuarios_almacenes_perfil( usuario, cod_alm, tp_transac, insertar_registros, consulta
                                     , estado)
select 'ABAILON', cod_alm, tp_transac, insertar_registros, consulta, estado
  from usuarios_almacenes_perfil
 where usuario = 'JGARDOIS';

select *
  from usuarios_almacenes_perfil
 where usuario = 'DESPACHO';


select *
  from factcob
 where cod_cliente = '20602006761' and saldo <> 0 and estado not in ('3', '9')
   and moneda = 'D' and vended like '65' and tipdoc not in ('LC', 'LD')
   and ((tipdoc = 'L1' and l_condle is null) or (tipdoc <> 'L1'));

select *
  from factcob
 where tipdoc = 'LP'
   and serie_num = 1
   and numero = 57211;

select *
  from factcob
 where cod_cliente = '20602006761';

-- cod_cliente = :cabe.cod_cliente and saldo <> 0 and estado not in ('3','9')
--  and moneda = :cabe.moneda and vended like :cabe.vendedor and tipdoc not in ('LC','LD')
-- AND ((TIPDOC = 'L1' AND L_CONDLE is null) or (tipdoc <> 'L1'))

-- recibos provisionales
select *
  from recprov
 where tip_doc_ref = 'LP'
   and nro_doc_ref = '1093';

select *
  from recprov
 where numero = 2540;

select *
  from itemrec
 where numero = 2538;

select i.*
  from recprov r
       join itemrec i on r.tipodoc = i.tipodoc and r.serie = i.serie and r.numero = i.numero
 where r.tip_doc_ref = 'LP'
   and r.nro_doc_ref = '1093';

select *
  from pevisa.factcob
 where numero = '57211'
   and tipdoc = 'LP';

select * from letras;

select *
  from factcob
 where numero = '399'
   and tipdoc = 'RT';

select *
  from movdeta
 where nro_referencia = '399'
   and tipo_referencia = 'RT';

select * from cuenta_asiento_auto;

select *
  from unidad_negocio_cuenta
 where cod_tipo = 'DIFERENCIA_CAMBIO_PREVEEDOR_9';

select * from modulo where id_modulo like 'ANULA_RECIBO';

select * from usuario_modulo where usuario = 'YYOVERA';

select * from pla_control;

select *
  from ctabnco
 where banco = '24';

select * from tipo_prestamo_banco;

select *
  from pedido
 where num_ped = 3251;

select *
  from clientes
 where cod_cliente = '20604187941';

select *
  from docuvent
 where tipodoc = '08'
   and serie = 'F091'
   and numero = 8;

select *
  from factcob
 where tipdoc = '08'
   and serie_num = 'F091'
   and numero = '8';

select *
  from vendedores
 where cod_vendedor = '00';

select *
  from usuario_modulo
 where usuario = 'YYOVERA';

select distinct flag_impre from cotizacion;

select *
  from docuvent
 where tipodoc = '08'
   and serie = 'F091'
   and numero = 8;

select *
  from docuvent
 where tipodoc = '08'
   and estado = '9';

select *
  from pedido
 where serie = 'F091'
   and num_ped = 28;

select *
  from cambdol
 where fecha = to_date('10/07/2023', 'dd/mm/yyyy');

-- facturacion licencia
select * from docuvent;

select *
  from gastos_de_viaje_habilitado
 where nacional_internacional = 'I';

select *
  from gastos_de_viaje_habilitado
 where numero = 124
   and id_vendedor = '62';

select *
  from gastos_de_viaje_habilitado
 where numero = 124
   and id_vendedor = '62';

select *
  from gastos_de_viaje
 where numero = 124
   and id_vendedor = '62';

select *
  from gastos_de_viaje_d
 where numero = 124
   and id_vendedor = '62';

select *
  from gastos_de_viaje_habilitado
 where nacional_internacional != 'N';

select *
  from factpag
 where numero = '0001819';

select tipo, codigo, descripcion
  from tablas_auxiliares
 where tipo = 32 and codigo <> '....' and indicador1 = 'S' and codigo in ('01', '03');

select * from paramin;

insert into cominac_concepto_linea
select 369, linea
  from tab_lineas
 where grupo = 150;

select *
  from cominac_concepto_grupo
 where cod_concepto = 369;

select * from vw_saldo_banco_mail;

select serie from nrodoc where tipodoc = '07' order by tipodoc, serie;

select *
  from nrodoc
 where tipodoc = '07'
   and serie like 'B%';

select * from pla_control;

select *
  from factcob
 where cod_cliente = '44444444'
   and tipdoc = '07'
   and numero = 1;

select distinct p.serie
  from pedido p
 where p.tipo_docto in (2, 20, 21, 22, 23, 24) and p.estado = 5
 order by p.serie;

select serie, automatico from numdoc where tp_transac = '21';

select *
  from movfide_situacion_banco
 where ano = 2023;

select *
  from orden_de_compra
 where serie = 13
   and num_ped = 319;

select *
  from plancta
 where cuenta = '44291100';

select *
  from nrolibr
 where ano = 2023
   and mes = 2;

select *
  from orden_de_compra
 where cod_proveed = '10442310624'
 order by fecha;

select *
  from movglos
 where numero_order = '297'
   and serie_orden = 13;

select *
  from movdeta
 where ano = 2023
   and mes = 8
   and libro = '40'
   and voucher = 80001;

select *
  from plancta
 where cuenta = '40172000';

select *
  from nrodoc
 where tipodoc = '07'
   and serie in ('F055', 'F050');

select *
  from nrodoc
 where tipodoc = '01'
   and serie = 'F055';

select *
  from docuvent
 where tipodoc = '07'
   and serie = 'F055'
   and numero = 1;

select *
  from itemdocu
 where tipodoc = '07'
   and serie = 'F055'
   and numero = 1;

select *
  from clientes
 where cod_cliente = '00000990019';

select *
  from exfacturas_enviados
 where tipdoc = '07'
   and serie = 'F055';

select i.numero
     , i.item as id_linea
     , i.cod_art as codigo_producto_linea
--                 , A.UNIDAD                             UNIDAD_LINEA
     , tab_aux_obs(a.unidad, 36) as unidad_linea
     , a.cod_igv
     , p.valor
     , a.descripcion
     , get_deslinea(a.cod_lin) as descripcion_linea
     , i.precio_de_lista
     , abs(cantidad) as cantidad_linea
     , abs(precio_de_lista) as valor_unitario_linea
     , valor_unitario as precio_venta_linea
     , round(abs(precio_de_lista) * p.valor, 2) as igv_unidad
     , abs(neto) as valor_venta_linea
     , round(abs(neto) * p.valor, 2) as subtotal_igv_linea
     , abs(neto) + round(abs(neto) * p.valor, 2) as total_de_la_linea
     , p.valor * 100 as porcentaje_igv_linea, i.descuento, i.por_desc1, i.por_desc2, i.por_desc3,
    to_char(i.por_desc1) || '+' || to_char(i.por_desc2) || '+' ||
    to_char(i.por_desc3) as x_pordes_ori
     , d.nro_lista, d.cond_pag, i.observacion
  from itemdocu i
     , articul a
     , impuesto p
     , docuvent d
 where i.tipodoc = :p_tipdoc
   and i.serie = :p_serie
   and i.numero = :p_numero
   and i.cod_art = a.cod_art
   and p.codigo = a.cod_igv
   and d.tipodoc = :p_tipdoc
   and d.serie = :p_serie
   and d.numero = :p_numero
 order by i.item;

select * from impuesto;

select *
  from articul
 where cod_art = 'NC7';

select *
  from articul
 where cod_art like 'NC%';

select *
  from usuario_modulo
 where modulo = 'COMISIONES';

select *
  from modulo
 where id_modulo = 'ABRE_MES';

select *
  from modulo
 where id_modulo = 'CIERRA_MES';

select *
  from usuario_modulo
 where usuario = 'ABAILON';

select * from orden_de_compra
where serie =
      and num_ped = ;