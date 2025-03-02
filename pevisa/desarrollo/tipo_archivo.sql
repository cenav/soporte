alter table pevisa.tipo_archivo
  drop primary key cascade;

drop table tipo_archivo cascade constraints;

create table pevisa.tipo_archivo (
  id_tipo_archivo  number(3),
  dsc_tipo_archivo varchar2(80) not null
)
  tablespace pevisad;


create unique index pevisa.idx_tipo_archivo
  on pevisa.tipo_archivo(id_tipo_archivo)
  tablespace pevisax;


create or replace public synonym tipo_archivo for pevisa.tipo_archivo;


alter table pevisa.tipo_archivo
  add (
    constraint pk_tipo_archivo
      primary key (id_tipo_archivo)
        using index pevisa.idx_tipo_archivo
        enable validate
    );


grant delete, insert, select, update on pevisa.tipo_archivo to sig_roles_invitado;
