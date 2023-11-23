select *
  from kardex_g
 where num_importa like 'BSERVL009-%';

select *
  from kardex_d
 where cod_alm = '15'
   and tp_transac = '11'
   and serie = 2
   and numero = 7056;

select *
  from kardex_g_movglos
 where cod_alm = '15'
   and tp_transac = '11'
   and serie = 2
   and numero = 7056;

select *
  from caja_chica_d
 where alm_transac = '03'
   and tpo_transac = '11'
   and ser_transac = 2
   and nro_transac = 6794;

select *
  from tmp_moviart_dos
 where voucher = '100509';

select *
  from analisis_consumo
 where ano = 2023
   and mes = 1;

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
   and extract(month from kx.fch_transac) = 5
   and ot.numero in (
   513172
   )
--    and otd.art_cod_art in ('CAR 404')
 group by extract(year from kx.fch_transac), extract(month from kx.fch_transac)
        , ot.nuot_tipoot_codigo, ot.nuot_serie
        , ot.numero, ot.estado, ot.formu_art_cod_art, ot.cod_lin
        , ot.fecha, ot.fecha_cierre, ot.cant_prog, ot.cant_ingresado
        , ot.cant_merma, otd.art_cod_art, otd.cod_lin, otd.rendimiento
        , otd.cant_formula, ot.lote
 order by ot.nuot_tipoot_codigo, ot.numero;

select *
  from analisis_consumo
 where ano = 2023
   and mes = 5;

select count(*)
  from analisis_consumo
 where ano = 2023
   and mes = 2;

-- cantidad 0 error proceso victor
select *
  from kardex_d
 where extract(year from fch_transac) = 2023
   and extract(month from fch_transac) = 10
   and cantidad = 0;

begin
  pkg_analisis_consumo.procesa(2023, 5);
end;

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
   and extract(month from kx.fch_transac) = 5
   and ot.numero in (
   456384
   )
--        and otd.art_cod_art in ('CAR 404')
 group by extract(year from kx.fch_transac), extract(month from kx.fch_transac)
        , ot.nuot_tipoot_codigo, ot.nuot_serie
        , ot.numero, ot.estado, ot.formu_art_cod_art, ot.cod_lin
        , ot.fecha, ot.fecha_cierre, ot.cant_prog, ot.cant_ingresado
        , ot.cant_merma, otd.art_cod_art, otd.cod_lin, otd.rendimiento
        , otd.cant_formula, ot.lote
 order by ot.nuot_tipoot_codigo, ot.numero;


select nvl(sum(d.cantidad), 0)
  from kardex_d d
 where d.tp_transac in ('22', '29') -- transacciones de consumos
   and d.estado != '9'
   and d.pr_tipot = 'PR'
   and d.pr_numot = 456384
   and d.cod_art = 'AX 1.0 C430-1219-2438';

select *
  from usuarios_tipos
 where usuario = 'WPORTILLO';

select *
  from usuarios_libros
 where usuario = 'WPORTILLO';
