select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR';

select *
  from pr_trasab_estado
 where tipo = 'PR'
   and extract(year from fecha) = 2024
   and extract(month from fecha) = 6
   and usuario = 'ALBERTO';

-- 3189 registros
select *
  from pr_trasab_estado
 where tipo = 'PR'
   and trunc(fecha) = to_date('29/06/2024', 'dd/mm/yyyy')
   and usuario = 'ALBERTO';

-- BOLING = '180301',
-- ORIGEN = '180301'

select *
  from pr_ot po
 where exists(
   select *
     from pr_trasab_estado pte
    where pte.tipo = po.nuot_tipoot_codigo
      and pte.serie = po.nuot_serie
      and pte.numero = po.numero
      and trunc(pte.fecha) = to_date('29/06/2024', 'dd/mm/yyyy')
      and pte.usuario = 'ALBERTO'
   );


select *
  from pr_ot po
 where po.boling != '240901'
   and exists(
   select *
     from pr_trasab_estado pte
    where pte.tipo = po.nuot_tipoot_codigo
      and pte.serie = po.nuot_serie
      and pte.numero = po.numero
      and trunc(pte.fecha) >= to_date('20/08/2024', 'dd/mm/yyyy')
      and pte.usuario = 'ALBERTO'
   );

select *
  from pr_ot po
 where po.fecha >= to_date('01/07/2024', 'dd/mm/yyyy')
   and po.boling != '240701'
   and po.origen != '240701';

update pr_ot po
   set po.boling = '240901'
     , po.origen = '240901'
 where exists(
   select *
     from pr_trasab_estado pte
    where pte.tipo = po.nuot_tipoot_codigo
      and pte.serie = po.nuot_serie
      and pte.numero = po.numero
      and trunc(pte.fecha) >= to_date('20/08/2024', 'dd/mm/yyyy')
      and pte.usuario = 'ALBERTO'
   );

-- update pr_ot po
--    set po.fecha = to_date('01/07/2024 01:00:00', 'dd/mm/yyyy hh24:mi:ss')
--  where exists(
--    select *
--      from pr_trasab_estado pte
--     where pte.tipo = po.nuot_tipoot_codigo
--       and pte.serie = po.nuot_serie
--       and pte.numero = po.numero
--       and trunc(pte.fecha) = to_date('29/06/2024', 'dd/mm/yyyy')
--       and pte.usuario = 'ALBERTO'
--    );

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero = 570910;

select * from tmp_programa_ordenes_ingresos;

select *
  from pr_programas
--  where estado = 1
order by id_programa desc;

select *
  from pr_ot
 where boling = '240801';

select *
  from pr_ot p
 where p.nuot_tipoot_codigo = 'PR'
   and p.estado = 1
   and rownum = 1
   and get_descripcion_grupo_pieza(p.formu_art_cod_art) like 'ANILLOS';

-- PARA CREAR NUEVO PROGRAMA  PR
-- USANDO UNA ORDEN POR CADA GRUPO
declare
  p_nuevo_programa varchar2(06) := '240901';
  cursor c1 is
    select distinct get_descripcion_grupo_pieza(formu_art_cod_art) as grupo
      from pr_ot
     where nuot_tipoot_codigo = 'PR'
       and get_descripcion_grupo_pieza(formu_art_cod_art) <> 'SAOS'
       and estado = 1
     minus
    select distinct get_descripcion_grupo_pieza(formu_art_cod_art) as grupo
      from pr_ot
     where nuot_tipoot_codigo = 'PR'
       and get_descripcion_grupo_pieza(formu_art_cod_art) <> 'SAOS'
       and boling in ('240901') --  PROGRAMA NUEVO--
       and estado = 1
     order by 1;
begin
  dbms_output.put_line('-----------------------------');
  for rec in c1
  loop
    update pr_ot p
       set boling = p_nuevo_programa
         , origen = p_nuevo_programa
     where p.nuot_tipoot_codigo = 'PR'
       and p.estado = 1
       and rownum = 1
       and get_descripcion_grupo_pieza(p.formu_art_cod_art) like rec.grupo;
    dbms_output.put_line('Actualizados' || sql%rowcount || '  ' || rec.grupo);
  end loop;
  dbms_output.put_line('-----------------------------');
end;