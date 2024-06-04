declare
  l_ultimo_estado pr_ot.estado%type;
  l_cambios       pls_integer := 1;

  cursor cr_estado is
    select *
      from pr_ot
     where nuot_tipoot_codigo = 'AR'
       and estado is null;
begin
  for r in cr_estado loop
      with estados as (
        select estado
          from pr_trasab_estado
         where tipo = r.nuot_tipoot_codigo
           and serie = r.nuot_serie
           and numero = r.numero
         order by fecha desc
        )
    select estado
      into l_ultimo_estado
      from estados
     where rownum = 1;

    update pr_ot
       set estado = l_ultimo_estado
     where nuot_tipoot_codigo = r.nuot_tipoot_codigo
       and nuot_serie = r.nuot_serie
       and numero = r.numero;

    l_cambios := l_cambios + sql%rowcount;
  end loop;
  dbms_output.put_line(l_cambios);
end;