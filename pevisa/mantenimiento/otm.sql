select *
  from ot_mantto
 where id_tipo = 'PY'
   and id_serie = 2
   and id_numero = 745;

select *
  from activo_fijo
 where cod_activo_fijo like 'SECS PREN DE JEBE%';

select * from correlativo_activo_fijo;

select * from nroafijo;

select *
  from nroafijo
 where cod_activo_fijo = 'SECS PREN DE JEBE';

select lpad(a.id_serie, 3, '0') as id_serie, lpad(a.id_numero, 6, '0') as id_numero
     , c.descripcion as tipo, a.fecha_solicitud, a.estado, b.descripcion
     , trunc(sysdate - a.fecha_solicitud) as dias
     , trunc(months_between(sysdate, a.fecha_solicitud)) as meses, a.desc_solicitud
  from ot_mantto a
     , estado_otm b
     , ot_mantto_tipo c
 where a.estado = b.id_estado
   and trunc(months_between(sysdate, a.fecha_solicitud)) >= 4
   and a.fecha_cierre_mantto is null
   and a.estado not in (4, 8, 9)
   and a.id_tipo = c.id_tipo
   and not exists (
   select 1
     from ot_mantto_justifica j
    where j.id_tipo = a.id_tipo
      and j.id_serie = a.id_serie
      and j.id_numero = a.id_numero
   )
--AND rownum <= 20
 order by 3;

select * from estado_otm;

begin
  pkg_notificaciones.notificar_cierre_otm();
end;

alter package pkg_notificaciones compile body;