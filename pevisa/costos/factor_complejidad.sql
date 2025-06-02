-- TIEMPO factor complejidad
select *
  from pcmasters
 where cod_art = '200.2740NA';

select *
  from vw_factor_complejidad
 where cod_art = '200.2740NA';

select *
  from vw_factor_complejidad
 where cantidad > 0
   and factor = 0;

-- consultar como se genera el listado de Betty
select ano
     , mes
     , a.cod_art
     , linea
     , factor
     , cantidad
  from vw_factor_complejidad f
       join articul a on a.cod_art = f.cod_art
 where ano = :p_ano
   and mes = :p_mes
   and factor = 0
   and not exists (
   select 1
     from tab_lineas_tipo_linea
    where cod_tipo = 2
      and vw_factor_complejidad.linea = tab_lineas_tipo_linea.cod_linea
   )
 order by cod_art;

select * from tipo_linea;

select *
  from tab_lineas_tipo_linea
 where cod_tipo = 2;

select *
  from pcarticul
 where cod_art = 'TO450.962-I';

select *
  from articul
 where cod_art = 'TO450.962-I'
   and indicador not like '%I%';

select distinct indicador
  from articul;
