select *
  from cambdol
 where fecha = to_date('01/12/2022', 'dd/mm/yyyy');

select *
  from cambdol
 where fecha = to_date('31/12/2022', 'dd/mm/yyyy');

select *
  from pcart_precios_hist
 where cod_art = 'LT265/65R17 RT05'
   and ano = 2022
   and mes = 12
   and cod_costo = '03';

select *
  from pcart_precios_hist
 where ano = 2023
   and mes = 01
   and cod_costo = '03';

select f_stock_al('LT265/65R17 RT05', '%', to_date('31/01/2023', 'dd/mm/yyyy')) from dual;

select f_stock_al('LT265/65R17 RT05', '%', to_date('31/12/2022', 'dd/mm/yyyy')) from dual;


create or replace view vw_costo_ventas as
  with cambio_linea as (
    select cod_art, fecha, usuario, ip, glosa, campo, antiguo, nuevo
         , row_number() over (partition by cod_art order by fecha desc) as rn
      from pcarticul_historia
     where campo = 'LINEA'
       and antiguo != 'ZZ'
     order by cod_art, fecha desc
    )
     , linea_anterior as (
    select p.ano, p.mes, p.cod_art
         , f_stock_al(p.cod_art, '%', datefmt.year_month_to_first_day(p.ano, p.mes)) as stock_ini
         , f_stock_al(p.cod_art, '%', datefmt.year_month_to_last_day(p.ano, p.mes)) as stock_fin
         , p.costo * sf_cambio_dolar(datefmt.year_month_to_last_day(p.ano, p.mes), 'V') as costo_sol
         , p.costo as costo_dol
         , case a.cod_lin when 'ZZ' then c.antiguo else a.cod_lin end as linea
         , a.cod_lin as linea_actual
         , c.antiguo as linea_anterior
      from pcart_precios_hist p
           join articul a on p.cod_art = a.cod_art
           left join cambio_linea c on p.cod_art = c.cod_art and rn = 1
     where p.cod_costo = '03'
    )
select a.ano, a.mes, a.cod_art, a.stock_ini, a.stock_fin, a.costo_sol, a.costo_dol, a.linea
     , a.linea_actual, a.linea_anterior, g.grupo
     , g.descripcion as dsc_grupo, s.cod_grupo_venta as supergrupo
     , s.descripcion as dsc_supergrupo
  from linea_anterior a
       left join tab_lineas l on a.linea = l.linea
       left join tab_grupos g on l.grupo = g.grupo
       left join grupo_venta s on g.ind_vta1 = s.cod_grupo_venta;

select ano, mes, cod_art, stock_ini, stock_fin, costo_sol, costo_dol, linea, linea_actual
     , linea_anterior, grupo, dsc_grupo, supergrupo, dsc_supergrupo
  from vw_costo_ventas
 where ano = 2023
   and mes = 1;

select :p_ano, :p_mes, to_date('20238', 'yyyymm') as first_day
  from dual;

select datefmt.year_month_to_first_day(2023, 8) as first
     , datefmt.year_month_to_last_day(2023, 8) as last
  from dual;

select nombre, mes
  from tab_meses
 where mes != 0
 order by mes;

select descripcion, cod_grupo_venta from grupo_venta order by cod_grupo_venta;

select *
  from articul
 where cod_art = '235/65R17H RA33';

select f_stock_al('235/65R17H RA33', '%', datefmt.year_month_to_first_day(2023, 3)) as stock_ini
  from dual;

select *
  from tab_lineas
 where linea = 'ZZ';

select cod_art, fecha, usuario, ip, glosa, campo, antiguo, nuevo
     , row_number() over (partition by cod_art order by fecha desc) as rn
  from pcarticul_historia
 where cod_art in ('235/65R17H RA33', '235/45ZR20W XL K117A', '195R14 RA08')
   and campo = 'LINEA'
   and antiguo != 'ZZ'
 order by cod_art, fecha desc;
