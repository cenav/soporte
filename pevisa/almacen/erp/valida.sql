declare
  function linea_incorrecta(
    p_linea varchar2
  ) return boolean is
    l_error boolean;
  begin

    if (length(p_linea) = 3 and p_linea not between '900' and '999') or
       (length(p_linea) = 4 and p_linea not in ('1252', '1430')) or
       length(p_linea) not in (3, 4)
    then
      l_error := true;
    else
      l_error := false;
    end if;

    return l_error;
  end;
begin
  assert.is_false(linea_incorrecta('950'));
  assert.is_false(linea_incorrecta('900'));
  assert.is_false(linea_incorrecta('999'));
  assert.is_false(linea_incorrecta('1252'));
  assert.is_false(linea_incorrecta('1430'));
  assert.is_true(linea_incorrecta('800'));
  assert.is_true(linea_incorrecta('1000'));
  assert.is_true(linea_incorrecta('10'));
end;
