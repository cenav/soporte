select *
  from almacenes
 where descripcion like '%OBSERVADOS%';

select *
  from transacciones_almacen
 where flg_transferencia = 1;


select d.cod_alm, d.cod_art
     , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
 where d.estado <> '9'
--    and d.cod_art = :p_articulo
   and d.cod_alm = '63'
--    and trunc(d.fch_transac) <= to_date('10/05/2026', 'dd/mm/yyyy')
--    and d.cod_art in (
--                      '0619-008120-16 TG', '114003-FS WO/H', '8.97066.196.0 MLS 1.60',
--                      '04111-37091 WO/H'
--    )
having sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) > 0
 group by d.cod_alm, d.cod_art;


select *
  from almacenes
 where es_stock = 1;

select * from transacciones_almacen;

select *
  from almacenes
 where cod_alm = 'RV';

select *
  from log_auditoria
 where tabla = 'PROVEED'
   and accion = 'UPDATE';

select *
  from caja_chica_serie
 order by id_serie;

select *
  from expedidos
 order by numero desc;

select vw.*, (
  select max(fch_transac) as ult_fch_ingreso
    from kardex_d
   where cod_alm = vw.almacen
     and kardex_d.cod_art = vw.cod_art
     and estado <> '9'
     and ing_sal = 'I'
  ) as ultimo_ingreso
  from vw_stock_almacenes_transito vw
 where vw.almacen in ('TD', 'TE', 'TF', 'TG')
--    and vw.cod_art in (
--                       'TMM-200.3366SR', 'TM-200.1565-1-2', 'P.CAV.INF-M-400.096-1L/144-REP',
--                       'TM-300.713', 'TM-200.1568-4-1', 'TM-PL95118-1NA', 'MAT1 PL 95300-1ZN',
--                       'MOLD 300.075-1L/1-CM-1', 'MAT4 80205CS-1-RP/1-1'
--    )
 order by vw.almacen, vw.stock desc;

select cod_alm, descripcion, cod_art, stock from tmp_carga_data;

-- para no perder los codigos con stock luego de hacer la salida
insert into tmp_carga_data(cod_alm, descripcion, cod_art, stock)
select vw.almacen, vw.descripcion, vw.cod_art, vw.stock
  from vw_stock_almacenes_transito vw
 where vw.almacen in ('F8')
   and vw.cod_art in (
                      'CHATARRA LAF', 'CH 93008 MLS', 'FS 70062 MLS', 'FS 93003 GR', 'FS 80125 GR'
   )
 order by vw.almacen, vw.stock desc;

--LT	LIMPIEZA EN TRANSITO	CAJA SERV 059X24X25-P	618
--TQ	TRANSITO DESCARTES DQ	ESP 919	3.3

select vw.almacen, vw.descripcion, vw.cod_art, vw.stock
  from vw_stock_almacenes_transito vw
--  where vw.almacen not in ('F8', 'FR')
 order by vw.almacen, vw.stock desc;

select d.cod_alm, d.cod_art
     , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
 where d.estado <> '9'
   and d.cod_alm = '48'
having sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) > 0
--    and trunc(d.fch_transac) <= to_date('31/08/2024', 'dd/mm/yyyy')
 group by d.cod_alm, d.cod_art;


-- version 1
  with stock_cierre_ant as (
    select d.cod_alm, d.cod_art
         , sum(decode(d.ing_sal, 'S', d.cantidad * -1, d.cantidad)) as stock_ant
      from kardex_d d
     where d.estado <> '9'
       and d.cod_alm = '48'
       and trunc(d.fch_transac) <= to_date('30/04/2026', 'dd/mm/yyyy')
       and d.cod_art not in (
                             '04111-37091 WO/H', '0619-008120-16 TG', '114003-FS WO/H',
                             '8.97066.196.0 MLS 1.60'
       )
     group by d.cod_alm, d.cod_art
    having sum(decode(d.ing_sal, 'S', d.cantidad * -1, d.cantidad)) > 0
    )
     , stock_actual as (
    select d.cod_alm, d.cod_art
         , sum(decode(d.ing_sal, 'S', d.cantidad * -1, d.cantidad)) as stock_act
      from kardex_d d
     where d.estado <> '9'
       and d.cod_alm = '48'
       and trunc(d.fch_transac) <= trunc(sysdate)
       and d.cod_art not in (
                             '04111-37091 WO/H', '0619-008120-16 TG', '114003-FS WO/H',
                             '8.97066.196.0 MLS 1.60'
       )
     group by d.cod_alm, d.cod_art
    having sum(decode(d.ing_sal, 'S', d.cantidad * -1, d.cantidad)) > 0
    )
select count(a.cod_art) as codigos_mes_anterior
     , count(b.cod_art) as codigos_actuales
     , count(a.cod_art) - count(b.cod_art) as codigos_regularizados
     , round(((count(a.cod_art) - count(b.cod_art)) / nullif(count(a.cod_art), 0)) * 100,
             2) as porcentaje_avance
  from stock_cierre_ant a
       full outer join stock_actual b
                       on b.cod_alm = a.cod_alm
                         and b.cod_art = a.cod_art;


-- version 2 (queda)
  with stock_cierre_ant as (
    select d.cod_alm, d.cod_art
         , sum(decode(d.ing_sal, 'S', d.cantidad * -1, d.cantidad)) as stock_ant
      from kardex_d d
     where d.estado <> '9'
       and d.cod_alm = '48'
       and trunc(d.fch_transac) <= last_day(add_months(trunc(sysdate), -1))
       and d.cod_art not in (
                             '04111-37091 WO/H', '0619-008120-16 TG', '114003-FS WO/H',
                             '8.97066.196.0 MLS 1.60'
       )
     group by d.cod_alm, d.cod_art
    having sum(decode(d.ing_sal, 'S', d.cantidad * -1, d.cantidad)) > 0
    )
     , stock_actual as (
    select d.cod_alm, d.cod_art
         , sum(decode(d.ing_sal, 'S', d.cantidad * -1, d.cantidad)) as stock_act
      from kardex_d d
     where d.estado <> '9'
       and d.cod_alm = '48'
       and trunc(d.fch_transac) <= trunc(sysdate)
       and d.cod_art not in (
                             '04111-37091 WO/H', '0619-008120-16 TG', '114003-FS WO/H',
                             '8.97066.196.0 MLS 1.60'
       )
     group by d.cod_alm, d.cod_art
    having sum(decode(d.ing_sal, 'S', d.cantidad * -1, d.cantidad)) > 0
    )
select count(a.cod_art) as codigos_mes_anterior
     , count(b.cod_art) as codigos_actuales
     , case
         when count(a.cod_art) = 0 then 0
         when count(a.cod_art) - count(b.cod_art) < 0 then 0
         else count(a.cod_art) - count(b.cod_art)
       end as codigos_regularizados
     , case
         when count(a.cod_art) = 0 then 0
         else round(
             (
               case
                 when count(a.cod_art) - count(b.cod_art) < 0 then 0
                 else count(a.cod_art) - count(b.cod_art)
               end / count(a.cod_art)
               ) * 100,
             2
              )
       end as porcentaje_avance
  from stock_cierre_ant a
       full outer join stock_actual b
                       on b.cod_alm = a.cod_alm
                         and b.cod_art = a.cod_art;

-- detalle por artículo
  with stock_cierre_ant as (
    select d.cod_alm, d.cod_art
         , sum(decode(d.ing_sal, 'S', d.cantidad * -1, d.cantidad)) as stock_ant
      from kardex_d d
     where d.estado <> '9'
       and d.cod_alm = '48'
       and trunc(d.fch_transac) <= last_day(add_months(trunc(sysdate), -1))
       and d.cod_art not in (
                             '04111-37091 WO/H', '0619-008120-16 TG', '114003-FS WO/H',
                             '8.97066.196.0 MLS 1.60'
       )
     group by d.cod_alm, d.cod_art
    having sum(decode(d.ing_sal, 'S', d.cantidad * -1, d.cantidad)) > 0
    )
     , stock_actual as (
    select d.cod_alm, d.cod_art
         , sum(decode(d.ing_sal, 'S', d.cantidad * -1, d.cantidad)) as stock_act
      from kardex_d d
     where d.estado <> '9'
       and d.cod_alm = '48'
       and trunc(d.fch_transac) <= trunc(sysdate)
       and d.cod_art not in (
                             '04111-37091 WO/H', '0619-008120-16 TG', '114003-FS WO/H',
                             '8.97066.196.0 MLS 1.60'
       )
     group by d.cod_alm, d.cod_art
    having sum(decode(d.ing_sal, 'S', d.cantidad * -1, d.cantidad)) > 0
    )
select nvl(a.cod_alm, b.cod_alm) as cod_alm, nvl(a.cod_art, b.cod_art) as cod_art
     , nvl(a.stock_ant, 0) as stock_mes_anterior
     , nvl(b.stock_act, 0) as stock_actual
     , case
         when a.cod_art is not null and b.cod_art is null
           then 'REGULARIZADO'
         when a.cod_art is not null and b.cod_art is not null
           then 'PENDIENTE'
         when a.cod_art is null and b.cod_art is not null
           then 'NUEVO OBSERVADO'
       end as estado_avance
  from stock_cierre_ant a
       full outer join stock_actual b
                       on b.cod_alm = a.cod_alm
                         and b.cod_art = a.cod_art
 order by estado_avance, cod_art;


select *
  from kardex_g
 where cod_alm = '48'
   and fch_transac >= to_date('10/05/2026', 'dd/mm/yyyy');


select *
  from kardex_d
 where cod_alm = '48'
   and fch_transac >= to_date('10/05/2026', 'dd/mm/yyyy')
   and pr_referencia in ('M1', 'M2', 'M3', 'M4');


select *
  from kardex_d
 where cod_alm = 'T6'
   and tp_transac = '27'
   and serie = 1
   and numero = 1726875;

-- MAT1 3304US SB

select *
  from kardex_d
 where cod_alm = '48'
   and tp_transac = '16'
   and serie = 1
   and numero = 216157;

select *
  from kardex_g g
       join kardex_d d
            on g.cod_alm = d.cod_alm and g.tp_transac = d.tp_transac and g.serie = d.serie and
               g.numero = d.numero
 where g.cod_alm = '48'
   and g.fch_transac >= to_date('10/05/2026', 'dd/mm/yyyy')
   and d.pr_referencia = 'TD';

begin
  reporte_almacen_observados.envia_correo();
end;

select *
  from almacenes
 where cod_alm = 'B1';

select *
  from kardex_d
 where fch_transac >= to_date('15/05/2026', 'dd/mm/yyyy')
   and cod_alm in ('M1', 'M2', 'M3', 'M4');


select *
  from almacenes
 where cod_alm in ('M1', 'M2', 'M3', 'M4');

select *
  from kardex_d
 where cod_alm = '48'
   and pr_referencia in ('TD', 'TE', 'TF', 'TG')
   and fch_transac >= to_date('10/05/2026', 'dd/mm/yyyy');

select *
  from kardex_d
 where cod_alm = '48'
   and cod_art in (
   'MAT1 RIBX 85202'
   );

select *
  from articul
 where cod_art = 'MAT1 RIBX 85202';

select *
  from caja_chica_serie
 order by id_serie;

select *
  from kardex_d
 where cod_alm = '48'
   and tp_transac = '16'
   and serie = 1
   and numero = 216296;

select *
  from kardex_d
 where cod_alm = '48'
   and tp_transac = '16'
   and serie = 1
   and numero = 216296
   and cod_art in (
                   'MAT4 80205CS-1-RP/1-1', 'TM-200.1568-4-1', 'MAT1 PL 95300-1ZN'
   );

select *
  from kardex_d
 where cod_alm = 'TG'
   and tp_transac = '27'
   and serie = 1
   and numero = 1728554
   and cod_art in (
                   'MAT4 80205CS-1-RP/1-1', 'TM-200.1568-4-1', 'MAT1 PL 95300-1ZN'
   );

select *
  from kardex_d
 where cod_alm = '48'
   and tp_transac = '16'
   and serie = 1
   and numero = 216256;

select *
  from kardex_g
 where cod_alm = 'TE'
   and tp_transac = '27'
   and serie = 1
   and numero = 1728031;

select *
  from kardex_d
 where cod_alm = 'TE'
   and tp_transac = '27'
   and serie = 1
   and numero = 1728031;


select *
  from kardex_g_historia
 where cod_alm = '48'
   and tp_transac = '16'
   and serie = 1
   and numero = 216256;

select *
  from kardex_d
 where cod_art = 'LAF 2.0-1219-2438GZ'
 order by fch_transac desc;

select *
  from almacenes
 where cod_alm = '72';

select *
  from transacciones_almacen
 where tp_transac in ('16', '27', '10', '35');

select *
  from kardex_g_historia
 where cod_alm = '72'
   and tp_transac = '27'
   and serie = 1
   and numero = 1726879;

select *
  from kardex_g_historia
 where cod_alm = '48'
   and tp_transac = '16'
   and serie = 1
   and numero = 216166;
