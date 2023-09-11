create table pevisa.desmat_notas (
  cod_art           varchar2(30),
  pieza_laser       varchar2(280),
  importado_demanda varchar2(280),
  alto_consumo      varchar2(280)
)
  tablespace pevisad;


create unique index pevisa.idx_desmat
  on pevisa.desmat_notas(cod_art)
  tablespace pevisax;


create or replace public synonym desmat_notas for pevisa.desmat_notas;


alter table pevisa.desmat_notas
  add (
    constraint pk_desmat
      primary key (cod_art)
        using index pevisa.idx_desmat
        enable validate,
    constraint fk_desmat_codart
      foreign key (cod_art)
        references articul(cod_art)
          on delete cascade
    );


grant delete, insert, select, update on pevisa.desmat_notas to sig_roles_invitado;
