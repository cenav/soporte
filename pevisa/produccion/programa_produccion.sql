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


