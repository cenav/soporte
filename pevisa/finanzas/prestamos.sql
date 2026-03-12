select *
  from prestamo_banco
 where cod_prestamo = '3323452';

select *
  from prestamo_banco_cuota
 where cod_prestamo = '3323452';

-- update prestamo_banco_cuota
--    set fecha_vcto = add_months(fecha_vcto, 24000)
--  where cod_prestamo = '3323452';

select *
  from movfide
 where ano = 2025
   and mes = 9
   and tipo = '3'
   and voucher = 90024
   and f_vencto is not null;

select to_char(f_vencto, 'dd/mm/yyyy'), f_vencto
  from movfide
 where ano = 2025
   and mes = 9
   and tipo = '3'
   and voucher = 90024
   and f_vencto is not null;

-- update movfide
--    set f_vencto = add_months(f_vencto, 24000)
--  where ano = 2025
--    and mes = 9
--    and tipo = '3'
--    and voucher = 90024
--    and f_vencto is not null;

update movfide
   set detalle = to_char(f_vencto, 'dd/mm/yyyy')
 where ano = 2025
   and mes = 9
   and tipo = '3'
   and voucher = 90024
   and f_vencto is not null;

select add_months(to_date('29/10/0025', 'dd/mm/yyyy'), 24000) from dual;

select add_months(to_date('28/01/0026', 'dd/mm/yyyy'), 24000) from dual;