create or replace package cotiza as

  procedure reordena_bosch(
    p_serie  number
  , p_numero number
  );

  procedure retorna_emitida(
    p_doc    varchar2
  , p_serie  number
  , p_numero number
  );

end cotiza;
