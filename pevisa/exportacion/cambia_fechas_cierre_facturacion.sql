-- backup por si se necesita corregir
create table kardex_g_borrar_04032024 as
select *
  from kardex_g g
 where g.fch_transac >= to_date('01/03/2024', 'DD/MM/YYYY');

select * from kardex_g_borrar_04032024;

--     02.05.2022  solo ejecutamos esto:
--     03.06.2022  solo ejecutamos esto: 4473
--     03.07.2022  solo ejecutamos esto:
--     03.08.2022  solo ejecutamos esto:
--     03.09.2022  solo ejecutamos esto:
--     04.10.2022  solo ejecutamos esto: 5337
--     04.11.2022  solo ejecutamos esto: 10268
--     04.12.2022  solo ejecutamos esto: 5992
--     04.01.2023  solo ejecutamos esto: 5999
--     04.03.2023  solo ejecutamos esto:
--     04.04.2023  solo ejecutamos esto: 2822
--     04.05.2023  solo ejecutamos esto: 8302
--     04.06.2023  solo ejecutamos esto: 9019
--     04.07.2023  solo ejecutamos esto: 3825
--     04.08.2023  solo ejecutamos esto: 6464
--     04.09.2023  solo ejecutamos esto: 3131
--     04.10.2023  solo ejecutamos esto: 8168
--     04.11.2023  solo ejecutamos esto: 11696
--     02.12.2023  solo ejecutamos esto: 2489
--     03.02.2024  solo ejecutamos esto: 4314
--     04.03.2024  solo ejecutamos esto: 2474

update kardex_g g
   set fch_transac = to_date('29/02/2024', 'DD/MM/YYYY')
 where g.fch_transac >= to_date('01/03/2024', 'DD/MM/YYYY') ----- primer dia mes extendido
   and g.fch_transac <= to_date('02/03/2024', 'DD/MM/YYYY')
   and g.tp_transac <> '11'
   and g.cod_alm not like 'F%'
   and not exists
   (
     select 1
       from kardex_d d
          , articul a
      where d.cod_alm = g.cod_alm
        and d.tp_transac = g.tp_transac
        and d.serie = g.serie
        and d.numero = g.numero
        and d.cod_art = a.cod_art
        and a.procedencia = 'IQF'
        and d.fch_transac >= to_date('01/03/2024', 'DD/MM/YYYY')
        and d.fch_transac <= to_date('02/03/2024', 'DD/MM/YYYY')
     )
   and f_pr_ot_con_iqf(g.tipo_pguia, g.serie_pguia, g.numero_pguia) = 0
   and not exists
   (
     select 1
       from kardex_d d
          , pcarticul a
      where d.cod_alm = g.cod_alm
        and d.tp_transac = g.tp_transac
        and d.serie = g.serie
        and d.numero = g.numero
        and d.cod_art = a.cod_art
        and a.cta like '25%'
        and d.fch_transac >= to_date('01/03/2024', 'DD/MM/YYYY')
        and d.fch_transac <= to_date('02/03/2024', 'DD/MM/YYYY')
     );


