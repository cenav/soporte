create or replace trigger tbiu_componentes_importados
  before insert or update
  on kardex_d
  for each row
declare
  l_linea articul.cod_lin%type;
begin
  l_linea := api_articul.onerow(:new.cod_art).cod_lin;
  if ((length(l_linea) = 3 and l_linea not between '900' and '999')
    or length(l_linea) != 3)
    and :new.cod_alm = '48' and :new.ing_sal = 'I'
  then
    raise_application_error(-20001, 'Almacen 48 solo ingreso de componentes importados');
  end if;
end;