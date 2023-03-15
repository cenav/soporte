declare
  cursor periodos is
      with periodo as (
         select trunc(to_date('31/12/2022', 'DD/MM/YYYY') + 1 - rownum) as fecha
           from dual
        connect by rownum < 90
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
       '04LAPT41'
       )
    )
  loop
    for periodo in periodos loop
      depreciacion.procesa(periodo.ano, periodo.mes, activo.cod_activo_fijo);
    end loop;
  end loop;
end;