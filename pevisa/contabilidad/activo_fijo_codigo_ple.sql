update activo_fijo
   set cod_ple = substr(cod_activo_fijo, 1, 24)
 where cod_ple is null
   and length(cod_activo_fijo) <= 24;

select *
  from activo_fijo
 where cod_ple is null;

select * from ruta_docvirtual;