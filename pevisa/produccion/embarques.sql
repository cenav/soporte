with detalle as (
                SELECT   USER
                       , prioridad
                       , cod_art
                       , SUM(valor_art) valor
                       , SUM(cant_prog) cantidad
                FROM     pr_prioridad_tmp_30
                WHERE    estado_ot < 3
                AND      prioridad = :p_prioridad
                --AND      color = 'BLUE'
                AND      EXISTS
                             (SELECT *
                              FROM   pr_embarques
                              WHERE  id_vendedor = :p_id_vendedor
                              AND    ano_embarque = :p_ano
                              AND    mes_embarque = :p_mes
                              AND    id_pedido IN (SELECT DISTINCT id_pedido
                                                   FROM   view_pedidos_pendientes_30
                                                   WHERE  id_vendedor = :p_id_vendedor
                                                   AND    prioridad = :p_prioridad))
                GROUP BY prioridad, cod_art
)
select *
from detalle;



                SELECT   USER
                       , prioridad
                       , cod_art
                       , SUM(valor_art) valor
                       , SUM(cant_prog) cantidad
                FROM     pr_prioridad_tmp_30
                WHERE    estado_ot < 3
                AND      prioridad = :p_prioridad
                AND      color = :c_color_70_por_ciento
                AND      EXISTS
                             (SELECT *
                              FROM   pr_embarques
                              WHERE  id_vendedor = :p_id_vendedor
                              AND    ano_embarque = :p_ano
                              AND    mes_embarque = :p_mes
                              AND    id_pedido IN (SELECT DISTINCT id_pedido
                                                   FROM   view_pedidos_pendientes_30
                                                   WHERE  id_vendedor = :p_id_vendedor
                                                   AND    prioridad = :p_prioridad))
              GROUP BY prioridad
                     , cod_art;


select *
from view_prioridades_pendientes_30
where prioridad = 4859;



select *
from pr_prioridad_tmp_30
where cod_art in (
'M 200.2107 AL R'
, 'M 200.2108 AL R'
, 'OS 32241 AL R'
, 'M 180.761 MLS E'
, 'MS 1262 F A'
, 'KIT ERS VK 50250 US2 R'
, 'M 290.3230 ALR'
)

select *
from pr_prioridad_tmp_30
where prioridad = 4859;



alter procedure p_setenta_por_ciento_porc compile


    select pp.id_vendedor, pp.nombre_vendedor, pp.nombre_cliente, sum(pp.monto_completo)
         , sum(pp.monto_incompleto), sum(pp.monto_pendiente), sum(pp.monto_saos_por_armar)
         , p.prioridad, f_prioridad_rojo_a_facturar_30(p.prioridad) rojo_a_facturar, pp.nombre_pais
      from view_pedidos_pendientes_30 pp, pr_consul p
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


  select e.zona, t.descripcion nombre_vendedor, e.numero, e.fecha, ex.nombre
       , (nvl(tmp.n1, 0) + nvl(tmp.n2, 0) + nvl(tmp.n3, 0) + nvl(tmp.n4, 0) + nvl(tmp.n8, 0) + nvl(tmp.n13, 0)) monto_completo
       , nvl(tmp.n5, 0) monto_incompleto, nvl(tmp.n10, 0) monto_pendiente
       , nvl(tmp.n11, 0) monto_saos_por_armar, p.prioridad, ex.cod_cliente
       , nvl(e.no_despachar_antes_de, 0) no_despachar_antes_de
       , f_pedidos_rojo_a_facturar_30(e.numero) rojo_a_facturar, ex.pais
       , get_pais(ex.pais) nombre_pais
    from expedidos e, extablas_expo t, tmp_pedidos_30 tmp, pr_consul p, exclientes ex
   where e.estado not in ('8', '9', 'T', '85')
     and t.tipo = 13
     and t.codigo = e.zona
     and tmp.usuario = (select usuario_30 from exparamexpo)
     and tmp.vendedor = e.zona
     and tmp.numero = e.numero
     and nvl(tmp.n0, 0) <> nvl(tmp.n6, 0)
     and e.numero = p.pedido
     and ex.cod_cliente = e.cod_cliente
  union all
  select '77', t.descripcion nombre_vendedor, e.numero, e.fecha, ex.nombre nombre
       , (nvl(tmp.n1, 0) + nvl(tmp.n2, 0) + nvl(tmp.n3, 0) + nvl(tmp.n4, 0) + nvl(tmp.n8, 0) + nvl(tmp.n13, 0)) monto_completo
       , nvl(tmp.n5, 0) monto_incompleto, nvl(tmp.n10, 0) monto_pendiente
       , nvl(tmp.n11, 0) monto_saos_por_armar, p.prioridad, e.referencia cod_cliente
       , 0 no_despachar_antes_de, f_pedidos_rojo_a_facturar_30(e.numero) rojo_a_facturar
       , '800' pais, get_pais('800') nombre_pais
    from expednac e, extablas_expo t, tmp_pedidos_30 tmp, pr_consul p, exclientes ex
   where e.estado not in ('8', '9', 'T', '85')
     and t.tipo = 13
     and t.codigo = '77'
     and tmp.usuario = (select usuario_30 from exparamexpo)
     and tmp.vendedor = '77'
     and tmp.numero = e.numero
     and nvl(tmp.n0, 0) <> nvl(tmp.n6, 0)
     and e.numero = p.pedido
     and ex.cod_cliente = e.cod_cliente
     and substr(e.referencia, 1, 2) <> 'PC'
  union all
  select '78', t.descripcion nombre_vendedor, e.numero, e.fecha, ex.nombre nombre
       , (nvl(tmp.n1, 0) + nvl(tmp.n2, 0) + nvl(tmp.n3, 0) + nvl(tmp.n4, 0) + nvl(tmp.n8, 0) + nvl(tmp.n13, 0)) monto_completo
       , nvl(tmp.n5, 0) monto_incompleto, nvl(tmp.n10, 0) monto_pendiente
       , nvl(tmp.n11, 0) monto_saos_por_armar, p.prioridad, e.referencia cod_cliente
       , 0 no_despachar_antes_de, f_pedidos_rojo_a_facturar_30(e.numero) rojo_a_facturar
       , '800' pais, get_pais('800') nombre_pais
    from expedstock e, extablas_expo t, tmp_pedidos_30 tmp, pr_consul p, exclientes ex
   where e.estado not in ('8', '9', 'T', '85')
     and t.tipo = 13
     and t.codigo = '78'
     and tmp.usuario = (select usuario_30 from exparamexpo)
     and tmp.vendedor = '78'
     and tmp.numero = e.numero
     and nvl(tmp.n0, 0) <> nvl(tmp.n6, 0)
     and e.numero = p.pedido
     and ex.cod_cliente = e.cod_cliente
     and substr(e.referencia, 1, 2) <> 'PC';