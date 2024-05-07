declare
  c_nueva_fecha constant date        := to_date('24/04/2024', 'dd/mm/yyyy');
  l_dias                 pls_integer := 0;

  cursor cr_facturas is
    select *
      from exfacturas
     where numero in (
                      55017847, 55017848, 55017849, 55017850, 55017851, 55017852, 55017853,
                      55017854, 55017855, 55017856, 55017857, 55017858, 55017859, 55017860,
                      55017861, 55017862, 55017863, 55017864, 55017865, 55017866, 55017867,
                      55017868, 55017869, 55017870, 55017871, 55017872, 55017873, 55017874,
                      55017875, 55017876, 55017877
       );
begin
  for r in cr_facturas loop
    l_dias := 0;
    begin
      select nvl(vence1, 0)
        into l_dias
        from excondpago
       where cond_pago = r.cond_pago;
    exception
      when others then raise_application_error(-20001, 'REVISAR CONDICION DE PAGO');
    end;

    update exfacturas
       set fecemb = c_nueva_fecha
         , fecven = c_nueva_fecha + l_dias
     where numero = r.numero;
  end loop;
end;