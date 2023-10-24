-- carga archivo temporal
select cod_art, cantidad from tmp_carga_data order by cantidad desc;

-- valida la carga contra total excel
select sum(cantidad) as cant_tot from tmp_carga_data;

-- limpia tabla tmp_ventas para explosion
select *
  from tmp_ventas
 where usuario = 'PEVISA';

-- carga data desde archivo
select cod_art, sum(cantidad) as cantidad
  from tmp_carga_data
 group by cod_art
 order by cantidad desc;

-- corrige los espacios en blanco
update tmp_carga_data
   set cod_art = trim(cod_art);

-- carga en tabla para la explosion
insert into tmp_ventas(usuario, cod_art, cantidad, importe)
select user, cod_art, sum(cantidad) as cantidad, 0
  from tmp_carga_data
 group by cod_art
 order by cantidad desc;

select *
  from tmp_ventas
 where usuario = 'PEVISA'
 order by cantidad desc;

begin
  pr_explosion_para_costear_1niv();
  --   sp_explosion();
  --   pr_explosion_hasta_subpiezas();
--   pr_explosion_hasta_subpiezas2();
--   pr_explosion_para_costear();
--   pr_explosion_1niv_olga();
--   pr_explosion_para_costear_1n32();
--   pr_explosion_para_costear_1n3a();
end;

select *
  from tmp_explosion_articulo
 where formula = 'AUTUS OS 32241 AL R';


-- autozone_usa_nacional
  with stock_art as (
    select cod_art, sum(stock) as stock
      from almacen
     where cod_alm in ('03', '05')
     group by cod_art
    )
     , explosion as (
    select formula, art_cod_art, cantidad, cod_lin
         , case
             when e.cod_lin between '900' and '999' and length(e.cod_lin) = 3 then 1
             else 0
           end as es_importado
         , case
             when e.cod_lin between '800' and '899' and length(e.cod_lin) = 3 then 1
             else 0
           end as es_embalaje
      from tmp_explosion_articulo e
    )
select a.cod_art, e.cod_lin, sum(e.cantidad) as consumo_anual_estimado_cliente, s.stock, c.costo
     , round(v.consumo_anual, 2) as consumo_anual_pevisa
     , round(v.consumo_mensual, 2) as consumo_mensual_pevisa
     , a.pr_golpez as golpez, a.pr_golpza as cavidades, p.cod_plancha as maquina
     , greatest(nvl(v.cant_requerida, 0) - nvl(v.stock_requerida, 0), 0) as cantidad_requerida
     , surte_util.material(a.cod_art) as material
     , surte_util.subpieza(a.cod_art) as subpieza
  from explosion e
       join articul a on e.art_cod_art = a.cod_art
       join vw_articulo v on e.art_cod_art = v.cod_art
       left join stock_art s on a.cod_art = s.cod_art
       left join arti_plancha p on a.cod_art = p.cod_art
       left join pcart_precios c on a.cod_art = c.cod_art and c.cod_costo = '35'
 where es_importado = 0
   and es_embalaje = 0
 group by a.cod_art, e.cod_lin, s.stock, round(v.consumo_anual, 2), a.pr_golpez, a.pr_golpza
        , greatest(nvl(v.cant_requerida, 0) - nvl(v.stock_requerida, 0), 0)
        , v.consumo_mensual, p.cod_plancha, c.costo;


-- autozone_usa_importado
  with stock_art as (
    select cod_art, sum(stock) as stock
      from almacen
     where cod_alm in ('03', '05')
     group by cod_art
    )
     , pedido_prov as (
    select cod_art, p.nombre, sum(d.cantidad) as cant
      from lg_pedjam g
           join lg_itemjam d on g.num_importa = d.num_importa
           join proveed p on g.cod_proveed = p.cod_proveed
     where nvl(g.estado, '0') != '9'
--        and nvl(d.saldo, 0) != 0
     group by cod_art, p.nombre
    )
     , proveedor as (
    select p.cod_art
         , listagg(p.nombre, ' | ') within group ( order by p.nombre) as proveedor
      from pedido_prov p
     group by p.cod_art
    )
     , pedido_numero as (
    select cod_art, g.num_importa, sum(d.cantidad) as cant
      from lg_pedjam g
           join lg_itemjam d on g.num_importa = d.num_importa
           join proveed p on g.cod_proveed = p.cod_proveed
     where nvl(g.estado, '0') != '9'
       and nvl(d.saldo, 0) != 0
     group by cod_art, g.num_importa
    )
     , pedido as (
    select p.cod_art, sum(p.cant) as cant_pedido
         , listagg(p.num_importa, ' | ') within group ( order by p.num_importa) as nro_pedido
      from pedido_numero p
     group by p.cod_art
    )
     , explosion as (
    select formula, art_cod_art, cantidad, cod_lin
         , case
             when e.cod_lin between '900' and '999' and length(e.cod_lin) = 3 then 1
             else 0
           end as es_importado
         , case
             when e.cod_lin between '800' and '899' and length(e.cod_lin) = 3 then 1
             else 0
           end as es_embalaje
      from tmp_explosion_articulo e
    )
select a.cod_art, e.cod_lin, sum(e.cantidad) as consumo_anual_estimado_cliente, v.stock, c.costo
     , v.consumo_anual as consumo_anual_pevisa, v.consumo_mensual as consumo_mensual_pevisa
     , p.proveedor, d.nro_pedido, d.cant_pedido
     , greatest(nvl(v.cant_requerida, 0) - nvl(v.stock_requerida, 0), 0) as cantidad_requerida
     , surte_util.material(a.cod_art) as material
     , surte_util.subpieza(a.cod_art) as subpieza
  from explosion e
       join articul a on e.art_cod_art = a.cod_art
       join vw_articulo v on e.art_cod_art = v.cod_art
       left join stock_art s on e.art_cod_art = s.cod_art
       left join proveedor p on e.art_cod_art = p.cod_art
       left join pedido d on e.art_cod_art = d.cod_art
       left join pcart_precios c on a.cod_art = c.cod_art and c.cod_costo = '35'
 where es_importado = 1
 group by a.cod_art, e.cod_lin, v.stock, v.consumo_anual, s.stock, cant_pedido, proveedor
        , d.nro_pedido, v.cant_requerida, stock_requerida, v.consumo_mensual, c.costo;

