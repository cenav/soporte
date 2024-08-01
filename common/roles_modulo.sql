create table pevisa.roles_modulo (
  id_rol     number(8),
  id_modulo  varchar2(30),
  id_permiso number(8)
)
  tablespace pevisad;


create unique index pevisa.idx_roles_modulo
  on pevisa.roles_modulo(id_rol, id_modulo, id_permiso)
  tablespace pevisax;


create or replace public synonym roles_modulo for pevisa.roles_modulo;


alter table pevisa.roles_modulo
  add (
    constraint pk_roles_modulo
      primary key (id_rol, id_modulo, id_permiso)
        using index pevisa.idx_roles_modulo
        enable validate,
    constraint fk_rolesmodulo_rol
      foreign key (id_rol)
        references roles(id_rol),
    constraint fk_rolesmodulo_modulo
      foreign key (id_modulo)
        references modulo(id_modulo),
    constraint fk_rolesmodulo_permiso
      foreign key (id_permiso)
        references permisos(id_permiso)
    );


grant delete, insert, select, update on pevisa.roles_modulo to sig_roles_invitado;
