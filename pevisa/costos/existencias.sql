select ano, mes, cuenta, descripcion, cod_art, stock_a_la_fecha, costo_unit_sol, costo_unit_dol
     , to_char(ultima_fecha_compra, 'DD/MM/YYYY') as ultima_fecha_compra, dias_0_60, dias_61_120
     , dias_121_180, dias_181_240, dias_241_360, ano_1, ano_2, ano_3, ano_4, ano_5_mas
  from view_existencias
 where ano = :p_ano
   and mes = :p_mes
   and (
   (:p_antiguedad = 1 and (ano_1 > 0 or ano_2 > 0 or ano_3 > 0 or ano_4 > 0 or ano_5_mas > 0)) or
   (:p_antiguedad = 2 and (ano_2 > 0 or ano_3 > 0 or ano_4 > 0 or ano_5_mas > 0)) or
   (:p_antiguedad = 3 and (ano_3 > 0 or ano_4 > 0 or ano_5_mas > 0)) or
   (:p_antiguedad = 4 and (ano_4 > 0 or ano_5_mas > 0)) or
   (:p_antiguedad = 5 and ano_5_mas > 0) or
   (:p_antiguedad = 0)
   )
--AND    cod_art = 'ALT-3051'
 order by cuenta, descripcion, cod_art;

select * from tmp_mastart_dos;

  with stocks as (
    select d.cod_art, sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
      from kardex_d d
     where d.estado <> '9'
       and trunc(d.fch_transac) <= to_date('31/08/2025', 'dd/mm/yyyy')
    having sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) > 0
     group by d.cod_art
    )
select a.cod_art, a.descripcion, a.cod_lin
  from articul a
       join stocks s on a.cod_art = s.cod_art;

select last_day(to_date(:p_ano || :p_mes, 'yyyymm')) from dual;