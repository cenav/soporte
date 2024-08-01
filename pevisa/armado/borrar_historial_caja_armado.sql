declare
  cursor cr_ordenes is
    select numero
      from pr_ot
     where numero in (
                      1060958, 1058529
       )
       and nuot_tipoot_codigo = 'AR';
begin
  for r in cr_ordenes loop
    delete produccion_armado where numero_oa in (r.numero);
    dbms_output.put_line(sql%rowcount);
    delete produccion_armado_log where numero_oa in (r.numero);
    dbms_output.put_line(sql%rowcount);
    delete produccion_armado_his where numero_oa in (r.numero);
    dbms_output.put_line(sql%rowcount);
    delete produccion_armado_cajas_his where numero_oa in (r.numero);
    dbms_output.put_line(sql%rowcount);
    delete produccion_armado_cajas_det where numero_oa in (r.numero);
    dbms_output.put_line(sql%rowcount);
    delete produccion_armado_rev where numero_oa in (r.numero);
    dbms_output.put_line(sql%rowcount);
  end loop;
end;