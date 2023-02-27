create or replace package body utilconta as

  procedure completa_cero(
    p_ano simple_integer
  , p_mes simple_integer
  ) is
  begin
    update movdeta
       set tipo_referencia = '00'
     where ano = p_ano
       and mes = p_mes
       and tipo_referencia is null;

    update movdeta
       set serie = '0000'
     where ano = p_ano
       and mes = p_mes
       and serie is null;

    update movdeta
       set nro_referencia = '0000000'
     where ano = p_ano
       and mes = p_mes
       and nro_referencia is null;
  end;

  procedure completa_cero is
  begin
    completa_cero(extract(year from sysdate), extract(month from sysdate));
  end;

  procedure elimina_relacion(
    p_ano simple_integer
  , p_mes simple_integer
  ) is
  begin
    update movdeta
       set tipo_relacion = null
     where ano = p_ano
       and mes = p_mes
       and relacion is null
       and tipo_relacion is not null;
  end;

  procedure elimina_relacion is
  begin
    elimina_relacion(extract(year from sysdate), extract(month from sysdate));
  end;

  procedure agrega_relacion(
    p_ano simple_integer
  , p_mes simple_integer
  ) is
    l_ano simple_integer := 0;
  begin
    select ano
      into l_ano
      from movdeta
     where ano = 2022
       and mes = 12
       and relacion is null
       and tipo_relacion is not null;
  end;
end;