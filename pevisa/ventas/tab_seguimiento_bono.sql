create table pevisa.seguimiento_bono (
  id_seguimiento  number(8),
  dsc_seguimiento varchar2(50)        not null,
  activo          number(1) default 1 not null
)
  tablespace pevisad;


create unique index pevisa.idx_seguimiento_bono
  on pevisa.seguimiento_bono(id_seguimiento)
  tablespace pevisax;


create or replace public synonym seguimiento_bono for pevisa.seguimiento_bono;


alter table pevisa.seguimiento_bono
  add (
    constraint pk_seguimiento_bono
      primary key (id_seguimiento)
        using index pevisa.idx_seguimiento_bono
        enable validate,
    constraint chk_seguimiento_bono_activo
      check ( activo in (0, 1) )
    );


grant delete, insert, select, update on pevisa.seguimiento_bono to sig_roles_invitado;
