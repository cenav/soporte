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
   and voucher = 43029;

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

select *
  from plancta
 where cuenta = '31110201';

select *
  from movdeta
 where ano = 2022
   and mes = 12
   and cuenta = '31110201';

select sum(cantidad * precio * factor_uc) as total_item
  from itemord
 where serie = 3
   and num_ped = 671;

select *
  from orden_de_compra
 where serie = 3
   and num_ped = 671;

select *
  from movfide
 where ano = 2022
   and mes = 4
   and tipo = '2'
   and voucher = 43029;