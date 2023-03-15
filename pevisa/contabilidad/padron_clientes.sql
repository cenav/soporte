-- padron cliente
create or replace view vw_padron_cliente as
select cod_cliente, c.ruc, nombre, direccion, c.telefono, c.pais, x.descripcion as dsc_pais
     , u.nom_dpt as departamento, u.nom_pvc as provincia, u.nom_dtt as distrito
     , c.email
  from clientes c
       left join ubigeo u on c.cod_ubc = u.cod_ubc
       left join tablas_auxiliares x on c.pais = x.codigo and x.tipo = '25';

-- padron proveedor
create or replace view vw_padron_proveedor as
select p.cod_proveed, p.ruc, p.nombre, p.direccion, p.telefono, p.pais, x.descripcion as dsc_pais
     , u.nom_dpt as departamento, u.nom_pvc as provincia, u.nom_dtt as distrito
     , p.email, p.alias as codigo_identificacion
  from proveed p
       left join ubigeo u on p.cod_ubc = u.cod_ubc
       left join tablas_auxiliares x on p.pais = x.codigo and x.tipo = '25';

select *
  from proveed
 where cod_proveed = '20603183933';

select *
  from ubigeo
 where cod_ubc = '150117';

select *
  from tablas_auxiliares
 where codigo != '....'
   and tipo = 25;

select *
  from tablas_auxiliares
 where codigo = '....';

select *
  from campana
 where cod_campana in (
                       'E2022-1', 'E2022-2', 'E2022-3', 'E2022-4'
   );

select * from estado_campana;

select *
  from kardex_d
 where tp_transac = '11'
   and cod_art like 'SLIM%'
   and extract(year from fch_transac) = 2022
   and extract(month from fch_transac) in (11, 12)
   and pr_tipot is not null
   and pr_numot is not null;

select *
  from kardex_d
 where cod_alm = '15'
   and tp_transac = '11'
   and serie = 2
   and numero = 7008
   and cod_art = 'SLIM380.974';

select *
  from kardex_g
 where cod_alm = '15'
   and tp_transac = '11'
   and serie = 2
   and numero = 7008;
