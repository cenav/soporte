select *
  from movfide_situacion_banco
 where p_ano = 2025
   and p_mes = 6
   and cta_cte_banco = '191-0676860-0-68';

select *
  from movfide_situacion_banco
 where p_ano = 2025
   and p_mes = 6;

select *
  from movfide
 where ano = 2025
   and mes = 6
   and tipo = '2'
   and voucher = 63333;

select *
  from movfide
 where ano_concil = 2025
   and mes_concil = 6
   and tipo = '2'
   and voucher = 63333;

select *
  from movfide
 where ano_concil = 2025
   and mes_concil = 6
   and tipo = '2';


select *
  from movfide
 where ano_concil = 2025
   and mes_concil = 6
   and tipo = '2'
   and estado_banco = 'P';