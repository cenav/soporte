create table pevisa.wms_ingreso_sol (
  ot_tipo     varchar2(4 byte),
  ot_serie    varchar2(4 byte),
  ot_numero   number(8),
  fecha_sol   date,
  juego       varchar2(30 byte),
  nro_pedido  varchar2(8 byte),
  ref_cliente varchar2(30 byte),
  destino     varchar2(15 byte),
  cant_prog   number(16, 2),
  tot_items   number,
  estado      varchar2(2 byte),
  picker      varchar2(15 byte),
  tk_serie    varchar2(4 byte),
  tk_numero   number(12),
  tk_item     number(4),
  fecha_rec   date,
  fecha_des   date,
  fecha_anu   date,
  oms_tipo    varchar2(4 byte),
  oms_serie   varchar2(4 byte),
  oms_numero  number(12)
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

comment on column pevisa.wms_ingreso_sol.fecha_rec is 'Fecha Recepcion';

comment on column pevisa.wms_ingreso_sol.fecha_des is 'Fecha Despacho';

comment on column pevisa.wms_ingreso_sol.fecha_anu is 'Fecha Anulacion';


create unique index pevisa.pk_wms_ord on pevisa.wms_ingreso_sol
  (tipo, serie, numero, oms_tipo, oms_serie,
   oms_numero)
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

create or replace trigger pevisa.tua_wms_ingreso_sol_estado
  after update of estado
  on pevisa.wms_ingreso_sol
  referencing old as old new as new
  for each row
begin
  if :new.estado = '3' then --- CERRADO---
    update wms_ingreso_sol_item
       set estado = :new.estado
     where tipo = :old.tipo
       and serie = :old.serie
       and numero = :old.numero
       and oms_tipo = :old.oms_tipo
       and oms_serie = :old.oms_serie
       and oms_numero = :old.oms_numero;
  else
    update wms_ingreso_sol_item
       set estado    = :new.estado
         , tk_serie  = :new.tk_serie
         , tk_numero = :new.tk_numero
         , tk_item   = :new.tk_item
     where tipo = :old.tipo
       and serie = :old.serie
       and numero = :old.numero
       and oms_tipo = :old.oms_tipo
       and oms_serie = :old.oms_serie
       and oms_numero = :old.oms_numero;
  end if;
end;
/


create or replace trigger pevisa.tub_wms_ingreso_sol
  before update
  on pevisa.wms_ingreso_sol
  referencing old as old new as new
  for each row
begin
  if :new.tk_numero is null then
    :new.estado := '0';
  end if;
end;
/


create or replace public synonym wms_ingreso_sol for pevisa.wms_ingreso_sol;


alter table pevisa.wms_ingreso_sol
  add (
    constraint pk_wms_ord
      primary key
        (tipo, serie, numero, oms_tipo, oms_serie, oms_numero)
        using index pevisa.pk_wms_ord
        enable validate);

grant update on pevisa.wms_ingreso_sol to privilegios_actualiza_pvs;

grant delete on pevisa.wms_ingreso_sol to privilegios_elimina_pvs;

grant insert on pevisa.wms_ingreso_sol to privilegios_inserta_pvs;

grant select on pevisa.wms_ingreso_sol to privilegios_lectura_pvs;
