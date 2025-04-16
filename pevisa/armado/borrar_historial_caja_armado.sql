declare
  cursor cr_ordenes is
    select numero
      from pr_ot
     where numero in (
       394664
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

-- elimina solo el historial de una caja
select *
  from produccion_armado_cajas_his
 where cod_caja = 394664
 order by fecha;
