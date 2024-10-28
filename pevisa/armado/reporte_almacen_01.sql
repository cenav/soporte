-- almacen 01 orden de armado
select *
  from numdoc
 where tp_transac = '27'
   and serie = 2;

select *
  from numdoc
 where tp_transac = '16'
   and serie = 2;

select max(numero)
  from kardex_g
 where tp_transac = '16'
   and serie = 2;