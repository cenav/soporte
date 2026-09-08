select *
  from kardex_d
 where cod_art = 'BO-N2095 0.8'
 order by fch_transac desc;


-- KT-16-1-217311
select *
  from kardex_d
 where cod_art = 'BO-N2095 0.8'
   and cantidad = 39406
 order by fch_transac desc;


select *
  from kardex_g
 where cod_alm = 'KT'
   and tp_transac = '16'
   and serie = 1
   and numero = 217311;

select *
  from kardex_g
 where num_importa = 'TRANSFERENCIA'
   and glosa like '48-%';


select *
  from kardex_d
 where cod_art = 'BO-N2095 0.8'
   and cod_alm = '48';


select *
  from kardex_d
 where cod_art = 'LTC 500-200-1.6'
   and cod_alm in ('48', 'T3');


select *
  from kardex_g
 where num_importa = 'OSERVADOS';


-- transferencia observados
select d.cod_alm, a.descripcion as dsc_alm, d.tp_transac, t.descripcion as dsc_transac, d.serie
     , d.numero, d.fch_transac, d.ing_sal, d.cod_art, d.cantidad, d.costo_d, d.costo_s
     , d.pr_tipot, d.pr_numot
  from kardex_d d
       join almacenes a on d.cod_alm = a.cod_alm
       join transacciones_almacen t on d.tp_transac = t.tp_transac
 where d.cod_alm = '48'
   and d.tp_transac = '16'
   and d.serie = 1
   and d.numero in (
                    216158, 216159, 216160, 216161, 216162, 216163, 216164, 216165, 216166, 216167,
                    216168, 216296, 216385
   );


select cod_alm, tp_transac, serie, numero from tmp_carga_data;


-- ingresos observados
select cod_alm, dsc_alm, tp_transac, dsc_transac, serie, numero, fch_transac, ing_sal, glosa
     , cod_art, cantidad
  from vw_kardex
 where cod_alm = '48'
   and tp_transac = '16'
   and serie = 1
   and numero in (
                  216158, 216159, 216160, 216161, 216162, 216163, 216164, 216165, 216166, 216167,
                  216168, 216296, 216385
   );


-- salidas transitos
select k.cod_alm, k.dsc_alm, k.tp_transac, k.dsc_transac, k.serie, k.numero, k.fch_transac
     , k.ing_sal, k.glosa, k.cod_art, k.cantidad
  from vw_kardex k
 where exists (
   select 1
     from tmp_carga_data t
    where t.cod_alm = k.cod_alm
      and t.tp_transac = k.tp_transac
      and t.serie = k.serie
      and t.numero = k.numero
   );


select *
  from kardex_g
 where cod_alm = '48'
   and tp_transac = '16'
   and serie = 1
   and numero = 216167;


select *
  from kardex_g
 where cod_alm = 'T3'
   and tp_transac = '27'
   and serie = 1
   and numero = 1726880;


-- salida observados
select k.cod_alm, k.dsc_alm, k.tp_transac, k.dsc_transac, k.serie, k.numero, k.fch_transac
     , k.ing_sal, k.glosa, k.cod_art, k.cantidad
  from vw_kardex k
 where k.cod_alm = '48'
   and k.tp_transac = '16'
   and k.serie = 1
   and k.numero in (1752134, 1752194);


-- ingreso KT
select k.cod_alm, k.dsc_alm, k.tp_transac, k.dsc_transac, k.serie, k.numero, k.fch_transac
     , k.ing_sal, k.glosa, k.cod_art, k.cantidad
  from vw_kardex k
 where k.cod_alm = 'KT'
   and k.tp_transac = '16'
   and k.serie = 1
   and k.numero in (217311, 217328);


select *
  from kardex_g
 where cod_alm = 'KT'
 order by fch_transac;