select *
  from kardex_g g
       join kardex_d d
            on g.cod_alm = d.cod_alm and g.tp_transac = d.tp_transac and g.serie = d.serie and
               g.numero = d.numero
 where g.pr_procedencia = 'SR'
   and g.pr_numped = '110'
   and d.cod_art = 'MAT5 90020';

select *
  from kardex_d
 where extract(year from fch_transac) = 2025
   and extract(month from fch_transac) in (2, 3)
   and cod_art = 'MAT5 90020';


-- transacciones por número de solicitud de reparación
select *
  from kardex_d d
 where exists (
   select *
     from kardex_g g
    where g.pr_procedencia = 'SR'
      and g.pr_numped = '110'
      and g.cod_alm = d.cod_alm
      and g.tp_transac = d.tp_transac
      and g.serie = d.serie
      and g.numero = d.numero
   )
   and d.cod_art = 'MAT5 90020';

select *
  from sol_reparacion
 where sol_tipo = 'SR'
   and sol_numero = 168;

select * from sol_reparacion_estado;

select *
  from sol_reparacion_det
 where sol_tipo = 'SR'
   and sol_numero = 168;

select *
  from sol_reparacion_det
 where sol_tipo = 'SR'
   and sol_numero = 110
   and item = 9;

select *
  from sol_reparacion_det
 where sol_tipo = 'SR'
   and sol_numero = 110
   and cod_herramental = 'MAT4 90020'
   and estado = 8;

-- transacciones por número de orden de reparacion
select *
  from vw_transac_soli_herramental
 where pr_tipot = 'OR'
   and pr_numot = '530';

-- transacciones por orden de reparacion
select *
  from kardex_d
 where pr_tipot = 'OR'
   and pr_numot = '530';

-- orden de reparacion
select *
  from pr_herramental
 where pr_tipo = 'OR'
   and pr_numero in (569);

select *
  from pr_herramental_det
 where pr_tipo = 'OR'
   and pr_numero = 569;

-- orden reparacion
-- 433
-- 489

select *
  from almacen
 where cod_art = 'MAT4 90020';

