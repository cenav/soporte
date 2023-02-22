declare
  c_ano constant pls_integer := 2020;
  c_mes constant pls_integer := 1;
begin
  update movdeta
     set tipo_referencia = '00'
   where ano = c_ano
     and mes = c_mes
     and tipo_referencia is null;

  update movdeta
     set serie = '0000'
   where ano = c_ano
     and mes = c_mes
     and serie is null;

  update movdeta
     set nro_referencia = '0000000'
   where ano = c_ano
     and mes = c_mes
     and nro_referencia is null;

  commit;
end;