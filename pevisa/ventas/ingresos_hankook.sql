select g.cod_alm, g.tp_transac, g.serie, g.numero
     , to_char(g.fch_transac, 'DD/MM/YYYY') as fch_transac, g.nro_doc_ref as numero_embarque
     , g.cod_relacion, g.num_importa as boleta_ingreso, g.pr_procedencia, eg.bl_numero
     , eg.aplicacion_seguro_numero, d.cod_art, d.cantidad as cantidad, d.costo_d
     , round(d.costo_d / d.cantidad, 4) as costo_unit, g.domicilio as factura
     , f_embarques_g_facturas(eg.numero_embarque) as lista_facturas
  from kardex_g g
     , kardex_d d
     , embarques_g eg
 where g.tp_transac = '11'
   and d.cod_alm = g.cod_alm
   and d.tp_transac = g.tp_transac
   and d.serie = g.serie
   and d.numero = g.numero
   and g.estado < 9
   and g.nro_doc_ref = eg.numero_embarque
   and extract(year from g.fch_transac) = 2021
   and d.cod_art = '11R22.5 AM09'
   and g.cod_relacion in (
                          '23997', '23387', '23815', '23698', 'I0539', 'I0115', '24003', 'I0141',
                          '23162', '23916'
   )
 order by 1, 5 desc;


-- hankook ingresos anuales
  with detalle as (
    select d.cod_art
         , extract(year from d.fch_transac) as anio
         , cantidad as cantidad
      from kardex_g g
         , kardex_d d
--          , embarques_g eg
     where g.tp_transac = '11'
       and d.cod_alm = g.cod_alm
       and d.tp_transac = g.tp_transac
       and d.serie = g.serie
       and d.numero = g.numero
       and g.estado < 9
--        and g.nro_doc_ref = eg.numero_embarque
       and extract(year from g.fch_transac) between 2006 and 2023
--        and d.cod_art in ('11R22.5 AM09', '11R22.5 AH33')
       and g.cod_relacion in (
                              '23997', '23387', '23815', '23698', 'I0539', 'I0115', '24003',
                              'I0141', '23162', '23916'
       )
     order by 1
    )
select cod_art
     , sum(case anio when 2006 then cantidad else 0 end) as und_2006
     , sum(case anio when 2007 then cantidad else 0 end) as und_2007
     , sum(case anio when 2008 then cantidad else 0 end) as und_2008
     , sum(case anio when 2009 then cantidad else 0 end) as und_2009
     , sum(case anio when 2010 then cantidad else 0 end) as und_2010
     , sum(case anio when 2011 then cantidad else 0 end) as und_2011
     , sum(case anio when 2012 then cantidad else 0 end) as und_2012
     , sum(case anio when 2013 then cantidad else 0 end) as und_2013
     , sum(case anio when 2014 then cantidad else 0 end) as und_2014
     , sum(case anio when 2015 then cantidad else 0 end) as und_2015
     , sum(case anio when 2016 then cantidad else 0 end) as und_2016
     , sum(case anio when 2017 then cantidad else 0 end) as und_2017
     , sum(case anio when 2018 then cantidad else 0 end) as und_2018
     , sum(case anio when 2019 then cantidad else 0 end) as und_2019
     , sum(case anio when 2020 then cantidad else 0 end) as und_2020
     , sum(case anio when 2021 then cantidad else 0 end) as und_2021
     , sum(case anio when 2022 then cantidad else 0 end) as und_2022
     , sum(case anio when 2023 then cantidad else 0 end) as und_2023
  from detalle
 group by cod_art;
