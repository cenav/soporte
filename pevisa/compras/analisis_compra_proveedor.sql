select *
  from vw_pedidos_pendientes_x_grupo;


select *
  from lg_pedjam l
     , proveed p
     , lg_itemjam i
     , articul a
 where p.cod_proveed = l.cod_proveed
   and i.num_importa = l.num_importa
   and a.cod_art = i.cod_art
   and nvl(i.estado, '0') < '9'
--- and i.saldo > 0
--AND L.FECHA BETWEEN :blk_data.P_FECHA1 AND :blk_data.P_FECHA2
--AND ( (:BLK_DATA.p_op = '0' AND I.SALDO > 0) OR (:BLK_DATA.p_op = '1'))
--AND lgpedimp.GET_GRUPO (L.TIPO)  LIKE :blk_data.GRUPO_DE_IMPORTACION
 order by grupo_importacion, p.ncomercial, l.num_importa;


create or replace view vw_analisis_compra_proveedor as
  with param as (
    select id, meses, importe
      from tmp_param_reporte
     where id = 1
    )
     , detalle as (
    select l.num_importa, l.fecha, l.cod_proveed, p.ncomercial, p.nombre, i.unidad, i.cod_art
         , i.precio, i.cantidad
         , sum(i.cantidad * i.precio) over (partition by p.ncomercial) as total_cliente
      from lg_pedjam l
           join lg_itemjam i on i.num_importa = l.num_importa
           join proveed p on p.cod_proveed = l.cod_proveed
           join articul a on a.cod_art = i.cod_art
           cross join param x
     where nvl(i.estado, '0') < '9'
       and l.fecha >= add_months(trunc(sysdate), - x.meses)
    )
select d.num_importa, d.fecha, d.cod_proveed, d.ncomercial, d.nombre, d.unidad, d.cod_art, d.precio
     , d.cantidad, d.total_cliente
  from detalle d
       cross join param x
 where d.total_cliente > x.importe
   and (exists (
   select 1
     from tmp_selecciona_proveedor t
    where d.cod_proveed = t.cod_proveedor
   ) or
        not exists (
          select 1
            from tmp_selecciona_proveedor
          ))
 order by d.total_cliente desc;

select * from artiprov_ncomercial;

select * from tmp_selecciona_proveedor;

select * from tmp_param_reporte;

comment on table tmp_param_reporte is 'Tabla temporal que sirve como parámetros para vistas ya que Oracle no cuenta con parameterized views';
