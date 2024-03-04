select *
  from movglos
 where ano = 2023
   and mes = 8
   and libro = '40'
   and voucher in (80003, 80004, 80005, 80006, 80007);

select *
  from movdeta
 where ano = 2024
   and mes = 1
   and libro = '10'
   and voucher in (21303201);

select *
  from factpag
 where cod_proveedor = '20182246078'
   and numero = '0021607';

select *
  from cabfpag
 where cod_proveedor = '20182246078'
   and numero = '0021845';

select *
  from cabfpag
 where ano = 2022
   and mes = 12
   and libro = '39'
   and voucher = 120006;

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
 where ano = 2024
   and mes = 1
   and tipo = '2'
   and voucher = 13033;

select *
  from prestamo_banco_cuota
 where cod_prestamo = '19012023';

select *
  from orden_de_compra
 where serie = 3
   and num_ped = 850;

select *
  from orden_de_compra_historia
 where serie = 3
   and num_ped = 811;

select *
  from itemord
 where serie = 3
   and num_ped = 789;

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
   and p_mes = 4
   and cta_cte_banco = '191-1200848-1-86';

select *
  from prestamo_banco_cuota
 where cod_prestamo = '3479350';

select *
  from caja_chica
 where serie = 1
   and numero = 189;

select *
  from plancta
 where cuenta = '442902';


select u.serie, s.nombres, cod_unidad_negocio
  from usuarios_caja_chica u
     , caja_chica_serie s
 where u.usuario = user
   and u.estado = '1'
   and s.id_serie = u.serie
   and s.tipo_caja = 'CAJA CHICA'
   and not exists
   (
     select distinct ch.serie
       from caja_chica ch
      where ch.serie = u.serie and ch.estado = 1
     )
 order by 1;


select *
  from cambdol
 where fecha = to_date('03/11/2023', 'dd/mm/yyyy');

select codigo, descripcion
  from tablas_auxiliares
 where tipo = 77
 order by codigo;


select codigo, descripcion
  from tablas_auxiliares
 where tipo = 3
 order by codigo;

select *
  from view_registro_de_compras_cont
 where ano = 2024
   and voucher = 10022;