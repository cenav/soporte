declare
  k_nueva_cantidad constant pls_integer := 12;
  l_items_cambiados pls_integer := 0;

  cursor cr_ordenes is
    select *
      from pr_ot
     where nuot_tipoot_codigo = 'AR'
       and numero = 1047645      ;
begin
  for r in cr_ordenes loop
    update pr_ot
       set cant_prog = k_nueva_cantidad
     where nuot_tipoot_codigo = r.nuot_tipoot_codigo
       and nuot_serie = r.nuot_serie
       and numero = r.numero;

    l_items_cambiados := l_items_cambiados + sql%rowcount;

    update pr_ot_det
       set cant_formula = k_nueva_cantidad * rendimiento
     where ot_nuot_tipoot_codigo = r.nuot_tipoot_codigo
       and ot_nuot_serie = r.nuot_serie
       and ot_numero = r.numero;
    
    l_items_cambiados := l_items_cambiados + sql%rowcount;
  end loop;
  
  dbms_output.put_line(l_items_cambiados);
end;