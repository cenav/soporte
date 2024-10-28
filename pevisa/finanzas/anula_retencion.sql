declare
  c_estado constant pls_integer  := 9;
  c_texto  constant varchar2(30) := '*****ANULADO*****';

  cursor cr_retenciones is
    select *
      from docu_ag
     where serie = 'R001'
       and numero in (
       5463
       );

  procedure anula_retencion(
    i_serie  docu_ag.serie%type
  , i_numero docu_ag.serie%type
  ) is
  begin
    update docu_ag
       set estado  = c_estado
         , detalle = c_texto
     where numero = i_numero
       and serie = i_serie;

    if (sql%found) then
      sys.dbms_output.put_line('Se anulo retencion ' || i_numero);
    end if;
  end;

  function existe_retencion(
    i_serie  docu_ag.serie%type
  , i_numero docu_ag.serie%type
  )
    return boolean is
    l_count pls_integer;
  begin
    select count(*)
      into l_count
      from docu_ag
     where numero = i_numero
       and serie = i_serie;

    return l_count > 0;
  end;
begin
  for r in cr_retenciones loop
    if existe_retencion(r.serie, r.numero) then
      anula_retencion(r.serie, r.numero);
      commit;
    else
      sys.dbms_output.put_line('NO existe retencion ' || r.numero);
    end if;
  end loop;
end;