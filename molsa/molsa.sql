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

declare
  l_ano simple_integer := 2022;
  l_mes simple_integer := 12;
begin
  utilconta.asiento_sin_detalle(l_ano, l_mes);
  utilconta.completa_cero(l_ano, l_mes);
  utilconta.elimina_relacion(l_ano, l_mes);
  utilconta.agrega_relacion(l_ano, l_mes);
  commit;
end;
