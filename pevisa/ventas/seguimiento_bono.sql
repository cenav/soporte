-- venta_cuatrimestral
  with detalle as (
    select cod_vende, tipodoc, serie, numero, fecha, cod_grupo, cod_lin, cod_art, total_dolares
      from vw_venta_detalle
     where fecha between to_date('01/09/2023', 'dd/mm/yyyy') and to_date('31/12/2023', 'dd/mm/yyyy')
       and ((cod_vende in ('06', '27', '23', '05', '20', '11', '10', '15') and
             cod_grupo not in (1, 2, 3, 4, 5, 6, 7, 11, 12, 13, 21, 26, 28, 37) and
             cod_lin not in ('227', '237', '247')) or
            cod_vende in ('61', '67', '62', '64', '65', '22'))
       and cod_megagrupo not in ('3000', '4000')
    )
select *
  from detalle
 where fecha between to_date('01/09/2023', 'dd/mm/yyyy') and to_date('31/12/2023', 'dd/mm/yyyy')
 order by fecha, tipodoc, numero;


select *
  from vendedores
 where cod_vendedor = '15';

select *
  from tab_grupos
 where ind_vta1 in ('4000')
 order by grupo;

  with detalle as (
    select cod_vende, tipodoc, serie, numero, fecha, cod_grupo, cod_lin, cod_art, total_dolares
         , cod_megagrupo
      from vw_venta_detalle
     where fecha between to_date('01/09/2023', 'dd/mm/yyyy') and to_date('31/12/2023', 'dd/mm/yyyy')
       and ((cod_vende in ('06', '27', '23', '05', '20', '11', '10', '15') and
             cod_grupo not in (1, 2, 3, 4, 5, 6, 7, 11, 12, 13, 21, 26, 28, 37) and
             cod_lin not in ('227', '237', '247')) or
            (cod_vende in ('61', '67', '62', '64', '65') or
             (cod_vende in ('22') and cod_megagrupo not in ('3000', '4000'))))
    )
select *
  from detalle
 where cod_vende = '22'
   and fecha between to_date('01/12/2023', 'dd/mm/yyyy') and to_date('31/12/2023', 'dd/mm/yyyy')
 order by fecha, tipodoc, numero;

select *
  from cominac_contrato c
       join cominac_contrato_item i on c.cod_contrato = i.cod_contrato
       join cominac_concepto e on i.cod_concepto = e.cod_concepto
 where e.cod_concepto = 431;

select *
  from cominac_concepto_rango
 where cod_concepto = 431;

select *
  from vw_cominac_concepto_rango
 where cod_concepto = 431
 order by cuota_desde;

select *
  from cominac_concepto_grupo
 where cod_concepto = 431
   and cod_grupo = 39;


  with test as (
    select r.cod_concepto
         , r.cod_rango
         , r.cuota as cuota_desde
         , lead(r.cuota - 1, 1, 999999999)
                over (partition by c.cod_concepto order by r.cuota) as cuota_hasta
         , lead(r.cuota, 1, binary_double_infinity)
                over (partition by c.cod_concepto order by r.cuota) as siguiente_cuota
         , r.premio
      from cominac_concepto c
           join cominac_concepto_rango r on c.cod_concepto = r.cod_concepto
     where c.cod_concepto = 431
     order by r.cuota
    )
select cod_concepto, cod_rango, cuota_desde, cuota_hasta, siguiente_cuota, premio
     , case siguiente_cuota when binary_double_infinity then 'SI' else 'NO' end as infinito
     , case when 300000 between cuota_desde and siguiente_cuota then 'SI' else 'NO' end as en_rango
     , case siguiente_cuota
         when binary_double_infinity then 'Infinito'
         else trim(to_char(siguiente_cuota, '9,999,999.99'))
       end as prueba
  from test;


insert into pevisa.cominac_concepto_grupo
  (cod_concepto, cod_grupo)
values
  (431, 37);
insert into pevisa.cominac_concepto_grupo
  (cod_concepto, cod_grupo)
values
  (432, 37);
insert into pevisa.cominac_concepto_grupo
  (cod_concepto, cod_grupo)
values
  (433, 37);
insert into pevisa.cominac_concepto_grupo
  (cod_concepto, cod_grupo)
values
  (434, 37);
insert into pevisa.cominac_concepto_grupo
  (cod_concepto, cod_grupo)
values
  (435, 37);
insert into pevisa.cominac_concepto_grupo
  (cod_concepto, cod_grupo)
values
  (436, 37);
insert into pevisa.cominac_concepto_grupo
  (cod_concepto, cod_grupo)
values
  (437, 37);
insert into pevisa.cominac_concepto_grupo
  (cod_concepto, cod_grupo)
values
  (438, 37);
insert into pevisa.cominac_concepto_grupo
  (cod_concepto, cod_grupo)
values
  (439, 37);
insert into pevisa.cominac_concepto_grupo
  (cod_concepto, cod_grupo)
values
  (440, 37);
insert into pevisa.cominac_concepto_grupo
  (cod_concepto, cod_grupo)
values
  (441, 37);
insert into pevisa.cominac_concepto_grupo
  (cod_concepto, cod_grupo)
values
  (442, 37);
insert into pevisa.cominac_concepto_grupo
  (cod_concepto, cod_grupo)
values
  (443, 37);
insert into pevisa.cominac_concepto_grupo
  (cod_concepto, cod_grupo)
values
  (444, 37);
insert into pevisa.cominac_concepto_grupo
  (cod_concepto, cod_grupo)
values
  (445, 37);


select cod_concepto, "1_CUOTA", "2_CUOTA", "3_CUOTA", "1_PREMIO", "2_PREMIO", "3_PREMIO"
  from (
    select cod_concepto, cod_rango, cuota, premio
      from cominac_concepto_rango
     where cod_concepto between 431 and 445
    )
    pivot (
    sum(cuota) as cuota, sum(premio) as premio
    for cod_rango in (1, 2, 3)
    );

-- harcoded
  with concepto as (
    select c.cod_vendedor, e.cod_concepto, e.cod_tipo_venta, e.vigencia_del, e.vigencia_al, e.lineas
      from cominac_contrato c
           join cominac_contrato_item i on c.cod_contrato = i.cod_contrato
           join cominac_concepto e on i.cod_concepto = e.cod_concepto
     where e.cod_concepto between 431 and 445
    )
     , rangos as (
    select cod_concepto
         , "1_CUOTA" as cuota_1, "2_CUOTA" as cuota_2, "3_CUOTA" as cuota_3
         , "1_PREMIO" as premio_1, "2_PREMIO" as premio_2, "3_PREMIO" as premio_3
      from (
        select cod_concepto, cod_rango, cuota, premio
          from cominac_concepto_rango
         where cod_concepto between 431 and 445
        )
        pivot (
        sum(cuota) as cuota, sum(premio) as premio
        for cod_rango in (1, 2, 3)
        )
    )
     , venta as (
    select v.cod_vende, e.nombre, c.cod_concepto, nvl(sum(total_dolares), 0) as venta_dol
      from vw_venta_detalle v
           join vendedores e on v.cod_vende = e.cod_vendedor
           join concepto c on v.cod_vende = c.cod_vendedor
     where ((c.cod_tipo_venta = 'INDI'
       and cod_vende = c.cod_vendedor)
       or (c.cod_tipo_venta = 'TODO'
         and cod_vende like '%')
       or (c.cod_tipo_venta = 'GRUP'
         and cod_vende in (
           select cod_vendedor
             from cominac_concepto_venta_grupal
            where cod_concepto = c.cod_concepto
           )))
       and fecha between c.vigencia_del and c.vigencia_al
       and ((c.lineas = 'TODO'
       and cod_lin like '%')
       or (c.lineas = 'ESTABLECIDO'
         and cod_lin in (
           select cod_linea
             from cominac_concepto_linea
            where cod_concepto = c.cod_concepto
           ))
       or (c.lineas = 'GRUPO'
         and cod_lin in (
           select l.linea
             from cominac_concepto_grupo g
                  join tab_lineas l on g.cod_grupo = l.grupo
            where g.cod_concepto = c.cod_concepto
           ))
       or (c.lineas = 'MEGAGRUPO'
         and cod_lin in (
           select l.linea
             from cominac_concepto_megagrupo g
                  join tab_grupos r on g.cod_megagrupo = r.ind_vta1
                  join tab_lineas l on r.grupo = l.grupo
            where g.cod_concepto = c.cod_concepto
           )))
       and cod_cliente not in (
       select cod_cliente
         from cominac_concepto_excluye_clie
        where cod_concepto = c.cod_concepto
       )
       and not exists (
       select 1
         from cominac_concepto_excluye_doc
        where cod_concepto = c.cod_concepto
          and tipodoc = v.tipodoc
          and serie = v.serie
          and numero = v.numero
       )
     group by v.cod_vende, e.nombre, c.cod_concepto
    )
     , resumen as (
    select cod_vende, nombre, venta_dol, l.cuota_desde as cuota_lograda, l.premio as premio_logrado
         , coalesce(l.siguiente_cuota, d.cuota_desde) as siguiente_cuota
         , r.cuota_1, r.cuota_2, r.cuota_3, r.premio_1, r.premio_2, r.premio_3
      from venta v
           left join vw_cominac_concepto_rango l
                     on v.cod_concepto = l.cod_concepto
                       and v.venta_dol between l.cuota_desde and l.cuota_hasta
           left join vw_cominac_concepto_rango d
                     on v.cod_concepto = d.cod_concepto
                       and d.cod_rango = 1
           left join rangos r on v.cod_concepto = r.cod_concepto
    )
select cod_vende, nombre, venta_dol, cuota_lograda, premio_logrado
     , case siguiente_cuota
         when binary_double_infinity then 'MAXIMO ALCANZADO'
         else trim(to_char(siguiente_cuota, '9999999'))
       end as siguiente_cuota
     , case siguiente_cuota
         when binary_double_infinity then 0
         else round(siguiente_cuota - venta_dol, 2)
       end as faltante_siguiente_cuota
     , cuota_1, cuota_2, cuota_3, premio_1, premio_2, premio_3
  from resumen;

-- seguimiento bono
-- create or replace view vw_seguimiento_bono as
  with concepto as (
    select s.id_seguimiento, c.cod_vendedor, e.cod_concepto, e.cod_tipo_venta, e.vigencia_del
         , e.vigencia_al, e.lineas
      from cominac_contrato c
           join cominac_contrato_item i on c.cod_contrato = i.cod_contrato
           join cominac_concepto e on i.cod_concepto = e.cod_concepto
           join seguimiento_bono_d s on e.cod_concepto = s.cod_concepto
    )
     , rangos as (
    select cod_concepto
         , "1_CUOTA" as cuota_1, "2_CUOTA" as cuota_2, "3_CUOTA" as cuota_3
         , "1_PREMIO" as premio_1, "2_PREMIO" as premio_2, "3_PREMIO" as premio_3
      from (
        select r.cod_concepto, cod_rango, cuota, premio
          from cominac_concepto_rango r
               join seguimiento_bono_d s on r.cod_concepto = s.cod_concepto
        )
        pivot (
        sum(cuota) as cuota, sum(premio) as premio
        for cod_rango in (1, 2, 3)
        )
    )
     , venta as (
    select v.cod_vende, e.nombre, c.cod_concepto, nvl(sum(total_dolares), 0) as venta_dol
      from vw_venta_detalle v
           join vendedores e on v.cod_vende = e.cod_vendedor
           join concepto c on v.cod_vende = c.cod_vendedor
     where ((c.cod_tipo_venta = 'INDI'
       and cod_vende = c.cod_vendedor)
       or (c.cod_tipo_venta = 'TODO'
         and cod_vende like '%')
       or (c.cod_tipo_venta = 'GRUP'
         and cod_vende in (
           select cod_vendedor
             from cominac_concepto_venta_grupal
            where cod_concepto = c.cod_concepto
           )))
       and fecha between c.vigencia_del and c.vigencia_al
       and ((c.lineas = 'TODO'
       and cod_lin like '%')
       or (c.lineas = 'ESTABLECIDO'
         and cod_lin in (
           select cod_linea
             from cominac_concepto_linea
            where cod_concepto = c.cod_concepto
           ))
       or (c.lineas = 'GRUPO'
         and cod_lin in (
           select l.linea
             from cominac_concepto_grupo g
                  join tab_lineas l on g.cod_grupo = l.grupo
            where g.cod_concepto = c.cod_concepto
           ))
       or (c.lineas = 'MEGAGRUPO'
         and cod_lin in (
           select l.linea
             from cominac_concepto_megagrupo g
                  join tab_grupos r on g.cod_megagrupo = r.ind_vta1
                  join tab_lineas l on r.grupo = l.grupo
            where g.cod_concepto = c.cod_concepto
           )))
       and cod_cliente not in (
       select cod_cliente
         from cominac_concepto_excluye_clie
        where cod_concepto = c.cod_concepto
       )
       and not exists (
       select 1
         from cominac_concepto_excluye_doc
        where cod_concepto = c.cod_concepto
          and tipodoc = v.tipodoc
          and serie = v.serie
          and numero = v.numero
       )
     group by v.cod_vende, e.nombre, c.cod_concepto
    )
     , resumen as (
    select cod_vende, nombre, venta_dol, l.cuota_desde as cuota_lograda, l.premio as premio_logrado
         , coalesce(l.siguiente_cuota, d.cuota_desde) as siguiente_cuota
         , r.cuota_1, r.cuota_2, r.cuota_3, r.premio_1, r.premio_2, r.premio_3
      from venta v
           left join vw_cominac_concepto_rango l
                     on v.cod_concepto = l.cod_concepto
                       and v.venta_dol between l.cuota_desde and l.cuota_hasta
           left join vw_cominac_concepto_rango d
                     on v.cod_concepto = d.cod_concepto
                       and d.cod_rango = 1
           left join rangos r on v.cod_concepto = r.cod_concepto
    )
select cod_vende, nombre, venta_dol, cuota_lograda, premio_logrado
     , case siguiente_cuota
         when binary_double_infinity then 'MAXIMO ALCANZADO'
         else trim(to_char(siguiente_cuota, '9999999'))
       end as siguiente_cuota
     , case siguiente_cuota
         when binary_double_infinity then 0
         else round(siguiente_cuota - venta_dol, 2)
       end as faltante_siguiente_cuota
     , cuota_1, cuota_2, cuota_3, premio_1, premio_2, premio_3
  from resumen;

-- seguimiento_bono
select * from vw_seguimiento_bono order by nombre;

select cod_vende, nombre, venta_dol, cuota_lograda, premio_logrado, siguiente_cuota
     , faltante_siguiente_cuota, cuota_1, cuota_2, cuota_3, premio_1, premio_2, premio_3
  from vw_seguimiento_bono
 order by nombre;

-- , coalesce(
--     case l.siguiente_cuota
--       when binary_double_infinity then 'MAXIMO ALCANZADO'
--       else trim(to_char(l.siguiente_cuota, '9999999.99'))
--     end
--   , trim(to_char(d.cuota_desde, '9999999.99'))
--        ) as siguiente_cuota


select cod_concepto, cod_rango, cuota_desde, cuota_hasta, siguiente_cuota, premio
  from vw_cominac_concepto_rango
 where cod_concepto = 431
   and :p_venta between cuota_desde and cuota_hasta
 union
select cod_concepto, cod_rango, cuota_desde, cuota_hasta, siguiente_cuota, premio
  from vw_cominac_concepto_rango
 where cod_concepto = 431
   and cod_rango = 1
   and not exists (
   select 1
     from vw_cominac_concepto_rango
    where cod_concepto = 441
      and :p_venta between cuota_desde and cuota_hasta
   );



select cod_concepto, cod_rango, cuota_desde, cuota_hasta, siguiente_cuota, premio
  from vw_cominac_concepto_rango
 where cod_concepto = 431
   and :p_venta between cuota_desde and cuota_hasta
 union
select cod_concepto, cod_rango, cuota_desde, cuota_hasta, siguiente_cuota, premio
  from vw_cominac_concepto_rango
 where cod_concepto = 431
   and cod_rango = 1
   and not exists (
   select 1
     from vw_cominac_concepto_rango
    where cod_concepto = 431
      and :p_venta between cuota_desde and cuota_hasta
   );


begin
  select id_seguimiento, dsc_seguimiento
    from seguimiento_bono
   where activo = 1
     and rownum = 1;
exception
  when no_data_found then null;
end;

select id_seguimiento, cod_concepto from seguimiento_bono_d;

select dsc_seguimiento, id_seguimiento from seguimiento_bono where activo = 1;

select * from seguimiento_bono;

select * from seguimiento_bono_d;

select *
  from cominac_contrato o
       join cominac_contrato_item i on o.cod_contrato = i.cod_contrato
       join cominac_concepto c on i.cod_concepto = c.cod_concepto
       join vendedores v on o.cod_vendedor = v.cod_vendedor
 where v.supervisor = '01'
   and (c.fecha >= '01/01/2024' or c.vigencia_del >= '01/01/2024')
   and c.cod_tipo = 'BONO';

select sysdate from dual;