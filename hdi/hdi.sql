select *
  from movglos
 where ano = 2023
   and mes = 5
   and libro = '08'
   and voucher in (
   50040
   );

select *
  from movdeta
 where ano = 2023
   and mes = 5
   and libro = '08'
   and voucher in (
   50040
   );

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
   and numero = 171;

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
 where cod_prestamo = '0003CM5';

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
   and mes = 4
   and tipo = '3'
   and voucher = 40009;

select *
  from movfide
 where ano = 2023
   and mes = 4
   and tipo = '3'
   and voucher = 40009;

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
 where numero = 23012;

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
  from vendedores;

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
 where numero = '3848548'
   and serie_num = '007';

select *
  from lg_pedjam
 where num_importa = 'PH2023/061';

select *
  from pevisa.pagos_h
 where serie_planilla in (1, 2)
   and (estado = 6 or
        (estado = 2 and documentos_con_detraccion = 0))
   and forma_de_pago = 'TRAN'
   and exists(
   select distinct -1
     from ctabnco_unidad_de_negocio x
        , ctabnco_parametros p
        , ctabnco c
    where x.codigo = c.codigo
      and x.codigo_unidad_negocio = nvl(pagos_h.codigo_unidad_negocio, '00')
      and c.moneda = pagos_h.moneda
      and c.banco like nvl(pagos_h.banco_de_cuenta_de_abono, '%')
      and p.id_cuenta = c.codigo
      and p.usuario = user
   )
   and serie_planilla = 1
   and numero_planilla = 106;

select *
  from pevisa.pagos_h
 where serie_planilla = 1
   and numero_planilla = 106;

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
 where cod_alm = 'FB'
   and tp_transac = '56'
   and serie = 10
   and numero = 20;

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
   5610388
   )
   and voucher_c is null;

select h.*
  from planilla_cobranzas_d h
 where numero_planilla in (
   5610388
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
  from gastos_de_viaje_habilitado
 where numero = 102
   and id_vendedor = 'C2'
--    and trunc(fecha_cierre) >= :BLOCK_SELECCION.del
--    and trunc(fecha_cierre) <= :BLOCK_SELECCION.al
   and estado = 8
   and moneda = 'S'
   and exists
   (
     select 1
       from vendedores
      where cod_vendedor =
            gastos_de_viaje_habilitado.id_vendedor
        and indicador1 = 1
     )
   and not exists
   (
     select 1
       from pagos_i i
      where i.serie_planilla in (21, 22)
        and i.serie_num =
            gastos_de_viaje_habilitado.id_vendedor
        and i.numero = gastos_de_viaje_habilitado.numero
        and nvl(i.estado, 0) < 9
     )
   and exists (
   select f_vendedores_codigo_trabajador(gastos_de_viaje_habilitado.id_vendedor)
     from planilla10.personal p
        , tablas_auxiliares t
    where p.c_codigo = f_vendedores_codigo_trabajador(gastos_de_viaje_habilitado.id_vendedor)
      and p.c_banco like :BLOCK_SELECCION.banco_de_cuenta_de_abono
   );

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
   and serie = 'F081'
   and numero = '1752';

select *
  from itemdocu
 where tipodoc = '01'
   and serie = 'F081'
   and numero = '1752';

select *
  from factcob
 where tipdoc = '01'
   and serie_num = 'F081'
   and numero = '1752';

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

select decode(j.moneda, 'S', ctaconts, decode(x_zona, '900', ctaexpo, ctacontd))
  from nrodoc
 where tipodoc = 'A1'
   and serie = 1;

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



select moneda
  from plancta
 where cuenta = :new.cuenta;

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