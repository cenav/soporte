-- pedidos exportacion
declare
  l_count pls_integer := 0;

  cursor cr_elimina is
    select e.numero, e.nro, o.nuot_tipoot_codigo, o.nuot_serie, o.numero as nuot_numero
      from expedido_d e
           join pr_ot o on e.numero = o.abre01 and e.nro = o.per_env and o.destino = '1'
     where e.canti = 0
       and e.id is null
       and o.cant_prog = 0
       and o.estado = '1';

begin
  for r in cr_elimina loop
    delete
      from expedido_d
     where numero = r.numero
       and nro = r.nro;

    l_count := l_count + sql%rowcount;


    update pr_ot
       set estado = '9'
     where nuot_tipoot_codigo = r.nuot_tipoot_codigo
       and nuot_serie = r.nuot_serie
       and numero = r.nuot_numero;

    delete
      from pr_ot
     where nuot_tipoot_codigo = r.nuot_tipoot_codigo
       and nuot_serie = r.nuot_serie
       and numero = r.nuot_numero;

    l_count := l_count + sql%rowcount;
  end loop;

  dbms_output.put_line(l_count);
end;

-- pedidos nacional
declare
  l_count pls_integer := 0;

  cursor cr_elimina is
    select e.numero, e.nro, o.nuot_tipoot_codigo, o.nuot_serie, o.numero as nuot_numero
      from expednac_d e
           join pr_ot o on e.numero = o.abre01 and e.nro = o.per_env and o.destino = '2'
     where e.canti = 0
       and e.id is null
       and o.cant_prog = 0
       and o.estado = '1';

begin
  for r in cr_elimina loop
    delete
      from expednac_d
     where numero = r.numero
       and nro = r.nro;

    l_count := l_count + sql%rowcount;

    delete
      from pr_ot
     where nuot_tipoot_codigo = r.nuot_tipoot_codigo
       and nuot_serie = r.nuot_serie
       and numero = r.nuot_numero;

    l_count := l_count + sql%rowcount;
  end loop;

  dbms_output.put_line(l_count);
end;

select *
  from pr_prioridad_tmp_30
 where canti = 0;
