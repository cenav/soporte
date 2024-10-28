-- ordenes cantidad programada 0 dan problema en el proceso
begin
  p_setenta_por_ciento_atraso(
      p_ano => 2024
    , p_mes => 10
    , p_porcentaje => 85
  );
end;

-- elimina ordenes con cant_prog 0
select *
  from pr_prioridad_tmp_30
 where canti = 0;

select cod_art
     , cant_1
  from tmp_70_juegos_atraso
 where usuario = 'ALBERTO'
   and tipo = :p_tipo
   and prioridad = :p_prioridad
 order by cant_1 desc;

select *
  from tmp_70_juegos_atraso
 where cant_1 = 0;

select user
     , :p_tipo
     , prioridad
     , cod_art
     , sum(valor_art) as valor
     , sum(cant_prog) as cantidad
  from pr_prioridad_tmp_30
 where estado_ot < 3
   and fecha < :d_fecha_retraso
   and prioridad = :p_prioridad
   and color = :c_color_70_por_ciento
   and exists (
   select *
     from pr_embarques
    where id_vendedor = p_id_vendedor
      and ano_embarque = p_ano
      and mes_embarque = p_mes
      and id_pedido in (
      select distinct id_pedido
        from view_pedidos_pendientes_30
       where id_vendedor = p_id_vendedor
         and prioridad = p_prioridad
      )
   )
 group by prioridad
        , cod_art;

select *
  from pr_prioridad_tmp_30
 where valor_art = 0;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and estado = 1
   and cant_prog = 0;

select *
  from expedido_d
 where canti = 0
   and id is null;

select *
  from expedido_d
 where numero = 16515
   and nro = 161;

select e.numero, e.nro, o.nuot_tipoot_codigo, o.nuot_serie, o.numero
  from expedido_d e
       join pr_ot o on e.numero = o.abre01 and e.nro = o.per_env
 where e.canti = 0
   and e.id is null
   and o.cant_prog = 0
   and o.estado = '1';

select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and estado = 1
   and cant_prog = 0;
