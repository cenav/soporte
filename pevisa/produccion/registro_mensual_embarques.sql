select * from view_prioridades_pendientes_38;

select * from view_pedidos_pendientes_38;

-- modelo para la abreviatura o nombre por grupo (AUTOZONE USA, AUTOZONE MX)
select * from vw_ordenes_pedido_pendiente;

select *
  from exclientes_varios
 where cod_cliente in (
                       996057, 998048
   );

select * from grupo_cliente;

select * from grupo_cliente_cliente;

select *
  from exclientes
 where cod_cliente in (
                       996057, 998048
   );

-- query programa embarques
select ex.cod_vende as id_vendedor, t.descripcion as nombre_vendedor, e.numero as id_pedido, e.fecha
     , nvl(gc.dsc_grupo, ex.nombre) as nombre
     , (nvl(tmp.n1, 0)
  + nvl(tmp.n2, 0)
  + nvl(tmp.n3, 0)
  + nvl(tmp.n4, 0)
  + nvl(tmp.n8, 0)
  + nvl(tmp.n13, 0))
  as monto_completo
     , nvl(tmp.n5, 0) as monto_incompleto, nvl(tmp.n10, 0) as monto_pendiente
     , nvl(tmp.n11, 0) as monto_saos_por_armar, nvl(tmp.n12, 0) as servicio_cuno, p.prioridad
     , ex.cod_cliente, nvl(e.no_despachar_antes_de, 0) as no_despachar_antes_de
     , f_pedidos_rojo_a_facturar_30(e.numero) as rojo_a_facturar, ex.pais
     , get_pais(ex.pais) as nombre_pais
  from expedidos e
     , extablas_expo t
     , tmp_pedidos_30 tmp
     , pr_consul p
     , exclientes ex
     , grupo_cliente_cliente gcc
     , grupo_cliente gc
 where e.estado not in ('8',
                        '9',
                        'T',
                        '85')
   and t.tipo = 13
   and t.codigo = ex.cod_vende
   and tmp.usuario = (
   select usuario_30
     from exparamexpo
   )
   and tmp.vendedor = ex.cod_vende
   and tmp.numero = e.numero
   and nvl(tmp.n0, 0) <> nvl(tmp.n6, 0)
   and e.numero = p.pedido
   and p.tipo = '1'
   and ex.cod_cliente = e.cod_cliente
   and e.cod_cliente = gcc.cod_cliente(+)
   and gc.cod_grupo(+) = gcc.cod_grupo
 union all
select '77', t.descripcion as nombre_vendedor, e.numero, e.fecha, ex.nombre as nombre, (
  nvl(tmp.n1, 0)
    + nvl(tmp.n2, 0)
    + nvl(tmp.n3, 0)
    + nvl(tmp.n4, 0)
    + nvl(tmp.n8, 0)
    + nvl(tmp.n13, 0))
  as monto_completo
     , nvl(tmp.n5, 0) as monto_incompleto, nvl(tmp.n10, 0) as monto_pendiente
     , nvl(tmp.n11, 0) as monto_saos_por_armar, nvl(tmp.n12, 0) as servicio_cuno, p.prioridad
     , e.referencia as cod_cliente, 0 as no_despachar_antes_de
     , f_pedidos_rojo_a_facturar_30(e.numero) as rojo_a_facturar, '800' as pais
     , get_pais('800') as nombre_pais
  from expednac e
     , extablas_expo t
     , tmp_pedidos_30 tmp
     , pr_consul p
     , exclientes ex
 where e.estado not in ('8',
                        '9',
                        'T',
                        '85')
   and t.tipo = 13
   and t.codigo = '77'
   and tmp.usuario = (
   select usuario_30
     from exparamexpo
   )
   and tmp.vendedor = '77'
   and tmp.numero = e.numero
   and nvl(tmp.n0, 0) <> nvl(tmp.n6, 0)
   and e.numero = p.pedido
   and p.tipo = '2'
   and ex.cod_cliente = e.cod_cliente
   and substr(e.referencia, 1, 2) <> 'PC'
 union all
select '78', t.descripcion as nombre_vendedor, e.numero, e.fecha
     , ex.nombre as nombre
     , (nvl(tmp.n1, 0)
  + nvl(tmp.n2, 0)
  + nvl(tmp.n3, 0)
  + nvl(tmp.n4, 0)
  + nvl(tmp.n8, 0)
  + nvl(tmp.n13, 0))
  as monto_completo
     , nvl(tmp.n5, 0) as monto_incompleto, nvl(tmp.n10, 0) as monto_pendiente
     , nvl(tmp.n11, 0) as monto_saos_por_armar, nvl(tmp.n12, 0) as servicio_cuno, p.prioridad
     , e.referencia as cod_cliente, 0 as no_despachar_antes_de
     , f_pedidos_rojo_a_facturar_30(e.numero) as rojo_a_facturar, '800' as pais
     , get_pais('800') as nombre_pais
  from expedstock e
     , extablas_expo t
     , tmp_pedidos_30 tmp
     , pr_consul p
     , exclientes ex
 where e.estado not in ('8',
                        '9',
                        'T',
                        '85')
   and t.tipo = 13
   and t.codigo = '78'
   and tmp.usuario = (
   select usuario_30
     from exparamexpo
   )
   and tmp.vendedor = '78'
   and tmp.numero = e.numero
   and nvl(tmp.n0, 0) <> nvl(tmp.n6, 0)
   and e.numero = p.pedido
   and p.tipo = '3'
   and ex.cod_cliente = e.cod_cliente
   and substr(e.referencia, 1, 2) <> 'PC';


-- total fila superior programa embarques
  with backorder as (
    select v.id_vendedor, v.nombre_vendedor, v.prioridad, v.nombre_cliente, v.monto_completo
         , v.rojo_a_facturar, v.monto_completo + v.rojo_a_facturar as importe, e.ano_embarque
         , e.mes_embarque
      from view_prioridades_pendientes_38 v
           join
             pr_embarques e on e.id_vendedor = v.id_vendedor
     where exists (
       select 1
         from view_pedidos_pendientes_38 p
        where p.id_pedido = e.id_pedido
          and p.id_vendedor = v.id_vendedor
          and p.prioridad = v.prioridad
       )
     group by v.id_vendedor, v.nombre_vendedor, v.prioridad, v.nombre_cliente, v.monto_completo
            , v.rojo_a_facturar, e.ano_embarque, e.mes_embarque
    )
select sum(b.importe) as total
  from backorder b
 where b.ano_embarque = 2025
   and b.mes_embarque = 10
   and b.id_vendedor = '05';

-- sum monto completo detalle embarques
select sum(monto_completo) + sum(monto_saos_por_armar) + sum(servicio_cuno) as monto_completo
  from view_prioridades_pendientes_38
 where (id_vendedor <> '77' or (id_vendedor = '77' and nombre_cliente = 'PEVISA'))
   and id_vendedor = '05'
   and exists (
   select 1
     from pr_embarques
    where id_vendedor = view_prioridades_pendientes_38.id_vendedor
      and ano_embarque = 2025
      and mes_embarque = 10
      and id_pedido in (
      select distinct id_pedido
        from view_pedidos_pendientes_38
       where id_vendedor = view_prioridades_pendientes_38.id_vendedor
         and prioridad = view_prioridades_pendientes_38.prioridad
      )
   );

-- prioridades marcadas
select count(1)
  from pr_embarques
 where id_vendedor = :id_vendedor
   and ano_embarque = :x_ano
   and mes_embarque = :x_mes
   and id_pedido in (
   select distinct id_pedido
     from view_pedidos_pendientes_38
    where id_vendedor = :id_vendedor
      and prioridad = :prioridad
   );

-- total nacional, importado, desarrollo, reparacion
select nvl(sum(decode(color, 'R', importe, 0)), 0) as nacional
     , nvl(sum(decode(color, 'M', importe, 0)), 0) as importado
     , nvl(sum(decode(color, 'G', importe, 0)), 0) as desarrollo
     , nvl(sum(decode(color, 'RE', importe, 0)), 0) as reparacion
  from view_prioridad_colores_30;

-- total nacional
  with prioridades_color as (
    select prioridad, color
         , decode(color,
                  'G', 'Desarrollo',
                  'M', 'Inc. Importado',
                  'R', 'Inc. Nacional',
                  'RE', 'Inc. Reparación',
                  'B', 'Azul',
                  'Otro')
      as descripcion_color
         , sum(valor_art) as importe
      from pr_prioridad_tmp_30
     where color in ('G', 'M', 'R', 'RE')
     group by prioridad, color
     union all
    select prioridad, '%' as color, 'Total' as descripcion_color, sum(valor_art) as importe
      from pr_prioridad_tmp_30
     where color in ('G', 'M', 'R', 'RE')
     group by prioridad
     order by prioridad, color
    )
select c.descripcion_color, sum(c.importe) as importe
  from prioridades_color c
 where c.color = 'R'
 group by c.descripcion_color;

select * from tmp_pedidos_30;


select *
  from vw_pedidos_pendientes_x_vend
 where ano_embarque = 2025
   and mes_embarque = 4
   and id_vendedor = '05';

-- (:VIEW_PRIORIDADES_PENDIENTES.X_MONTO_MAXIMO_A_FACTURAR * :VIEW_PRIORIDADES_PENDIENTES.X_05 * :VIEW_PRIORIDADES_PENDIENTES.X_SELECCIONADO)

select sum(monto_completo)
  from view_prioridades_pendientes_38
 where id_vendedor = '05';


select *
  from view_prioridad_colores_30
 where prioridad = 6255;


select nvl(sum(monto_saos_por_armar), 0)
  from view_pedidos_pendientes_38
 where id_vendedor = p_vendedor
   and prioridad = p_prioridad;


select *
  from pr_prioridad_tmp_30
 where color like '%';

select sum(valor_art)
  from pr_prioridad_tmp_30
 where prioridad = 6255;

select *
  from pr_prioridad_tmp_30
 where prioridad = 6255
   and color like 'R';

select *
  from pr_prioridad_tmp_30
 where color = 'RE';

select *
  from view_pedidos_pendientes_38;