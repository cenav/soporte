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
 where pedido = 17218;

select *
  from produccion_armado
 where abrev_ped = '17214';

-- actualiza sucursal en cajas producto terminado
declare
  cursor c_pedidos is (
    -- por cada pedido
    select numero, cod_sucursal
      from expedidos
     where numero in (17214, 17215, 17216, 17217, 17218)
    );
begin
  for ped in c_pedidos loop
    -- actualiza sucursal
    update produccion_armado
       set dato_agrupa = '1-' || abrev_cli || '-' || ped.cod_sucursal
     where abrev_ped = ped.numero;
  end loop;
end;


-- regresa a una sola sucursal
declare
  cursor c_pedidos is (
    -- por cada pedido
    select numero, cod_sucursal
      from expedidos
     where numero in (17214, 17215, 17216, 17217, 17218)
    );
begin
  for ped in c_pedidos loop
    -- actualiza sucursal
    update produccion_armado
       set dato_agrupa = '1-' || abrev_cli
     where abrev_ped = ped.numero;
  end loop;
end;

select distinct decode(substr(dato_agrupa, 1, 1), '2', 'LIMA', p.abrev_cli), dato_agrupa
  from produccion_armado_log l
     , produccion_armado p
 where l.numero_oa = p.numero_oa
   and cod_caja = 467651;