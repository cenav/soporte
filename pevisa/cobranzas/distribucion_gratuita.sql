-- documentos a sacar de cuentas por cobar
-- distribucion gratuita
select f.cod_cliente, c.nombre, f.tipdoc, f.serie_num, f.numero, f.fecha, f.moneda, f.importe
  from factcob f
       left join clientes c on f.cod_cliente = c.cod_cliente
 where extract(year from f.fecha) = 2023
   and extract(month from f.fecha) = 5
   and f.serie_num in ('F053', 'B053')
 order by tipdoc, numero;

-- eliminar de factcob
select *
  from factcob f
 where extract(year from f.fecha) = 2023
   and extract(month from f.fecha) = 5
   and f.serie_num in ('F053', 'B053')
 order by tipdoc, numero;