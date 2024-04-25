create or replace package body bonoprod as

  function porc_jefatura(
    p_personal varchar2
  , p_tipo     varchar2
  ) return number is
    l_porc number;
  begin
    select porcentaje_neto
      into l_porc
      from comision_ingeniero_asigna
     where cod_personal = p_personal
       and cod_tipo = p_tipo;

    return l_porc;
  end;

  function porc_jefatura_mensual(
    p_personal varchar2
  ) return number is
  begin
    return porc_jefatura(p_personal, c_mensual);
  end;

  function porc_jefatura_semestral(
    p_personal varchar2
  ) return number is
  begin
    return porc_jefatura(p_personal, c_semestral);
  end;

end bonoprod;