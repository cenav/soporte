select *
  from almacenes
 where cod_alm in ('71', 'K0');

select *
  from almacenes
 where descripcion like '%MERMA%';

select min(fecha)
  from docuvent
 where serie like 'X%';


-- MARGEN BRUTO REAL


select *
  from exclientes
 where nombre like '%AUTOZONE%';


select *
  from expedidos
 where cod_cliente = '990937';


select *
  from exfacturas
 where cod_cliente = '996057'
   and extract(year from fecha) = 2026;


select *
  from docuvent
 where cod_cliente = '00000996057'
   and extract(year from fecha) = 2026;


select *
  from docuvent
 where tipodoc = '07'
   and serie = 'F056'
   and numero = 7692;


select *
  from docuvent
 where tip_doc_ref = '01'
   and ser_doc_ref = 'F055'
   and nro_doc_ref = '23080';


select *
  from docuvent
 where tipodoc = '01'
   and serie = 'F055'
   and numero = 23080;


-- costo 03 --> costo contable
select get_costos('',) from dual;


select *
  from pcart_precios
 where cod_costo = '03';


select *
  from pcart_precios_hist
 where cod_costo = '03'
   and ano = 2025;


select * from exfactura_d;


create table exfacturas (
  numero      number(8) not null,
  fecha       date,
  estado      varchar2(2),
  cod_cliente varchar2(12),
  nombre      varchar2(60),
  constraint pk_exfacturas
    primary key (numero)
);


create table exfactura_d (
  numero  number(8) not null,
  nro     number(4) not null,
  cod_art varchar2(30),
  canti   number(12, 2),
  preuni  number(12, 3),
  totlin  number(12, 2),
  constraint pk_exfactura_d
    primary key (numero, nro),
  constraint fk_exfactura_d_exfacturas
    foreign key (numero)
      references exfacturas(numero)
);


create table docuvent (
  tipodoc     varchar2(2) not null,
  serie       varchar2(4) not null,
  numero      number(8)   not null,
  fecha       date,
  cod_cliente varchar2(15),
  imp_neto    number(14, 2) default 0,
  tip_doc_ref varchar2(4),
  ser_doc_ref varchar2(4),
  nro_doc_ref varchar2(20),
  constraint pk_docuvent
    primary key (tipodoc, serie, numero),
  constraint fk_docuvent_exfacturas
    foreign key (nro_doc_ref)
      references exfacturas(numero)
);
