-- reporte compara proveedor x año detalle
select m.codigo_marca as nombre_comercial, p.cod_proveed, o.nombre, p.num_importa as pedido
     , extract(year from p.fecha) as "AÑO", p.fecha, p.moneda, p.total_pedido
  from lg_pedjam p
       join pv_marca_comercial m on p.ncomercial = m.codigo_marca
       join proveed o on p.cod_proveed = o.cod_proveed
 where extract(year from p.fecha) in (2023, 2024)
   and nvl(p.estado, '0') != '9'
   and codigo_marca in ('YIDA', 'AITE', 'CGP', 'AOK', 'XINGTAI HEXI', 'JULY', 'JAGO', 'SHEEN',
                        'LYO')
 order by nombre_comercial, fecha;

-- reporte compara proveedor x año resumen
select m.codigo_marca as nombre_comercial, p.cod_proveed, o.nombre
     , sum(case extract(year from p.fecha) when 2023 then p.total_pedido else 0 end) as tot_2023
     , sum(case extract(year from p.fecha) when 2024 then p.total_pedido else 0 end) as tot_2024
     , sum(p.total_pedido) as total_pedido
  from lg_pedjam p
       join pv_marca_comercial m on p.ncomercial = m.codigo_marca
       join proveed o on p.cod_proveed = o.cod_proveed
 where extract(year from p.fecha) in (2023, 2024)
   and nvl(p.estado, '0') != '9'
   and codigo_marca in ('YIDA', 'AITE', 'CGP', 'AOK', 'XINGTAI HEXI', 'JULY', 'JAGO', 'SHEEN',
                        'LYO')
 group by m.codigo_marca, p.cod_proveed, o.nombre
 order by nombre_comercial, nombre;

select *
  from lg_pedjam
 where num_importa = 'PVV25004';

select * from pv_marca_comercial;

select *
  from proveed
 where nombre like '%SHEEN%';

select *
  from proveed
 where ncomercial like 'SHEEN';

select *
  from pv_marca_comercial
 where codigo_marca in
       ('YIDA', 'AITE', 'CGP', 'AOK', 'XINGTAI HEXI', 'JULY', 'JAGO', 'SHEEN', 'LYO');

select *
  from pv_marca_comercial
 where descripcion like '%JAGO%';

select *
  from lg_itemjam
 where num_importa = 'PVV25004';