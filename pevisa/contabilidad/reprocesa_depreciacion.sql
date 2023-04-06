declare
  cursor periodos is
      with intervalo as (
        select to_date('01/09/2022', 'dd/mm/yyyy') as desde
             , to_date('31/12/2022', 'dd/mm/yyyy') as hasta
          from dual
        )
         , periodo as (
        select f.desde - 1 + rownum as fecha
          from all_objects
               cross join intervalo f
         where f.desde - 1 + rownum <= f.hasta
        )
    select to_number(to_char(fecha, 'YYYY')) as ano
         , to_number(to_char(fecha, 'MM')) as mes
      from periodo
     group by to_number(to_char(fecha, 'YYYY'))
            , to_number(to_char(fecha, 'MM'))
     order by 1, 2;
begin
  for activo in (
    select *
      from activo_fijo
     where cod_activo_fijo in (
       'RACK SELECT05'
       )
    )
  loop
    for periodo in periodos loop
      depreciacion.elimina(periodo.ano, periodo.mes, activo.cod_activo_fijo);
      depreciacion.procesa(periodo.ano, periodo.mes, activo.cod_activo_fijo);
    end loop;
  end loop;
end;
