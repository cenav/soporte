select *
  from kardex_g
 where cod_alm = 'SS'
   and tp_transac = '11'
   and serie = 1
   and numero = 29810;

select *
  from kardex_d
 where cod_alm = 'SS'
   and tp_transac = '11'
   and serie = 1
   and numero = 29810;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero = 9788;

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