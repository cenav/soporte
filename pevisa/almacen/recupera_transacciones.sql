select *
  from kardex_g
 where tipo_pguia = 'AR'
   and serie_pguia = 3
--    and numero_pguia in (1037709, 1037763, 1055771, 1052697, 1057410, 1042669)
   and numero_pguia in (1042669)
 order by ing_sal;


select *
  from kardex_g
 where tipo_pguia = 'AR'
   and serie_pguia = 3
   and numero_pguia in (1042669)
 order by ing_sal;


select *
  from kardex_d d
 where exists(
   select *
     from kardex_g g
    where g.cod_alm = d.cod_alm
      and g.tp_transac = d.tp_transac
      and g.serie = d.serie
      and g.numero = d.numero
      and g.tipo_pguia = 'AR'
      and g.serie_pguia = 3
      and g.numero_pguia in (1042669)
   )
 order by ing_sal;

select *
  from relacion
 where tipodoc = 'AR'
   and serie = 3
   and numero = 1042669
   and numero_rel = 686104;

select *
  from kardex_d
 where pr_tipot = 'AR'
   and pr_numot in (1037709, 1037763, 1055771, 1052697, 1057410)
 order by ing_sal;

alter trigger TUA_ALMACEN enable ;

select *
  from kardex_d
 where pr_tipot = 'AR'
   and pr_numot = 1037709
 order by ing_sal;

select *
  from kardex_d
 where pr_tipot = 'AR'
   and pr_numot = 1037763
 order by ing_sal;

select *
  from kardex_d
 where pr_tipot = 'AR'
   and pr_numot = 1055771
 order by ing_sal;

select *
  from kardex_d
 where pr_tipot = 'AR'
   and pr_numot = 1052697
 order by ing_sal;

select *
  from kardex_d
 where pr_tipot = 'AR'
   and pr_numot = 1057410
 order by ing_sal;

select *
  from relacion
 where tipodoc = 'AR'
   and numero = 1057410
   and numero_rel = 897577;

select *
  from relacion
 where tipodoc = 'AR'
   and numero in (
                  1055771,
                  1052697,
                  1037763,
                  1037709
   )
   and numero_rel in (
                      896912,
                      1811533,
                      1525084,
                      895352,
                      1808403,
                      1521726,
                      893344,
                      1805552,
                      1518794,
                      1811056,
                      1524662,
                      896990
   );

/*
revisar stock de códigos
46208SIL
JV 603
BOLSA P1316
BOLSA P1822
BOLSA R-5-N
ETIQ E-40
*/

select *
  from relacion
 where tipodoc = 'AR'
   and serie = 3
   and numero = 1037709;

select *
  from usuarios_almacenes_perfil
 where usuario = 'PEVISA'
   and cod_alm = '03';

-- resumen de códigos recuperados
select distinct cod_art
  from kardex_d
 where pr_tipot = 'AR'
   and pr_numot in (
                    1037709, 1037763, 1055771, 1052697, 1057410
   );

-- resumen de códigos recuperados
select distinct cod_alm, tp_transac, serie, numero
  from kardex_d
 where pr_tipot = 'AR'
   and pr_numot in (
                    1037709, 1037763, 1055771, 1052697, 1057410
   );

-- revisa stock de códigos a ajustar
  with kardex as (
    select d.cod_alm, d.cod_art
         , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
      from kardex_d d
     where d.estado != '9'
       and
       cod_art in ('46208SIL', 'JV 603', 'BOLSA P1316', 'BOLSA P1822', 'BOLSA R-5-N', 'ETIQ E-40')
     group by d.cod_alm, d.cod_art
    )
select a.cod_alm, a.cod_art, a.stock as stock_tabla, nvl(k.stock, 0) as stock_kardex
  from almacen a
       left join kardex k on a.cod_alm = k.cod_alm and a.cod_art = k.cod_art
 where a.cod_art in ('46208SIL', 'JV 603', 'BOLSA P1316', 'BOLSA P1822', 'BOLSA R-5-N', 'ETIQ E-40')
   and a.stock != k.stock;


select d.cod_alm, d.cod_art
     , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
 where d.estado != '9'
   and cod_art in ('46208SIL', 'JV 603', 'BOLSA P1316', 'BOLSA P1822', 'BOLSA R-5-N', 'ETIQ E-40')
 group by d.cod_alm, d.cod_art;

select a.cod_alm, a.cod_art, a.stock
  from almacen a
 where a.cod_art in ('46208SIL', 'JV 603', 'BOLSA P1316', 'BOLSA P1822', 'BOLSA R-5-N', 'ETIQ E-40')
   and a.stock < 0;


-- modelo de orden completa
select *
  from pevisa.pr_ot
 where nuot_tipoot_codigo = 'AR'
   and extract(year from fecha) = 2024
   and extract(month from fecha) = 4
   and estado = 7;

select *
  from kardex_g
 where tip_doc_ref = 'AR'
   and ser_doc_ref = 3
   and nro_doc_ref in (1039371)
 order by fch_transac, ing_sal;

select *
  from kardex_g
 where tipo_pguia = 'AR'
   and serie_pguia = 3
   and numero_pguia in (1039371)
 order by fch_transac, ing_sal;
