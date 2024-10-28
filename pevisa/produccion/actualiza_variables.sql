select * from pr_variables;

create or replace procedure sp_actualiza_param_produccion(
  p_fecha date default sysdate
) as
  l_boleta varchar2(50);
  l_fecha  date;
begin
  l_boleta := 'BP' || to_char(p_fecha, 'RR') || to_char(p_fecha, 'MM');
  l_fecha := trunc(p_fecha);

  update pr_variables
     set boleta_ingreso = l_boleta
       , boleta_salida  = l_boleta
       , fecha_ingreso  = l_fecha
       , fecha_salida   = l_fecha
   where empresa = 'PEVISA AUTO PARTS S.A.C.';

  commit;
end;

begin
  sp_actualiza_param_produccion();
end;