-- reprocesa depreciación
begin
  for activo in (
    select *
      from activo_fijo
     where cod_activo_fijo in (
       'EQ DIV352-2'
       )
    )
  loop
    depreciacion.reprocesa('31/12/2018', '30/09/2024', activo.cod_activo_fijo);
  end loop;
end;

-- Elimina depreciación
begin
  for deprec in (
    select *
      from activo_fijo_depreciacion
     where cod_activo_fijo = 'EQ DIV352'
     order by fecha desc
    )
  loop
    delete
      from activo_fijo_depreciacion
     where cod_activo_fijo = deprec.cod_activo_fijo
       and cod_tipo_depreciacion = deprec.cod_tipo_depreciacion
       and moneda = deprec.moneda
       and fecha = deprec.fecha;
  end loop;
end;

-- reprocesa depreciación antigua
declare
  cursor periodos is
      with intervalo as (
        select to_date('01/09/2024', 'dd/mm/yyyy') as desde
             , to_date('30/09/2024', 'dd/mm/yyyy') as hasta
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
                               'MQ1LJEB-004', 'MQ1LJEB-004 INS1', 'MQ1LJEB-005', 'MQ1LJEB-005 INS1',
                               'MQ1PLP-007'
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

declare
  s     date := '01/12/2024';
  e     date := '31/12/2024';
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

select *
  from activo_fijo_depreciacion
 where cod_activo_fijo = 'MQ1PLP-007'
 order by fecha desc;

select * from activo_fijo
where cod_activo_fijo = 'MQ1PLP-007';