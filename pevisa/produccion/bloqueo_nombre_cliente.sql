select g.num_pedido, g.num_orden, g.serie_orden, o.estado, g.cod_art, g.tipo_orden, o.abre02
     , g.tipo_orden, g.serie_orden, g.num_orden
  from pr_consg g
     , pr_ot o
 where g.tipo_orden = o.nuot_tipoot_codigo
   and g.serie_orden = o.nuot_serie
   and g.num_orden = o.numero
   and g.tipo = 'CA'
--    and g.serie = :PR_CONSD.serie
   and g.numero = 60155189;

select *
  from usuario_modulo
 where modulo = 'NOMBRE_CLIENTE';

select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and nuot_serie = 3
   and numero = 1128989;

select g.*
  from pr_consg g
     , pr_ot o
 where g.tipo_orden = o.nuot_tipoot_codigo
   and g.serie_orden = o.nuot_serie
   and g.num_orden = o.numero
   and g.tipo = 'CA'
--    and g.serie = :PR_CONSD.serie
   and g.numero = 60155189;
