select -- c.SERIE,
  -- c.NUM_PED,
  -- c.FECHA,
  -- c.ESTADO,
  -- c.COD_CLIENTE,
  -- c.COND_PAG,
  -- n.COD_UBC,
  decode(substr(n.cod_ubc, 1, 2), '07', 'L',
         decode(substr(n.cod_ubc, 1, 4), '1501', 'L', 'P')) as ubica
     , decode(c.cond_pag, 'A', 2, 0) as dscto3, decode(c.cliente_afecto, 'S', i.valor, 0) as p_iva
     , c.tasa_seguro as p_tasa_seguro, c.flete as p_flete
     , nvl(n.grupo_bateria, 0) as categoria_cliente
     , c.cod_cliente
  from cotizacion c
     , clientes n
     , impuesto i
 where c.serie = z_serie
   and c.num_ped = z_numero
   and n.cod_cliente = c.cod_cliente
   and i.codigo = '1';

-- categoria 40
select *
  from clientes
 where grupo_bateria is not null;

-- tabla categoría
select *
--   , nvl(valor2, 0) --> descuento 45%
  from tablas_auxiliares t
 where tipo = '24'
   and codigo = to_char(p_categoria);

select *
  from cotizacion
 where num_ped = 250661;

select *
  from itemcot
 where num_ped = 250661;

select nro_lista, detalle, moneda, inc_igv, desc_max
  from lispreg
 where (nro_lista = 6 and :cod_cliente <> '20100085578')
    or (nro_lista = 8 and :cod_cliente = '20100085578')
 order by nro_lista;

-- si esta en lista remate (oferta)
select get_lista_remate(90, :cod_art)
  from dual;

select importe, 0, importe
  from lispred
 where nro_lista = :x_lista_precio
   and cod_art = :cod_art;

select *
  from articul
 where cod_art = :cod_art;