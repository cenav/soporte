-- Los códigos con IQF no pueden ser transferidos a diferentes almacenes,
-- estos salen directo del 02 con orden de producción o solicitud (solo código SOL 831),
-- no se puede realizar ajustes ni mover de un mes a otro los consumos.

select *
  from kardex_d d
 where extract(year from d.fch_transac) >= 2022
   and exists(
   select 1
     from articul_iqf a
    where a.cod_art = d.cod_art
   );

-- 02	22	150	499
select *
  from kardex_d
 where cod_alm = '02'
   and tp_transac = '22'
   and serie = 150
   and numero = 499;

select *
  from kardex_d
 where cod_art like '%LAPT%';

select *
  from kardex_d
 where cod_alm = '62'
   and tp_transac = '11'
   and extract(year from fch_transac) >= 2024;

create or replace trigger tbiu_transferencia_iqbf
  before insert or update
  on kardex_d
  for each row
begin
  if not iqbf.es_almacen_controlado(:new.cod_alm) and iqbf.existe(:new.cod_art) then
    raise_application_error(-20001, 'IQBF no se puede transferir a otros almacenes');
  end if;
end;