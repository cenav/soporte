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