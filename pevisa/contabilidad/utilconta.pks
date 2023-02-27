create or replace package utilconta as

  procedure completa_cero(
    p_ano simple_integer
  , p_mes simple_integer
  );

  procedure completa_cero;

  procedure elimina_relacion(
    p_ano simple_integer
  , p_mes simple_integer
  );

  procedure elimina_relacion;

end utilconta;
