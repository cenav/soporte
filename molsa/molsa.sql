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
 where fecha = to_date('16/02/2023', 'dd/mm/yyyy');

insert into pevisa.cambdol ( fecha, tipo_cambio, import_cam, creacion_quien, creacion_cuando
                           , creacion_donde, validacion_quien, validacion_cuando, validacion_donde)
values ( to_date('2023-02-16', 'YYYY-MM-DD HH24:MI:SS'), 'C', 3.8580, 'VMONTANEZ'
       , to_date('2023-02-15 18:09:32', 'YYYY-MM-DD HH24:MI:SS'), '25.0.3.110', null, null, null);
insert into pevisa.cambdol ( fecha, tipo_cambio, import_cam, creacion_quien, creacion_cuando
                           , creacion_donde, validacion_quien, validacion_cuando, validacion_donde)
values ( to_date('2023-02-16', 'YYYY-MM-DD HH24:MI:SS'), 'V', 3.8650, 'VMONTANEZ'
       , to_date('2023-02-15 18:09:33', 'YYYY-MM-DD HH24:MI:SS'), '25.0.3.110', null, null, null);