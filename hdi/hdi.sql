select *
  from movglos
 where ano = 2023
   and mes = 6
   and libro = '08'
   and voucher in (
   24
   );

-- 11/05/2023
select *
  from movdeta
 where ano = 2024
   and mes = 2
   and libro = '25'
   and voucher in (
   23097
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
 where cod_prestamo = '4198825';

select *
  from prestamo_banco_cuota
 where cod_prestamo = '4198825';

select *
  from movfigl
 where ano = 2024
   and mes = 10
   and tipo = 3
   and voucher = 100003;

select *
  from movfide
 where ano = 2025
   and mes = 2
   and tipo = 2
   and voucher = 23097;

select *
  from factpag
 where cod_proveedor = '20100047218'
   and numero = '4198825';

select *
  from tab_bancos
 where codigo_banco = '04';

select *
  from ctabnco
 where banco = '04';

select *
  from prestamo_banco_cuota
 where cod_prestamo = '0003CM5';

select *
  from movfigl
 where ano = 2024
   and mes = 10
   and tipo = '3'
   and voucher = 100003;

select *
  from movfide
 where ano = 2024
   and mes = 10
   and tipo = '3'
   and voucher = 100003;

select *
  from factcob
 where cod_cliente = '20511623660'
   and tipdoc = 'LC'
   and numero = '57278';


select *
  from factpag
 where cod_proveedor = '20100047218'
--    and serie_num = '0000'
   and numero = '4198825';

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
 where serie = 13
   and num_ped = 475;

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

select *
  from docuvent
 where tipodoc = '01'
   and serie = 'E001'
   and numero = '33';

select *
  from docuvent
 where tipodoc = '01'
   and serie = 'E001'
   and numero = '34';

select *
  from nrodoc
 where tipodoc = '01'
   and serie = 'E001';

insert into pevisa.docuvent
  ( tipodoc, serie, numero, estado, fecha, cod_cliente, nro_sucur, ruc
  , cond_pag, cod_vende, origen, moneda, nro_lista, por_desc1, por_desc2
  , detalle, val_venta, imp_descto, imp_neto, imp_interes, imp_isc
  , imp_igv, precio_vta, cuota_inic, descto_adic, cta_descto, cta_interes
  , cta_impisc, cta_impigv, cta_pvta, motivo, pasecc, voucher, cod_alm
  , cliente_afecto, tipo_cambio, import_cam, calc_int, gnra_letra
  , f_vencto, porc_comision, tip_doc_ref, ser_doc_ref, nro_doc_ref
  , flg_impr, ubicacion, nombre, direccion, imp_fletes, sval_venta
  , simp_descto, simp_neto, simp_interes, simp_fletes, simp_isc, simp_igv
  , sprecio_vta, creacion_quien, creacion_cuando, creacion_donde
  , incluye_impuestos, cod_alm_kardex, tp_transac_kardex, serie_kardex
  , numero_kardex, porcentaje_impuesto_1, tipo_impuesto_1, imp_seguros
  , simp_seguros, imp_gastos, simp_gastos, imp_otros, simp_otros
  , unidad_negocio, tasa_percep, imp_percep, cod_notac)
values
  ( '01', 'E001', 33, '9', date '2023-01-20', '10200188409', null, '10200188409', 'Y', '65'
  , 'P', 'D', 1, 0.00, 0.00, null, 1644.12, 0.00, 1644.12, 0.00, null, 295.94, 1940.06, 0.00
  , 0.00, '7410101', '7720101', null, '40111100', '12122000', '0', 'S', null, null, 'S', 'V'
  , 3.8610, 'N', 'N', date '2023-02-19', 0.00, 'P2', '20', '10', '0', null
  , 'MUERAS CONTRERAS FLORINDA', 'JR MIGUEL GRAU S/N ESQUINA CON JR SAN MARTIN', null, null
  , null, null, null, null, null, null, 0.00, 'MBERNAL', timestamp '2023-01-20 17:11:41'
  , '30.0.0.215', null, 'F0', '21', 50, 3, null, null, 0.00, null, null, null, null, null, null
  , 0.00, 0.00, null);


insert into pevisa.docuvent
  ( tipodoc, serie, numero, estado, fecha, cod_cliente, nro_sucur, ruc
  , cond_pag, cod_vende, origen, moneda, nro_lista, por_desc1, por_desc2
  , detalle, val_venta, imp_descto, imp_neto, imp_interes, imp_isc
  , imp_igv, precio_vta, cuota_inic, descto_adic, cta_descto, cta_interes
  , cta_impisc, cta_impigv, cta_pvta, motivo, pasecc, voucher, cod_alm
  , cliente_afecto, tipo_cambio, import_cam, calc_int, gnra_letra
  , f_vencto, porc_comision, tip_doc_ref, ser_doc_ref, nro_doc_ref
  , flg_impr, ubicacion, nombre, direccion, imp_fletes, sval_venta
  , simp_descto, simp_neto, simp_interes, simp_fletes, simp_isc, simp_igv
  , sprecio_vta, creacion_quien, creacion_cuando, creacion_donde
  , incluye_impuestos, cod_alm_kardex, tp_transac_kardex, serie_kardex
  , numero_kardex, porcentaje_impuesto_1, tipo_impuesto_1, imp_seguros
  , simp_seguros, imp_gastos, simp_gastos, imp_otros, simp_otros
  , unidad_negocio, tasa_percep, imp_percep, cod_notac)
values
  ( '01', 'E001', 34, '9', date '2023-09-13', '20520588486', null, '20520588486', 'i', '27'
  , 'D', 'D', 1, 0.00, 0.00, null, 6121.11, 0.00, 6121.11, 0.00, 0.00, 1101.80, 7222.91, 0.00
  , 0.00, '7410101', '7720101', null, '40111100', '12122000', '1', 'S', null, 'F0', 'S', 'V'
  , 3.7080, 'N', 'N', date '2023-10-13', 0.00, '01', 'E001', '34', '0', null
  , 'DIVECENTER S.A.C.', 'AV. CANADA NRO. 1160 URB. SANTA CATALINA', null, null, null, null
  , null, null, null, null, 0.00, 'MBERNAL', timestamp '2023-09-13 10:26:49', '30.0.1.45', null
  , null, null, null, null, null, null, null, null, null, null, null, null, null, 0.00, 0.00
  , null);

select *
  from docuvent
 where tipodoc = '01'
   and serie = 'E001'
   and numero = 33;

select *
  from itemdocu
 where tipodoc = '01'
   and serie = 'E001'
   and numero = 33;

-- INSERT INTO PEVISA.ITEMDOCU (TIPODOC, SERIE, NUMERO, COD_ART, CANTIDAD, PRECIO_DE_LISTA, VALOR_UNITARIO, POR_DESC1, POR_DESC2, POR_DESC3, BRUTO, DESCUENTO, NETO, IMPUESTO, TOTAL, P_ISC, P_IGV, CUENTA70, ORIGEN, PORCENTAJE_COMISION, IMP_VVTA, ITEM, COD_EQI, COD_LIN, INDICADOR, PRECIO_NETO, COD_GRUPO_VENTA, MONEDA_COMISION, IMPORTE_COMISION, P_PERCEP, OBSERVACION, FECHA_VTA, ESTADO_VTA, PORCEN_NC, COD_GRUPO, NETOR, REFE_PEDIDO) VALUES ('01', 'E001', 33, '35014', 4.0000, 21.1900, 25.0000, 0.00, 0.00, 0.00, null, 0.00, 84.76, null, null, 0.00, 0.18, ' 7010101', 'P', 0.00, 84.76, 1, null, 'F306', 'IN', null, null, null, null, 0.00, null, DATE '2023-01-20', '9', 0.00, 308, 0.00, null);
-- INSERT INTO PEVISA.ITEMDOCU (TIPODOC, SERIE, NUMERO, COD_ART, CANTIDAD, PRECIO_DE_LISTA, VALOR_UNITARIO, POR_DESC1, POR_DESC2, POR_DESC3, BRUTO, DESCUENTO, NETO, IMPUESTO, TOTAL, P_ISC, P_IGV, CUENTA70, ORIGEN, PORCENTAJE_COMISION, IMP_VVTA, ITEM, COD_EQI, COD_LIN, INDICADOR, PRECIO_NETO, COD_GRUPO_VENTA, MONEDA_COMISION, IMPORTE_COMISION, P_PERCEP, OBSERVACION, FECHA_VTA, ESTADO_VTA, PORCEN_NC, COD_GRUPO, NETOR, REFE_PEDIDO) VALUES ('01', 'E001', 33, 'CONT-013', 1.0000, 6121.1100, 7222.9100, 0.00, 0.00, 0.00, null, 0.00, 6121.11, null, null, 0.00, 0.18, '7010101', 'D', 0.00, 6121.11, 1, null, 'Y002', 'EE', null, null, null, null, 0.00, null, DATE '2023-09-13', '0', 0.00, 900, 0.00, null);
-- INSERT INTO PEVISA.ITEMDOCU (TIPODOC, SERIE, NUMERO, COD_ART, CANTIDAD, PRECIO_DE_LISTA, VALOR_UNITARIO, POR_DESC1, POR_DESC2, POR_DESC3, BRUTO, DESCUENTO, NETO, IMPUESTO, TOTAL, P_ISC, P_IGV, CUENTA70, ORIGEN, PORCENTAJE_COMISION, IMP_VVTA, ITEM, COD_EQI, COD_LIN, INDICADOR, PRECIO_NETO, COD_GRUPO_VENTA, MONEDA_COMISION, IMPORTE_COMISION, P_PERCEP, OBSERVACION, FECHA_VTA, ESTADO_VTA, PORCEN_NC, COD_GRUPO, NETOR, REFE_PEDIDO) VALUES ('01', 'E001', 33, '40954', 4.0000, 101.7000, 120.0100, 0.00, 0.00, 0.00, null, 0.00, 406.80, null, null, 0.00, 0.18, ' 7010101', 'P', 0.00, 406.80, 2, null, 'F304', 'IN', null, null, null, null, 0.00, null, DATE '2023-01-20', '9', 0.00, 308, 0.00, null);
-- INSERT INTO PEVISA.ITEMDOCU (TIPODOC, SERIE, NUMERO, COD_ART, CANTIDAD, PRECIO_DE_LISTA, VALOR_UNITARIO, POR_DESC1, POR_DESC2, POR_DESC3, BRUTO, DESCUENTO, NETO, IMPUESTO, TOTAL, P_ISC, P_IGV, CUENTA70, ORIGEN, PORCENTAJE_COMISION, IMP_VVTA, ITEM, COD_EQI, COD_LIN, INDICADOR, PRECIO_NETO, COD_GRUPO_VENTA, MONEDA_COMISION, IMPORTE_COMISION, P_PERCEP, OBSERVACION, FECHA_VTA, ESTADO_VTA, PORCEN_NC, COD_GRUPO, NETOR, REFE_PEDIDO) VALUES ('01', 'E001', 33, '8T00-300-218E-0001', 4.0000, 288.1400, 340.0100, 0.00, 0.00, 0.00, null, 0.00, 1152.56, null, null, 0.00, 0.18, ' 7010101', 'P', 0.00, 1152.56, 3, null, 'D501', 'IN', null, null, null, null, 0.00, null, DATE '2023-01-20', '9', 0.00, 150, 0.00, null);

select *
  from cominac_concepto_venta_grupal
 where cod_concepto = 397
   and cod_vendedor = 'M1';

select * from cominac_concepto_venta_grupal;

select *
  from vendedores
 where estado = 1;

select * from pla_control;

select *
  from numdoc
 where tp_transac = '30'
   and serie = 5;

select *
  from kardex_g
 where tp_transac = '30'
   and serie = 5;

select * from vendedores;

select *
  from orden_de_venta o
 where o.serie = substr(:x_orden_trabajo, 1, 2)
   and to_char(o.numero) = rtrim(substr(:x_orden_trabajo, 3, 6))
   and o.estado = '40';

select *
  from orden_de_venta
 where serie = 'DI'
   and numero = 6894;

select *
  from orden_de_venta_historia
 where serie = 'DI'
   and numero = 6894;

select *
  from embarques_d
 where numero_embarque = 116;

select *
  from lg_detalle_gastos
 where numero_embarque = 116;

select p.id_programa, p.descripcion
  from pr_programas_compras p
     , planeamiento_compras c
 where p.id_programa = c.programa
   and c.codigo = 'NACIONAL'
 group by p.id_programa, p.descripcion
 order by id_programa;

select *
  from nrodoc
 where tipodoc = '01';

select *
  from docuvent
 where tipodoc = '01'
   and serie = 'F071';

select * from pla_control;

select *
  from itemord
 where serie = 11
   and num_ped = 46
   and saldo > 0;

select *
  from kardex_d
 where cod_art = 'F026400221'
 order by fch_transac desc;

select *
  from itemord
 where serie = 11
   and num_ped = 46
   and saldo = 0;

select l.num_importa as pedido, replace(p.nombre, ',', ' ') as nombre, l.cod_proveed, to_char(
    l.fecha, 'DD/MM/YYYY', 'NLS_DATE_LANGUAGE=Spanish') as fecha
     , to_char(l.fecha_aduana,
               'DD/MM/YYYY',
               'NLS_DATE_LANGUAGE=Spanish') as fecha_aduana
     , to_char(l.fecha_almacen, 'DD/MM/YYYY', 'NLS_DATE_LANGUAGE=Spanish') as fecha_almacen
     , a.cod_lin, i.cod_art, a.descripcion, i.cantidad, i.cantidad - i.saldo as ingresado, i.saldo
     , i.precio, round(i.cantidad * i.precio, 4) as total, round(i.saldo * i.precio, 4) as tot_saldo
     , l.moneda, 1 as factor_moneda, i.estado, to_char(i.fecha_estimada_despacho, 'DD/MM/YYYY',
                                                       'NLS_DATE_LANGUAGE=Spanish') as fecha_estimada_despacho
     , to_char(i.nueva_fecha_estimada_despacho, 'DD/MM/YYYY',
               'NLS_DATE_LANGUAGE=Spanish') as nueva_fecha_estimada_despacho
     , l.cod_vende, l.cond_pago, l.tipo_pedido, l.pais_origen as cod_pais
  from lg_pedjam l
     , proveed p
     , lg_itemjam i
     , articul a
--,LG_INFORME_PEDIDO M
 where p.cod_proveed = l.cod_proveed
   and i.num_importa = l.num_importa
   and a.cod_art = i.cod_art
   and nvl(l.estado, 0) < '6'
   and nvl(i.estado, 0) < '6'
   and ((p_op = '0' and i.saldo <> 0) or (p_op = '1'))
   and l.fecha between :P_FECHA1 and :P_FECHA2
--AND M.PEDIDO(+) = L.NUM_IMPORTA
 order by l.num_importa, i.item;


create or replace view vw_saldo_pedido_nacional as
select g.descripcion as grupo_compra, o.serie, o.num_ped, p.nombre as proveedor, fecha, o.cond_pag
     , c.descripcion as condicion_pago, a.cod_lin, i.cod_art, a.descripcion, am.marca, i.cantidad
     , i.cantidad - i.saldo as ingresado, i.saldo, i.precio, o.moneda
     , round(i.cantidad * i.precio, 4) as total, round(i.saldo * i.precio, 4) as tot_saldo
  from orden_de_compra o
       join itemord i on o.serie = i.serie and o.num_ped = i.num_ped
       join articul a on i.cod_art = a.cod_art
       join articul_pev am on a.cod_art = am.cod_art
       join proveed p on o.cod_proveed = p.cod_proveed
       left join lg_grupos_compras g on o.codigo_grupo_compra = g.codigo_grupo_compra
       left join lg_condpag c on o.cond_pag = c.cond_pag
 where o.estado != '9'
   and i.saldo != 0
   and o.estado < '8'
   and o.serie = 11;

select grupo_compra, serie, num_ped, proveedor, fecha, cond_pag, condicion_pago, cod_lin, cod_art
     , descripcion, marca, cantidad, ingresado, saldo, precio, moneda, total, tot_saldo
  from vw_saldo_pedido_nacional;

select *
  from lg_grupos_compras
 where codigo_grupo_compra = '097';

select *
  from lg_condpag
 where cond_pag = '10';


select *
  from articul_pev
 where cod_art = '1554X9-A02';


select * from vw_saldo_pedido_nacional;


select * from almacen;


select *
  from kardex_d
 where cod_alm like '%'
   and tp_transac = '11'
   and serie = 10
   and numero = 686;


select *
  from packing_g
 where numero_embarque = 152;


select *
  from embarques_d
 where numero_embarque = 152;

select *
  from almacen
 where cod_art = 'HARCR500';


select *
  from almacen
 where cod_art = 'HARCR500-PROMO';


select *
  from orden_de_compra
 where serie = 11
   and num_ped = 63;

select *
  from itemord
 where serie = 11
   and num_ped = 63
   and saldo = 0;

select *
  from orden_de_compra_historia
 where serie = 11
   and num_ped = 63;

select *
  from movglos
 where cod_proveed = '10442310624'
 order by fecha desc;

select *
  from movdeta
 where ano = 2023
   and mes = 8
   and libro = '40'
   and voucher = 80006;

select *
  from lg_detalle_gastos
 where numero_embarque = 123
 order by item;

select *
  from orden_de_compra
 where serie = 11
   and num_ped = 63;

select *
  from itemord
 where serie = 11
   and num_ped = 63
   and saldo != 0;

select *
  from itemord
 where serie = 11
   and num_ped = 63
   and factor_uc != 1;

select *
  from cominac_concepto
 where descripcion like '%V DIAZ%';

select *
  from cominac_concepto
 where vigencia_del = to_date('01/01/2023', 'dd/mm/yyyy')
   and vigencia_al = to_date('31/12/2023', 'dd/mm/yyyy')
   and cod_periodo = 'TR';

select c.*
  from proceso_cominac p
       join proceso_cominac_concepto c on p.cod_proceso = c.cod_proceso
       left join cominac_concepto o on c.cod_concepto = o.cod_concepto
 where c.cod_concepto in (
                          361, 362, 363, 364, 365, 366
   )
   and p.periodo_ano = 2023
   and p.periodo_mes > 3
   and c.total > 0
 order by p.cod_proceso;

-- bono no corresponde
select p.periodo_ano, p.periodo_mes, p.cod_vendedor, v.nombre
     , o.descripcion as concepto, c.total
  from proceso_cominac p
       join proceso_cominac_concepto c on p.cod_proceso = c.cod_proceso
       left join cominac_concepto o on c.cod_concepto = o.cod_concepto
       left join vendedores v on p.cod_vendedor = v.cod_vendedor
 where c.cod_concepto in (
                          361, 362, 363, 364, 365, 366
   )
   and p.periodo_ano = 2023
   and p.periodo_mes > 3
   and c.total > 0
 order by p.cod_proceso;

select * from pla_control;

select *
  from vendedores
 where cod_vendedor in ('D7', '77');

select *
  from tablas_auxiliares
--  where tipo = '98'
 where codigo = '....'
 order by tipo;

select *
  from seccrus
 where co_usrusr = 'AZAPATA';

select *
  from seccrus
 where co_usrusr = 'AZAPATA'
   and co_ctrctr = 'MAINMENU_HDI';

select *
  from seccrus
 where co_ctrctr = 'MAINMENU_HDI';

select * from pla_control;

select *
  from nrolibr
 where ano = 2024
   and mes = 1
   and libro = '10';

select *
  from nrolibr
 where ano = 2024
   and mes = 1;

select *
  from nrotipo
 where ano = 2024
   and mes = 1;

select * from pla_control;

select * from cominac_concepto where cod_concepto = 351;

select * from cominac_concepto_cliente;

select * from cominac_concepto_excluye_clie;

select *
  from cominac_concepto_venta_grupal
 where cod_concepto = 417;

select *
  from sistabgen
 order by sistabcod, sisdatcod;

select *
  from view_vendedor_grupo
 where cod_art = 'ANTICIPO-DI';

select * from gastos_de_viaje_d;

select *
  from docuvent
 where extract(year from fecha) = 2022;

select *
  from saldo_banco
 where fecha = to_date('24/03/2024', 'dd/mm/yyyy');

select * from pla_control;

-- x vendedor 690417.79
select v.cod_vende, d.nombre as vendedor, sum(v.dolares) as total
  from view_vendedor_grupo v
     , vendedores d
 where v.cod_vende like :p_vende
   and v.fecha between :p_fecha1 and :p_fecha2
   and v.cod_vende = d.cod_vendedor
--    and v.tipo like :p_tiponac
--    and cod_art != 'ANTICIPO-DI'
 group by v.cod_vende, d.nombre
 order by 3 desc;

-- x grupo 690218.30
select v.grupo, v.des_grupo, sum(v.dolares) as total
  from view_vendedor_grupo v
 where v.fecha between :p_fecha1 and :p_fecha2
--    and v.ind_vta1 like :p_tiponac
 group by v.grupo, v.des_grupo
 order by 3 desc;


select v.grupo, v.des_grupo, sum(v.dolares) as total
  from view_vendedor_grupo v
 where v.fecha between :p_fecha1 and :p_fecha2
   and v.cod_lin in (
                     'Y002', 'Y003'
   )
 group by v.grupo, v.des_grupo
 order by 3 desc;

select i.*
  from docuvent d
       join itemdocu i on d.tipodoc = i.tipodoc and d.serie = i.serie and d.numero = i.numero
 where fecha between :p_fecha1 and :p_fecha2
   and i.cod_art = 'ANTICIPO-DI';

select i.*
  from docuvent d
       join itemdocu i on d.tipodoc = i.tipodoc and d.serie = i.serie and d.numero = i.numero
 where d.fecha between :p_fecha1 and :p_fecha2
   and i.cod_grupo = 98;

select *
  from view_vendedor_grupo
 where fecha between :p_fecha1 and :p_fecha2
   and des_grupo like '%ACTIVO%';

select *
  from itemdocu
 where cod_lin in ('AF1', 'AD1');

select *
  from tab_lineas
 where grupo = 136;

select *
  from tab_grupos
 where grupo = 136;

select nvl(sum(total_dolares), 0) as venta
  from vw_venta_detalle
 where fecha between :p_fecha1 and :p_fecha2;

select d.tipodoc
     , sum(round(decode(d.moneda, 'D', nvl(i.neto, 0), 'S', nvl(i.neto, 0) / d.import_cam),
                 2)) as total_dolares
  from docuvent d
       join itemdocu i
            on (d.tipodoc = i.tipodoc
              and d.serie = i.serie
              and d.numero = i.numero)
       left join clientes c on d.cod_cliente = c.cod_cliente
       left join tablas_auxiliares x
                 on d.tipodoc = x.codigo
                   and x.tipo = '02'
       left join tab_lineas l on i.cod_lin = l.linea
       left join tab_grupos g on l.grupo = g.grupo
 where d.origen <> 'EXPO'
   and d.tipodoc in ('01', '03', '07')
   and d.cond_pag != 'W'
   and d.estado <> '9'
   and d.fecha between :p_fecha1 and :p_fecha2
   and g.ind_vta1 = '1000'
 group by d.tipodoc;

select grupo, descripcion, ind_vta1
  from tab_grupos
 order by ind_vta1;

select d.tipodoc
     , sum(round(decode(d.moneda, 'D', nvl(i.neto, 0), 'S', nvl(i.neto, 0) / d.import_cam),
                 2)) as total_dolares
  from docuvent d
       join itemdocu i
            on (d.tipodoc = i.tipodoc
              and d.serie = i.serie
              and d.numero = i.numero)
       left join clientes c on d.cod_cliente = c.cod_cliente
       left join tablas_auxiliares x
                 on d.tipodoc = x.codigo
                   and x.tipo = '02'
       left join tab_lineas l on i.cod_lin = l.linea
       left join tab_grupos g on l.grupo = g.grupo
 where d.estado != '9'
   and d.cond_pag != 'W'
   and d.fecha between :p_fecha1 and :p_fecha2
 group by d.tipodoc;

select *
  from sistabgen
 where sisdatcod = 100;

select *
  from tab_lineas
 where linea in (
                 'D127', 'D127', 'D127', 'D127', 'D127', 'D127', 'D127', 'D127', 'D127', 'D127',
                 'D127', 'D127', 'D127', 'D113', 'D113', 'D113', 'D501', 'D501', 'D501', 'D301',
                 'D301', 'D301', 'D017', 'D017', 'D017', 'D017', 'D017', 'D017', 'D301', 'D301',
                 'D301', 'D201', 'D201', 'D201', 'D127', 'D127', 'D127', 'D127', 'D127', 'D127',
                 'D127', 'D127', 'D127', 'D501', 'D501', 'D501', 'D301', 'D301', 'D301', 'D301',
                 'D301', 'D301', 'D301', 'D301', 'D30', 'D201', 'D281'
   );

select * from pla_control;

select *
  from orden_de_compra
 where cod_proveed = '10442310624'
 order by fecha desc;

select *
  from prestamo_banco_cuota
 where cod_prestamo = '4198825';

select pcuenta
     , pcuentad
  from t_documi
 where codigo = '26';

select cuenta, descripcion
  from plancta
 where lower(descripcion) like '%interes%'
   and moneda = :prestamo_banco.cod_banco
   and titulo = 'D';

select *
  from factpag
 where numero = '4198825';

select *
  from factpag
 where cod_proveedor = '20100047218'
   and serie_num = '050';

select *
  from movfide_situacion_banco
 where p_ano = 2024
   and p_mes = 12
   and cta_cte_banco = '191-9411292-0-54';