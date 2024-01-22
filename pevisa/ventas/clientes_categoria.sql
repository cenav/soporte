drop table clientes_categoria cascade constraints;

create table pevisa.clientes_categoria (
  cod_cliente   varchar2(15),
  cod_tipo      varchar2(3),
  cod_categoria number(3) not null
)
  tablespace pevisad;


create unique index pevisa.idx_clientes_categoria
  on pevisa.clientes_categoria(cod_cliente, cod_tipo)
  tablespace pevisax;


create or replace public synonym clientes_categoria for pevisa.clientes_categoria;


alter table pevisa.clientes_categoria
  add (
    constraint pk_clientes_categoria
      primary key (cod_cliente, cod_tipo)
        using index pevisa.idx_clientes_categoria
        enable validate,
    constraint fk_clientes_categoria
      foreign key (cod_cliente)
        references clientes(cod_cliente)
          on delete cascade,
    constraint fk_clientes_tipo_categoria
      foreign key (cod_tipo, cod_categoria)
        references categoria(cod_tipo, cod_categoria)
    );

grant delete, insert, select, update on pevisa.clientes_categoria to sig_roles_invitado;
