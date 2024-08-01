-- ORDENES DE COMPRA
select *
  from orden_de_compra
 where serie = 1
   and num_ped = 85819
 order by fecha desc;

select *
  from itemord
 where serie = 1
   and num_ped = 85917;

select *
  from unidades_negocio
 where codigo_unidad_negocio = '01';

select *
  from lg_grupos_compras
 where codigo_grupo_compra = '003';

select * from articul;

select * from tab_lineas;

select *
  from lg_condpag
 where cond_pag = '28';

select *
  from proveed
 where cod_proveed = '20600612922';

select *
  from ubigeo
 where cod_ubc = '150103';

select * from moneda;

select *
  from tablas_auxiliares
 where codigo = '....'
 order by tipo;

select *
  from tablas_auxiliares
 where codigo != '....'
   and tipo = 25
 order by tipo;


-- codigos sin movimiento
select a.cod_art, a.descripcion, a.cod_lin
  from articul a
 where a.cod_lin in (
                     '1000', '1001', '1002', '1003', '1004', '1005', '1006', '1007', '1008', '1009',
                     '1010', '1011', '1012', '1013', '1014', '1015', '1016', '1017', '1018', '1019',
                     '1020', '1021', '1022', '1023', '1024', '1025', '1026', '1027'
   )
   and a.cod_art not in (
   select distinct d.cod_art
     from kardex_g g
          join kardex_d d
               on g.cod_alm = d.cod_alm and g.tp_transac = d.tp_transac and g.serie = d.serie and
                  g.numero = d.numero
          join articul a on d.cod_art = a.cod_art
    where g.estado != '9'
      and extract(year from g.fch_transac) >= 2017
   );

select *
  from permiso
 where numero = 63268;

select * from vw_permisos;

select count(*)
  from permiso
 where id_personal = 'E42422'
   and trunc(desde) = to_date('10/04/2024', 'dd/mm/yyyy')
   and id_concepto = 'DMS'
 order by fecha desc;
