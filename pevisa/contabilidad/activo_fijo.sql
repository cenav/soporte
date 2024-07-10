select *
  from activo_fijo
 where activacion_almacen is not null
   and fecha_activacion > to_date('05/07/2024', 'dd/mm/yyyy');

-- A1	22	1	283520

select *
  from transacciones_almacen
 where tp_transac = '22';

select *
  from numdoc
 where tp_transac = '22'
   and serie = 1;

select *
  from kardex_g
 where cod_alm = 'A1'
   and tp_transac = '22'
   and serie = 1
   and numero = 283520;

select *
  from kardex_d
 where cod_alm = 'A1'
   and tp_transac = '22'
   and serie = 1
   and numero = 283520;

select cod_activo_fijo from tmp_carga_data;


-- stock alamcen
select d.cod_alm, d.cod_art
     , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
 where d.estado != '9'
   and exists(
   select *
     from tmp_carga_data t
    where d.cod_art = t.cod_activo_fijo
   )
   and exists(
   select *
     from activo_fijo af
    where d.cod_art = af.cod_activo_fijo
   )
having sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) > 0
 group by d.cod_alm, d.cod_art;