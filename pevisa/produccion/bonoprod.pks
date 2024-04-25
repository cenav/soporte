create or replace package bonoprod as
  subtype t_string is varchar2(32767);

  c_mensual constant t_string := 'ME';
  c_semestral constant t_string := 'SE';

  function porc_jefatura(
    p_personal varchar2
  , p_tipo     varchar2
  ) return number;

  function porc_jefatura_mensual(
    p_personal varchar2
  ) return number;

  function porc_jefatura_semestral(
    p_personal varchar2
  ) return number;

end bonoprod;

create public synonym bonoprod for bonoprod;