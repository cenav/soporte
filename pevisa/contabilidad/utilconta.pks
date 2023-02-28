create or replace package utilconta as

  procedure asiento_sin_detalle(
    p_ano simple_integer
  , p_mes simple_integer
  );

  procedure asiento_sin_detalle;

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

  procedure agrega_relacion(
    p_ano simple_integer
  , p_mes simple_integer
  );

  procedure agrega_relacion;

end utilconta;
