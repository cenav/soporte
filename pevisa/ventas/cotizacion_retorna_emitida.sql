begin
  for r in (
    select *
      from cotizacion
     where num_ped = 218162
    )
  loop
    update pedido
       set estado = '9'
     where num_ped = r.refe_pedido;

    update itemped
       set estado = '9'
         , saldo  = 0
     where num_ped = r.refe_pedido;

    update cotizacion
       set estado      = '0'
         , refe_pedido = null
     where num_ped = r.num_ped;

    update itemcot
       set estado = '0'
     where num_ped = r.num_ped;
  end loop;
end;