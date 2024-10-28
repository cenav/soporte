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

select * from activo_fijo;

-- equipos de computo
select e.cod_activo_fijo, a.descripcion, a.abreviatura, c.descripcion as clase
     , u.descripcion as subclase, e.nro_serie, e.fabricacion, e.cod_marca, e.alto, e.largo, e.ancho
     , e.peso, e.ip, e.licencia, e.observaciones, e.nro_telefono, e.modelo, e.imei, e.anexo
     , eh.cod_hardware, h.descripcion as nom_hardware, eh.cantidad, es.cod_software
     , s.descripcion as nom_software, es.cantidad, es.key
  from activo_fijo a
       join activo_fijo_clase c on a.cod_clase = c.cod_clase
       join activo_fijo_subclase u on a.cod_clase = c.cod_clase and a.cod_subclase = u.cod_subclase
       join equipo e on a.cod_activo_fijo = e.cod_activo_fijo
       left join equipo_hardware eh on e.cod_activo_fijo = eh.cod_activo_fijo
       left join equipo_software es on e.cod_activo_fijo = es.cod_activo_fijo
       left join hardware h on eh.cod_hardware = h.cod_hardware
       left join software s on es.cod_software = s.cod_software
 where (eh.cod_activo_fijo is not null or es.cod_activo_fijo is not null)
   and a.cod_activo_fijo = 'CPUC63';

select *
  from activo_fijo_subclase
 where cod_clase = 'EQP';

select * from hardware;

select * from software;

-- equipos de computo
  with componentes as (
    select eh.cod_activo_fijo, eh.cod_hardware as cod_componente, h.descripcion as nom_componente
         , eh.cantidad
         , null as key
      from equipo_hardware eh
           left join hardware h on eh.cod_hardware = h.cod_hardware
     union all
    select es.cod_activo_fijo, es.cod_software, s.descripcion as nom_software, es.cantidad
         , es.key
      from equipo_software es
           left join software s on es.cod_software = s.cod_software
    )
select e.cod_activo_fijo, a.descripcion, a.abreviatura, c.descripcion as clase
     , u.descripcion as subclase, e.nro_serie, e.fabricacion, e.cod_marca, e.alto, e.largo, e.ancho
     , e.peso, e.ip, e.licencia, e.observaciones, e.nro_telefono, e.modelo, e.imei, e.anexo
     , cp.cod_componente, cp.nom_componente, cp.cantidad, cp.key
  from activo_fijo a
       join activo_fijo_clase c on a.cod_clase = c.cod_clase
       join activo_fijo_subclase u on a.cod_clase = c.cod_clase and a.cod_subclase = u.cod_subclase
       join equipo e on a.cod_activo_fijo = e.cod_activo_fijo
       join componentes cp on e.cod_activo_fijo = cp.cod_activo_fijo;

select *
  from activo_fijo
 where cod_activo_fijo = '03COMP25-MONI2';
