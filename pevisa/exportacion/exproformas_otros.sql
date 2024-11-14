create table pevisa.exproformas_otros (
  numero         number(8),
  fch_colocacion date not null,
  fch_despacho   date,
  fch_llegada    date
)
  tablespace pevisad;


create unique index pevisa.idx_exproformas_otros
  on pevisa.exproformas_otros(numero)
  tablespace pevisax;


create or replace public synonym exproformas_otros for pevisa.exproformas_otros;


alter table pevisa.exproformas_otros
  add (
    constraint pk_exproformas_otros
      primary key (numero)
        using index pevisa.idx_exproformas_otros
        enable validate,
    constraint fk_exproformas_otros
      foreign key (numero)
        references exproformas(numero)
          on delete cascade
    );


grant delete, insert, select, update on pevisa.exproformas_otros to sig_roles_invitado;
