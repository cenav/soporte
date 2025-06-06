-- vencimientos masivos de un rango de fechas
declare
  cursor vencimientos is
       with fechas as (
         select date'2025-04-01' as desde, date'2025-04-27' as hasta
           from dual
         )
     select f.desde + level - 1 as dia
       from dual
            cross join fechas f
    connect by level <= (f.hasta - f.desde + 1);
begin
  for vcto in vencimientos loop
    pkg_finanzas_pagares.cancela_cuotas(vcto.dia);
    pkg_finanzas_leasing.cancela_cuotas(vcto.dia);
  end loop;
end;

-- genera asiento de pagaré que vencía en una fecha pero se pago en otra
declare
  l_vencimiento date := to_date('15/01/2023', 'dd/mm/yyyy');
  l_pago        date := to_date('16/01/2023', 'dd/mm/yyyy');
begin
  pkg_finanzas_pagares.cancela_cuotas(l_vencimiento, l_pago);
end;

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