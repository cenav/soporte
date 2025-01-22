-- codigos sin movimiento
select cod_activo_fijo
  from tmp_carga_activo_fijo
 where not exists (
   select 1
     from kardex_d d
    where fch_transac >= to_date('01/01/2020', 'dd/mm/yyyy')
      and nvl(d.estado, '0') != '9'
      and d.cod_art = tmp_carga_activo_fijo.cod_activo_fijo
   );

select * from tmp_carga_activo_fijo;

-- corrige los espacios en blanco
update tmp_carga_activo_fijo
   set cod_activo_fijo = trim(cod_activo_fijo);


select d.*
  from kardex_d d
 where fch_transac >= to_date('01/01/2020', 'dd/mm/yyyy')
   and cod_art = '180.000';


-- codigos sin movimiento por almacen
  with codigos_stock as (
    select d.cod_alm, d.cod_art
         , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
      from kardex_d d
     where d.estado != '9'
       and d.cod_alm = '30'
    having sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) > 0
     group by d.cod_alm, d.cod_art
    )
select *
  from codigos_stock cs
 where not exists (
   select 1
     from kardex_d d
    where extract(year from d.fch_transac) = 2024
      and nvl(d.estado, '0') != '9'
      and d.cod_art = cs.cod_art
   );

select *
  from kardex_d
 where cod_art = 'AL 1.5-550-705'
   and extract(year from fch_transac) = 2024;
