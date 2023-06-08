create table pevisa.cuenta_asiento_auto (
  id          number(8),
  descripcion varchar2(80) not null,
  cta_sol     varchar2(15) not null,
  cta_dol     varchar2(15) not null,
  tipo        number(3)
)
  tablespace pevisad;


create unique index pevisa.idx_cuenta_asiento_auto
  on pevisa.cuenta_asiento_auto(id)
  tablespace pevisax;


create or replace public synonym cuenta_asiento_auto for pevisa.cuenta_asiento_auto;


alter table pevisa.cuenta_asiento_auto
  add (
    constraint pk_cuenta_asiento_auto
      primary key (id)
        using index pevisa.idx_cuenta_asiento_auto
        enable validate
    );


grant delete, insert, select, update on pevisa.cuenta_asiento_auto to sig_roles_invitado;
