declare
  l_contable pls_integer := 0;

  cursor cr_gasto_viaje is
    select *
      from gastos_de_viaje_habilitado
     where numero = 210
       and id_vendedor = '42';

begin
  for r in cr_gasto_viaje loop
    select count(*)
      into l_contable
      from gastos_de_viaje_d
     where numero = 210
       and id_vendedor = '42';

    if l_contable >= 1 then
      raise_application_error(
          -20001
        , 'viatico trabajado en contabilidad ' || r.numero || '-' || r.id_vendedor
      );
    end if;
  end loop;

  for r in cr_gasto_viaje loop
    update gastos_de_viaje_habilitado
       set estado = 1
     where numero = r.numero
       and id_vendedor = r.id_vendedor;

    delete gastos_de_viaje
     where numero = r.numero
       and id_vendedor = r.id_vendedor;

    delete gastos_de_viaje_m
     where numero = r.numero
       and id_vendedor = r.id_vendedor;
  end loop;
end ;
