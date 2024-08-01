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

-- USUARIOS, PERFILES Y PERMISOS

/*
0  -- no tiene botones
1  -- agrega
3  -- agregar y modificar
5  -- agrega y elimina
8  -- listado
9  -- agregar y listado
11 -- agrega, modifica y listado
15 -- es todos los botones
*/

select * from perfil;

select * from menu;

select * from perfildet; --columna permiso guarda el valor del boton

select * from usuario; --columna enlace es idperfil

select *
  from perfil
 where idperfil = 243;

select *
  from perfildet
 where idmenu = 3110;

select * from menu;

select *
  from menu
 where lower(dsc_menu) like '%categoria%';

select *
  from menu
 where lower(dsc_menu) like '%plantilla de horarios%';

select *
  from menu
 where lower(dsc_menu) like '%asignaciones%';
