select *
  from movfigl
 where ano = 2023
   and mes = 2
   and tipo = '2'
   and voucher = 23233;


select *
  from movfide
 where ano = 2023
   and mes = 2
   and tipo = '2'
   and voucher = 23233;

select *
  from factpag
 where tipdoc = '26'
   and serie_num = '008'
   and numero = '3484117';


select *
  from cabfpag
 where tipdoc = '26'
   and serie_num = '008'
   and numero = '3484117';

select * from ot_mantto where id_tipo = 'EQ' and id_serie = 2 and id_numero = 3;

select * from pevisa.tab_semanas order by al;