-- iqbf sunat
select g.cod_alm, g.tp_transac, ta.descripcion as dsc_transaccion, g.serie, g.numero, g.fch_transac
     , g.ser_doc_ref as oc_ser, g.nro_doc_ref as oc_nro, g.cod_relacion as proveedor
     , d.pr_referencia as factura, d.cod_art, d.cantidad
  from kardex_g g
       join kardex_d d
            on g.cod_alm = d.cod_alm
              and g.tp_transac = d.tp_transac
              and g.serie = d.serie
              and g.numero = d.numero
       join transacciones_almacen ta on g.tp_transac = ta.tp_transac
 where extract(year from g.fch_transac) = 2021
   and extract(month from g.fch_transac) in (6, 7)
   and g.estado != '9'
   and d.cod_art = 'SOL 806'
 order by g.fch_transac, g.tp_transac;

select d.*
  from kardex_g g
       join kardex_d d
            on g.cod_alm = d.cod_alm
              and g.tp_transac = d.tp_transac
              and g.serie = d.serie
              and g.numero = d.numero
 where extract(year from g.fch_transac) = 2021
   and extract(month from g.fch_transac) in (6, 7)
   and g.estado != '9'
   and d.cod_art = 'SOL 806';

select *
  from transacciones_almacen
 where tp_transac = '29';

-- reporte SOL 815
select g.cod_alm, g.tp_transac, ta.descripcion as dsc_transaccion, g.serie, g.numero, g.fch_transac
     , g.ser_doc_ref as oc_ser, g.nro_doc_ref as oc_nro, g.cod_relacion as proveedor
     , d.pr_referencia as factura, d.cod_art, d.cantidad
  from kardex_g g
       join kardex_d d
            on g.cod_alm = d.cod_alm
              and g.tp_transac = d.tp_transac
              and g.serie = d.serie
              and g.numero = d.numero
       join transacciones_almacen ta on g.tp_transac = ta.tp_transac
 where g.fch_transac between to_date('19/06/2024', 'dd/mm/yyyy') and to_date('01/07/2024', 'dd/mm/yyyy')
   and g.estado != '9'
   and d.cod_art = 'SOL 815'
 order by g.fch_transac, g.tp_transac;

select *
  from kardex_g_historia
 where cod_alm = '02';

-- transacciones eliminadas
select *
  from kardex_d_historia
 where cod_alm = '02'
   and fecha between to_date('19/06/2024', 'dd/mm/yyyy') and to_date('01/07/2024', 'dd/mm/yyyy')
