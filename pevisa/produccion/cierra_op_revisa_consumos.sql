select cant_prog, cant_ingresado, cant_merma, cant_resul
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero in (
                  545237, 507689, 549341, 537457, 571639, 571640, 507105, 502477, 555283, 524362,
                  530474, 549241, 524532, 530191, 514985, 492470, 570824, 554767, 561635, 567591,
                  569731, 554149, 458808, 571616, 556431, 556284, 551526, 537498, 545026, 524017,
                  510002, 506015, 583021, 570670, 544606, 559695, 545228, 544988, 567525, 556318,
                  535419, 545822, 523794, 506032, 576258, 544387, 558446, 571261, 551326, 529758,
                  530045, 572282, 572368, 580909, 524465, 510781, 579414, 570682, 574141, 567532,
                  530815, 522998, 578100, 544452, 533283, 547345, 537212, 526296, 501028, 575072,
                  525210, 561993, 581222, 581224, 575800, 534242, 505743, 570848, 552093, 551916,
                  563194, 556317, 551070, 535418, 523060, 524038, 581853, 582570, 554730, 562085,
                  574832, 527513, 420385, 486529
   )
   and (cant_prog != cant_ingresado or cant_prog != cant_resul);

select cant_prog, cant_ingresado, cant_merma, cant_resul
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero in (
                  545237, 507689, 549341, 537457, 571639, 571640, 507105, 502477, 555283, 524362,
                  530474, 549241, 524532, 530191, 514985, 492470, 570824, 554767, 561635, 567591,
                  569731, 554149, 458808, 571616, 556431, 556284, 551526, 537498, 545026, 524017,
                  510002, 506015, 583021, 570670, 544606, 559695, 545228, 544988, 567525, 556318,
                  535419, 545822, 523794, 506032, 576258, 544387, 558446, 571261, 551326, 529758,
                  530045, 572282, 572368, 580909, 524465, 510781, 579414, 570682, 574141, 567532,
                  530815, 522998, 578100, 544452, 533283, 547345, 537212, 526296, 501028, 575072,
                  525210, 561993, 581222, 581224, 575800, 534242, 505743, 570848, 552093, 551916,
                  563194, 556317, 551070, 535418, 523060, 524038, 581853, 582570, 554730, 562085,
                  574832, 527513, 420385, 486529
   );

-- revisa ingreso produccion
select o.numero, d.cod_art, o.cant_ingresado as cant_ing_op, sum(d.cantidad) as cant_ing_kardex
  from pr_ot o
       join kardex_g g
            on o.nuot_tipoot_codigo = g.tipo_pguia
              and o.nuot_serie = g.serie_pguia
              and o.numero = g.numero_pguia
       join kardex_d d
            on g.cod_alm = d.cod_alm
              and g.tp_transac = d.tp_transac
              and g.serie = d.serie
              and g.numero = d.numero
 where o.nuot_tipoot_codigo = 'PR'
   and o.nuot_serie = '8'
   and o.numero in (
                    545237, 507689, 549341, 537457, 571639, 571640, 507105, 502477, 555283,
                    524362, 530474, 549241, 524532, 530191, 514985, 492470, 570824, 554767,
                    561635, 567591, 569731, 554149, 458808, 571616, 556431, 556284, 551526,
                    537498, 545026, 524017, 510002, 506015, 583021, 570670, 544606, 559695,
                    545228, 544988, 567525, 556318, 535419, 545822, 523794, 506032, 576258,
                    544387, 558446, 571261, 551326, 529758, 530045, 572282, 572368, 580909,
                    524465, 510781, 579414, 570682, 574141, 567532, 530815, 522998, 578100,
                    544452, 533283, 547345, 537212, 526296, 501028, 575072, 525210, 561993,
                    581222, 581224, 575800, 534242, 505743, 570848, 552093, 551916, 563194,
                    556317, 551070, 535418, 523060, 524038, 581853, 582570, 554730, 562085,
                    574832, 527513, 420385, 486529
   )
   and g.tp_transac = '18'
having o.cant_ingresado != sum(d.cantidad)
 group by d.cod_art, o.cant_ingresado, o.numero;


-- revisa salida produccion
  with orden as (
    select *
      from pr_ot o
     where o.nuot_tipoot_codigo = 'PR'
       and o.nuot_serie = '8'
       and o.numero in (
                        545237, 507689, 549341, 537457, 571639, 571640, 507105, 502477, 555283,
                        524362, 530474, 549241, 524532, 530191, 514985, 492470, 570824, 554767,
                        561635, 567591, 569731, 554149, 458808, 571616, 556431, 556284, 551526,
                        537498, 545026, 524017, 510002, 506015, 583021, 570670, 544606, 559695,
                        545228, 544988, 567525, 556318, 535419, 545822, 523794, 506032, 576258,
                        544387, 558446, 571261, 551326, 529758, 530045, 572282, 572368, 580909,
                        524465, 510781, 579414, 570682, 574141, 567532, 530815, 522998, 578100,
                        544452, 533283, 547345, 537212, 526296, 501028, 575072, 525210, 561993,
                        581222, 581224, 575800, 534242, 505743, 570848, 552093, 551916, 563194,
                        556317, 551070, 535418, 523060, 524038, 581853, 582570, 554730, 562085,
                        574832, 527513, 420385, 486529
       )
    )
     , consumos as (
    select o.nuot_tipoot_codigo, o.nuot_serie, o.numero, d.cod_art
         , sum(d.cantidad) as cant_ing_kardex
      from orden o
           join kardex_g g
                on o.nuot_tipoot_codigo = g.tipo_pguia
                  and o.nuot_serie = g.serie_pguia
                  and o.numero = g.numero_pguia
           join kardex_d d
                on g.cod_alm = d.cod_alm
                  and g.tp_transac = d.tp_transac
                  and g.serie = d.serie
                  and g.numero = d.numero
                  and g.tp_transac = '29'
     group by d.cod_art, o.nuot_tipoot_codigo, o.nuot_serie, o.numero
    )
     , analiza as (
    select o.numero, o.cant_prog, o.cant_ingresado, e.art_cod_art
         , e.cant_formula, nvl(c.cant_ing_kardex, 0) as cant_ing_kardex
         , round(abs(e.cant_formula - nvl(c.cant_ing_kardex, 0)) /
                 ((e.cant_formula + nvl(c.cant_ing_kardex, 0)) / 2)
                   * 100, 2) as desviacion
      from orden o
           join pr_ot_det e
                on o.nuot_tipoot_codigo = e.ot_nuot_tipoot_codigo
                  and o.nuot_serie = e.ot_nuot_serie
                  and o.numero = e.ot_numero
           left join consumos c
                     on e.ot_nuot_tipoot_codigo = c.nuot_tipoot_codigo
                       and e.ot_nuot_serie = c.nuot_serie
                       and e.ot_numero = c.numero
                       and e.art_cod_art = c.cod_art
    )
-- select a.numero, a.cant_prog, a.cant_ingresado, a.art_cod_art, a.cant_formula, a.cant_ing_kardex
select a.numero, a.art_cod_art, a.cant_formula, a.cant_ing_kardex as cant_ingreso_produccion
     , a.desviacion
  from analiza a
--  where a.desviacion >= 5
 order by desviacion desc;

