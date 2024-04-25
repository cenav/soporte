-- piezas de caucho
select cod_art, descripcion, cod_lin, cavidades, material
     , surte_util.subpieza(cod_art) as subpieza
  from vw_articulo
 where cod_lin between '1800' and '1850'
   and length(cod_lin) = 4;