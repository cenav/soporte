-- tipos de agrupaciones de pedido
select * from packing_agrupar;

select packing_agrupar --> cambiar por la agrupación que indiquen
  from expedidos
 where numero in (17214, 17215, 17216, 17217, 17218);


select *
  from view_prodterm_pedidos
 where cod_cliente = '990655';

select *
  from view_prodterm_pedidos
 where pedido = 17214;

select *
  from produccion_armado
 where abrev_ped = '17214';