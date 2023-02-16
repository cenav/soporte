create table pevisa.nroafijo (
  cod_activo_fijo varchar2(40 byte) not null,
  cod_tipo        varchar2(30 byte) not null,
  numero          number(8)
)
  tablespace pevisad;


create unique index pevisa.idx_nroafijo on pevisa.nroafijo
  (cod_activo_fijo, cod_tipo)
  tablespace pevisax;

create or replace public synonym nroafijo for pevisa.nroafijo;


alter table pevisa.nroafijo
  add (
    constraint pk_nroafijo
      primary key
        (cod_activo_fijo, cod_tipo)
        using index pevisa.idx_nroafijo
        enable validate);

alter table pevisa.nroafijo
  add (
    constraint fk_nroafijo_cuenta
      foreign key (cod_activo_fijo)
        references pevisa.activo_fijo(cod_activo_fijo)
          on delete cascade
          enable validate
    );

grant delete, insert, select, update on pevisa.nroafijo to sig_roles_invitado;
