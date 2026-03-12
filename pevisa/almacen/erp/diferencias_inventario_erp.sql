create table pevisa.diferencias_inventario_erp (
  fecha          date         not null,
  cod_alm        varchar2(4)  not null,
  cod_art        varchar2(30) not null,
  stock          number(16, 6),
  primer_conteo  number(16, 6),
  segundo_conteo number(16, 6),
  tercer_conteo  number(16, 6),
  diferencia     number(16, 6)
)
  tablespace pevisad;


create unique index pevisa.idx_diferencias_inventario_erp
  on pevisa.diferencias_inventario_erp(fecha, cod_alm, cod_art) tablespace pevisax;


create or replace public synonym diferencias_inventario_erp for pevisa.diferencias_inventario_erp;


alter table pevisa.diferencias_inventario_erp
  add (
    constraint pk_diferencias_inventario_erp
      primary key (fecha, cod_alm, cod_art)
        using index pevisa.idx_diferencias_inventario_erp
        enable validate
    );


grant delete, insert, select, update on pevisa.diferencias_inventario_erp to sig_roles_invitado;


select * from pevisa.diferencias_inventario_erp;

select *
  from diferencias_inventario_erp
 where cod_art = 'BAX C304 0.23-460';


select sum(nvl(stock, 0)) as stock_total
     , sum(nvl(primer_conteo, 0)) as primer_conteo_total
     , sum(nvl(stock, 0)) - sum(nvl(primer_conteo, 0)) as diferencia_total
     , count(*)
  from diferencias_inventario_erp
 where cod_alm = '06';

select cod_art from tmp_carga_data;

select cod_art, count(*)
  from tmp_carga_data
 group by cod_art
having count(*) > 1;

select *
  from diferencias_inventario_erp
 where cod_alm = '06';

-- costo inventario
select d.cod_art, d.stock, d.primer_conteo, d.diferencia, p.costo
     , d.diferencia * p.costo as costo_total
  from diferencias_inventario_erp d
       join pcart_precios p on d.cod_art = p.cod_art and p.cod_costo = '03'
 where d.cod_alm = '06';

select *
  from pcart_precios
 where cod_costo = '03'
   and cod_art = 'NPC 190.720';