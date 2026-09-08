select *
  from almacenes
 where cod_alm = 'TR';

select a.cod_alm, a.descripcion, l.descripcion as desc_local
     , a.descripcion || ' (' || l.descripcion || ')' as desc_almacen
     , p.apellido_paterno || ' ' || p.apellido_materno || ', ' || p.nombres as desc_encargado
  from pevisa.almacen_activo_fijo a
       join locales l on a.cod_local = l.cod_local
       join planilla10.personal p on a.encargado = p.c_codigo
 order by 1;

select * from almacen_activo_fijo;

select a.cod_activo_fijo
     , a.descripcion
     , c.descripcion as clase
     , a.fecha_adquisicion
     , a.cod_estado
     , a.cod_subclase
     , a.abreviatura
  from activo_fijo a
     , activo_fijo_clase c
 where a.cod_clase = c.cod_clase(+)
   and nvl(a.cod_estado, 0) in (1, 6, 7, 0)
   and exists (
   select 1
     from (
            select b.cod_activo_fijo, sum(nvl(a.stock, 0)) as stock
              from almacen a
                 , activo_fijo b
             where a.cod_art(+) = b.cod_activo_fijo
             group by b.cod_activo_fijo
            )
    where cod_activo_fijo = a.cod_activo_fijo
      and stock = 0
   )
   and a.cod_activo_fijo = 'TMC-TROQ 215.440'
 order by a.cod_activo_fijo;


select *
  from almacen
 where cod_art = 'TMC-TROQ 215.440';


select cod_alm, dsc_alm, tp_transac, dsc_transac, numero, fch_transac, cod_art, ing_sal, cantidad
  from vw_kardex
 where cod_art = 'TMC-TROQ 215.440'
 order by fch_transac desc;


create or replace view vw_kardex as
select g.cod_alm, a.descripcion as dsc_alm, g.tp_transac, t.descripcion as dsc_transac, g.serie
     , g.numero, g.fch_transac, g.estado, g.ing_sal, g.tip_doc_ref, g.ser_doc_ref, g.nro_doc_ref
     , g.glosa, g.num_importa, d.cod_art, d.cantidad, d.costo_d, d.costo_s, d.pr_tipot, d.pr_numot
  from kardex_g g
       join almacenes a on g.cod_alm = a.cod_alm
       join transacciones_almacen t on g.tp_transac = t.tp_transac
       join kardex_d d
            on g.cod_alm = d.cod_alm
              and g.tp_transac = d.tp_transac
              and g.serie = d.serie
              and g.numero = d.numero;

select *
  from (
         select b.cod_activo_fijo, sum(nvl(a.stock, 0)) as stock
           from almacen a
              , activo_fijo b
          where a.cod_art(+) = b.cod_activo_fijo
          group by b.cod_activo_fijo
         )
 where cod_activo_fijo = 'TMC-TROQ 215.440'
   and stock = 0;

select cod_alm, dsc_alm, tp_transac, dsc_transac, numero, fch_transac, cod_art, ing_sal, cantidad
  from vw_kardex
 where cod_art = 'TMC-TROQ 215.440-V2'
 order by fch_transac desc, ing_sal;
