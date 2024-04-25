create or replace package body iqbf as

  function existe(
    p_codigo varchar2
  ) return boolean is
    l_count pls_integer := 0;
  begin
    select count(*)
      into l_count
      from articul_iqf
     where cod_art = p_codigo;

    return l_count > 0;
  end;

  function en_oc(
    p_serie  number
  , p_numero number
  ) return boolean is
    l_count pls_integer := 0;
  begin
    select count(*)
      into l_count
      from itemord i
     where i.serie = p_serie
       and i.num_ped = p_numero
       and exists(
       select 1
         from articul_iqf a
        where a.cod_art = i.cod_art
       );

    return l_count > 0;
  end;

end iqbf;