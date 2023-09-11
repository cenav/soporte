-- sq_justificacion

select sq_justificacion.nextval from dual;

select sq_justificacion.currval from dual;

grant select on asistencia.sq_justificacion to pevisa;

create or replace public synonym sq_justificacion for pevisa.sq_justificacion;

select owner, object_type, object_name
  from all_objects
 where object_name = 'SQ_JUSTIFICACION';

select *
  from justificacion
 where idjustificacion = 442557;