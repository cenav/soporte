select *
  from exprovision_comision
 where periodo_ano = 2024
   and periodo_mes = 4;

select *
  from exprovision_comision_det
 where periodo_ano = 2024
   and periodo_mes = 4;

declare
  c_ano constant pls_integer := 2024;
  c_mes constant pls_integer := 4;
begin

  delete
    from exprovision_comision
   where periodo_ano = c_ano
     and periodo_mes = c_mes;

  delete
    from exprovision_comision_det
   where periodo_ano = c_ano
     and periodo_mes = c_mes;

end;