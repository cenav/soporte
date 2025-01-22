create or replace force view pevisa.vw_articulo (
       cod_art,
       descripcion,
       cod_lin,
       id_grupo,
       dsc_grupo,
       cant_requerida,
       cant_separado,
       cant_faltante,
       stock,
       stock_requerida,
       numero_op,
       saldo_op,
       consumo_anual,
       consumo_mensual,
       frecuencia_meses,
       cant_disponible,
       golpes,
       cavidades,
       material,
       consumo_anual_material,
       maquina,
       ubicacion_art,
       pr_observacion
)
as
  with op_curso
    as (
      select cod_art, sum(saldo) as saldo_op, listagg(
          numero || '(' || estado || ', ' || cant_prog || ')',
          ' | ')
          within group (order by estado, numero)
        as numero_op
        from vw_ordenes_curso
       where nuot_tipoot_codigo = 'PR'
       group by cod_art
      )
     , requerimiento
    as (
      select cod_art, sum(cant_requerida) as cant_requerida, sum(cant_separado) as cant_separado
           , sum(faltante) as cant_faltante, sum(stock) as stock_requerida
        from vw_requerimiento_articulo
       group by cod_art
      )
     , stock_art
    as (
      select cod_art, sum(stock) as stock
        from almacen
       group by cod_art
      )
     , material
    as (
      select f.formu_art_cod_art, listagg(f.art_cod_art, ' | ')
                                          within group (order by f.art_cod_art)
        as art_cod_art
           , listagg(round(c.consumo_anual), ' | ')
                     within group (order by c.consumo_anual)
        as consumo_anual_material
        from pr_for_ins f
             join articul a on f.art_cod_art = a.cod_art
             join vw_articulo_consumo c on f.art_cod_art = c.cod_art
       where (a.cod_lin in ('1601', '2004', '2005')
         or (a.cod_lin between '1620' and '1634')
         or (a.cod_lin between '2010' and '2019'))
         and length(a.cod_lin) = 4
       group by f.formu_art_cod_art
      )
select a.cod_art, a.descripcion, a.cod_lin, g.id_grupo, g.dsc_grupo, r.cant_requerida
     , r.cant_separado, r.cant_faltante, nvl(s.stock, 0) as stock, r.stock_requerida, o.numero_op
     , o.saldo_op, c.consumo_anual, c.consumo_mensual, c.frecuencia_meses
     , a.s_act - r.cant_separado as cant_disponible, a.pr_golpez as golpes, a.pr_golpza as cavidades
     , m.art_cod_art as material, m.consumo_anual_material, pl.cod_plancha as maquina
     , a.pr_medpza as ubicacion_art, a.pr_observacion
  from articul a
       left join op_curso o on a.cod_art = o.cod_art
       left join requerimiento r on a.cod_art = r.cod_art
       left join stock_art s on a.cod_art = s.cod_art
       left join material m on a.cod_art = m.formu_art_cod_art
       left join vw_articulo_consumo c on a.cod_art = c.cod_art
       left join vw_articulo_grupo g on a.cod_art = g.cod_art
       left join arti_plancha pl on a.cod_art = pl.cod_art;
