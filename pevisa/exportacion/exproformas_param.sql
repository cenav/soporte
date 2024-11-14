create table pevisa.exproformas_param (
  id            number(1),
  dias_despacho number(3) not null,
  dias_llegada  number(3) not null
)
  tablespace pevisad;


create unique index pevisa.idx_exproformas_param
  on pevisa.exproformas_param(id)
  tablespace pevisax;


create or replace public synonym exproformas_param for pevisa.exproformas_param;


alter table pevisa.exproformas_param
  add (
    constraint pk_exproformas_param
      primary key (id)
        using index pevisa.idx_exproformas_param
        enable validate,
    constraint chk_exproformas_id
      check (id in (1))
        enable validate
    );

grant delete, insert, select, update on pevisa.exproformas_param to sig_roles_invitado;
