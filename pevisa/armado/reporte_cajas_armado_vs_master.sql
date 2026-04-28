select *
  from produccion_armado_log
 where numero_oa = 1148769;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and numero = 1148769;

select *
  from expedido_d
 where numero = 17119;

select p.numero as pedido, p.nombre, d.nro as item, d.cod_art, o.numero as oa, c.tipo_caja
     , c.cantidad
  from expedidos p
       join expedido_d d on p.numero = d.numero
       join pr_ot o on d.numero = o.abre01 and d.nro = o.per_env
       join produccion_armado_log l on l.numero_oa = o.numero
       join produccion_armado_cajas c on l.cod_caja = c.cod_caja
 where p.numero = 17119
   and o.numero = 1148769
 order by p.numero, d.nro, d.cod_art;

select *
  from pcformulas f
       join articul a on f.cod_for = a.cod_art
 where f.cod_art = 'KIT AUT OS 32241 AL R'
   and exists(
   select *
     from tab_lineas_tipo_linea l
    where l.cod_tipo = 3
      and l.cod_linea = a.cod_lin
   );

select *
  from tab_lineas_tipo_linea
 where cod_tipo = 3;

select distinct l.cod_caja, c.tipo_caja, sum(l.cantidad) as cantidad, l.id_linea_prod, c.estado
  from produccion_armado_log l
     , produccion_armado_cajas c
 where l.cod_caja = c.cod_caja
   and numero_oa = 1148769
 group by l.cod_caja, c.tipo_caja, l.id_linea_prod, c.estado
 order by l.cod_caja;
