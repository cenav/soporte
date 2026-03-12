  with inventario as (
    select d.numero, d.fch_invent, d.cod_alm, get_deslinea(d.cod_lin) as des_linea, d.cod_art
         , a.cod_interno as cod_wms, a.und, d.stock
         , d.conteo1
         , d.conteo1 - d.stock as diferencia1
         , d.conteo2
         , case
             when d.conteo2 = 0 then
               d.conteo1 - d.stock
             when d.conteo1 - d.stock != 0 then
               d.conteo2 - d.stock
             else
               0
           end as diferencia2
         , get_costos(d.cod_art, '03') as costo_unit_d
      from wms_inventa_fis_d d
         , pcarticul a
     where d.numero = 340
       and a.cod_art = d.cod_art
--    and d.cod_art = 'BLAF 0.5-240GZ'
       and d.stock > d.conteo1
--    and d.stock < d.conteo1
--        and d.stock = d.conteo1 and d.stock > 0
--        and d.conteo1 != d.conteo2 and d.conteo2 > 0
     order by d.cod_lin, d.cod_art
    )
     , diferencias as (
    select i.numero, i.fch_invent, i.cod_alm, i.des_linea, i.cod_art, i.cod_wms, i.und, i.stock
         , i.conteo1, i.diferencia1, i.conteo2, i.diferencia2
         , case
             when i.diferencia2 = 0 then
               i.diferencia1
             else
               i.diferencia2
           end as diferencia_final
         , i.costo_unit_d
         , case
             when i.diferencia2 = 0 then
               round(i.diferencia1 * i.costo_unit_d, 2)
             else
               round(i.diferencia2 * i.costo_unit_d, 2)
           end as costo_diferencia_final
      from inventario i
    )
select d.numero, d.fch_invent, d.cod_alm, d.des_linea, d.cod_art, d.cod_wms, d.und, d.stock
     , d.conteo1, d.diferencia1, d.conteo2, d.diferencia2, d.diferencia_final, d.costo_unit_d
     , d.costo_diferencia_final
     , case when d.diferencia_final > 0 then d.costo_diferencia_final else 0 end as sobrante
     , case when d.diferencia_final < 0 then d.costo_diferencia_final else 0 end as faltante
  from diferencias d;
