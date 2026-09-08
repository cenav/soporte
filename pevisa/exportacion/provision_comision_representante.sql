select *
  from exprovision_comision
 where periodo_ano = 2026
   and periodo_mes = 6;

select *
  from exprovision_comision_det
 where periodo_ano = 2026
   and periodo_mes = 6;

declare
  c_ano constant pls_integer := 2026;
  c_mes constant pls_integer := 6;
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