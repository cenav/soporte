-- Campos: Grupo, Linea, Marca, Código, Peso
select a.cod_art, a.cod_lin as linea, l.descripcion as dsc_linea, a.grupo
     , g.descripcion as dsc_grupo, a.peso_std
  from articul a
       left join tab_lineas l on a.cod_lin = l.linea
       left join tab_grupos g on a.grupo = g.grupo
 where a.cod_art = 'R-H 4123';

select *
  from tab_lineas
 where linea = '55';

select *
  from tab_grupos
 where grupo = 21;

select *
  from vw_articulo
 where cod_art = 'R-F 9105';

create view vw_articulo_peso as
select a.cod_art, a.cod_lin as linea, l.descripcion as dsc_linea, a.grupo
     , g.descripcion as dsc_grupo, a.peso_std
  from articul a
       left join tab_lineas l on a.cod_lin = l.linea
       left join tab_grupos g on a.grupo = g.grupo;

select cod_art, linea, dsc_linea, grupo, dsc_grupo, peso_std
  from vw_articulo_peso
 where (grupo = :grupo or :grupo is null)
   and (linea = :linea or :linea is null);

select grupo, descripcion
  from tab_grupos;

select linea, descripcion
  from tab_lineas;