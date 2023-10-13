select *
  from tmp_programa_ordenes_ingresos
 where usuario = :usuario
   and id_programa = :id_programa
   and (nvl(programa, 0) + nvl(ordenes, 0) + nvl(ingresos, 0)) > 0
   and exists (
   select 1
     from pr_grupos r
    where nvl(programa_produccion, 'X') = 'SI'
      and nvl(estado, 0) < 9
   );

-- resumen programa produccion
select descripcion, programa, ingresos
     , (ordenes - nvl(ingresos, 0) - nvl(mermas, 0) + nvl(excesos, 0)) as por_ingresar
  from tmp_programa_ordenes_ingresos
 where usuario = :usuario
   and id_programa = :id_programa
   and (nvl(programa, 0) + nvl(ordenes, 0) + nvl(ingresos, 0)) > 0
   and exists (
   select 1
     from pr_grupos r
    where nvl(programa_produccion, 'X') = 'SI'
      and nvl(estado, 0) < 9
   );

-- detalle programa produccion
select g.descripcion, numero, fecha, prioridad, formu_art_cod_art, cant_prog, o.estado
     , cod_lin
  from view_ordenes_por_programa o
       join pr_grupos g on o.id_grupo = g.id
 where o.id_programa = :id_programa;

-- reporte control produccion
  with salida_venta as (
    select cod_art, pr_tipot, pr_numot, cantidad as cant_sal_vta
         , row_number() over (partition by cod_art, pr_tipot, pr_numot order by fecha desc) as rn
      from kardex_dpk
     where tp_transac = '26'
    )
select extract(year from o.fecha) as anio, nuot_tipoot_codigo as tipo, o.numero, o.fecha
     , formu_art_cod_art, cod_lin, o.estado, e.descripcion as dsc_estado, cant_prog, cant_sal_vta
     , cant_prog - cant_sal_vta as por_ingresar, cant_sal_vta * cant_prog / 100 as por_ingreso
     , abre01 as pedido, p.nombre as cliente
  from pr_ot o
       left join pr_estados e on o.estado = e.estado
       left join expedidos p on o.abre01 = p.numero
       left join salida_venta s
                 on o.formu_art_cod_art = s.cod_art
                   and o.nuot_tipoot_codigo = s.pr_tipot
                   and o.numero = s.pr_numot
                   and s.rn = 1
 where nuot_tipoot_codigo = 'AR'
   and extract(year from o.fecha) >= 2020
   and e.estado != '9'
--    and cant_prog != cant_sal_vta
   and o.destino = 1
 order by o.fecha;

select cod_art, pr_tipot, pr_numot, sum(cantidad) as cant_sal_vta
  from kardex_dpk
 where cod_art = 'CH 80102 TG'
   and pr_tipot = 'AR'
   and pr_numot = 674363
 group by cod_art, pr_tipot, pr_numot;


select cod_art, pr_tipot, pr_numot, cantidad, estado
  from kardex_dpk
 where cod_art = 'CH 80102 TG'
   and pr_tipot = 'AR'
   and pr_numot = 674363;


select cod_art, pr_tipot, pr_numot, cantidad, estado, fecha
     , row_number() over (partition by cod_art, pr_tipot, pr_numot order by fecha desc) as rn
  from kardex_dpk
--  where cod_art = 'CH 80102 TG'
 where pr_tipot = 'AR'
   and pr_numot in (674363, 677007)
   and tp_transac = '26';
