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
