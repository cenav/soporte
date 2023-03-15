declare
  c_numero_orden simple_integer := 850725;
begin
  delete produccion_armado where numero_oa in (c_numero_orden);
  dbms_output.put_line(sql%rowcount);
  delete produccion_armado_log where numero_oa in (c_numero_orden);
  dbms_output.put_line(sql%rowcount);
  delete produccion_armado_his where numero_oa in (c_numero_orden);
  dbms_output.put_line(sql%rowcount);
  delete produccion_armado_cajas_his where numero_oa in (c_numero_orden);
  dbms_output.put_line(sql%rowcount);
  delete produccion_armado_cajas_det where numero_oa in (c_numero_orden);
  dbms_output.put_line(sql%rowcount);
  delete produccion_armado_rev where numero_oa in (c_numero_orden);
  dbms_output.put_line(sql%rowcount);
end;