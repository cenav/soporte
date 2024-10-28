select *
  from kardex_d
 where cod_art = '03CARR11';

select *
  from transacciones_almacen
 where tp_transac = '22';

-- activos con salida de almacen sin activar
select d.cod_alm, d.tp_transac, d.serie, d.numero, g.fch_transac as fecha, d.cod_art, d.cantidad
     , a.descripcion, a.cod_clase, c.descripcion as clase, a.cod_subclase, s.descripcion as subclase
     , sd.cod_ubicacion, u.descripcion as ubicacion
  from kardex_g g
       join kardex_d d
            on g.cod_alm = d.cod_alm
              and g.tp_transac = d.tp_transac
              and g.serie = d.serie
              and g.numero = d.numero
       join activo_fijo a on d.cod_art = a.cod_activo_fijo
       left join activo_fijo_clase c on a.cod_clase = c.cod_clase
       left join activo_fijo_subclase s
                 on c.cod_clase = s.cod_clase and a.cod_subclase = s.cod_subclase
       left join solimat_g sg on g.ser_doc_ref = sg.serie and g.nro_doc_ref = sg.numero
       left join solimat_d sd
                 on sg.serie = sd.serie and sg.numero = sd.numero and sd.cod_art = d.cod_art
       left join activo_fijo_ubicacion u on sd.cod_ubicacion = u.cod_ubicacion
 where d.tp_transac = '22'
   and g.estado != '9'
   and a.cod_estado = '0'
   and a.depreciable = 'S';

select * from activo_fijo_subclase;

select *
  from activo_fijo_ubicacion
 where cod_ubicacion = 'UB-002';

select d.*
  from solimat_g g
       join solimat_d d on g.serie = d.serie and g.numero = d.numero
 where g.serie = 1
   and g.numero = 149128;

select g.*, sd.cod_ubicacion
  from kardex_g g
       join kardex_d d
            on g.cod_alm = d.cod_alm and g.tp_transac = d.tp_transac and g.serie = d.serie and
               g.numero = d.numero
       left join solimat_g sg on g.ser_doc_ref = sg.serie and g.nro_doc_ref = sg.numero
       left join solimat_d sd
                 on sg.serie = sd.serie and sg.numero = sd.numero and sd.cod_art = d.cod_art
 where g.cod_alm = 'A1'
   and g.tp_transac = '22'
   and g.serie = 1
   and g.numero = 191118
   and g.estado != '9';
