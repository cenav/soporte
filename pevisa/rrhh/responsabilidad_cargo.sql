alter table pevisa.responsabilidad_cargo
  drop primary key cascade;

drop table pevisa.responsabilidad_cargo cascade constraints;

create table pevisa.responsabilidad_cargo (
  id_cargo varchar2(6)  not null,
  bono     number(8, 2) not null
)
  tablespace pevisad;


create unique index pevisa.idx_responsabilidad_cargo on pevisa.responsabilidad_cargo(id_cargo)
  tablespace pevisax;

create or replace public synonym responsabilidad_cargo for pevisa.responsabilidad_cargo;


alter table pevisa.responsabilidad_cargo
  add (
    constraint pk_responsabilidad_cargo
      primary key
        (id_cargo)
        using index pevisa.idx_responsabilidad_cargo
        enable validate);

alter table pevisa.responsabilidad_cargo
  add (
    constraint fk_responsabilidad_cargo
      foreign key (id_cargo)
        references planilla10.t_cargo(c_cargo)
    );

grant delete, insert, select, update on pevisa.responsabilidad_cargo to sig_roles_invitado;
