select a.cod_art, a.cod_art
  from pcarticul a
     , wms_inventa_fis b
     , wms_inventa_fis_d c
     , wms_inventa_fis_u u
 where a.cod_interno = :x_barra
   and b.estado = '1'
   and b.numero = :x_lote
   and c.serie = b.serie
   and c.numero = b.numero
   and c.cod_art = a.cod_art
   and u.serie = b.serie
   and u.numero = b.numero
   and u.usuario = :txt_codigo_personal;

select *
  from pcarticul
 where cod_art = 'BLAF 0.5-160GZ';

select *
  from wms_inventa_fis
 where numero = 344;

select *
  from wms_inventa_fis
 where estado = '1'
   and cod_alm = 'D5';
