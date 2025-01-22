-- op emitidas
select a.dsc_grupo as grupo, o.numero as op, o.fecha, o.estado
     , o.cod_lin as linea, o.formu_art_cod_art as codigo, o.cant_prog as cantidad
  from pr_ot o
       join vw_articulo a on o.formu_art_cod_art = a.cod_art
 where o.nuot_tipoot_codigo = 'PR'
   and o.estado = 1
   and a.id_grupo in ('01', '02')
   and o.cant_prog < 1000
 order by a.dsc_grupo;

select distinct id_grupo, dsc_grupo from vw_articulo;

-- op emitidas complementos
select a.dsc_grupo as grupo, o.numero as op, o.estado, o.fecha
     , o.cod_lin as linea, o.formu_art_cod_art as codigo, o.cant_prog as cantidad
  from pr_ot o
       join vw_articulo a on o.formu_art_cod_art = a.cod_art
 where o.nuot_tipoot_codigo = 'PR'
   and length(o.cod_lin) = 4
   and o.cod_lin between '1860' and '1890'
   and o.estado not in ('7', '8', '9')
   and o.estado = 1
 order by a.dsc_grupo;

select * from pr_estadopr;

select * from pr_grupos;

select *
  from pr_ot o
 where o.nuot_tipoot_codigo = 'PR'
   and o.estado = '1'
   and o.formu_art_cod_art = '200.2560SGR';

select *
  from consumo_piezas_resumen
 where pieza = '92020/20GR';

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero in (
   552314
   );

select trunc(trunc(sysdate - 365), 'MONTH') as del, trunc(sysdate, 'MONTH') - 1 as al
  from dual;

select *
  from view_consumo_anual_piezas
 where pieza = '95242TG';

select *
  from consumo_piezas
 where cod_art = '95242TG';

select v.pieza, v.id_grupo, v.cod_lin, v.numero_de_clientes, v.meses, v.consumo_anual
     , v.tipo_de_cliente, v.cantidad_vendida, decode(vg.consumo_anual, 0, 0,
                                                     (v.consumo_anual * 100 / vg.consumo_anual)) as consumo_porcentaje
     , 0, 0, decode(vg.meses, 0, 0, (v.meses * 100 / vg.meses)) as meses_porcentaje, 0, 0, decode(
    vg.numero_de_clientes, 0, 0,
    (v.numero_de_clientes * 100 / vg.numero_de_clientes)) as clientes_porcentaje
     , 0, 0, 0, 0, 0
  from view_consumo_anual_piezas v
     , (
    select sum(v.numero_de_clientes) as numero_de_clientes, sum(v.meses) as meses
         , sum(v.consumo_anual) as consumo_anual
      from view_consumo_anual_piezas v
     where v.id_grupo = rec.id
     group by v.id_grupo
    ) vg
 where v.id_grupo = rec.id;

select *
  from articul
 where cod_art = '92020/20GR';

select *
  from activo_fijo_asigna
 where cod_empleado = 'E1210';

select *
  from kardex_g
 where cod_alm = 'A2'
   and tp_transac = '59'
   and serie = 1
   and numero = 177;

select *
  from activo_fijo
 where cod_activo_fijo in ('KIT AUDIOVISUAL41', '05SILL160');

select *
  from activo_fijo_asiento
 where cod_activo_fijo in ('KIT AUDIOVISUAL41', '05SILL160');