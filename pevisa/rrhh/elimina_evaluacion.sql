select *
  from evaluacion
 where id_evaluacion in (7308, 7458, 7457);

select *
  from respuesta
 where id_evaluacion in (7308, 7458, 7457);

select *
  from evaluacion
 where id_estado != '0';

select * from estado_evaluacion;
