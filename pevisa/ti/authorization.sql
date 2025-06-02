select * from usuarios;

select * from aut_rol;

select * from aut_rol_usuario order by id_rol;

select * from aut_rol_compuesto;

select * from aut_actividad order by id_actividad;

/*
01,Crear
02,Editar
03,Consultar
04,Eliminar
05,Imprimir
06,Procesar
07,Aprobar
08,Cerrar
09,Anular
10,Mostrar historial
18,Cerrar RRHH
19,Anular RRHH
*/
select * from aut_modulo;

select * from aut_menu;

select * from aut_objeto;

select * from aut_campo;

select * from aut_objcam;

select * from aut_objcamval;

select * from aut_permiso;

select *
  from aut_rol_usuario
 where usuario = 'MZONCO';

select *
  from aut_rol_usuario
 where usuario = 'ICATALAN';

select *
  from aut_rol_usuario
 where usuario = 'OLGA';

select *
  from aut_rol_usuario
 where usuario = 'JOSE_GAVELAN';

select *
  from aut_rol_usuario u
       left join aut_rol_compuesto c on u.id_rol = c.id_compuesto
       join aut_permiso p on (p.id_rol = coalesce(c.id_rol, u.id_rol))
 where u.usuario = :p_usuario
   and p.id_objeto = :p_objeto
   and p.id_campo = :p_campo1
   and p.valor = :p_valor1
   and p.contador in (
   select p2.contador
     from aut_rol_usuario u2
          left join aut_rol_compuesto c2 on u2.id_rol = c2.id_compuesto
          join aut_permiso p2 on (p2.id_rol = coalesce(c2.id_rol, u2.id_rol))
    where u2.usuario = u.usuario
      and p2.id_rol = p.id_rol
      and p2.id_objeto = p.id_objeto
      and p2.id_campo = :p_campo2
      and p2.valor = :p_valor2
   );


select *
  from aut_permiso
 where id_objeto = 'RH_PRMSO'
   and id_campo in ('ACTVD', 'CPTO_PRMSO')
   and valor in ('18', 'EGT');


select *
  from aut_permiso
 where id_rol = 'RH_PRMSO_ASOCIAL'
   and id_objeto = 'RH_PRMSO';