select *
  from exfacturas
 where numero = 55017002;

select *
  from docuvent
 where tipodoc = '01'
   and serie = 'F055'
   and numero = 17002;

begin
  pr_expo_docuvent(x_tipo => '01', x_serie => 'F055', x_numero => 55017002);
end;