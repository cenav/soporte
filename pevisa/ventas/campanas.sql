select * from campana_cliente;

select *
  from planilla10.personal
 where encargado = '056'
 order by apellido_paterno;

select *
  from campana
 where cod_campana in (
                       'E2022-1', 'E2022-2', 'E2022-3', 'E2022-4'
   );

select *
  from proceso_comiacc
 where cod_proceso = '00268';

-- Los premios en soles, son montos fijos establecidos al inicio de la campaña, no fluctúan con el tipo de cambio.
-- Por tanto, solo deben cumplir la cuota en dólares valor venta y acceden al premio en soles establecido.

select *
  from vw_campana_det
 where cod_campana = 'E2022-1';

select *
  from estado_campana
 order by cod_estado;

select *
  from usuario_modulo
 where modulo like '%CAMPANA%';

select *
  from tipo_premio_campana
 order by cod_tipo_premio;


select grupo, nombre, ruc, razon_social, importe_dolares, importe_soles, cod_campana, desc_campana
     , prinom, apepat
  from vw_campana_rrh
 where cod_campana = 'C24-ET1'
 order by cod_campana, importe_dolares desc;


  with clie as (
    select g.grupo
         , d.cod_cliente
         , c.nombre as razon_social
         , row_number()
        over (partition by g.grupo
          order by g.grupo)
      as rn
         , c.prinom, c.apepat
      from cliente_grupo g
           join cliente_grupo_d d on g.grupo = d.cod_grupo
           join clientes c on d.cod_cliente = c.cod_cliente
     where g.grupo not in ('R', 'S')
     order by g.grupo
    )
select d.cod_cliente as grupo
     , d.desc_cliente as nombre
     , case
         when l.grupo is not null then l.cod_cliente
         else d.cod_cliente
       end as ruc
     , case
         when l.grupo is not null then l.razon_social
         else d.desc_cliente
       end as razon_social
     , case d.moneda_premio
         when 'D' then d.premio_logrado
         else round(d.premio_logrado / a.import_cam, 2)
       end as importe_dolares
     , case d.moneda_premio
         when 'S' then d.premio_logrado
         else round(d.premio_logrado * a.import_cam, 2)
       end as importe_soles
     , d.cod_campana
     , d.desc_campana
     , l.prinom
     , l.apepat
  from vw_campana c
       join vw_campana_det d
            on c.cod_campana = d.cod_campana
       left join cambdol a
                 on c.vigencia_hasta = a.fecha
                   and a.tipo_cambio = 'V'
       left join clie l
                 on d.cod_cliente = l.grupo and l.rn = 1
 where
   --  d.fecha_ok_creditos is not null and
   d.premio_logrado > 0
   and d.cuota_lograda >= d.cuota
--    and c.cod_estado = '8'
   and c.cod_campana = 'C24-ET1'
 order by d.cod_campana, d.premio_logrado desc;
