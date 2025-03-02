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