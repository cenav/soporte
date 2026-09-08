select *
  from produccion_armado_log
 where numero_oa = 1148769;


select *
  from produccion_armado
 where numero_oa = 1148769;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and numero = 1148769;

select *
  from expedido_d
 where numero = 17119;

select * from produccion_armado_log;

-- analisis cajas armado
  with master as (
    select f.cod_art, f.cod_for, a.cod_lin, f.canti as rendimiento
      from pcformulas f
           join articul a on f.cod_for = a.cod_art
     where a.cod_lin in ('855')
    )
     , cajas as (
    select l.numero_oa, l.cod_caja, c.tipo_caja, l.cantidad
         , row_number() over (partition by l.numero_oa order by l.numero_oa, l.cantidad desc) as rn
      from produccion_armado_log l
           join produccion_armado_cajas c on l.cod_caja = c.cod_caja
--      where numero_oa in (1148769, 1122957)
     order by l.numero_oa, l.cantidad desc
    )
     , detalle as (
    select p.numero as pedido, p.nombre, d.nro as item, d.cod_art, o.numero as oa, o.cant_prog
         , c.tipo_caja as caja_armado, c.cantidad, m.cod_for as caja_master, m.rendimiento
         , round(1 / m.rendimiento, 2) as rendimiento_inverso, c.rn
         , case
             when abs(c.cantidad - round(1 / m.rendimiento, 2)) / c.cantidad <= 0.01 then 'IGUAL'
             else 'DIFERENTE'
           end as comparacion
      from expedidos p
           join expedido_d d on p.numero = d.numero
           join pr_ot o on d.numero = o.abre01 and d.nro = o.per_env
           join cajas c on c.numero_oa = o.numero and c.rn = 1
           join master m on d.cod_art = m.cod_art
     where p.numero in (16941, 16942, 16940, 17137, 17138, 17139)
--      where o.numero in (1148769, 1122957)
     order by p.numero, d.nro, d.cod_art
    )
select d.pedido, d.nombre, d.item, d.cod_art, d.oa, d.cant_prog, d.caja_armado, d.cantidad
     , d.caja_master, d.rendimiento, d.rendimiento_inverso
  from detalle d
 where d.comparacion = 'DIFERENTE'
 order by pedido, item;

select *
  from pcformulas f
       join articul a on f.cod_for = a.cod_art
 where f.cod_art = 'KIT AUT OS 32241 AL R'
   and a.cod_lin in ('855');

select *
  from tab_lineas_tipo_linea
 where cod_tipo = 5;