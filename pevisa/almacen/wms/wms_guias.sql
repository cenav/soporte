select *
  from wms_rec_guia
 where rec_numero = 645;

select * from wms_estado_solicitud;

select *
  from kardex_d
 where cod_art = 'FOR3560N'
 order by fch_transac desc;


select *
  from kardex_g
 where cod_alm = 'D5'
 order by fch_transac desc;


select *
  from kardex_g
 where tip_doc_ref = 'TK'
   and nro_doc_ref = '645'
 order by fch_transac desc;

select *
  from kardex_g g
       join kardex_d d
            on g.cod_alm = d.cod_alm and g.tp_transac = d.tp_transac and g.serie = d.serie and
               g.numero = d.numero
 where g.tip_doc_ref = 'TK'
   and g.nro_doc_ref = '645'
   and g.estado != '9'
