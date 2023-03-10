insert into usuarios_tipos(usuario, tipo, mes_predeterminado)
select 'ECHINCHA', tipo, mes_predeterminado
  from usuarios_tipos
 where usuario = 'MDIAZ';

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
  from movglos
 where ano = 2023
   and mes = 2
   and libro = '08'
   and voucher = 20403;

select *
  from movdeta
 where ano = 2023
   and mes = 2
   and libro = '08'
   and voucher = 20403;

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