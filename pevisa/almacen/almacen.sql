select *
  from kardex_g
 where cod_alm = '91'
   and tp_transac = '16'
   and serie = 1
   and numero = 193762;

select *
  from kardex_d
 where cod_alm = '03'
   and tp_transac = '28'
   and serie = 1
   and numero = 719;

-- descarga almacen de transito
select *
  from kardex_g
 where cod_alm = 'D3'
   and tp_transac = '35'
   and serie = 39
   and numero = 2323
   and estado <= 7
   and tp_transac = '10'
   and ing_sal = 'I'
--    and cod_relacion = '20100084768' and nro_sucur in ('04', '05', '06', '11', '03')
   and cod_alm in (
   select cod_alm_transito
     from almacenes
    where cod_alm_transito is not null
      and cod_alm_transito = kardex_g.cod_alm
   );

select *
  from kardex_d
 where cod_alm = 'D5'
   and tp_transac = '18'
   and serie = 2
   and numero = 520707;

select *
  from kardex_g_movglos
 where cod_alm = 'SS'
   and tp_transac = '11'
   and serie = 1
   and numero = 29807;

select *
  from almacenes
 where cod_alm = 'D3';


select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero = 178279;

select *
  from instrumento_asigna
 where id_instrumento = 16;

select *
  from movglos
 where ano = 2022
   and mes = 11
   and libro = '39'
   and voucher = 11004;

-- 2022 11 39 110004
-- 2022 12 39 120004

select cod_art
     , sum(case ing_sal when 'I' then cantidad when 'S' then cantidad * -1 else 0 end) as total
  from kardex_d
 where cod_art = 'SLIM380.1092SIL'
 group by cod_art;

select *
  from pr_for_ins
 where formu_art_cod_art = '95037/22TG';

select *
  from solimat_g
 where numero = 181100;

select *
  from solimat_d
 where numero = 181100;

select *
  from kardex_g
 where num_importa = 'SM 1 179926';

select *
  from kardex_d d
 where exists(
   select *
     from kardex_g g
    where d.cod_alm = g.cod_alm
      and d.tp_transac = g.tp_transac
      and d.serie = g.serie
      and d.numero = g.numero
      and g.num_importa = 'SM 1 179922'
   );

select *
  from kardex_g
 where cod_alm = 'A1'
   and tp_transac = '22'
   and serie = 1
   and numero = 249660;

select *
  from kardex_d
 where cod_art = 'PARALELA 850X70X30MM 40-45HRC';

select *
  from transacciones_almacen
 where tp_transac = '22';