select *
  from evaluacion
 where id_evaluacion in (9340);

select *
  from respuesta
 where id_evaluacion in (9340);

select *
  from evaluacion
 where id_estado != '0';

select * from estado_evaluacion;

select *
  from evaluacion
 where id_evaluado = 'E42490'
 order by fecha desc;

select *
  from evaluacion
 where id_evaluado = 'E43511'
   and fecha = to_date('16/10/2023', 'dd/mm/yyyy');