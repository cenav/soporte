create table pevisa.oc_lineas_peso (
  serie   number(4),
  cod_lin varchar2(8 byte)
)
  tablespace pevisad
  pctused 0
  pctfree 10
  initrans 1
  maxtrans 255
  storage (
  initial
  64K
  next
  1M
  maxsize
  unlimited
  minextents
  1
  maxextents
  unlimited
  pctincrease
  0
  buffer_pool
  default
)
  logging
  nocompress
  nocache
  monitoring;


create unique index pevisa.idx_oc_lineas_peso on pevisa.oc_lineas_peso
  (serie, cod_lin)
  logging
  tablespace pevisax
  pctfree 10
  initrans 2
  maxtrans 255
  storage (
  initial 64K
  next 1M
  maxsize unlimited
  minextents 1
  maxextents unlimited
  pctincrease 0
  buffer_pool default
  );

create or replace public synonym oc_lineas_peso for pevisa.oc_lineas_peso;


alter table pevisa.oc_lineas_peso
  add (
    constraint pk_oc_lineas_peso
      primary key
        (serie, cod_lin)
        using index pevisa.idx_oc_lineas_peso
        enable validate);


grant update on pevisa.oc_lineas_peso to privilegios_actualiza_pvs;

grant delete on pevisa.oc_lineas_peso to privilegios_elimina_pvs;

grant insert on pevisa.oc_lineas_peso to privilegios_inserta_pvs;

grant select on pevisa.oc_lineas_peso to privilegios_lectura_pvs;

