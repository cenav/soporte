-- facturado programa embarque
select case c.cod_vende
         when '02' then 'CARLOS'
         when '05' then 'OCTAVIO'
         else c.cod_vende
       end as vendedor
     , case d.tipodoc when '01' then 'FACT' when '07' then 'NC' else d.tipodoc end as documento
     , d.numero, d.fecha, d.nombre, d.imp_neto
  from docuvent d
     , exclientes c
 where d.fecha >= :x_fecha_del
   and d.fecha <= :x_fecha_al
   and substr(d.cod_cliente, 6, 6) = c.cod_cliente
   and d.origen = 'EXPO'
--    and c.cod_vende in ('02')
   and d.estado < 9;


select nvl(t.abreviada, 'OFICINA') as p_vende
     , nvl(e.zona, '00') as vende
     , to_char(e.fecha, 'YYYY') as p_ano
     , to_char(e.fecha, 'MM') as p_mes
     , e.numero
     , p.zona
     , p.abrevia
     , e.nombre
     , e.cod_cliente
     , sum(round(d.preuni * d.canti / e.fflete, 2)) as total
  from expedidos e
     , expedido_d d
     , expaises p
     , exclientes c
     , extablas_expo t
 where d.numero = e.numero
   and nvl(d.id, '0') = '0'
   and e.pais like '%'
   and e.cod_cliente like '%'
   and (nvl(e.estado, '0') <> '9'
   and nvl(e.estado, '0') <> '85')
   and (not (nvl(e.estado, '0') = '8' and nvl(e.zona, '00') = '00'))
   and p.pais(+) = e.pais
   and c.cod_cliente = e.cod_cliente
   and t.tipo = '13'
   and t.codigo(+) = nvl(e.zona, '00')
   and nvl(e.tipo, '0') <> '04'
   and extract(year from e.fecha) = 2025
   and extract(month from e.fecha) = 8
   and e.zona = '02'
 group by nvl(t.abreviada, 'OFICINA')
        , nvl(e.zona, '00')
        , to_char(e.fecha, 'YYYY')
        , to_char(e.fecha, 'MM')
        , e.numero
        , p.zona
        , p.abrevia
        , e.nombre
        , e.cod_cliente;
