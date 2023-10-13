-- detalle pedidos
select p.numero, to_char(p.fecha, 'dd/mm/yyyy') as fecha, d.cod_eqi, d.cod_art, d.canti
     , d.preuni, d.canti * preuni as importe
  from expedidos p
       join expedido_d d on p.numero = d.numero
 where p.cod_cliente in (996057, 990937)
   and p.fecha >= to_date('01/01/2022', 'dd/mm/yyyy')
 order by p.fecha, p.numero;

delete from tmp_articul_costos_pais;

select * from tmp_articul_costos_pais where usuario = user;

insert into tmp_articul_costos_pais ( usuario, cod_art, pais, cantidad, vta01, vta02, vta03, ventas
                                    , costo)
select user, cod_art, pais, 1, vta01, vta02, vta03
     , f_estadistica_lista_borrar(pais, cod_art), get_costos(cod_art, '32')
  from exfactores_vta
 where exists(
   select d.cod_art, sum(d.canti) as cantidad
     from expedidos p
          join expedido_d d on p.numero = d.numero
    where p.cod_cliente in (996057, 990937)
      and d.cod_art = exfactores_vta.cod_art
      and p.fecha >= to_date('01/01/2022', 'dd/mm/yyyy')
    group by d.cod_art
   );

begin
  delete tmp_ventas
   where usuario = user;

  begin
    insert into tmp_ventas
    select user, a.cod_art, 1, 0
      from tmp_articul_costos_pais a
     where usuario = user
     group by user, a.cod_art;
  exception
    when others then null;
  end;
  commit;
  pr_explosion_para_costear_1niv();
end;

-- importar autozone
  with pedidos as (
    select d.cod_art, sum(d.canti) as cantidad
      from expedidos p
           join expedido_d d on p.numero = d.numero
     where p.cod_cliente in (996057, 990937)
       and p.fecha >= to_date('01/01/2022', 'dd/mm/yyyy')
     group by d.cod_art
    )
     , lista_unica as (
    select p.cod_art, p.cantidad, f.vta03
         , row_number() over (partition by p.cod_art order by f.pais) as lista
      from pedidos p
           left join exfactores_vta f on p.cod_art = f.cod_art
    )
     , formulas as (
    select p.cod_art, p.cantidad, f.vta03 as aaa
         , get_costos(p.cod_art, '35') as costo_total
         , f_costo_explosion(p.cod_art, 'IMPORTADO') as costo_importado
         , f_costo_explosion(p.cod_art, 'NACIONAL') as costo_nacional
      from pedidos p
           left join lista_unica f on p.cod_art = f.cod_art and f.lista = 1
    )
select f.cod_art, f.cantidad, f.aaa, f.costo_total, f.costo_importado
     , f.costo_nacional + (f.costo_total - (f.costo_importado + f.costo_nacional)) as costo_nacional
     , round(f.costo_importado / f.costo_total * 100) as porc_costo_importado
  from formulas f
--  where f.cod_art = 'KIT AUT SS 450.741-12'
 order by porc_costo_importado desc, cantidad desc;

select *
  from pcart_precios
 where cod_art = 'KIT AUT SS 450.678-24'
 order by costo;

select *
  from pcart_precios
 where cod_art = 'KIT AUT SS 450.678-24'
   and cod_costo in ('56', '35')
 order by costo;

select *
  from pctab_costos
 where cod_costo = '56';

select vta03 as aaa
  from exfactores_vta
 where cod_art = 'KIT AUT SS 450.678-24';

select *
  from exfactores_vta
 where cod_art = 'KIT AUT SS 450.741-12';

select *
  from expedido_d
 where cod_art = 'KIT AUT SS 450.741-12';

select *
  from expedidos
 where numero = 15600;

select *
  from tmp_ventas
 where usuario = user
   and cod_art = 'KIT AUT JD 1262-1'
 order by cantidad desc;

select cod_art, cantidad from tmp_carga_data;

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
  --     pr_explosion_para_costear_1niv();
  sp_explosion();
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

-- reporte importar requerido detalle
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
       and nvl(d.saldo, 0) != 0
     group by cod_art, p.nombre
    )
     , proveedor as (
    select p.cod_art, sum(p.cant) as cant_pedido
         , listagg(p.nombre, ' | ') within group ( order by p.nombre) as proveedor
      from pedido_prov p
     group by p.cod_art
    )
     , pedido_numero as (
    select cod_art, g.num_importa
      from lg_pedjam g
           join lg_itemjam d on g.num_importa = d.num_importa
           join proveed p on g.cod_proveed = p.cod_proveed
     where nvl(g.estado, '0') != '9'
       and nvl(d.saldo, 0) != 0
     group by cod_art, g.num_importa
    )
     , pedido as (
    select p.cod_art
         , listagg(p.num_importa, ' | ') within group ( order by p.num_importa) as nro_pedido
      from pedido_numero p
     group by p.cod_art
    )
select e.formula, e.art_cod_art, e.cantidad, s.stock, cant_pedido, proveedor, d.nro_pedido
  from tmp_explosion_articulo e
       left join stock_art s on e.art_cod_art = s.cod_art
       left join proveedor p on e.art_cod_art = p.cod_art
       left join pedido d on e.art_cod_art = d.cod_art
 where (e.cod_lin between '900' and '999' and length(e.cod_lin) = 3)
--    and e.formula = 'KIT AUT VK 87860 R'
 order by e.cantidad desc;


-- reporte importar requerido resumen
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
       and nvl(d.saldo, 0) != 0
     group by cod_art, p.nombre
    )
     , proveedor as (
    select p.cod_art, sum(p.cant) as cant_pedido
         , listagg(p.nombre, ' | ') within group ( order by p.nombre) as proveedor
      from pedido_prov p
     group by p.cod_art
    )
     , pedido_numero as (
    select cod_art, g.num_importa
      from lg_pedjam g
           join lg_itemjam d on g.num_importa = d.num_importa
           join proveed p on g.cod_proveed = p.cod_proveed
     where nvl(g.estado, '0') != '9'
       and nvl(d.saldo, 0) != 0
     group by cod_art, g.num_importa
    )
     , pedido as (
    select p.cod_art
         , listagg(p.num_importa, ' | ') within group ( order by p.num_importa) as nro_pedido
      from pedido_numero p
     group by p.cod_art
    )
select e.art_cod_art, s.stock, cant_pedido, proveedor, d.nro_pedido
     , greatest(nvl(a.cant_requerida, 0) - nvl(stock_requerida, 0), 0) as cantidad_requerida
     , sum(e.cantidad) as cantidad
  from tmp_explosion_articulo e
       left join proveedor p on e.art_cod_art = p.cod_art
       left join stock_art s on e.art_cod_art = s.cod_art
       left join pedido d on e.art_cod_art = d.cod_art
       left join vw_articulo a on e.art_cod_art = a.cod_art
 where (e.cod_lin between '900' and '999' and length(e.cod_lin) = 3)
--    and e.formula = 'KIT AUT VK 87860 R'
 group by e.art_cod_art, s.stock, cant_pedido, proveedor, d.nro_pedido, a.cant_requerida
        , stock_requerida
 order by cantidad desc;

select cant_requerida, stock_requerida
  from vw_articulo
 where cod_art = '400.2556';

select *
  from tmp_explosion_articulo
 where art_cod_art = '450.951RVIT';

  with pedidos as (
    select cod_art, p.nombre, sum(d.cantidad) as cant
      from lg_pedjam g
           join lg_itemjam d on g.num_importa = d.num_importa
           join proveed p on g.cod_proveed = p.cod_proveed
     where d.cod_art = '400.2789'
       and d.saldo != 0
     group by cod_art, p.nombre
    )
select p.cod_art, sum(p.cant) as cant
     , listagg(p.nombre, ' | ') within group ( order by p.nombre) as proveedor
  from pedidos p
 group by p.cod_art;

select nombre, ncomercial
  from proveed
 where nombre like '%FOSHAN%';


-- detalle pedidos
  with detalle as (
    select p.numero, to_char(p.fecha, 'dd/mm/yyyy') as fecha, d.cod_eqi, d.cod_art, d.canti
         , d.preuni, d.canti * preuni as importe
      from expedidos p
           join expedido_d d on p.numero = d.numero
     where p.cod_cliente in (996057, 990937)
       and p.fecha >= to_date('01/01/2022', 'dd/mm/yyyy')
     order by p.fecha, p.numero
    )
select cod_art, sum(canti) as cantidad
  from detalle
 group by cod_art;

select *
  from lg_itemjam
 where cod_art = 'SA VK10040-D';

select *
  from lg_pedjam
 where num_importa = 'PVC22167';

select *
  from pcformulas
 where cod_art = 'M 290.3569 ALR';

select *
  from pcformulas
 where cod_art like '%290.3569ALR%';

select *
  from pcformulas
 where cod_for = '290.3569ALR';