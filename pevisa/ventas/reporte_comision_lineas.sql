-- comision de lineas

select * from vw_consulta_comision;

select *
  from cominac_concepto
 where cod_concepto = 230;

select *
  from cominac_concepto_rango
 where cod_concepto = 230;

select r.cod_concepto
     , listagg('cuota: ' ||
               case c.cod_tipo_cuota
                 when 'IMPT' then
                   case c.moneda_rango
                     when 'S' then 'S/'
                     when 'D' then '$'
                   end
                 when 'PORC' then '%'
               end || r.cuota ||
               ' premio: ' ||
               case c.cod_tipo_premio
                 when 'IMPT' then
                   case c.moneda_premio
                     when 'S' then 'S/'
                     when 'D' then '$'
                   end
                 when 'PORC' then '%'
               end || r.premio, ' | ')
               within group (order by r.cod_rango) as productos
  from cominac_concepto c
       join cominac_concepto_rango r on c.cod_concepto = r.cod_concepto
 where c.cod_concepto = 230
 group by r.cod_concepto;

select * from cominac_tipo_cuota;

select * from cominac_tipo_premio;

-- lineas bonos
  with rangos as (
    select r.cod_concepto
         , listagg('cuota: ' ||
                   case c.cod_tipo_cuota
                     when 'IMPT' then
                       case c.moneda_rango
                         when 'S' then 'S/'
                         when 'D' then '$'
                       end
                     when 'PORC' then '%'
                   end || r.cuota ||
                   ' premio: ' ||
                   case c.cod_tipo_premio
                     when 'IMPT' then
                       case c.moneda_premio
                         when 'S' then 'S/'
                         when 'D' then '$'
                       end
                     when 'PORC' then '%'
                   end || r.premio, ' | ')
                   within group (order by r.cod_rango) as dsc_rangos
      from cominac_concepto c
           join cominac_concepto_rango r on c.cod_concepto = r.cod_concepto
     group by r.cod_concepto
    )
select c.supervisor, c.cod_vendedor, c.nombre, o.cod_concepto, o.concepto, o.tipo, o.periodo
     , o.calculo, o.porc_flat, r.dsc_rangos
     , case o.lineas when 'ESTABLECIDO' then 'LINEA' else o.lineas end as lineas
     , case o.lineas
         when 'ESTABLECIDO' then l1.cod_linea
         when 'GRUPO' then to_char(l2.cod_grupo)
         when 'MEGAGRUPO' then l3.cod_megagrupo
       end as lineas_grupo_megagrupo
     , case o.lineas
         when 'ESTABLECIDO' then l.descripcion
         when 'GRUPO' then g.descripcion
         when 'MEGAGRUPO' then m.descripcion
       end as descripcion
  from vw_consulta_comision c
       join vw_consulta_comision_concepto o on c.cod_contrato = o.cod_contrato
       left join rangos r
                 on o.calculo = 'RANGO'
                   and o.cod_concepto = r.cod_concepto
       left join cominac_concepto_linea l1
                 on o.lineas = 'ESTABLECIDO'
                   and o.cod_concepto = l1.cod_concepto
       left join tab_lineas l
                 on o.lineas = 'ESTABLECIDO'
                   and l1.cod_linea = l.linea
       left join cominac_concepto_grupo l2
                 on o.lineas = 'GRUPO'
                   and o.cod_concepto = l2.cod_concepto
       left join tab_grupos g
                 on o.lineas = 'GRUPO'
                   and l2.cod_grupo = g.grupo
       left join cominac_concepto_megagrupo l3
                 on o.lineas = 'MEGAGRUPO'
                   and o.cod_concepto = l3.cod_concepto
       left join grupo_venta m
                 on o.lineas = 'MEGAGRUPO'
                   and l3.cod_megagrupo = m.cod_grupo_venta
 where o.cod_concepto not in ('13', '14')
   and o.tipo = 'BONO'
   and c.supervisor = '42'
   and exists (
   select 1
     from vendedores v
    where c.cod_vendedor = v.cod_vendedor
      and v.estado = 1 --> vendedor activo
   )
 order by c.cod_vendedor, o.cod_concepto;

select *
  from cominac_concepto
 where cod_concepto = '462';

select * from cominac_filtro;

select * from grupo_venta;

select *
  from vendedores
 where cod_vendedor = 'B1';

select *
  from vendedores
 where cod_vendedor = '42';
