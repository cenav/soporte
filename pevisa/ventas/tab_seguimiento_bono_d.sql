create table pevisa.seguimiento_bono_d (
  id_seguimiento number(8),
  cod_concepto   number(6)
)
  tablespace pevisad;


create unique index pevisa.idx_seguimiento_bono_d
  on pevisa.seguimiento_bono_d(id_seguimiento, cod_concepto)
  tablespace pevisax;


create or replace public synonym seguimiento_bono_d for pevisa.seguimiento_bono_d;


alter table pevisa.seguimiento_bono_d
  add (
    constraint pk_seguimiento_bono_d
      primary key (id_seguimiento, cod_concepto)
        using index pevisa.idx_seguimiento_bono_d
        enable validate
    , constraint fk_seguimiento_bono_d
      foreign key (id_seguimiento)
        references seguimiento_bono(id_seguimiento)
          on delete cascade
    );


grant delete, insert, select, update on pevisa.seguimiento_bono_d to sig_roles_invitado;
