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

declare
  s     date := to_date('01/12/2022', 'dd/mm/yyyy');
  e     date := to_date('31/12/2022', 'dd/mm/yyyy');
  ndays number;
begin
  ndays := e - s + 1;
  for i in 1..ndays loop
    dbms_output.put_line(s);
    s := s + 1;
  end loop;
end;

 select trunc(to_date('31/12/2022', 'DD/MM/YYYY') + 1 - rownum) as fecha
   from dual
connect by rownum < 90;

begin
  depreciacion.reprocesa(
      to_date('01/09/2022', 'dd/mm/yyyy')
    , to_date('31/12/2022', 'dd/mm/yyyy')
    , 'RACK SELECT04'
    );
end;