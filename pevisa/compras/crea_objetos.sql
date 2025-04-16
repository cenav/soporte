--cabecera
create table pevisa.certificados_locales (
  id_registro       number,
  cod_local         varchar2(3 byte),
  cod_certificado   varchar2(50 byte),
  fecha_emision     date,
  fecha_vencimiento date,
  archivo           varchar2(500 byte),
  estado            varchar2(50 byte) default '0',
  guardado_por      varchar2(30 byte),
  guardado_donde    varchar2(50 byte),
  guardado_cuando   date
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


create unique index pevisa.pk_certificados_locales on pevisa.certificados_locales
  (id_registro, cod_local, cod_certificado)
  logging
  tablespace pevisax
  pctfree 10
  initrans 2
  maxtrans 255
  storage (
  initial 2M
  next 1M
  maxsize unlimited
  minextents 1
  maxextents unlimited
  pctincrease 0
  buffer_pool default
  );

create or replace trigger pevisa.tbi_certificados_locales
  before insert
  on pevisa.certificados_locales
  referencing old as old new as new
  for each row
declare
  ultimo number;
begin
  select nvl(max(id_registro), 0) + 1
    into ultimo
    from certificados_locales
   where cod_local = :new.cod_local
     and cod_certificado = :new.cod_certificado;
  :new.id_registro := ultimo;
end tbi_certificados_locales;
/


create or replace public synonym certificados_locales for pevisa.certificados_locales;


alter table pevisa.certificados_locales
  add (
    constraint pk_certificados_locales
      primary key
        (id_registro, cod_local, cod_certificado)
        using index pevisa.pk_certificados_locales
        enable validate);

--detalle
create table pevisa.requisitos_certi_locales (
  id_registro     number,
  cod_local       varchar2(10 byte),
  cod_certificado varchar2(50 byte),
  cod_requisito   number,
  fecha_emision   date,
  archivo         varchar2(500 byte),
  guardado_por    varchar2(30 byte),
  guardado_donde  varchar2(50 byte),
  guardado_cuando date,
  estado          varchar2(50 byte) default '0'
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


create unique index pevisa.pk_requisitos_certi_locales on pevisa.requisitos_certi_locales
  (id_registro, cod_local, cod_certificado, cod_requisito)
  logging
  tablespace pevisax
  pctfree 10
  initrans 2
  maxtrans 255
  storage (
  initial 2M
  next 1M
  maxsize unlimited
  minextents 1
  maxextents unlimited
  pctincrease 0
  buffer_pool default
  );

create or replace public synonym requisitos_certi_locales for pevisa.requisitos_certi_locales;


alter table pevisa.requisitos_certi_locales
  add (
    constraint pk_requisitos_certi_locales
      primary key
        (id_registro, cod_local, cod_certificado, cod_requisito)
        using index pevisa.pk_requisitos_certi_locales
        enable validate);


--


create table pevisa.certificados_locales_estado (
  estado      varchar2(10 byte),
  descripcion varchar2(500 byte)
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


create or replace public synonym certificados_locales_estado for pevisa.certificados_locales_estado;


--

create table pevisa.certificados (
  cod_certificado varchar2(50 byte),
  nombre          varchar2(200 byte),
  descripcion     varchar2(400 byte),
  estado          varchar2(30 byte) default '0'
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


create unique index pevisa.pk_certificados on pevisa.certificados
  (cod_certificado)
  logging
  tablespace pevisax
  pctfree 10
  initrans 2
  maxtrans 255
  storage (
  initial 2M
  next 1M
  maxsize unlimited
  minextents 1
  maxextents unlimited
  pctincrease 0
  buffer_pool default
  );

create or replace public synonym certificados for pevisa.certificados;


alter table pevisa.certificados
  add (
    constraint pk_certificados
      primary key
        (cod_certificado)
        using index pevisa.pk_certificados
        enable validate);


---
create table pevisa.requisitos (
  cod_certificado varchar2(50 byte),
  cod_requisito   number,
  nombre          varchar2(1000 byte),
  descripcion     varchar2(4000 byte),
  usuario         varchar2(250 byte),
  estado          varchar2(30 byte) default '0'
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


create unique index pevisa.pk_requisitos on pevisa.requisitos
  (cod_certificado, cod_requisito)
  logging
  tablespace pevisax
  pctfree 10
  initrans 2
  maxtrans 255
  storage (
  initial 2M
  next 1M
  maxsize unlimited
  minextents 1
  maxextents unlimited
  pctincrease 0
  buffer_pool default
  );

create or replace trigger pevisa.tbi_requisitos
  before insert
  on pevisa.requisitos
  referencing old as old new as new
  for each row
declare
  ultimo number;
begin
  select nvl(max(cod_requisito), 0) + 1
    into ultimo
    from requisitos
   where cod_certificado = :new.cod_certificado;
  :new.cod_requisito := ultimo;
end tbi_requisitos;
/


create or replace public synonym requisitos for pevisa.requisitos;


alter table pevisa.requisitos
  add (
    constraint pk_requisitos
      primary key
        (cod_certificado, cod_requisito)
        using index pevisa.pk_requisitos
        enable validate);
