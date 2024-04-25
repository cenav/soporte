create or replace package iqbf as

  function existe(
    p_codigo varchar2
  ) return boolean;

  function en_oc(
    p_serie  number
  , p_numero number
  ) return boolean;

end iqbf;