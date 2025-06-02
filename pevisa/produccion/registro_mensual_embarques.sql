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
