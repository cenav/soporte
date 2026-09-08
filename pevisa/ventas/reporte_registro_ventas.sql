-- original
select d.cod_vende, d.tipodoc, x.descripcion as nombre_doc, d.serie, d.numero, d.fecha
     , d.cod_cliente, c.nombre as nombre_cliente, i.cod_art, i.item, i.cod_lin, l.descripcion
     , l.grupo, g.descripcion, g.ind_vta1, m.descripcion, i.cantidad, d.tip_doc_ref
     , d.ser_doc_ref, d.nro_doc_ref, d.moneda, d.import_cam, nvl(i.neto, 0) as neto
     , decode(d.moneda, 'S', nvl(i.neto, 0), 0) as soles
     , decode(d.moneda, 'D', nvl(i.neto, 0), 0) as dolares
     , round(decode(d.moneda, 'S', nvl(i.neto, 0), 'D', nvl(i.neto, 0) * d.import_cam),
             2) as total_soles
     , round(decode(d.moneda, 'D', nvl(i.neto, 0), 'S', nvl(i.neto, 0) / d.import_cam),
             2) as total_dolares
     , round(i.cantidad * p.costo * d.import_cam, 2) as costo_soles
     , round(i.cantidad * p.costo, 2) as costo_dolares
  from docuvent d
       join itemdocu i
            on (d.tipodoc = i.tipodoc
              and d.serie = i.serie
              and d.numero = i.numero)
       left join clientes c on d.cod_cliente = c.cod_cliente
       left join tablas_auxiliares x
                 on d.tipodoc = x.codigo
                   and x.tipo = '02'
       left join pcart_precios p
                 on i.cod_art = p.cod_art
                   and p.cod_costo = '04'
       left join tab_lineas l on i.cod_lin = l.linea
       left join tab_grupos g on l.grupo = g.grupo
       left join grupo_venta m on g.ind_vta1 = m.cod_grupo_venta
--  where d.tipodoc in ('01', '03', '07')
 where d.origen <> 'EXPO'
   and d.estado <> '9'
 order by d.cod_vende, d.tipodoc, d.serie, d.numero, i.cod_lin, i.cod_art;


-- venta nacional grupos
select d.tipodoc, x.descripcion as nombre_doc, d.serie, d.numero, d.fecha
     , d.cod_cliente, c.nombre as nombre_cliente, i.cod_art, i.item, i.cod_lin
     , l.descripcion as dsc_lin, l.grupo, g.descripcion as dsc_grupo, g.ind_vta1 as megagrupo
     , m.descripcion as dsc_megagrupo, d.tip_doc_ref, d.ser_doc_ref, d.nro_doc_ref, i.cantidad
     , d.moneda, d.import_cam, nvl(i.neto, 0) as neto
     , round(decode(d.moneda, 'S', nvl(i.neto, 0), 'D', nvl(i.neto, 0) * d.import_cam),
             2) as total_soles
     , round(decode(d.moneda, 'D', nvl(i.neto, 0), 'S', nvl(i.neto, 0) / d.import_cam),
             2) as total_dolares
  from docuvent d
       join itemdocu i
            on (d.tipodoc = i.tipodoc
              and d.serie = i.serie
              and d.numero = i.numero)
       left join clientes c on d.cod_cliente = c.cod_cliente
       left join tablas_auxiliares x
                 on d.tipodoc = x.codigo
                   and x.tipo = '02'
       left join pcart_precios p
                 on i.cod_art = p.cod_art
                   and p.cod_costo = '04'
       left join tab_lineas l on i.cod_lin = l.linea
       left join tab_grupos g on l.grupo = g.grupo
       left join grupo_venta m on g.ind_vta1 = m.cod_grupo_venta
--  where d.tipodoc in ('01', '03', '07')
 where d.origen <> 'EXPO'
   and d.estado <> '9'
   and d.fecha between to_date('01/01/2022', 'dd/mm/yyyy') and to_date('30/08/2026', 'dd/mm/yyyy')
 order by d.fecha, d.tipodoc, d.serie, d.numero, i.cod_lin, i.cod_art;


select *
  from itemdocu
 where tipodoc = '01'
   and serie = 'F050'
   and numero = 252574;
