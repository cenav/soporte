declare
  c_nro_letra    constant letras.nrolet%type      := 377254;
  c_nuevo_vencto constant letras.vencimiento%type := to_date('01/04/2024', 'dd/mm/yyyy');
begin
  select *
    from letras
   where serlet = 1
     and nrolet = c_nro_letra;

  update factcob
     set f_vencto = c_nuevo_vencto
   where tipdoc = 'L1'
     and serie_num = '1'
     and numero = c_nro_letra;
end;

select *
  from factcob
 where tipdoc = 'L1'
   and serie_num = '1'
   and numero = '377254';

select *
  from letras
 where nrolet = 377254;
