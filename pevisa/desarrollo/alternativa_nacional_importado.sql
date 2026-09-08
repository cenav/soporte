select *
  from pieza_nacional_importada
 where nacional = 'ARO 66100-I';

select *
  from pieza_importada_nacional
 where importada = '30013CS-1-I';

select cod_art from tmp_carga_data;


select d.cod_alm, d.cod_art, i.nacional
     , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
       join transferencia_nac_imp_13052026 t on d.cod_art = t.cod_art
       left join pieza_nacional_importada i on d.cod_art = i.importada
 where d.estado <> '9'
   and d.cod_alm != 'D5'
--    and trunc(d.fch_transac) <= to_date('31/08/2024', 'dd/mm/yyyy')
having sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) > 0
 group by d.cod_alm, d.cod_art, i.nacional
 order by d.cod_alm, d.cod_art;

select *
  from articul
 where cod_art = 'ARO 66100-I';

select cod_alm, cod_art, cod_activo_fijo, stock from tmp_carga_data;

select * from transferencia_nac_imp_13052026;

select *
  from transferencia_nac_imp_13052026 x
       left join pieza_nacional_importada i on x.cod_art = i.importada;


insert into tmp_carga_data(cod_alm, cod_art, cod_activo_fijo, stock)
select d.cod_alm, d.cod_art, i.importada
     , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
       join pieza_nacional_importada i on d.cod_art = i.nacional
 where d.estado <> '9'
   and d.cod_alm != 'D5'
   and d.cod_art in (
   select i.nacional
     from transferencia_nac_imp_13052026 x
          left join pieza_nacional_importada i on x.cod_art = i.importada
   )
--    and trunc(d.fch_transac) <= to_date('31/08/2024', 'dd/mm/yyyy')
having sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) > 0
 group by d.cod_alm, d.cod_art, i.importada
 order by d.cod_alm, d.cod_art;


select cod_alm, cod_art, cod_activo_fijo, stock from tmp_carga_data;

select *
  from transacciones_almacen
 where tp_transac = '08';

select *
  from kardex_g
 where tp_transac in ('51', '08')
   and fch_transac >= to_date('13/05/2026', 'dd/mm/yyyy')
   and numero not in (28112, 27887);

select *
  from kardex_g_historia
 where cod_alm = '05'
   and tp_transac = '51'
   and serie = 1
   and numero = 28115;

select *
  from kardex_d
 where cod_art = '180.385S-I';

select *
  from almacen
 where cod_art in ('180.385S-I', '180.385S');

select *
  from transacciones_almacen
 where tp_transac = '08';
