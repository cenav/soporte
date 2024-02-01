create table pevisa.color (
  id_color   varchar2(2),
  nom_color  varchar2(50) not null,
  colorindex number(3)
)
  tablespace pevisad;


create unique index pevisa.idx_color
  on pevisa.color(id_color)
  tablespace pevisax;


create or replace public synonym color for pevisa.color;


alter table pevisa.color
  add (
    constraint pk_color
      primary key (id_color)
        using index pevisa.idx_color
        enable validate
    );


grant delete, insert, select, update on pevisa.color to sig_roles_invitado;
