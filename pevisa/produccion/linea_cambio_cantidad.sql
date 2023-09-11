create table pevisa.linea_cambio_cantidad (
  cod_lin varchar2(4)
)
  tablespace pevisad;


create unique index pevisa.idx_linea_cambio_cantidad
  on pevisa.linea_cambio_cantidad(cod_lin)
  tablespace pevisax;


create or replace public synonym linea_cambio_cantidad for pevisa.linea_cambio_cantidad;


alter table pevisa.linea_cambio_cantidad
  add (
    constraint pk_linea_cambio_cantidad
      primary key (cod_lin)
        using index pevisa.idx_linea_cambio_cantidad
        enable validate
    );


grant delete, insert, select, update on pevisa.linea_cambio_cantidad to sig_roles_invitado;
