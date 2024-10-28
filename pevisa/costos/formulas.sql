select *
  from pevisa.pcformulas
 where cod_art = 'SA 450.928-6V';

select *
  from articul
 where cod_art = 'SA 450.928-6V';

select *
  from articul
 where cod_art = '450.928RVIT'
   and indicador = 'IP';

select *
  from tab_lineas
 where linea = '932';

select count(*)
  from pcformulas f
       join articul a on f.cod_for = a.cod_art
 where f.cod_art = 'SA 450.928-6V'
   and a.indicador like 'I%';
