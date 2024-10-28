create table pevisa.rol_concepto_permiso (
  id_rol      number(8),
  id_concepto varchar(3),
  id_permiso  number(8)
)
  tablespace pevisad;


create unique index pevisa.idx_rol_concepto_permiso
  on pevisa.rol_concepto_permiso(id_rol, id_concepto, id_permiso)
  tablespace pevisax;


create or replace public synonym rol_concepto_permiso for pevisa.rol_concepto_permiso;

alter table pevisa.rol_concepto_permiso
  add (
    constraint pk_rol_concepto_permiso
      primary key (id_rol, id_concepto, id_permiso)
        using index pevisa.idx_rol_concepto_permiso
        enable validate,
    constraint pk_rol_concepto_permiso_1
      foreign key (id_rol)
        references roles(id_rol),
    constraint pk_rol_concepto_permiso_2
      foreign key (id_concepto)
        references concepto_permiso(id_concepto),
    constraint pk_rol_concepto_permiso_3
      foreign key (id_permiso)
        references permisos(id_permiso)
    );


grant delete, insert, select, update on pevisa.rol_concepto_permiso to sig_roles_invitado;
