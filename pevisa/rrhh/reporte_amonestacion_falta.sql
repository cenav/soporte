-- amomenstaciones y faltas asistencia 2025 de todos los trabajadores
  with amonesta as (
    select a.id_trabajador
         , a.id_tipo
         , t.descripcion as dsc_tipo
         , count(*) as count_amonesta
      from amonestacion a
           left join tipo_amonestacion t on a.id_tipo = t.id_tipo
           left join motivo_amonestacion m on a.id_motivo = m.id_motivo
     where a.id_estado != '9'
       and extract(year from a.fecha) = 2025
       and extract(month from a.fecha) between 1 and 11
--        and a.id_trabajador = 'E42309'
--     having count(*) > 3
     group by a.id_trabajador, a.id_tipo, t.descripcion
    )
     , amonesta_resumen as (
    select a.id_trabajador
         , listagg(a.dsc_tipo || ' (' || a.count_amonesta || ')', ' | ')
                   within group ( order by a.dsc_tipo) as tipos_amonesta
         , sum(a.count_amonesta) as tot_amonesta
      from amonesta a
     group by a.id_trabajador
    )
     , faltas as (
    select cod_personal, count(dfalta) as tot_faltas
      from asistencia.vw_resdiario
     where dfalta > 0
       and extract(year from fecha) = 2025
       and extract(month from fecha) between 1 and 11
--        and cod_personal = 'E42309'
     group by cod_personal
    )
     , permisos as (
    select p.cod_personal, count(*) as tot_permisos
      from asistencia.resumendiario r
         , asistencia.personal p
         , asistencia.concepto c
     where r.idpersonal = p.idpersonal
       and r.idconcepto = c.idconcepto
       and extract(year from r.fecha) = 2025
       and extract(month from r.fecha) between 1 and 11
       and r.idconcepto in (581, 441)
       and tiempo = 1
--        and p.cod_personal = 'E41862'
     group by p.cod_personal
    )
select p.c_codigo, p.nombre, p.desc_cargo, p.desc_seccion, p.dsc_area, p.desc_encargado
     , p.desc_local, p.f_ingreso, p.anos_empresa, a.tipos_amonesta, a.tot_amonesta, f.tot_faltas
     , e.tot_permisos
  from vw_personal p
       left join amonesta_resumen a on p.c_codigo = a.id_trabajador
       left join faltas f on p.c_codigo = f.cod_personal
       left join permisos e on p.c_codigo = e.cod_personal
 where p.situacion not in (
   select *
     from planilla10.t_situacion_cesado
   );


select *
  from amonestacion
 where id_trabajador = 'E42309';


select distinct id_tipo from amonestacion;

select * from tipo_amonestacion;

select * from motivo_amonestacion;

select *
  from asistencia.vw_resdiario
 where cod_personal = 'E42309'
   and dfalta > 0
   and extract(year from fecha) = 2025;


select cod_personal, count(dfalta) as count_falta
  from asistencia.vw_resdiario
 where cod_personal = 'E42309'
   and dfalta > 0
   and extract(year from fecha) = 2025
 group by cod_personal;

select * from asistencia.vw_resdiario;

select p.cod_personal, r.fecha, r.idconcepto, c.dsc_concepto, r.tiempo
  from asistencia.resumendiario r
     , asistencia.personal p
     , asistencia.concepto c
 where r.idpersonal = p.idpersonal
   and r.idconcepto = c.idconcepto
   and fecha between '01/01/2025' and '15/12/2025'
   and r.idconcepto = 581
   and tiempo = 1
   and p.cod_personal = 'E43546';

select *
  from asistencia.concepto
 where dsc_concepto like '%GOCE%';

select *
  from asistencia.concepto
 where dsc_concepto like '%PERMISO%';

select p.cod_personal, count(*) as permisos
  from asistencia.resumendiario r
     , asistencia.personal p
     , asistencia.concepto c
 where r.idpersonal = p.idpersonal
   and r.idconcepto = c.idconcepto
   and extract(year from r.fecha) = 2025
   and extract(month from r.fecha) between 1 and 11
   and r.idconcepto in (581, 441)
   and tiempo = 1
   and p.cod_personal = 'E41862'
 group by p.cod_personal;


-- faltas y tardanzas
  with faltas as (
    select cod_personal, count(dfalta) as tot_faltas
      from asistencia.vw_resdiario
     where dfalta > 0
       and fecha between to_date('21/02/2026', 'dd/mm/yyyy') and to_date('20/03/2026', 'dd/mm/yyyy')
--        and cod_personal = 'E42309'
     group by cod_personal
    )
     , tardanzas as (
    select cod_personal, tingreso_fmt, trefrigerio_fmt
      from vw_puntualidad
     where idperiodo = 3344
    )
select p.c_codigo, p.nombre, p.desc_cargo, p.desc_seccion, p.dsc_area, p.desc_encargado
     , p.desc_local, p.f_ingreso, p.anos_empresa, f.tot_faltas, t.tingreso_fmt, t.trefrigerio_fmt
  from vw_personal p
       left join faltas f on p.c_codigo = f.cod_personal
       left join tardanzas t on p.c_codigo = t.cod_personal
 where p.situacion not in (
   select *
     from planilla10.t_situacion_cesado
   );

select tingreso_fmt, trefrigerio_fmt
  from vw_puntualidad
 where cod_personal = 'E567'
   and idperiodo = 3344
 order by idperiodo desc;

select * from ruta_docvirtual;