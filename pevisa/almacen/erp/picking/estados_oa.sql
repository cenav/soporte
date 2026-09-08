select * from pr_estados order by orden;

select * from areas;

/* otras tablas de areas
select * from area order by cod_area;
select * from pr_area;
select * from activo_fijo_area;
*/

alter table pr_estados
  modify orden not null;

select *
  from user_objects
 where object_name = 'AREAS';


select *
  from evaluacion
 where id_evaluacion = 12707;

select *
  from pr_usualma
 where usuario = 'JMEJIA'
   and cod_alm = '03';