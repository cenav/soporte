insert into usuarios_tipos(usuario, tipo, mes_predeterminado)
select 'ECHINCHA', tipo, mes_predeterminado
  from usuarios_tipos
 where usuario = 'MDIAZ';

select *
  from usuarios_tipos
 where usuario = 'ECHINCHA';


select *
  from factpag
 where cod_proveedor = '99000038'
   and tipdoc = '91'
   and numero in ('0000027', '0000030', '0000033');

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

select sign(-7000) as negativo, sign(0) as cero, sign(3000) as positivo from dual;

select *
  from cominac_concepto
 where cod_concepto = '173';

create public synonym cominac_filtro for cominac_filtro;

select *
  from docuvent
 where cod_vende = '20'
   and fecha > to_date('01/12/2022', 'dd/mm/yyyy');

select * from proceso_cominac;

select * from proceso_cominac_concepto;

select * from proceso_cominac_venta_det;

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
  from pevisa.movglos
 where ano = 2023
   and mes = 2
   and libro = '08'
   and voucher = 20398;

select * from pla_control;


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
select cod_banco, '0003CM5', fecha, estado, importe_prestamo, moneda, tasa_interes
     , cod_tipo_prestamo, ano, mes, tipo, voucher, item, asiento_generado_quien
     , asiento_generado_cuando, cod_derivado, debito_auto, contrato, cod_proveedor, tipdoc
     , importe_neto, tasa_igv, contrato_derivado, cod_penalidad, estructuracion, cod_interes_leasing
     , cod_motivo, nombre_archivo, cod_unidad_negocio
  from prestamo_banco
 where cod_prestamo = '0001CM5';

insert into prestamo_banco_cuota
select cod_banco, '0003CM5', nro_cuota, fecha_vcto, importe_saldo_capital, importe_capital
     , importe_interes, importe_cuota, serie_num, numero, importe_portes, importe_igv
     , importe_comision, importe_gastos, importe_valor_cuota, tipdoc_cp, serie_cp, numero_cp
     , fecha_debito_banco, importe_capital_real, importe_interes_real, importe_valor_cuota_real
     , importe_portes_real, importe_igv_real, importe_comision_real, importe_gastos_real
     , importe_cuota_real, opcion_de_compra
  from prestamo_banco_cuota
 where cod_prestamo = '0001CM5';

select *
  from movfigl
 where ano = 2023
   and mes = 1
   and tipo = '3'
   and voucher = 10013;

select *
  from movfide
 where ano = 2023
   and mes = 1
   and tipo = '3'
   and voucher = 10013;

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