-- agrega a la tabla tab_descuento_gpolin los nuevos grupos y lineas creados
select a.cod_art, a.descripcion, a.unidad, n.stock, a.u_eqv, l.cod_linea as linea
     , l.cod_grupo as grupo, v.importe as precio, pr_medpza as cod_ing, t.grupo_venta
  from articul a
     , tab_descuento_gpolin l
     , lispred v
     , lispreg g
     , tab_lineas t
     , almacen n
 where a.tp_art in ('T', 'S')
   and l.cod_linea = a.cod_lin
   and l.cod_grupo is not null
   and g.nro_lista = :nro_lista
   and l.moneda = g.moneda
   and v.cod_art = a.cod_art
   and v.nro_lista = g.nro_lista
   and t.linea = l.cod_linea
   and n.cod_art(+) = a.cod_art
   and n.cod_alm(+) = 'F0'
   and a.cod_art = '0221504464'
 order by l.cod_grupo, a.cod_art;

select *
  from articul
 where cod_art = '0221504464';

select *
  from tab_descuento_gpolin
 where cod_linea = '254';

select *
  from tab_descuento_gpolin
 where cod_linea = '07';

select *
  from tab_descuento_gpolin
 where cod_grupo = '27';

select *
  from lispred
 where cod_art = '0221504464';

select *
  from tab_lineas
 where linea = '254';

select *
  from tab_lineas
 where grupo = '42';

select *
  from tab_grupos
 where grupo = '42';

select *
  from tab_grupos
 where descripcion like '%BOSCH%';

select *
  from tab_descuento_gpolin
 where cod_grupo = '42';

select * from grupo_venta;

select *
  from tab_descuento_comercial
 order by cod_grupo_venta;

-- insert into tab_descuento_gpolin(cod_grupo_venta, cod_grupo, cod_linea, moneda)
-- select '70', '42', linea, 'D'
--   from tab_lineas
--  where grupo = '42';

select *
  from tab_descuento_rango
 where cod_grupo_venta = '50';



select *
  from lpred_fam
 where ldesc1 = 30;

select *
  from lpred_fam
 where nro_lista = 1
   and cod_grupo = '42';

select *
  from lpred_fam
 where nro_lista = 1
   and cod_lin = '07';

select *
  from tab_descuento_rango
 where cod_grupo_venta = '70';

select *
  from lispred
 where cod_art = 'FS 40088 MLS';

select *
  from articul
 where cod_art = 'FS 40088 MLS';

select *
  from cotizacion
 where num_ped = 212571;

-- obtiene la ubicacion
select decode(substr(n.cod_ubc, 1, 2), '07', 'L',
              decode(substr(n.cod_ubc, 1, 4), '1501', 'L', 'P')) as ubica
     , decode(c.cond_pag, 'A', 2, 0) as dscto3, decode(c.cliente_afecto, 'S', i.valor, 0) as p_iva
     , c.tasa_seguro as p_tasa_seguro, c.flete as p_flete, c.cod_cliente
  from cotizacion c
     , clientes n
     , impuesto i
 where c.serie = 20
   and c.num_ped = 212571
   and n.cod_cliente = c.cod_cliente
   and i.codigo = '1';

-- lista por grupos
select gp.cod_grupo_venta, gc.descripcion, gc.moneda_rango, gc.tipo_cliente, gc.tipo_rango
     , sum(i.cantidad) as kantidad, sum(round(i.cantidad * i.precio, 2)) as importes
     , get_rango_descuento(gp.cod_grupo_venta, 'L',
                           decode(gc.tipo_rango, 'I', sum(round(i.cantidad * i.precio, 2)),
                                  sum(i.cantidad)), '1') as dd1
     , get_rango_descuento(gp.cod_grupo_venta, 'L',
                           decode(gc.tipo_rango, 'I', sum(round(i.cantidad * i.precio, 2)),
                                  sum(i.cantidad)), '2') as dd2
  from itemcot i
     , articul a
     , tab_descuento_gpolin gp
     , tab_descuento_comercial gc
 where i.serie = 20
   and i.num_ped = 212571
   and a.cod_art = i.cod_art
   and gp.cod_grupo = a.grupo
   and gp.cod_linea = a.cod_lin
   and gc.cod_grupo_venta = gp.cod_grupo_venta
 group by gp.cod_grupo_venta, gc.descripcion, gc.moneda_rango, gc.tipo_cliente, gc.tipo_rango
 order by 1;

-- lista por solo un grupo
select i.serie, i.num_ped, a.cod_art, a.grupo, a.cod_lin, gp.cod_grupo_venta, gc.descripcion
     , gc.moneda_rango, gc.tipo_cliente, gc.tipo_rango, sum(i.cantidad) as kantidad
     , sum(round(i.cantidad * i.precio, 2)) as importes
  from itemcot i
     , articul a
     , tab_descuento_gpolin gp
     , tab_descuento_comercial gc
 where i.serie = 20
   and i.num_ped = 212571
   and a.cod_art = i.cod_art
   and gp.cod_grupo = a.grupo
   and gp.cod_linea = a.cod_lin
   and gc.cod_grupo_venta = gp.cod_grupo_venta
   and gc.cod_grupo_venta = '70'
 group by i.serie, i.num_ped, a.cod_art, a.grupo, a.cod_lin, gp.cod_grupo_venta, gc.descripcion
        , gc.moneda_rango, gc.tipo_cliente, gc.tipo_rango
 order by 4;

select *
  from cotizacion
 where num_ped = 212571;

select *
  from itemcot
 where num_ped = 212571;

select cod_alm, descripcion
  from almacenes
 where cod_alm in
       (select distinct cod_alm
          from usuarios_almacenes_perfil
         where usuario = user
         union all
        select 'FF'
          from dual)
 union all
select '%', 'TODOS'
  from dual
 order by cod_alm;

select distinct cod_alm
  from usuarios_almacenes_perfil
 where usuario = 'JNEYRA'
   and cod_alm in
       ('F0', 'F1', 'F2', 'F3', 'F4', 'F5', 'F6', 'F7', 'F8', 'F9', '92', 'FH', 'FS', 'FF', 'FI',
        'FP', 'FT', 'FB', 'FC', 'FQ', 'B1');


select '%' as cod_alm, 'TODOS' as descripcion
  from dual
 union all
select a.cod_alm, a.descripcion
  from almacenes a
     , pr_usualma u
 where a.cod_alm = u.cod_alm
   and u.usuario = 'JNEYRA';

select *
  from almacenes
 where cod_alm in
       ('F0', 'F1', 'F2', 'F3', 'F4', 'F5', 'F6', 'F7', 'F8', 'F9', '92', 'FH', 'FS', 'FF', 'FI',
        'FP', 'FT', 'FB', 'FC', 'FQ', 'B1')
   and not exists (select 1
                     from pr_usualma
                    where usuario = 'PCALDERON'
                      and pr_usualma.cod_alm = almacenes.cod_alm);

select *
  from pr_usualma
 where usuario = 'PCALDERON';

select sysdate from dual;