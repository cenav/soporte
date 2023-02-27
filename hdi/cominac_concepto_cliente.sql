create table pevisa.cominac_concepto_cliente (
  cod_concepto number(6)   not null,
  cod_cliente  varchar(15) not null
)
  tablespace pevisad;


create unique index pevisa.idx_cominac_concepto_cliente
  on pevisa.cominac_concepto_cliente(cod_concepto, cod_cliente)
  tablespace pevisax;


create or replace public synonym cominac_concepto_cliente for pevisa.cominac_concepto_cliente;


alter table pevisa.cominac_concepto_cliente
  add (
    constraint pk_cominac_concepto_cliente
      primary key (cod_concepto, cod_cliente)
        using index pevisa.idx_cominac_concepto_cliente
        enable validate
    );


grant delete, insert, select, update on pevisa.cominac_concepto_cliente to sig_roles_invitado;
