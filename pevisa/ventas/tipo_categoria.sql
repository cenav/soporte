create table pevisa.tipo_categoria (
  cod_tipo varchar2(3),
  dsc_tipo varchar2(80) not null
)
  tablespace pevisad;


create unique index pevisa.idx_tipo_categoria
  on pevisa.tipo_categoria(cod_tipo)
  tablespace pevisax;


create or replace public synonym tipo_categoria for pevisa.tipo_categoria;


alter table pevisa.tipo_categoria
  add (
    constraint pk_tipo_categoria
      primary key (cod_tipo)
        using index pevisa.idx_tipo_categoria
        enable validate
    );


grant delete, insert, select, update on pevisa.tipo_categoria to sig_roles_invitado;
