-- codigos sin movimiento
select cod_activo_fijo
  from tmp_carga_activo_fijo
 where not exists(
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

