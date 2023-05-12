-- cotizacion
select c.serie
     , c.num_ped
     , c.fecha
     , c.cod_cliente
     , e.nombre
     , c.cond_pag
     , c.cod_vende
     , v.nombre       as nom_vendedor
     , c.refe_pedido
     , p.estado
     , c.moneda
     , c.total_bruto
     , c.total_descuento
     , c.total_igv
     , c.total_valvta
     , c.total_pedido as total_cotizacion
  from cotizacion c
       join clientes e on c.cod_cliente = e.cod_cliente
       join vendedores v on c.cod_vende = v.cod_vendedor
       join pedido p on c.refe_pedido = p.num_ped
 where extract(year from c.fecha) = 2023
   and extract(month from c.fecha) = 4
 order by fecha;

select *
  from cotizacion
 where extract(year from fecha) = 2023
   and extract(month from fecha) = 4;

select *
  from cotizacion
 where num_ped = 196170;

select distinct estado
  from cotizacion
 where extract(year from fecha) = 2023
   and extract(month from fecha) = 4;

select *
  from histcot
 where num_ped = 196170;

select *
  from histcot
 where cod_accion != '00'
   and extract(year from fecha) = 2023
   and extract(month from fecha) = 5;
