create table pevisa.wms_rec_oms_item (
  rec_tipo    varchar2(4 byte),
  rec_serie   varchar2(4 byte),
  rec_numero  number(12),
  rec_item    number(4),
  bolsa       number(4),
  id_etiqueta varchar2(20),
  cantidad    number(12, 4)
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


create unique index pevisa.idx_wms_rec_oms_item on pevisa.wms_rec_oms_item
  (rec_tipo, rec_serie, rec_numero, bolsa)
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

create unique index pevisa.pk_wms_rec_oms_item on pevisa.wms_rec_oms_item
  (rec_tipo, rec_serie, rec_numero, rec_item)
  logging
  tablespace pevisax
  pctfree 10
  initrans 2
  maxtrans 255
  storage (
  initial 16K
  next 16K
  maxsize unlimited
  minextents 1
  maxextents unlimited
  pctincrease 0
  buffer_pool default
  );


create or replace public synonym wms_rec_oms_item for pevisa.wms_rec_oms_item;


alter table pevisa.wms_rec_oms_item
  add (
    constraint pk_wms_rec_oms_item
      primary key
        (rec_tipo, rec_serie, rec_numero, rec_item)
        using index pevisa.pk_wms_rec_oms_item
        enable validate);


alter table pevisa.wms_rec_oms_item
  add (
    constraint fk_wms_rec_oms_item
      foreign key (rec_tipo, rec_serie, rec_numero)
        references wms_rec_oms(rec_tipo, rec_serie, rec_numero)
          on delete cascade
    );

drop trigger tbi_rec_oms_item;

create or replace trigger tbi_rec_oms_item
  before insert
  on wms_rec_oms_item
  for each row
declare
  l_max_item number;
begin
  if :new.rec_item is null then
    select nvl(max(rec_item), 0)
      into l_max_item
      from wms_rec_oms_item
     where rec_tipo = :new.rec_tipo
       and rec_serie = :new.rec_serie
       and rec_numero = :new.rec_numero
       for update;

    :new.rec_item := l_max_item + 1;
  end if;
end;
