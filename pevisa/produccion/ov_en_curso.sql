select *
  from pr_ot
 where nuot_tipoot_codigo = 'VA'
   and estado;

select c.nuot_tipoot_codigo as tipo, c.numero, c.estado, c.fecha, c.cant_prog, c.cant_ingresado
  from vw_ordenes_curso c
 where c.cod_art = '380.752'
   and c.nuot_tipoot_codigo = 'VA';

select o.nuot_tipoot_codigo as tipo, o.numero, o.formu_art_cod_art as cod_art, o.cant_prog
     , o.cant_ingresado, o.estado, o.fecha, o.usuario
--   case when o.cant_resul > 0 then o.cant_resul else o.cant_prog end - o.cant_ingresado as saldo
  from pr_ot o
 where o.estado < 5
   and o.nuot_tipoot_codigo = 'VA'
 order by o.fecha desc;
