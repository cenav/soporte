select *
  from lg_factura_comercial
 where numero_embarque = 6019;

select *
  from packing_g
 where numero_embarque = 6019
   and num_importa = 'NT25033';

select *
  from embarques_g
 where numero_embarque = 6019;

select *
  from embarques_d
 where numero_embarque = 6019
   and num_importa = 'NT25033'
   and factura_comercial_numero = '9150006608';

select *
  from embarques_d
 where num_importa = 'NT25033'
   and cod_art = '215/65R16H RA33';

select *
  from lg_pedjam
 where num_importa = 'NT25033';

select g.cod_proveed, p.nombre, i.num_importa as pedido, g.fecha_programacion_embarque
     , i.cod_art, i.cant_ped
  from lg_pedjam g
       join lg_itemjam i on i.num_importa = g.num_importa
       join proveed p on g.cod_proveed = p.cod_proveed
 where nvl(g.estado, '0') != '9'
   and nvl(i.estado, '0') != '9'
   and i.num_importa = 'NT25033'
   and i.cod_art = '215/65R16H RA33';

select *
  from lg_itemjam
 where num_importa = 'NT25033'
   and cod_art = '215/65R16H RA33';

select ed.num_importa as pedido, ed.cod_art, max(eg.bl_fecha) as fecha_embarque_real
     , sum(ed.cantidad_packing) as cantidad_packing
     , sum(ed.cantidad_recibida) as cantidad_recibida
  from embarques_g eg
       join embarques_d ed on eg.numero_embarque = ed.numero_embarque
 where ed.num_importa = 'NT25033'
   and ed.cod_art = '215/65R16H RA33'
 group by ed.num_importa, ed.cod_art;

-- reporte lead time con embarques agrupados por pedido
  with embarque as (
    select ed.num_importa as pedido, ed.cod_art, max(eg.bl_fecha) as ultimo_embarque
         , sum(ed.cantidad_packing) as cantidad_packing
      from embarques_g eg
           join embarques_d ed on eg.numero_embarque = ed.numero_embarque
     where nvl(eg.estado, '0') != '9'
       and nvl(ed.estado, '0') != '9'
     group by ed.num_importa, ed.cod_art
    )
select g.cod_proveed, p.nombre, i.num_importa as pedido
     , case i.saldo
         when 0 then
           'Cerrado'
         else
           case g.estado when '1' then 'Confirmado' when '9' then 'Anulado' end
       end as estado
     , g.fecha_programacion_embarque
     , e.ultimo_embarque, i.cod_art, i.cant_ped, e.cantidad_packing
     , (i.cant_ped - e.cantidad_packing) as cantidad_pendiente
     , round((i.cant_ped - e.cantidad_packing) * 100 / i.cant_ped, 2) as porc_pendiente
     , round(100 - (i.cant_ped - e.cantidad_packing) * 100 / i.cant_ped,
             2) as porc_cumplimiento
     , greatest(case i.saldo when 0 then ultimo_embarque else trunc(sysdate) end -
                fecha_programacion_embarque, 0) as lead_time_days
  from lg_pedjam g
       join lg_itemjam i on i.num_importa = g.num_importa
       join proveed p on g.cod_proveed = p.cod_proveed
       join embarque e on e.pedido = i.num_importa and e.cod_art = i.cod_art
 where nvl(g.estado, '0') != '9'
   and nvl(i.estado, '0') != '9'
--    and g.cod_proveed = '24003'
   and extract(year from g.fecha) >= 2021;
--    and i.num_importa = 'NT25033'
--    and i.cod_art = '215/65R16H RA33';


-- reporte lead time con embarques detallados
select g.cod_proveed, p.nombre, i.num_importa as pedido, g.fecha as fecha_pedido
     , case i.saldo
         when 0 then
           'Cerrado'
         else
           case g.estado when '1' then 'Confirmado' when '9' then 'Anulado' end
       end as estado
     , eg.numero_embarque
     , g.fecha_programacion_embarque
     , eg.bl_fecha as fecha_real_embarque, i.cod_art, i.cant_ped, ed.cantidad_packing
     , (i.cant_ped - ed.cantidad_packing) as cantidad_pendiente
     , round((i.cant_ped - ed.cantidad_packing) * 100 / i.cant_ped, 2) as porc_pendiente
     , round(100 - (i.cant_ped - ed.cantidad_packing) * 100 / i.cant_ped,
             2) as porc_cumplimiento
     , greatest(case i.saldo when 0 then eg.bl_fecha else trunc(sysdate) end -
                fecha_programacion_embarque, 0) as lead_time_days
  from lg_pedjam g
       join lg_itemjam i on i.num_importa = g.num_importa
       join proveed p on g.cod_proveed = p.cod_proveed
       join embarques_d ed on i.num_importa = ed.num_importa and i.cod_art = ed.cod_art
       join embarques_g eg on eg.numero_embarque = ed.numero_embarque
 where nvl(g.estado, '0') != '9'
   and nvl(i.estado, '0') != '9'
--    and g.cod_proveed = '24003'
   and extract(year from g.fecha) >= 2021
--    and i.num_importa = 'NT25033'
--    and i.cod_art = '215/65R16H RA33';
 order by cod_proveed, fecha_pedido, pedido, bl_fecha, numero_embarque;