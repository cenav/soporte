create or replace package body util as

  function concat_list(
    p_list t_list
  , p_sep  varchar2
  ) return varchar2 is
    l_list string_type;
  begin
    for i in p_list.first .. p_list.last loop
      if l_list is not null then
        l_list := l_list || p_sep || p_list(i);
      else
        l_list := p_list(i);
      end if;
    end loop;

    return l_list;
  end;

  procedure add_to_list(
    p_list in out t_list
  , p_add         varchar2
  ) is
  begin
    p_list.extend(1);
    p_list(p_list.count) := p_add;
  end;

end util;
