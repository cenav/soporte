declare
  /* Anulacion de OT activo fijo */
  c_estado_anulado constant simple_integer := 9;
  c_estado_cerrado constant simple_integer := 8;

  ot                        ot_mantto%rowtype;

  cursor cr_ot_anular is
    select *
      from ot_mantto
     where id_tipo = 'PY'
       and id_serie = 1
       and id_numero in (
       24
       );

  function tiene_oc(
    p_tipo   ot_mantto.id_tipo%type
  , p_serie  ot_mantto.id_serie%type
  , p_numero ot_mantto.id_numero%type
  ) return boolean is
    l_count simple_integer := 0;
  begin
    select count(*)
      into l_count
      from vw_compra_otm
     where otm_tipo = p_tipo
       and otm_serie = p_serie
       and otm_numero = p_numero;

    return l_count > 0;
  end;

  function tiene_repuestos(
    p_tipo   ot_mantto.id_tipo%type
  , p_serie  ot_mantto.id_serie%type
  , p_numero ot_mantto.id_numero%type
  ) return boolean is
    l_count simple_integer := 0;
  begin
    select count(*)
      into l_count
      from vw_repuesto_otm
     where otm_tipo = p_tipo
       and otm_serie = p_serie
       and otm_numero = p_numero;

    return l_count > 0;
  end;

begin
  for r in cr_ot_anular loop
    ot := api_ot_mantto.onerow(r.id_tipo, r.id_serie, r.id_numero);

    case
      when r.estado = c_estado_cerrado then
        raise_application_error(-20001, 'estado cerrado');
      when tiene_oc(r.id_tipo, r.id_serie, r.id_numero) then
        raise_application_error(-20002, 'tiene OC');
      when tiene_repuestos(r.id_tipo, r.id_serie, r.id_numero) then
        raise_application_error(-20002, 'tiene repuestos');
      else
        update ot_mantto
           set estado = c_estado_anulado
         where id_tipo = r.id_tipo
           and id_serie = r.id_serie
           and id_numero = r.id_numero;
    end case;
  end loop;

  commit;
exception
  when others then
    if sqlcode not between -20999 and -20000 then
      logger.log_error('Anulacion de OTM');
    end if;

    rollback;
    raise;
end;