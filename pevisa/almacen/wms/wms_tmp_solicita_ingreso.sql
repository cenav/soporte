drop table pevisa.tmp_solicita_ingreso_wms cascade constraints;

create global temporary table pevisa.tmp_solicita_ingreso_wms (
  ot_tipo     varchar2(4 byte),
  ot_serie    varchar2(4 byte),
  ot_numero   number(8),
  bolsa       number(6),
  id_etiqueta varchar2(20),
  cod_art     varchar2(30 byte),
  cantidad    number(14, 4)
)
  on commit preserve rows
  nocache;

create unique index pevisa.pk_tmp_solicita_ingreso_wms on pevisa.tmp_solicita_ingreso_wms
  (ot_tipo, ot_serie, ot_numero, bolsa);

alter table pevisa.tmp_solicita_ingreso_wms
  add (
    constraint pk_tmp_solicita_ingreso_wms
      primary key (ot_tipo, ot_serie, ot_numero, bolsa)
        using index pevisa.pk_tmp_solicita_ingreso_wms
        enable validate);

create or replace public synonym tmp_solicita_ingreso_wms for pevisa.tmp_solicita_ingreso_wms;
