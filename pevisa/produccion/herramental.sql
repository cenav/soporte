select *
  from pcherramental
 where cod_art = 'MAT1 20045';

select *
  from pcherramental
 where cod_for = '20045';

select *
  from articul
 where cod_art = 'MAT1 20045';

select *
  from tab_lineas
 where linea = '2538';

select *
  from pr_proceso
 where codigo = 'COTT';

select *
  from pcherramental
 where cod_art = 'MAT1 20045';


select p.pr_numero, p.formu_art_cod_art, p.cant_prog, p.fecha, null as descripcion
     , substr(to_char(100000000 + p.pr_numero), 2, 8) as orden_etiqueta
     , substr(to_char(100 + p.pr_serie), 2, 2) as serie_etiqueta, p.pr_tipo, p.pr_serie
     , nvl(peso_por_bolsa, 0) as peso_por_bolsa
  from pevisa.pr_herramental p
     , pr_formu f
 where p.pr_tipo = 'OF'
   and p.estado in (6)
   and p.formu_art_cod_art = f.art_cod_art
 order by p.pr_numero;

select *
  from pr_herramental
 where pr_tipo = 'OF'
   and pr_numero = 327;

select *
  from pr_herramental_det
 where pr_tipo = 'OF'
   and pr_numero = 327;

select * from fabricacion_estado order by cod_estado;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'OF'
   and numero = 327;

select * from;