select *
  from movglos g
 where g.ano = 2022
   and g.mes = 12
   and not exists(
     select 1
       from movdeta d
      where d.ano = g.ano
        and d.mes = g.mes
        and d.libro = g.libro
        and d.voucher = g.voucher
   );

select distinct ano, ano, mes, libro, voucher
  from movdeta
 where ano = 2021
   and mes = 8
   and cuenta like '6%'
   and estado != '9';

select *
  from movdeta
 where ano = 2022
   and mes = 12
   and libro = '11'
   and voucher = 120135;