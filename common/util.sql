-- dado año y trimestre devuelve el rango de fechas
select to_char(add_months(trunc(to_date(:p_year, 'YYYY'), 'YYYY'), (:p_quarter - 1) * 3),
               'dd/mm/yyyy') as ini
     , to_char(add_months(trunc(to_date(:p_year, 'YYYY'), 'YYYY'), :p_quarter * 3) - 1,
               'dd/mm/yyyy') as fin
  from dual;