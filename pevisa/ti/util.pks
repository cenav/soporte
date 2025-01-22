create or replace package util as

  subtype string_type is varchar2(32767);

  type t_list is table of string_type;

  function concat_list(
    p_list t_list
  , p_sep  varchar2
  ) return varchar2;

  procedure add_to_list(
    p_list in out t_list
  , p_add         varchar2
  );

end util;
