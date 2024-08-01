drop table roles cascade constraints;

create table pevisa.roles (
  id_rol  number(8),
  dsc_rol varchar2(50) not null,
  c_cargo varchar2(6),
  estado  number(1) default 1 not null
)
  tablespace pevisad;


create unique index pevisa.idx_roles
  on pevisa.roles(id_rol)
  tablespace pevisax;


create or replace public synonym roles for pevisa.roles;


alter table pevisa.roles
  add (
    constraint pk_roles
      primary key (id_rol)
        using index pevisa.idx_roles
        enable validate,
    constraint chk_estado_rol
      check ( estado in (0, 1) )
    );


grant delete, insert, select, update on pevisa.roles to sig_roles_invitado;
