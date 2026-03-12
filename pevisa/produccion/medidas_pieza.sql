select cod_art, medida_pieza, medida_pieza_ancho, medida_pieza_espesor
  from arti_plancha;

select *
  from pcarticul
 where cod_art = 'FS 86025 GR AKU';

select *
  from pcarticul
 where cod_art = 'FS 95118 MLS AKU';

select *
  from articul
 where cod_art = 'FS 88120 MLS AKU';

select *
  from arti_plancha
 where cod_art = 'FS 88120 MLS AKU';

/*
create or replace trigger tbi_pcarticul_medidas_pieza
  before insert
  on pcarticul
  for each row
declare
  l_existe number;
begin
  -- Bloqueo Alberto Wolfenzon no quitar
  -- Valida que se carguen las medidas de la pieza
  select count(*)
    into l_existe
    from arti_plancha
   where cod_art = :new.cod_art
     and medida_pieza is not null
     and medida_pieza_ancho is not null
     and medida_pieza_espesor is not null;

  if l_existe = 0 then
    raise_application_error(-20001, 'Debe ingresar medidas de la pieza');
  end if;
end;
*/

select * from prod_subgrupo_linea_rel;