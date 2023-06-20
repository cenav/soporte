declare
  cursor cr_ordenes is
    select *
      from orden_de_compra
     where serie = 4
       and num_ped in (
       60468
       );

  function ot_cerrada(
    p_serie  orden_de_compra.serie%type
  , p_numero orden_de_compra.num_ped%type
  ) return boolean is
    l_count simple_integer := 0;
  begin
    select count(*)
      into l_count
      from vw_compra_otm c
           left join ot_mantto o
                     on c.otm_tipo = o.id_tipo and c.otm_serie = o.id_serie and
                        c.otm_numero = o.id_numero
     where c.serie = p_serie
       and c.num_ped = p_numero
       and o.estado = 8;

    return l_count > 0;
  end;
begin
  for r in cr_ordenes loop
    if ot_cerrada(r.serie, r.num_ped) then
      raise_application_error(-20001, 'OT ya se encuentra cerrada');
    end if;

    update orden_de_compra
       set estado = '9'
     where serie = r.serie
       and num_ped = r.num_ped;

    if sql%notfound then
      sys.dbms_output.put_line('NO SE ACTUALIZO OC');
    else
      sys.dbms_output.put_line('Registros actualizados ' || sql%rowcount);
    end if;

    update itemord
       set estado = '9'
         , saldo  = 0
     where serie = r.serie
       and num_ped = r.num_ped;

    if sql%notfound then
      sys.dbms_output.put_line('NO SE ACTUALIZO DETALLE OC');
    else
      sys.dbms_output.put_line('Registros actualizados ' || sql%rowcount);
    end if;
  end loop;

  commit;
end;
