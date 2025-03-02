alter table pevisa.articul_archivos
  drop primary key cascade;

drop table articul_archivos cascade constraints;

create table pevisa.articul_archivos (
  cod_art         varchar2(30),
  id_tipo_archivo number(3)     not null,
  ruta_archivo    varchar2(250) not null
)
  tablespace pevisad;


create unique index pevisa.idx_articul_archivos
  on pevisa.articul_archivos(cod_art, id_tipo_archivo)
  tablespace pevisax;


create or replace public synonym articul_archivos for pevisa.articul_archivos;


alter table pevisa.articul_archivos
  add (
    constraint pk_articul_archivos
      primary key (cod_art, id_tipo_archivo)
        using index pevisa.idx_articul_archivos
        enable validate,
    constraint fk_articul_archivos
      foreign key (id_tipo_archivo)
        references tipo_archivo(id_tipo_archivo)
    );


grant delete, insert, select, update on pevisa.articul_archivos to sig_roles_invitado;
