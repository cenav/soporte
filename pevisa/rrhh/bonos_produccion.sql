select *
  from proceso_puntualidad
 order by fecha desc;

select *
  from proceso_puntualidad_pers
 where id_personal = 'E43229';

select * from pcarticul;

select *
  from pcarticul
 where division is not null;

select *
  from pcarticul
 where sub_clase is not null;
