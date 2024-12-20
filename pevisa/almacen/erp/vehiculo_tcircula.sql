drop table vehiculo_tcircula cascade constraints;

create table pevisa.vehiculo_tcircula (
  cod_activo_fijo varchar2(30),
  id_item         number(6),
  nro_documento   varchar2(50) not null,
  fch_emision     date         not null,
  fch_vencimiento date         not null,
  adjunto         varchar2(80)
)
  tablespace pevisad;


create unique index pevisa.idx_vehiculo_tcircula
  on pevisa.vehiculo_tcircula(cod_activo_fijo, id_item)
  tablespace pevisax;


create or replace public synonym vehiculo_tcircula for pevisa.vehiculo_tcircula;


alter table pevisa.vehiculo_tcircula
  add (
    constraint pk_vehiculo_tcircula
      primary key (cod_activo_fijo, id_item)
        using index pevisa.idx_vehiculo_tcircula
        enable validate,
    constraint fk_vehiculo_tcircula
      foreign key (cod_activo_fijo)
        references vehiculo(cod_activo_fijo)
    );


grant delete, insert, select, update on pevisa.vehiculo_tcircula to sig_roles_invitado;
