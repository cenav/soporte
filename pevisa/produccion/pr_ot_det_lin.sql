create table pevisa.pr_ot_det_lin (
  ot_numero             number(8)    not null,
  ot_nuot_serie         varchar2(4)  not null,
  ot_nuot_tipoot_codigo varchar2(4)  not null,
  art_cod_art           varchar2(30) not null,
  cod_lin               varchar2(4),
  nom_lin               varchar2(80),
  pr_grupo              varchar2(10),
  nom_grupo             varchar2(50),
  id_linea              varchar2(4),
  dsc_linea             varchar2(80),
  id_subgrupo           varchar2(4),
  dsc_subgrupo          varchar2(80),
  id_grupo              varchar2(4),
  dsc_grupo             varchar2(80),
  id_megagrupo          varchar2(4),
  dsc_megagrupo         varchar2(80)
)
  tablespace pevisad;


create unique index pevisa.idx_pr_ot_det_lin
  on pevisa.pr_ot_det_lin(ot_numero, ot_nuot_serie, ot_nuot_tipoot_codigo, art_cod_art)
  tablespace pevisax;


create or replace public synonym pr_ot_det_lin for pevisa.pr_ot_det_lin;


alter table pevisa.pr_ot_det_lin
  add (
    constraint pk_pr_ot_det_lin
      primary key (ot_numero, ot_nuot_serie, ot_nuot_tipoot_codigo, art_cod_art)
        using index pevisa.idx_pr_ot_det_lin
        enable validate,
    constraint fk_pr_ot_det_lin
      foreign key (ot_numero, ot_nuot_serie, ot_nuot_tipoot_codigo, art_cod_art)
        references pr_ot_det(ot_numero, ot_nuot_serie, ot_nuot_tipoot_codigo, art_cod_art)
          on delete cascade
    );


grant delete, insert, select, update on pevisa.pr_ot_det_lin to sig_roles_invitado;
