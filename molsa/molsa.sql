select *
  from movglos
 where ano = 2023
   and mes = 2
   and libro = '08'
   and voucher = 20013;

select *
  from movdeta
 where ano = 2023
   and mes = 2
   and libro = '40'
   and voucher = 20001;

select *
  from factpag
 where cod_proveedor = '10257424281';

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
  from movfide
 where ano = 2022
   and mes = 4
   and tipo = '2'
   and voucher = 43029;

select *
  from prestamo_banco_cuota
 where cod_prestamo = '19012023';

select *
  from orden_de_compra
 where serie = 3
   and num_ped = 702;

select *
  from movdeta d
 where d.ano = 2023
   and d.mes = 2
   and d.libro like '40'
   and d.estado = 0;

select *
  from movglos
 where ano = 2023
   and mes = 2
   and libro = '40'
   and voucher = 20002;

select *
  from movdeta_cua d
 where d.ano = 2023
   and d.mes = 2
   and d.libro like '40';

select *
  from movfide_situacion_banco
 where p_ano = 2023
   and p_mes = 2
   and cta_cte_banco = '191-1200848-1-86';

select *
  from prestamo_banco_cuota
 where cod_prestamo = '3479350';

select * from v$version;
