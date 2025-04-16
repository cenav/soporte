select * from exmetas;

select cod_proveedor, detalle, importe_capital
  from tmp_carga_data;

select cod_proveedor, detalle, importe_capital
  from tmp_carga_data
 where cod_proveedor is null;

merge into tmp_carga_data t
using (
    with detalle as (
      select cod_cliente, nombre, count(nombre) over (partition by nombre) as repetido
        from exclientes
      )
  select *
    from detalle d
   where repetido = 1
    ) e
on (t.detalle = e.nombre)
when matched then
  update set t.cod_proveedor = e.cod_cliente;

insert into exmetas(anio, cod_cliente, nombre, meta)
select 2024, cod_proveedor, detalle, importe_capital
  from tmp_carga_data;

select t.cod_proveedor, t.detalle, t.importe_capital, e.cod_cliente
  from tmp_carga_data t
       left join exclientes e on t.detalle = e.nombre
 where e.cod_cliente is null;

select *
  from exclientes
 where nombre like 'SABO INDUSTRIA E COMERCIO DE AUTOPECAS S';

select *
  from exclientes
 where nombre like '%AUTOZONE%';

  with detalle as (
    select cod_cliente, nombre, count(nombre) over (partition by nombre) as repetido
      from exclientes
    )
select *
  from detalle d
 where repetido = 1;

select cod_proveedor, detalle, importe_capital
  from tmp_carga_data
 where cod_proveedor is null;

select * from grupo_cliente;

select *
  from grupo_cliente_cliente
 where cod_grupo = 'G001';

select *
  from exclientes
 where cod_cliente in (
                       '990937', '996057'
   );