begin
  pkg_analisis_consumo.procesa(2023, 07);
end;

select *
  from analisis_consumo
 where ano = 2024
   and mes = 4;

select *
  from logger_logs
 order by id desc;


-- PR 8 503540 BO 2.0GR-200
select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero = 513172;

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 513172;

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 513172
   and art_cod_art = 'BO 1.4TG-165';

-- l_cant_ing_prod_fecha ==> formula original

select nvl(sum(d.cantidad), 0)
  from kardex_d d
 where d.tp_transac in ('22', '29') -- transacciones de consumos
   and d.estado != '9'
   and d.pr_tipot = 'PR'
   and d.pr_numot = 460989
   and d.cod_art = '180.653NY';


select sum(kxd.cantidad)
  from kardex_g kx
       join kardex_d kxd
            on (kx.cod_alm = kxd.cod_alm
              and kx.tp_transac = kxd.tp_transac
              and kx.serie = kxd.serie
              and kx.numero = kxd.numero)
 where kx.tipo_pguia = 'PR'
   and kx.serie_pguia = 8
   and kx.numero_pguia = 460989
   and kx.tp_transac = '18'
   and kx.estado != '9'
   and to_number(to_char(kx.fch_transac, 'yyyymm')) <= :p_ano * 100 + :p_mes;


select ot.nuot_tipoot_codigo as tipo_ot
     , ot.nuot_serie as serie_ot
     , ot.numero as numero_ot
     , ot.estado
     , ot.formu_art_cod_art
     , ot.cod_lin as linea_formula
     , ot.fecha
     , ot.fecha_cierre
     , nvl(ot.cant_prog, 0) as cant_prog
     , nvl(ot.cant_ingresado, 0) as cant_ingresado
     , nvl(ot.cant_merma, 0) as cant_merma
     , case ot.lote when 0 then 1 else ot.lote end as lote
     , sum(kxd.cantidad) as cant_ing_prod_mes
     , otd.art_cod_art
     , otd.cod_lin
  from pr_ot ot
       join pr_ot_det otd
            on (ot.numero = otd.ot_numero
              and ot.nuot_serie = otd.ot_nuot_serie
              and ot.nuot_tipoot_codigo = otd.ot_nuot_tipoot_codigo)
       join kardex_g kx
            on (ot.nuot_tipoot_codigo = kx.tipo_pguia
              and ot.nuot_serie = kx.serie_pguia
              and ot.numero = kx.numero_pguia)
       join kardex_d kxd
            on (kx.cod_alm = kxd.cod_alm
              and kx.tp_transac = kxd.tp_transac
              and kx.serie = kxd.serie
              and kx.numero = kxd.numero)
 where nvl(ot.estado, '0') < '9'
   and nvl(otd.estado, '0') != '9'
   and ot.nuot_tipoot_codigo in ('PR', 'AR', 'VA')
   and kx.tp_transac = '18'
   and nvl(kx.estado, '0') != '9'
   and extract(year from kx.fch_transac) = 2023
   and extract(month from kx.fch_transac) = 6
   and ot.numero in (
   465601
   )
--    and otd.art_cod_art in ('180.653NY')
 group by extract(year from kx.fch_transac), extract(month from kx.fch_transac)
        , ot.nuot_tipoot_codigo, ot.nuot_serie
        , ot.numero, ot.estado, ot.formu_art_cod_art, ot.cod_lin
        , ot.fecha, ot.fecha_cierre, ot.cant_prog, ot.cant_ingresado
        , ot.cant_merma, otd.art_cod_art, otd.cod_lin, otd.rendimiento
        , otd.cant_formula, ot.lote
 order by ot.nuot_tipoot_codigo, ot.numero;

select * from serie_caja_usuario;

select * from serie_caja order by id_serie;

select *
  from planilla10.personal
 where apellido_paterno = 'GARCIA';

select *
  from planilla10.personal
 where c_codigo = 'E943';

select * from serie_caja_usuario order by id_serie;

select *
  from articul
 where cod_art = 'BOLSA P1822';

select nvl(sum(d.cantidad), 0)
  from kardex_d d
 where d.tp_transac in ('22', '29') -- transacciones de consumos
   and d.estado != '9'
   and d.pr_tipot = 'PR'
   and d.pr_numot = 449806
   and d.cod_art = 'BOLSA P1822'
   and extract(year from d.fch_transac) = 2023
   and extract(month from d.fch_transac) = 6;

select *
  from kardex_d
 where extract(year from fch_transac) = 2024
   and extract(month from fch_transac) = 4
   and tp_transac = '24'
   and cantidad = 0;
