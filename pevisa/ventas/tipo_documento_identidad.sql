drop table tipo_documento_identidad cascade constraints;

create table pevisa.tipo_documento_identidad (
  id_tipo_dociden  number(6),
  dsc_tipo_dociden varchar2(50) not null,
  cod_sunat        varchar2(3),
  dsc_sunat        varchar2(80),
  abreviatura      varchar2(20)
)
  tablespace pevisad;


create unique index pevisa.idx_tipo_documento_identidad
  on pevisa.tipo_documento_identidad(id_tipo_dociden)
  tablespace pevisax;


create or replace public synonym tipo_documento_identidad for pevisa.tipo_documento_identidad;


alter table pevisa.tipo_documento_identidad
  add (
    constraint pk_tipo_documento_identidad
      primary key (id_tipo_dociden)
        using index pevisa.idx_tipo_documento_identidad
        enable validate
    );


grant delete, insert, select, update on pevisa.tipo_documento_identidad to sig_roles_invitado;
