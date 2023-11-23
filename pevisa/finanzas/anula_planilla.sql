declare
  c_anulado constant pls_integer := 9;

  cursor cr_planillas is
    select *
      from pagos_h
     where serie_planilla = 3
       and numero_planilla in (
                               000855, 000763, 000745, 000727, 000678, 000670
       );

  procedure anula_detalle(
    p_serie  pagos_h.serie_planilla%type
  , p_numero pagos_h.numero_planilla%type
  ) is
  begin
    update pagos_i
       set estado = c_anulado
     where serie_planilla = p_serie
       and numero_planilla = p_numero;

    if sql%found then
      sys.dbms_output.put_line('Detalle ' || p_serie || '-' || p_numero || ', ' || sql%rowcount ||
                               ' registro actualizados');
    else
      sys.dbms_output.put_line('No se actualizo detalle');
    end if;
  end;

  procedure anula_maestro(
    p_serie  pagos_h.serie_planilla%type
  , p_numero pagos_h.numero_planilla%type
  ) is
  begin
    update pagos_h
       set estado = c_anulado
     where serie_planilla = p_serie
       and numero_planilla = p_numero;

    if sql%found then
      sys.dbms_output.put_line('Cabecera ' || p_serie || '-' || p_numero || ', ' || sql%rowcount ||
                               ' registro actualizados');
    else
      sys.dbms_output.put_line('No se actualizo cabecera');
    end if;
  end;

  procedure anula_planilla_pagos(
    p_serie  pagos_h.serie_planilla%type
  , p_numero pagos_h.numero_planilla%type
  ) is
  begin
    anula_maestro(p_serie, p_numero);
    anula_detalle(p_serie, p_numero);
  end;

  function existe_planilla(
    p_serie  pagos_h.serie_planilla%type
  , p_numero pagos_h.numero_planilla%type
  ) return boolean is
    l_dummy  pls_integer := 0;
    l_existe boolean;

    cursor cur_planilla is
      select 1
        from pagos_h
       where serie_planilla = p_serie
         and numero_planilla = p_numero;
  begin
    open cur_planilla;

    fetch cur_planilla into l_dummy;

    l_existe := cur_planilla%found;

    close cur_planilla;

    return l_existe;
  end;
begin
  for r in cr_planillas loop
    if existe_planilla(r.serie_planilla, r.numero_planilla) then
      anula_planilla_pagos(r.serie_planilla, r.numero_planilla);
    else
      sys.dbms_output.put_line('No existe el numero de planilla');
    end if;
  end loop;

  commit;
end;