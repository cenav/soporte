select a.cod_art
     , a.cod_lin
     , pf.secuencia
     , pf.codigo_proceso
  from pr_forsec pf
     , articul a
 where a.cod_art = pf.cod_art(+)
   and pf.codigo_proceso is null
---GRUPOS QUE ESTAN EN PROGRAMA PRODUCCION DELIMITANDO.
   and g_grupo_pieza_new(a.cod_art) in
       ('G006', 'G007', 'G001', 'G002', 'G003', 'G004', 'G005', 'G008', 'G011', 'G012', 'G013',
        'G014', 'G016', 'G017', 'G053'
         --'G018', SAOS
         )
 group by a.cod_art, a.cod_lin, pf.secuencia, pf.codigo_proceso;

select a.cod_art
     , a.cod_lin
     , pf.secuencia
     , pf.codigo_proceso
  from pr_forsec pf
     , articul a
 where a.cod_art = pf.cod_art(+)
   and pf.codigo_proceso is null
---GRUPOS QUE ESTAN EN PROGRAMA PRODUCCION DELIMITANDO.
   and g_grupo_pieza_new(a.cod_art) in
       ('G006', 'G007', 'G001', 'G002', 'G003', 'G004', 'G005', 'G008', 'G011', 'G012', 'G013',
        'G014', 'G016', 'G017', 'G053')
 group by a.cod_art, a.cod_lin, pf.secuencia, pf.codigo_proceso;


select a.cod_art, a.cod_lin, pf.secuencia, pf.codigo_proceso, va.consumo_anual, va.frecuencia_meses
  from articul a
       left join vw_articulo_consumo va on a.cod_art = va.cod_art
       left join pr_forsec pf on a.cod_art = pf.cod_art
 where g_grupo_pieza_new(a.cod_art) in
       ('G006', 'G007', 'G001', 'G002', 'G003', 'G004', 'G008', 'G011', 'G012', 'G013',
        'G014', 'G016', 'G017')
   and pf.codigo_proceso is null
 order by va.consumo_anual desc nulls last;


-- codigos sin procesos nuevos grupos
  with grupos as (
    select g.id_grupo, g.dsc_grupo, l.id_linea
      from prod_grupo g
           join prod_grupo_subgrupo_rel s on g.id_grupo = s.id_grupo
           join prod_subgrupo_linea_rel l on s.id_subgrupo = l.id_subgrupo
    )
select g.dsc_grupo, a.cod_art, a.cod_lin, pf.secuencia, pf.codigo_proceso, va.consumo_anual
     , va.frecuencia_meses
  from articul a
       left join vw_articulo_consumo va on a.cod_art = va.cod_art
       left join grupos g on a.cod_lin = g.id_linea
       left join pr_forsec pf on a.cod_art = pf.cod_art
 where g_grupo_pieza_new(a.cod_art) in
       ('G006', 'G007', 'G001', 'G002', 'G003', 'G004', 'G008', 'G011', 'G012', 'G013',
        'G014', 'G016', 'G017')
   and pf.codigo_proceso is null
--    and a.cod_art = 'RIB 80045C'
 group by a.cod_art, a.cod_lin, pf.secuencia, pf.codigo_proceso, va.consumo_anual
        , va.frecuencia_meses, g.dsc_grupo
 order by va.consumo_anual desc nulls last;

select g_grupo_pieza_new('CL-O 200.4198CS-1') from dual;

select g.id_grupo, g.dsc_grupo
  from prod_grupo g
       join prod_grupo_subgrupo_rel s on g.id_grupo = s.id_grupo
       join prod_subgrupo_linea_rel l on s.id_subgrupo = l.id_subgrupo
 where l.id_linea = '1628';

select *
  from prod_grupo_subgrupo_rel
 where id_grupo = 'G053';

select *
  from prod_subgrupo_linea_rel
 where id_subgrupo = 'S080';

-- RIB 80045C

select *
  from pr_forsec
 where cod_art = 'DUR 230.330';

select *
  from articul
 where cod_art = 'DUR 230.330';

-- Grupos de códigos que tienen que tener procesos
select *
  from prod_grupo
 where id_grupo in (
                    'G001', 'G002', 'G003', 'G004', 'G006', 'G007', 'G008', 'G011', 'G012',
                    'G013', 'G014', 'G016', 'G017'
   )
 order by id_grupo;

select g_grupo_pieza_new('FOR3801N') from dual;

-- codigos sin procesos antiguos grupos
select g.dsc_grupo, a.cod_art, a.cod_lin, pf.secuencia, pf.codigo_proceso, va.consumo_anual
     , va.frecuencia_meses
  from articul a
       left join vw_articulo_consumo va on a.cod_art = va.cod_art
       left join vw_articulo_grupo g on a.cod_art = g.cod_art
       left join pr_forsec pf on a.cod_art = pf.cod_art
 where g.id_grupo in
       ('01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '12', '27', '28')
   and pf.codigo_proceso is null
--    and a.cod_art = 'RIB 80045C'
 group by a.cod_art, a.cod_lin, pf.secuencia, pf.codigo_proceso, va.consumo_anual
        , va.frecuencia_meses, g.dsc_grupo
 order by va.consumo_anual desc nulls last;

select * from vw_articulo_grupo;

select *
  from pr_grupos
 where id in ('01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '12', '27', '28')
 order by id;