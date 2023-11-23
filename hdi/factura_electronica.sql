select *
  from exfacturas_enviados
 where serie = 'F051'
   and numero = '3299';

select *
  from docuvent
 where tipodoc = '07'
   and numero = 40343;


select *
  from itemdocu
 where tipodoc = '07'
   and numero = 40343;

select *
  from factcob
 where tipdoc = '07'
   and numero = '40343';

-- NC08

select *
  from kardex_g
 where cod_alm = 'F0'
   and tp_transac = '14'
   and serie = 10
   and numero = 18898;

select *
  from kardex_d
 where cod_alm = 'F0'
   and tp_transac = '14'
   and serie = 10
   and numero = 18898;


select *
  from docuvent
 where tipodoc = '07'
   and numero = 40355;
