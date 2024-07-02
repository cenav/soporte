-- cancelacion a una fecha
call pkg_finanzas_pagares.cancela_cuotas(to_date('28/03/2022', 'dd/mm/yyyy'));

select *
  from factpag
 where cod_proveedor = '20100047218'
   and numero = '35466026'
   and serie_num = '004';

select *
  from factpag
 where cod_proveedor = '20100047218'
   and numero = '3546048'
   and serie_num = '005';

select *
  from plancta
 where cuenta = '45111100';

select *
  from movfigl
 where ano = 2021
   and mes = 9
   and tipo = '3'
   and voucher = 90009;

select *
  from prestamo_banco
 where cod_prestamo = '3546048';

select *
  from plancta
 where cuenta = '45111100';

select *
  from ctabnco
 where banco = '32';

select *
  from prestamo_banco
 where cod_prestamo = '2581324';

select * from ctabnco;

select * from logger_logs order by id desc;