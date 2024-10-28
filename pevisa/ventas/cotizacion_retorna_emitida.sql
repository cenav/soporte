begin
  for r in (
--     select c.num_ped as num_cot, c.refe_pedido as num_ped, c.fecha, c.estado
--       from cotizacion c
--      where c.refe_pedido in (
--        222701
--        )
    select c.num_ped as num_cot, c.refe_pedido as num_ped, c.fecha, c.estado
      from cotizacion c
     where ((c.num_ped = :p_cotizacion or :p_cotizacion is null) and
            (c.refe_pedido = :p_pedido or :p_pedido is null))
    )
  loop
    update pedido
       set estado = '9'
     where num_ped = r.num_ped;

    update itemped
       set estado = '9'
         , saldo  = 0
     where num_ped = r.num_ped;

    update cotizacion
       set estado      = '0'
         , refe_pedido = null
     where num_ped = r.num_cot;

    update itemcot
       set estado = '0'
     where num_ped = r.num_cot;
  end loop;
end;