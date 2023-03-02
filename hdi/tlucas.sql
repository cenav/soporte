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
