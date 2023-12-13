select *
  from pr_programa_embarques_id
 where estado = 1;

insert into pr_embarques
select id_vendedor, :ANO_NUEVO as ano_embarque, :MES_NUEVO as mes_embarque, id_pedido
     , fecha_embarque, detalle, nombre_cliente, parcial
  from pr_embarques
 where ano_embarque = :ANO_ANTERIOR
   and mes_embarque = :MES_ANTERIOR
   and id_pedido not in (
   select id_pedido
     from pr_embarques
    where ano_embarque = :ANO_NUEVO
      and mes_embarque = :MES_NUEVO
   );


insert into pr_embarques_prioridad_orden
select :ANO_NUEVO, :MES_NUEVO, prioridad, orden, maximo_a_facturar
  from pr_embarques_prioridad_orden
 where ano_embarque = :ANO_ANTERIOR
   and mes_embarque = :MES_ANTERIOR;

select *
  from pr_embarques
 where ano_embarque = 2023
   and mes_embarque = 12;

select *
  from pr_embarques_prioridad_orden
 where ano_embarque = 2023
   and mes_embarque = 12;