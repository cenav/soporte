insert into seccrus
select 'ECARDENAS', co_ctrctr, co_clave, nombres
  from seccrus
 where co_usrusr in ('DISENO');

-- copia menu a usuario
insert into tab_menu
select cod_menu, descripcion, menus, titulo, nivel, 'ECARDENAS', estado, sistema, id_programa
  from tab_menu
 where usuario = 'DISENO';
