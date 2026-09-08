select *
  from activo_fijo
 where activacion_almacen is not null
   and fecha_activacion > to_date('05/07/2024', 'dd/mm/yyyy');

-- A1	22	1	283520

select *
  from transacciones_almacen
 where tp_transac = '37';

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
   and exists (
   select *
     from tmp_carga_data t
    where d.cod_art = t.cod_activo_fijo
   )
   and exists (
   select *
     from activo_fijo af
    where d.cod_art = af.cod_activo_fijo
   )
having sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) > 0
 group by d.cod_alm, d.cod_art;

select *
  from activo_fijo
 where cod_activo_fijo in (
                           'MQ1LJEB-004', 'MQ1LJEB-004 INS1', 'MQ1LJEB-005', 'MQ1LJEB-005 INS1',
                           'MQ1PLP-007'
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
 where cod_activo_fijo in ('MQ2MATR-046', 'MQ2MATR-063');

select * from activo_fijo_estado order by cod_estado;

select *
  from activo_fijo_depreciacion
 where cod_activo_fijo = 'EQ DIV352';

select *
  from activo_fijo_depreciacion
 where cod_activo_fijo = 'EQ DIV352-2';

select * from activo_fijo_area;

select * from locales;

select * from activo_fijo_estado;

select *
  from articul
 where cod_art in ('EQLAB1', 'EQLAB5', 'EQLAB6');

select *
  from activo_fijo
 where cod_activo_fijo in (
                           'LICENCIA A.CAD38', 'LICENCIA COREL22', 'CPUC57', 'CPUC57-MONI',
                           'AC1PJEB-004', '02ELEV22', '03TORN1', '03TORN2', 'MQ1PJEB-033',
                           '02VENT27'
   );


select * from activo_fijo_estado;


select *
  from activo_fijo
 where cod_activo_fijo = 'SECV ARMADO PT MAN3';


select *
  from nroafijo
 where cod_activo_fijo = 'SECV ARMADO PT';


select *
  from activo_fijo
 where cod_activo_fijo = 'SECV ARMADO PT';


declare
  l_next nroafijo.numero%type;
begin
  l_next := api_nroafijo.next_key('SECV ARMADO PT', 'MAN');
  dbms_output.put_line(l_next);
end;