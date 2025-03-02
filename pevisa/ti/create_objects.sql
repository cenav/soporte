create table pim_articul (
  cod_art     varchar2(30 byte)  not null,
  descripcion varchar2(100 byte) not null,
  cod_lin     varchar2(4 byte),
  unidad      varchar2(4 byte)   not null,
  cod_upc     varchar2(15 byte),
  estado      varchar2(1 byte)   not null,
  fecha_crea  date          default sysdate,
  pr_imagen   varchar2(1 byte),
  usuario     varchar2(10 byte),
  cod_alm     varchar2(2 byte),
  grupo       number(3),
  peso_std    number(16, 8) default 0
)
;


create unique index pk_pim_articul on pim_articul
  (cod_art)
;

alter table pim_articul
  add (
    constraint pk_pim_articul
      primary key
        (cod_art)
        using index pk_pim_articul
        enable validate);
