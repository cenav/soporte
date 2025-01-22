select * from paramlg;

select *
  from orden_matriceria
 where serie = 2;

select *
  from itemmatri
 where serie = 2;

select *
  from permiso
 where id_concepto = 'CSE'
 order by numero desc;