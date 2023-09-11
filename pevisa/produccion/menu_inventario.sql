drop table menu_inventario cascade constraints;

create table pevisa.menu_inventario (
  id_menu  varchar2(2),
  nom_menu varchar2(30)
)
  tablespace pevisad;


create unique index pevisa.idx_menu_inventario
  on pevisa.menu_inventario(id_menu)
  tablespace pevisax;


create or replace public synonym menu_inventario for pevisa.menu_inventario;


alter table pevisa.menu_inventario
  add (
    constraint pk_menu_inventario
      primary key (id_menu)
        using index pevisa.idx_menu_inventario
        enable validate
    );


grant delete, insert, select, update on pevisa.menu_inventario to sig_roles_invitado;
