select tipo, serie, numero, estado, estado_descripcion, juego, cantidad, pedido, abreviatura, fecha
     , nro_picking, c_codigo, nombre, fecha_impresion, fecha_inicio, fecha_fin, dias_impreso
     , tipo_juego, color, dias_picking, color_picking
  from vw_ot_impresas
 order by tipo_juego desc, juego;

/*
id_
cod_
dsc_
nom_
fch_
flg_
*/


  with datos as (
    select ot.nuot_tipoot_codigo as tipo, ot.nuot_serie as serie, ot.numero as numero, ot.estado
         , pe.descripcion as estado_descripcion, ot.formu_art_cod_art as juego
         , ot.cant_prog as cantidad, ot.abre01 as pedido, ot.abre02 as abreviatura
         , (
      select max(i.fecha)
        from pr_ot_impresion i
       where i.numero = ot.numero
         and i.nuot_serie = ot.nuot_serie
         and i.nuot_tipoot_codigo = ot.nuot_tipoot_codigo
      ) as fecha
         , pl.nro_picking, pl.c_codigo, vp.nombre, pl.fecha as fecha_impresion
         , pl.fecha_inicio, pl.fecha_fin
      from pevisa.pr_ot ot
           join pevisa.pr_estados pe on ot.estado = pe.estado
           left join picking_lote_orden plo
                     on plo.tipo = ot.nuot_tipoot_codigo
                       and plo.serie = ot.nuot_serie
                       and plo.numero = ot.numero
           left join picking_lote pl on pl.nro_picking = plo.nro_picking
           left join vw_personal vp on vp.c_codigo = pl.c_codigo
     where ot.nuot_tipoot_codigo = 'AR'
       and ot.nuot_serie = '3'
       and ot.estado in ('1', '12', '14', '16')
       and exists (
       select 1
         from pr_ot_impresion i
        where i.numero = ot.numero
          and i.nuot_serie = ot.nuot_serie
          and i.nuot_tipoot_codigo =
              ot.nuot_tipoot_codigo
       )
     union all
    select ot.nuot_tipoot_codigo as tipo, ot.nuot_serie as serie, ot.numero as numero, ot.estado
         , pe.descripcion as estado_descripcion, ot.formu_art_cod_art as juego
         , ot.cant_prog as cantidad, ot.abre01 as pedido, ot.abre02 as abreviatura, (
      select max(i.fecha)
        from pr_ot_impresion i
       where i.numero = ot.numero
         and i.nuot_serie = ot.nuot_serie
         and i.nuot_tipoot_codigo = ot.nuot_tipoot_codigo
      )
      as fecha, pl.nro_picking, pl.c_codigo, vp.nombre, pl.fecha as fecha_impresion
         , pl.fecha_inicio, pl.fecha_fin
      from pevisa.pr_ot ot
           join pevisa.pr_estados pe on ot.estado = pe.estado
           left join picking_lote_orden plo
                     on plo.tipo = ot.nuot_tipoot_codigo
                       and plo.serie = ot.nuot_serie
                       and plo.numero = ot.numero
           left join picking_lote pl on pl.nro_picking = plo.nro_picking
           left join vw_personal vp on vp.c_codigo = pl.c_codigo
     where ot.nuot_tipoot_codigo = 'SA'
       and ot.nuot_serie = '2'
       and ot.estado in ('2', '12', '14', '16')
    )
select d.tipo, d.serie, d.numero, d.estado, d.estado_descripcion, d.juego, d.cantidad, d.pedido
     , d.abreviatura, d.fecha, d.nro_picking, d.c_codigo, d.nombre, d.fecha_impresion
     , d.fecha_inicio, d.fecha_fin, round(sysdate - d.fecha) as dias_impreso
     , case
         when count(*) over (partition by d.juego) = 1 then 'UNICO'
         else 'REPETIDO'
       end as tipo_juego
     , case
         when round(sysdate - d.fecha) <= p.dias_impreso_bien then 'GREEN'
         when round(sysdate - d.fecha) <= p.dias_impreso_mal then 'YELLOW'
         else
           'RED'
       end as color
     , round(sysdate - d.fecha_impresion) as dias_picking
     , case
         when d.nro_picking is not null then
           case
             when round(sysdate - d.fecha_impresion) <= p.dias_impreso_bien then 'GREEN'
             when round(sysdate - d.fecha_impresion) <= p.dias_impreso_mal then 'YELLOW'
             else 'RED'
           end
         else 'WHITE'
       end as color_picking
  from datos d
       cross join param_surte p
 where p.id_param = 1
