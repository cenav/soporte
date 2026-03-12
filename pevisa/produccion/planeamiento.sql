begin
  surte.por_item();
end;

select *
  from vw_planeamiento_sao
 where cod_cliente = '992073'
   and nro_pedido = 15973;

-- OA impresas
select o.nuot_tipoot_codigo as tipo, o.numero, trunc(o.fecha) as fecha, o.estado
     , o.formu_art_cod_art as codigo, o.cod_lin, o.cant_prog
  from pr_ot o
 where o.nuot_tipoot_codigo = 'AR'
   and o.estado = '1'
   and o.formu_art_cod_art = 'SA5975-1'
   and not exists (
   select 1
     from pr_ot_impresion i
    where o.nuot_tipoot_codigo = i.nuot_tipoot_codigo
      and o.nuot_serie = i.nuot_serie
      and o.numero = i.numero
   );

select * from vw_stock_almacen;

  with stock_art as (
    select cod_art, sum(stock) as stock
      from almacen
     where cod_alm in ('03', '05')
     group by cod_art
    )
select s.nom_color, j.ranking, j.nom_cliente, j.cod_cliente, j.nro_pedido, j.itm_pedido
     , j.fch_pedido, j.ot_numero, p.cantidad as ot_cantidad, j.cod_jgo as formula
     , j.valor, j.ot_estado, s.id_color, j.es_armar, j.es_urgente, j.es_prioritario
     , a1.dsc_grupo as grupo_1, p.cod_pza as articulo_1, a1.cod_lin as linea_1, s1.stock as stock_1
     , a2.dsc_grupo as grupo_2, s.cod_sao as articulo_2, a2.cod_lin as linea_2, s2.stock as stock_2
     , s.cantidad as cant_requerida
  from vw_surte_jgo j
       join vw_surte_pza p
            on j.nro_pedido = p.nro_pedido
              and j.itm_pedido = p.itm_pedido
       join vw_surte_sao s
            on p.nro_pedido = s.nro_pedido
              and p.itm_pedido = s.itm_pedido
              and p.cod_pza = s.cod_pza
       join vw_articulo a1 on s.cod_pza = a1.cod_art
       join vw_articulo a2 on s.cod_sao = a2.cod_art
       join stock_art s1 on a1.cod_art = s1.cod_art
       join stock_art s2 on a2.cod_art = s2.cod_art
 where a2.cod_art = '400.2438'
 order by a1.dsc_grupo, ranking, cod_cliente;

select s.nro_pedido, s.itm_pedido, s.cod_pza, s.cod_sao, s.cantidad, s.rendimiento
     , s.stock_inicial, s.stock_actual, s.saldo_stock, s.sobrante, s.faltante, s.cant_final
     , case s.es_importado when 0 then 'NO' when 1 then 'SI' end as es_importado
     , case s.tiene_stock_itm when 0 then 'NO' when 1 then 'SI' end as tiene_stock_itm
     , s.id_color, c.dsc_color, c.nom_color, c.colorindex, c.orden
  from tmp_surte_sao s
       left join color_surtimiento c on s.id_color = c.id_color;

select *
  from vw_ordenes_impresas_piezas
 where art_cod_art = '400.2438';

select nvl(sum(cant_formula), 0) as stock_oa_impresa
  from vw_ordenes_impresas_piezas
 where art_cod_art = '400.2438';

select *
  from vw_articulo
 where cod_art = '400.2438';

-- query hoja de items
select ranking, nom_cliente, nro_pedido, itm_pedido, ot_numero, cod_jgo, valor, valor_surtir
     , es_juego, tiene_importado
     , tiene_stock_ot, impreso, se_puede_partir, cant_partir, nom_color, cant_prog
  from vw_surte_jgo
 where cod_cliente = '992073'
   and nro_pedido = 15973
 order by ranking;

select * from tipo_linea;

select *
  from tab_lineas_tipo_linea
 where cod_tipo = 2;

select nvl(sum(cant_prog), 0) as stock_oa_impresa
  from vw_ordenes_impresas_embalaje
 where formu_art_cod_art = 'CAJA 250.525/45 KRF';


create view vw_analisis_embalaje as
  with stock_art as (
    select cod_art, sum(stock) as stock
      from almacen
     where cod_alm in ('06')
     group by cod_art
    )
     , orden_impresa as (
    select formu_art_cod_art, nvl(sum(cant_prog), 0) as stock_orden_impresa
      from vw_ordenes_impresas_embalaje
     group by formu_art_cod_art
    )
select m.cod_art
     , listagg(f.cod_for, ' | ') within group (order by f.cod_for) as tipo_embalaje
     , listagg(f.canti, ' | ') within group (order by f.canti) as rendimiento
     , listagg(s.stock, ' | ') within group (order by s.stock) as stock_06
     , listagg(nvl(i.stock_orden_impresa, 0), ' | ')
               within group (order by i.stock_orden_impresa) as stock_orden_impresa
  from pcmasters m
       join pcformulas f on m.cod_art = f.cod_art
       join articul a on a.cod_art = f.cod_for
       left join stock_art s on f.cod_for = s.cod_art
       left join orden_impresa i on f.cod_for = i.formu_art_cod_art
 where cod_lin in (
   select cod_linea
     from tab_lineas_tipo_linea
    where cod_tipo = 3
   )
 group by m.cod_art;

select cod_art, tipo_embalaje, rendimiento, stock_06, stock_orden_impresa
  from vw_analisis_embalaje
 where cod_art = 'AUT CH 1024 MLS';

create or replace view vw_ordenes_impresas_embalaje as
  with impresion as (
    select nuot_tipoot_codigo, nuot_serie, numero, max(fecha) as fch_impresion
      from pr_ot_impresion
     where nuot_tipoot_codigo = 'PR'
     group by nuot_tipoot_codigo, nuot_serie, numero
    )
     , ordenes as (
    select h.abre01 as pedido, h.per_env as pedido_item, h.nuot_tipoot_codigo, h.nuot_serie
         , h.numero, h.fecha
         , h.estado, h.destino, h.formu_art_cod_art, h.cant_prog
         , case g.grupo when 1 then 1 else 0 end as es_juego, i.fch_impresion
         , round(sysdate - i.fch_impresion) as dias_impreso
      from pr_ot h
           left join tab_lineas l on h.cod_lin = l.linea
           left join tab_grupos g on l.grupo = g.grupo
           join impresion i
                on h.numero = i.numero
                  and h.nuot_serie = i.nuot_serie
                  and h.nuot_tipoot_codigo = i.nuot_tipoot_codigo
     where h.nuot_tipoot_codigo = 'PR'
       and h.estado in (1, 2)
    )
select o.pedido, o.pedido_item, o.nuot_tipoot_codigo, o.nuot_serie, o.numero, o.fecha, o.estado
     , o.destino, o.formu_art_cod_art, o.cant_prog, o.es_juego, o.fch_impresion, o.dias_impreso
  from ordenes o;

select *
  from pr_ot
 where formu_art_cod_art = 'CAJA 250.525/45 KRF'
   and extract(year from fecha) = 2023;

select *
  from pr_ot_impresion
 where nuot_tipoot_codigo = 'PR'
   and numero = 562608;

select *
  from pr_ot_impresion
 where numero = 535585;

select *
  from vw_ordenes_pedido_pendiente
 where pedido = 16739;

select id_pedido
  from view_pedidos_pendientes_38
 where exists (
   select 1
     from pr_embarques p
          join pr_programa_embarques_id i
               on p.ano_embarque = i.ano
                 and p.mes_embarque = i.mes
                 and i.estado = 1
    where p.id_pedido =
          view_pedidos_pendientes_38.id_pedido
   )
   and id_pedido = 16336
 union
select id_pedido
  from view_pedidos_pendientes_38
 where cod_cliente in (
   select gcc.cod_cliente
     from grupo_cliente gc
          join grupo_cliente_cliente gcc on gc.cod_grupo = gcc.cod_grupo
    where gc.es_simulacion = 1
   )
   and id_pedido = 16336;

select *
  from pr_embarques
 where id_pedido = 16739;

select *
  from pr_programa_embarques_id
 where estado = 1;

select *
  from pr_programa_embarques_id
 where ano = 2025
   and mes = 2;

select *
  from expedidos
 where numero = 16739;

select get_descripcion_grupo_pieza(pp.cod_pza) as descripcion_grupo, a.cod_lin, pp.cod_pza
     , pp.art_cod_art as color, sum(pp.saldo) as saldo
     , sum(f_compras_en_curso(pp.cod_pza)) as compras_en_curso
     , decode(pp.art_cod_art, 'G',
              'Desarrollo',
              'M', 'Inc. Importado',
              'R', 'Inc. Nacional',
              'B', 'Azul',
              'Otro'
       ) as descripcion_color
     , f_stock_almacen(cod_pza, '42') as stock_alm_42
  from tmp_faltantes_importados pp
     , articul a
 where pp.cod_pza = a.cod_art
 group by get_descripcion_grupo_pieza(pp.cod_pza), pp.cod_pza, a.cod_lin, pp.cod_pza, pp.art_cod_art
 order by 2, 3;

  with detalle as (
    select pp.numero, get_descripcion_grupo_pieza(pp.cod_pza) as descripcion_grupo, a.cod_lin
         , pp.cod_pza, pp.color, sum(pp.saldo) as saldo
      from pr_prioridad_pedido_color pp
         , articul a
     where pp.cod_pza = a.cod_art
--	             AND    GET_GRUPO_PIEZA (PP.COD_PZA) <> '11'
       and pp.prioridad in (
       select prioridad
         from temp_priori_selecionadas
        where usuario = user
       )
     group by pp.numero, get_descripcion_grupo_pieza(pp.cod_pza), a.cod_lin, pp.cod_pza, pp.color
    )
select *
  from detalle
 where detalle.numero = 16456;


select *
  from pr_prioridad_pedido_color
 where numero = 16532;

select *
  from pr_prioridad_pza_30
 where prioridad = 6103
   and numero = 16532
   and cod_pza = '66044SR';

select p.ranking, p.nom_cliente, p.nro_pedido, p.itm_pedido, p.fch_pedido, p.ot_numero, p.cod_jgo
     , p.cod_pza, p.valor, p.cantidad, p.rendimiento, p.stock_actual, p.cant_final, p.saldo_stock
     , p.stock_inicial, p.nom_color as color_pza, j.nom_color as color_jgo
  from vw_surte_jgo j
     , vw_surte_pza p
 where j.nro_pedido = p.nro_pedido
   and j.itm_pedido = p.itm_pedido
   and cod_pza = '95313-CHGR'
 order by p.ranking;

select *
  from vw_surte_sao
 where cod_sao = '300.539A';

-- resta ordenes que estan impresas al stock actual de las piezas
  with impresas as (
    select o.art_cod_art, sum(o.cant_formula) as impreso
      from vw_ordenes_impresas_piezas o
--                    join param_surte p on p.id_param = 1
--              where o.dias_impreso <= p.dias_impreso_bien
     group by o.art_cod_art
    )
     , stock as (
    select distinct art_cod_art, stock
      from vw_ordenes_pedido_pendiente
    )
select s.art_cod_art, s.stock, i.impreso as impreso
     , greatest(s.stock - nvl(i.impreso, 0), 0) as stock
  from stock s
       left join impresas i on s.art_cod_art = i.art_cod_art
 where i.art_cod_art = '95313-CHGR';

select o.art_cod_art, sum(o.cant_formula) as impreso
  from vw_ordenes_impresas_piezas o
 where o.art_cod_art = '95313-CHGR'
 group by o.art_cod_art;


select o.pedido, o.pedido_item as item, o.nuot_tipoot_codigo as tipo, o.numero
     , o.formu_art_cod_art as formula, o.art_cod_art as pieza, o.cant_prog
  from vw_ordenes_impresas_piezas o
 where o.art_cod_art = '95313-CHGR';

select *
  from vw_surte_pza
 where cod_pza = '90010SB';

select *
  from vw_surte_pza
 where cod_pza = 'ARO 66110-I';

select *
  from vw_surte_sao
 where cod_sao = 'ARO 66110';

select *
  from vw_surte_pza
 where cod_pza = '180.761MLS'
   and ot_tipo = 'AR';

  with stock_actual as (
    select cod_art, stock
      from vw_stock_almacen
    )
     , impresion
    as (
    select nuot_tipoot_codigo, nuot_serie, numero, max(fecha) as fch_impresion
      from pr_ot_impresion
     where nuot_tipoot_codigo = 'AR'
     group by nuot_tipoot_codigo, nuot_serie, numero
    )
     , prioridad_marcada
    as (
    select id_pedido
      from view_pedidos_pendientes_38
     where exists (
       select 1
         from pr_embarques p
              join pr_programa_embarques_id i
             --condicion para que tome tambien desmarcados
             --ON     p.ano_embarque = i.ano
             --  AND p.mes_embarque = i.mes
                   on i.estado = 1
        where p.id_pedido =
              view_pedidos_pendientes_38.id_pedido
       )
       --PRIORIDAD EVITAR LOS 7...
       and prioridad not like '7%'
     union
    select id_pedido
      from view_pedidos_pendientes_38
     where cod_cliente in
           (
             select gcc.cod_cliente
               from grupo_cliente gc
                    join grupo_cliente_cliente gcc
                         on gc.cod_grupo = gcc.cod_grupo
              where gc.es_simulacion = 1
             )
    )
     , cliente_nuevo
    as (
    select case
             when v.nombre_corp is not null then v.nombre_corp
             else e.cod_cliente
           end
      as cod_corporativo
         , case
             when v.nombre_corp is not null then v.nombre_corp
             when c.abreviada is not null then c.abreviada
             else c.nombre
           end
      as nombre
         , count(*) as compras
      from expedidos e
           left join exclientes_varios v
                     on e.cod_cliente = v.cod_cliente
           left join exclientes c on e.cod_cliente = c.cod_cliente
     where e.estado != '9'
       and e.fecha > add_months(sysdate, - (12 * 3))
    having count(*) <= 2
     group by case
                when v.nombre_corp is not null then v.nombre_corp
                else e.cod_cliente
              end
            , case
                when v.nombre_corp is not null then v.nombre_corp
                when c.abreviada is not null then c.abreviada
                else c.nombre
              end
     order by nombre
    )
     , ordenes
    as (
    select h.abre01 as pedido, h.per_env as pedido_item, h.numero, h.nuot_serie
         , h.nuot_tipoot_codigo, h.fecha, h.hora_fab as jaba, h.estado, h.destino, d.art_cod_art
         , d.cant_formula, d.saldo, d.rendimiento, d.cant_formula - nvl(d.saldo, 0) as despachar
         , d.cod_lin, h.formu_art_cod_art, h.abre02, h.cant_prog
         , case g.grupo when 1 then 1 else 0 end as es_juego
         , case when i.numero is not null then 'SI' else 'NO' end
      as impreso
         , i.fch_impresion, case
                              when d.cod_lin between '900' and '999'
                                and length(d.cod_lin) = 3
                                then
                                1
                              else
                                0
                            end
      as es_importado
         , case a.tp_art when 'A' then 1 else 0 end as es_sao
      from pr_ot h
           join pr_ot_det d
                on h.numero = d.ot_numero
                  and h.nuot_serie = d.ot_nuot_serie
                  and h.nuot_tipoot_codigo = d.ot_nuot_tipoot_codigo
           left join tab_lineas l on h.cod_lin = l.linea
           left join tab_grupos g on l.grupo = g.grupo
           left join articul a on d.art_cod_art = a.cod_art
           left join impresion i
                     on h.numero = i.numero
                       and h.nuot_serie = i.nuot_serie
                       and h.nuot_tipoot_codigo = i.nuot_tipoot_codigo
     where h.nuot_tipoot_codigo = 'AR'
       and d.cant_formula - nvl(d.saldo, 0) > 0
       and h.estado < 5
       and d.cod_lin not between '800' and '899'
    )
     , pedidos
    as ( -- exportacion
    select p.numero as pedido, d.nro as pedido_item, p.cod_cliente
         , coalesce(c.abreviada, p.nombre) as nombre, p.fecha as fch_pedido, o.numero, o.nuot_serie
         , o.nuot_tipoot_codigo, o.fecha, o.jaba, o.estado, o.rendimiento, o.destino, o.art_cod_art
         , o.cant_formula, o.saldo, o.despachar, o.cod_lin, o.formu_art_cod_art, o.abre02
         , o.es_juego, o.impreso, o.fch_impresion, o.es_importado, d.preuni, a.codigo_aux as pais
         , p.zona as vendedor, p.empaque, o.es_sao, o.cant_prog
         , round(d.canti * d.preuni, 2) as valor, case
                                                    when v.nombre_corp is not null
                                                      then v.nombre_corp
                                                    else p.cod_cliente
                                                  end
      as cod_corporativo
      from expedidos p
           join expedido_d d on p.numero = d.numero
           join ordenes o
                on o.pedido = p.numero
                  and o.pedido_item = d.nro
                  and o.destino = '1'
--            join prioridad_marcada m on p.numero = m.id_pedido
           left join expaises a on p.pais = a.pais
           left join exclientes c on p.cod_cliente = c.cod_cliente
           left join exclientes_varios v
                     on p.cod_cliente = v.cod_cliente
     union all
-- nacional
    select p.numero as pedido, d.nro as pedido_item, p.cod_cliente, p.nombre, p.fecha as fch_pedido
         , o.numero, o.nuot_serie, o.nuot_tipoot_codigo, o.fecha, o.jaba, o.estado, o.rendimiento
         , o.destino, o.art_cod_art, o.cant_formula, o.saldo, o.despachar, o.cod_lin
         , o.formu_art_cod_art, o.abre02, o.es_juego, o.impreso, o.fch_impresion, o.es_importado
         , d.preuni, p.pais, 'PE' as vendedor, p.empaque, o.es_sao, o.cant_prog
         , round(d.canti * d.preuni, 2) as valor, p.cod_cliente as cod_corporativo
      from expednac p
           join expednac_d d on p.numero = d.numero
           join ordenes o
                on o.pedido = p.numero
                  and o.pedido_item = d.nro
                  and o.destino = '2'
--            join prioridad_marcada m on p.numero = m.id_pedido
    )
     , detalle
    as (
    select nvl(gcc.cod_grupo, p.cod_cliente) as cod_cliente, nvl(gc.dsc_grupo, p.nombre) as nombre
         , p.fch_pedido, p.pedido, p.pedido_item, p.numero, p.nuot_serie, p.nuot_tipoot_codigo
         , p.fecha, p.jaba, p.estado, p.art_cod_art, p.cant_formula, p.saldo, p.pais, p.vendedor
         , p.empaque, p.cant_formula - nvl(p.saldo, 0) as despachar, p.cod_lin, p.rendimiento
         , p.formu_art_cod_art, p.abre02, nvl(s.stock, 0) as stock, p.preuni, p.valor, p.es_sao
         , p.cant_prog, case
                          when p.cant_formula - nvl(p.saldo, 0) >= s.stock
                            then
                            0
                          else
                            1
                        end
      as tiene_stock
         , p.impreso, p.fch_impresion, p.es_juego, p.es_importado
         , nvl(gc.es_prioritario, 0) as es_prioritario, nvl(gc.orden, 0) as orden_prioritario
         , nvl(gc.es_simulacion, 0) as es_simulacion
         , case when n.cod_corporativo is not null then 1 else 0 end
      as es_nuevo
      from pedidos p
           left join stock_actual s on p.art_cod_art = s.cod_art
           left join grupo_cliente_cliente gcc
                     on p.cod_cliente = gcc.cod_cliente
           left join grupo_cliente gc on gc.cod_grupo = gcc.cod_grupo
           left join cliente_nuevo n
                     on p.cod_corporativo = n.cod_corporativo
    )
select d.cod_cliente, d.nombre, d.fch_pedido, d.pedido, d.pedido_item, d.numero, d.nuot_serie
     , d.nuot_tipoot_codigo, d.fecha, d.jaba, d.estado, d.art_cod_art, d.cant_formula, d.rendimiento
     , d.saldo, d.despachar, d.cod_lin, d.formu_art_cod_art, d.abre02, d.preuni, d.pais, d.vendedor
     , d.empaque, d.valor, d.stock, d.tiene_stock, d.es_sao, d.cant_prog, case max(
    d.es_importado)
    over (
      partition by d.numero, d.nuot_serie, d.nuot_tipoot_codigo)
                                                                            when 0
                                                                              then
                                                                              0
                                                                            else
                                                                              1
                                                                          end
  as tiene_importado
     , case min(
    d.tiene_stock)
    over (
      partition by d.numero, d.nuot_serie, d.nuot_tipoot_codigo)
         when 0
           then
           'NO'
         else
           'SI'
       end
  as tiene_stock_ot
     , d.tiene_stock as tiene_stock_item, d.impreso, d.fch_impresion, d.es_juego, d.es_importado
     , d.es_prioritario, d.orden_prioritario, d.es_simulacion
     , case when r.pedido_nro is not null then 1 else 0 end
  as es_reservado
     , d.es_nuevo, sum(distinct d.valor)
                       over (partition by d.cod_cliente, d.formu_art_cod_art)
  as total_art
  from detalle d
       left join reserva_surtimiento r
                 on d.pedido = r.pedido_nro and d.pedido_item = r.pedido_itm
 union all
select cod_cliente, nombre, fch_pedido, pedido, pedido_item, numero, nuot_serie, nuot_tipoot_codigo
     , fecha, jaba, estado, art_cod_art, cant_formula, rendimiento, saldo, despachar, cod_lin
     , formu_art_cod_art, abre02, preuni, pais, vendedor, empaque, valor, stock, tiene_stock, es_sao
     , cant_prog, tiene_importado, tiene_stock_ot, tiene_stock_item, impreso, fch_impresion
     , es_juego, es_importado, es_prioritario, orden_prioritario, es_simulacion, es_reservado
     , es_nuevo, total_art
  from view_ordenes_pedido_saos
 union all
select cod_cliente, nombre, fch_pedido, pedido, pedido_item, numero, nuot_serie, nuot_tipoot_codigo
     , fecha, jaba, estado, art_cod_art, cant_formula, rendimiento, saldo, despachar, cod_lin
     , formu_art_cod_art, abre02, preuni, pais, vendedor, empaque, valor, stock, tiene_stock, es_sao
     , cant_prog, tiene_importado, tiene_stock_ot, tiene_stock_item, impreso, fch_impresion
     , es_juego, es_importado, es_prioritario, orden_prioritario, es_simulacion, es_reservado
     , es_nuevo
  -- 1 AS se_trabaja,
     , total_art
  from view_ordenes_pedido_stock
 order by nuot_serie, nuot_tipoot_codigo, numero
/



select p.ranking, p.nom_cliente, p.nro_pedido, to_char(p.fch_pedido, 'dd/mm/yyyy') as fch_pedido
     , p.ot_tipo
     , p.ot_serie, p.ot_numero, p.cod_jgo, p.ot_estado, p.valor, p.tiene_stock_ot, p.cod_pza
     , p.cantidad, cant_final
     , p.saldo_stock, p.faltante, p.linea, p.tiene_stock_itm, p.es_importado, p.impreso
     , a.dsc_grupo as grupo, stock_inicial, p.sobrante, j.nom_color, j.cant_prog
     , a.cant_faltante, a.saldo_op, a.numero_op, a.stock, a.stock_requerida, consumo_anual
     , surte_util.material(p.cod_pza) as material
     , surte_util.ribete(p.cod_pza) as ribete
     , surte_util.subpieza(p.cod_pza) as subpieza
  from vw_surte_jgo j
     , vw_surte_pza p
     , vw_articulo a
 where j.nro_pedido = p.nro_pedido
   and j.itm_pedido = p.itm_pedido
   and p.cod_pza = a.cod_art
   and ((:color_header = 'C' and :color_detail = 'C' and j.id_color = 'C' and j.es_armar = 'NO') or
        (:color_header = 'C' and :color_detail = 'P' and j.id_color = 'P' and j.es_armar = 'NO') or
        (:color_header = 'C' and :color_detail = 'A' and j.id_color in ('C', 'P') and
         j.es_armar = 'SI') or
        (:color_header = 'C' and :color_detail = 'CP' and j.id_color in ('C', 'P') and
         j.es_armar = 'NO') or
        (:color_header = 'C' and :color_detail is null and j.id_color in ('C', 'P')) or
        (:color_header = 'F' and :color_detail = 'R' and j.id_color = 'R') or
        (:color_header = 'F' and :color_detail = 'F' and j.id_color = 'F') or
        (:color_header = 'F' and :color_detail = 'U' and j.es_urgente = 'SI') or
        (:color_header = 'F' and :color_detail is null and j.id_color in ('R', 'F')) or
        (:color_header = 'I' and :color_detail is null and j.id_color = 'I') or
        (:color_header is null and :color_detail is null))
   and (j.cod_cliente = :cliente or :cliente is null)
   and (j.nro_pedido = :pedido or :pedido is null)
   and (j.es_prioritario = :prioritario or :prioritario = 'SI')
 order by p.ranking;


select cod_cliente, nombre, fch_pedido, pedido, pedido_item, numero, estado, pais, vendedor, empaque
     , formu_art_cod_art, valor, dias_impreso, fch_impresion, es_juego, es_prioritario, cant_prog
     , color
  from vw_ordenes_impresas_pendientes
 order by dias_impreso desc, valor desc;


select * from vw_ordenes_impresas_piezas;


select nuot_tipoot_codigo, nuot_serie, numero, fecha, pedido, formu_art_cod_art, cant_prog
     , art_cod_art, cant_formula
  from vw_ordenes_impresas_piezas
 order by fecha;