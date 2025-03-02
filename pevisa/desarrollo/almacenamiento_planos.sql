select * from ruta_docvirtual;

-- \\25.0.3.18\planos

select *
  from ruta_docvirtual
 where docvirtual = 'DESARROLLO';

select * from articul;

select *
  from articul_varios
 where proceso_adicional is not null;

select * from formato_calidad;

select *
  from articul
 where seccion is not null;

select *
  from articul
 where seccion is not null;

select *
  from pr_usualma
 where usuario = 'RICARDO_TOVAR';

select *
  from articul
 where cod_art = '93009GR';

select * from tipo_archivo;

merge into articul_archivos a
using (
  select :cod_art as cod_art, :id_tipo_archivo as id_tipo_archivo, :ruta_archivo as ruta_archivo
    from dual
  ) s
on (a.cod_art = s.cod_art and a.id_tipo_archivo = s.id_tipo_archivo)
when not matched then
  insert
    (a.cod_art, a.id_tipo_archivo, a.ruta_archivo)
  values
    (s.cod_art, s.id_tipo_archivo, s.ruta_archivo)
when matched then
  update set a.ruta_archivo = s.ruta_archivo;

begin
  api_articul_archivos.mer('380.752', 1, 'archivo');
end;

select * from ruta_docvirtual;

-- no debe leer el archivo por el punto
select * from articul_archivos;

select *
  from usuario_modulo
 where modulo in ('MAESTRO_ARTICULO')
 order by usuario, modulo;