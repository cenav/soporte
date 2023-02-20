select *
  from movglos
 where ano = 2022
   and mes = 12
   and libro = '09'
   and voucher = 120001;

select *
  from movdeta
 where ano = 2022
   and mes = 12
   and libro = '09'
   and voucher = 120001;

select * from activo_fijo_depreciacion;

select *
  from cambdol
 where fecha = to_date('20/02/2023', 'dd/mm/yyyy');