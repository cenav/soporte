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

select *
  from activo_fijo
 where cod_activo_fijo in (
                            'LICENCIA COREL14', 'LICENCIA A.CAD07', '04LAPT26',
                           'AC1RET-012', 'EQ DIV315', 'EQ COMP/OF SEG', '02CAMA2', '02CAMA3',
                           '02CAMA4', '02CAMA1', 'SECS PINT AREN FOSF MET MAN15',
                           'SECS PINT AREN FOSF MET MAN16', 'MQ2MATR-074', 'EQ DIV107', '03BOBI146',
                           '03BOBI147', '03BOBI148', '02SILL2', '03IMPR1', '02MUEB25', 'EQ DIV96',
                           'EQ DIV120', '02IMPR10', '02LOCK1', '03HERR44', '03CAMA1',
                           'MQ2MATR-064 INST1', '02ANDA26', 'AC1LJEB-011', 'AC1LJEB-012', 'EQ DIV2',
                           'EQ MEDIC35'
   );

select *
  from activo_fijo_depreciacion
 where cod_activo_fijo = 'LICENCIA A.CAD08'
   and fecha = to_date('30/06/2024', 'dd/mm/yyyy');
