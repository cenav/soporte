select *
  from tab_grupos
 where grupo = '41';

select grupo_bateria
  from clientes
 where cod_cliente = '';


select *
  from tablas_auxiliares
 where tipo = 24;


select *
  from clientes
 where categoria_ventas_anoant is not null;

select cod_tipo, dsc_tipo from tipo_categoria;

select cod_tipo, cod_categoria, dsc_categoria, medida, rango_desde, rango_hasta
  from categoria
 order by to_number(cod_categoria);

select * from clientes_categoria;

begin
  dbms_output.put_line(api_clientes_categoria.descripcion('10182059221', 'BCH').dsc_categoria);
end;


select *
  from clientes
 where nombre like '%WILMA%';

-- 10182059221

select *
  from gastos_de_viaje
 where id_vendedor = '79'
   and numero = 217;

select c.*
  from clientes_categoria t
       join categoria c on t.cod_tipo = c.cod_tipo and t.cod_categoria = c.cod_categoria


select * from tab_descuento_rango;

select * from clientes;

select * from tipo_categoria;

select * from categoria;

select * from clientes_categoria;