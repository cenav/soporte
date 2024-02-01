select *
  from tab_grupos
 where grupo = '41';

select grupo_bateria
  from clientes
 where cod_cliente = '';

select *
  from cotizacion
 where num_ped = 213260;

select *
  from itemcot
 where num_ped = 213260;

select *
  from tablas_auxiliares
 where tipo = 24;


select *
  from clientes
 where categoria_ventas_anoant is not null;

select cod_tipo, dsc_tipo from tipo_categoria;

select cod_tipo, cod_categoria, dsc_categoria, medida, rango_desde, rango_hasta
  from categoria
 order by to_number(cod_categoria);

select * from clientes_categoria;

begin
  dbms_output.put_line(api_clientes_categoria.descripcion('10182059221', 'BCH').dsc_categoria);
end;


select *
  from clientes
 where nombre like '%WILMA%';


select *
  from clientes
 where cod_cliente = '20611411724';

-- 10182059221

select *
  from gastos_de_viaje
 where id_vendedor = '79'
   and numero = 217;

select c.*
  from clientes_categoria t
       join categoria c on t.cod_tipo = c.cod_tipo and t.cod_categoria = c.cod_categoria


select * from tab_descuento_rango;

select * from clientes;

select * from tipo_categoria;

select * from categoria order by 1, 2;

select * from clientes_categoria;

select *
  from pedido
 where num_ped = 235779;

select *
  from cotizacion
 where refe_pedido = '235779';

select importe, 0, importe
  from lispred
 where nro_lista = 1
   and cod_art = '0092S37085';

select *
  from lispred
 where nro_lista = 1
   and cod_art = '0092S37085';


select * from lispred;

select *
  from itemcot
 where num_ped = 213243;

select distinct cod_grupo_venta from tab_descuento_gpolin;

select *
  from tab_descuento_comercial
 order by 1;

select *
  from tab_descuento_rango
 where cod_grupo_venta = '71';

select *
  from tab_descuento_gpolin
 where cod_grupo_venta = '71';

select *
  from tab_descuento_gpolin
 where cod_linea = '253';

select *
  from tab_grupos
 where grupo in ('41', '42');

select *
  from tab_lineas
 where grupo = 41;

select *
  from articul
 where cod_art = '0092S37085';

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
 where c.serie = 20
   and c.num_ped = 213243
   and n.cod_cliente = c.cod_cliente
   and i.codigo = '1';

select gp.cod_grupo_venta, gc.descripcion, gc.moneda_rango, gc.tipo_cliente, gc.tipo_rango
     , sum(i.cantidad) as kantidad, sum(round(i.cantidad * i.precio, 2)) as importes
     , get_rango_descuento(gp.cod_grupo_venta, :p_ubica,
                           decode(gc.tipo_rango, 'I', sum(round(i.cantidad * i.precio, 2)),
                                  sum(i.cantidad)), '1') as dd1
     , get_rango_descuento(gp.cod_grupo_venta, :p_ubica,
                           decode(gc.tipo_rango, 'I', sum(round(i.cantidad * i.precio, 2)),
                                  sum(i.cantidad)), '2') as dd2
  from itemcot i
     , articul a
     , tab_descuento_gpolin gp
     , tab_descuento_comercial gc
 where i.serie = 20
   and i.num_ped = 213243
   and a.cod_art = i.cod_art
   and gp.cod_grupo = a.grupo
   and gp.cod_linea = a.cod_lin
   and gc.cod_grupo_venta = gp.cod_grupo_venta
 group by gp.cod_grupo_venta, gc.descripcion, gc.moneda_rango, gc.tipo_cliente, gc.tipo_rango
 order by 1;

select *
  from tablas_auxiliares
 where tipo = '24';

select *
  from cotizacion
 where num_ped = 213276;

select *
  from itemcot
 where num_ped = 213276;

select *
  from itemcot
 where por_desc1 = 30
   and por_desc2 = 10
   and por_desc3 = 3
 order by num_ped desc;

select *
  from cese_personal
 where id_personal = 'E4637';

select s.id_serie
     , s.descripcion
     , s.nombre as encargado
  from ot_mantto_serie s
     , otm_serie_usuario u
 where s.id_serie = u.id_serie
   and s.id_tipo = u.id_tipo
   and u.usuario = 'HOLIVARES'
   and u.id_tipo = 'MQ'
 order by s.id_serie;

select *
  from otm_serie_usuario
 where usuario = 'HOLIVARES'
   and id_tipo = 'MQ'
 order by id_serie;

insert into otm_serie_usuario(id_tipo, id_serie, usuario)
select 'MQ', id_serie, 'HOLIVARES'
  from ot_mantto_serie
 where id_tipo = 'MQ'
   and not exists(
   select 1
     from otm_serie_usuario
    where usuario = 'HOLIVARES'
      and id_tipo = 'MQ'
      and ot_mantto_serie.id_serie = otm_serie_usuario.id_serie
   )
 order by id_serie;