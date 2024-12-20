select *
  from evaluacion
 where id_evaluacion in (9579);

select *
  from respuesta
 where id_evaluacion in (9579);

select *
  from evaluacion
 where id_estado != '0';

select * from estado_evaluacion;

select *
  from evaluacion
 where id_evaluado = 'E43086'
 order by fecha desc;

select *
  from evaluacion
 where id_evaluado = 'E43511'
   and fecha = to_date('16/10/2023', 'dd/mm/yyyy');