  with detalle as (
    select user
         , prioridad
         , cod_art
         , sum(valor_art) as valor
         , sum(cant_prog) as cantidad
      from pr_prioridad_tmp_30
     where estado_ot < 3
       and prioridad = :p_prioridad
       --AND      color = 'BLUE'
       and exists
       (
         select *
           from pr_embarques
          where id_vendedor = :p_id_vendedor
            and ano_embarque = :p_ano
            and mes_embarque = :p_mes
            and id_pedido in (
            select distinct id_pedido
              from view_pedidos_pendientes_30
             where id_vendedor = :p_id_vendedor
               and prioridad = :p_prioridad
            )
         )
     group by prioridad, cod_art
    )
select *
  from detalle;



  select user
       , prioridad
       , cod_art
       , sum(valor_art) as valor
       , sum(cant_prog) as cantidad
    from pr_prioridad_tmp_30
   where estado_ot < 3
     and prioridad = :p_prioridad
     and color = :c_color_70_por_ciento
     and exists
     (
       select *
         from pr_embarques
        where id_vendedor = :p_id_vendedor
          and ano_embarque = :p_ano
          and mes_embarque = :p_mes
          and id_pedido in (
          select distinct id_pedido
            from view_pedidos_pendientes_30
           where id_vendedor = :p_id_vendedor
             and prioridad = :p_prioridad
          )
       )
   group by prioridad
          , cod_art;


  select *
    from view_prioridades_pendientes_30
   where prioridad = 4859;



  select *
    from pr_prioridad_tmp_30
   where cod_art in (
                     'M 200.2107 AL R', 'M 200.2108 AL R', 'OS 32241 AL R', 'M 180.761 MLS E',
                     'MS 1262 F A', 'KIT ERS VK 50250 US2 R', 'M 290.3230 ALR'
     )

  select *
    from pr_prioridad_tmp_30
   where prioridad = 4859;



  alter procedure p_setenta_por_ciento_porc compile


  select pp.id_vendedor, pp.nombre_vendedor, pp.nombre_cliente, sum(pp.monto_completo)
       , sum(pp.monto_incompleto), sum(pp.monto_pendiente), sum(pp.monto_saos_por_armar)
       , p.prioridad, f_prioridad_rojo_a_facturar_30(p.prioridad) as rojo_a_facturar, pp.nombre_pais
    from view_pedidos_pendientes_30 pp
       , pr_consul p
   where pp.id_pedido = p.pedido
   group by pp.id_vendedor, pp.nombre_vendedor, pp.nombre_cliente, p.prioridad, pp.nombre_pais;


  select *
    from pr_consul
   where prioridad = 4859;


  select *
    from view_pedidos_pendientes_30
   where prioridad = 4859;

  select *
    from tmp_pedidos_30;


  select e.zona, t.descripcion as nombre_vendedor, e.numero, e.fecha, ex.nombre
       , (nvl(tmp.n1, 0) + nvl(tmp.n2, 0) + nvl(tmp.n3, 0) + nvl(tmp.n4, 0) + nvl(tmp.n8, 0) +
          nvl(tmp.n13, 0)) as monto_completo
       , nvl(tmp.n5, 0) as monto_incompleto, nvl(tmp.n10, 0) as monto_pendiente
       , nvl(tmp.n11, 0) as monto_saos_por_armar, p.prioridad, ex.cod_cliente
       , nvl(e.no_despachar_antes_de, 0) as no_despachar_antes_de
       , f_pedidos_rojo_a_facturar_30(e.numero) as rojo_a_facturar, ex.pais
       , get_pais(ex.pais) as nombre_pais
    from expedidos e
       , extablas_expo t
       , tmp_pedidos_30 tmp
       , pr_consul p
       , exclientes ex
   where e.estado not in ('8', '9', 'T', '85')
     and t.tipo = 13
     and t.codigo = e.zona
     and tmp.usuario = (
     select usuario_30
       from exparamexpo
     )
     and tmp.vendedor = e.zona
     and tmp.numero = e.numero
     and nvl(tmp.n0, 0) <> nvl(tmp.n6, 0)
     and e.numero = p.pedido
     and ex.cod_cliente = e.cod_cliente
   union all
  select '77', t.descripcion as nombre_vendedor, e.numero, e.fecha, ex.nombre as nombre
       , (nvl(tmp.n1, 0) + nvl(tmp.n2, 0) + nvl(tmp.n3, 0) + nvl(tmp.n4, 0) + nvl(tmp.n8, 0) +
          nvl(tmp.n13, 0)) as monto_completo
       , nvl(tmp.n5, 0) as monto_incompleto, nvl(tmp.n10, 0) as monto_pendiente
       , nvl(tmp.n11, 0) as monto_saos_por_armar, p.prioridad, e.referencia as cod_cliente
       , 0 as no_despachar_antes_de, f_pedidos_rojo_a_facturar_30(e.numero) as rojo_a_facturar
       , '800' as pais, get_pais('800') as nombre_pais
    from expednac e
       , extablas_expo t
       , tmp_pedidos_30 tmp
       , pr_consul p
       , exclientes ex
   where e.estado not in ('8', '9', 'T', '85')
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
     and ex.cod_cliente = e.cod_cliente
     and substr(e.referencia, 1, 2) <> 'PC'
   union all
  select '78', t.descripcion as nombre_vendedor, e.numero, e.fecha, ex.nombre as nombre
       , (nvl(tmp.n1, 0) + nvl(tmp.n2, 0) + nvl(tmp.n3, 0) + nvl(tmp.n4, 0) + nvl(tmp.n8, 0) +
          nvl(tmp.n13, 0)) as monto_completo
       , nvl(tmp.n5, 0) as monto_incompleto, nvl(tmp.n10, 0) as monto_pendiente
       , nvl(tmp.n11, 0) as monto_saos_por_armar, p.prioridad, e.referencia as cod_cliente
       , 0 as no_despachar_antes_de, f_pedidos_rojo_a_facturar_30(e.numero) as rojo_a_facturar
       , '800' as pais, get_pais('800') as nombre_pais
    from expedstock e
       , extablas_expo t
       , tmp_pedidos_30 tmp
       , pr_consul p
       , exclientes ex
   where e.estado not in ('8', '9', 'T', '85')
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
     and ex.cod_cliente = e.cod_cliente
     and substr(e.referencia, 1, 2) <> 'PC';

  select *
    from lg_factura_comercial
   where numero_embarque = 5022;