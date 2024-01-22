create table pevisa.categoria (
  cod_tipo      varchar2(3),
  cod_categoria number(3),
  dsc_categoria varchar2(50) not null,
  medida        varchar2(8),
  rango_desde   number(6),
  rango_hasta   number(6)
)
  tablespace pevisad;


create unique index pevisa.idx_categoria
  on pevisa.categoria(cod_tipo, cod_categoria)
  tablespace pevisax;


create or replace public synonym categoria for pevisa.categoria;


alter table pevisa.categoria
  add (
    constraint pk_categoria
      primary key (cod_tipo, cod_categoria)
        using index pevisa.idx_categoria
        enable validate
    , constraint fk_tipo_categoria
      foreign key (cod_tipo)
        references tipo_categoria(cod_tipo)
    );


grant delete, insert, select, update on pevisa.categoria to sig_roles_invitado;
