select *
  from kardex_g
 where cod_alm = '91'
   and tp_transac = '16'
   and serie = 1
   and numero = 193762;

select *
  from kardex_d
 where cod_alm = '42'
   and tp_transac = '18'
   and serie = 2
   and numero = 520585;

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