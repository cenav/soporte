declare
  cursor periodos is
      with intervalo as (
        select to_date('01/06/2024', 'dd/mm/yyyy') as desde
             , to_date('30/06/2024', 'dd/mm/yyyy') as hasta
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
                               'LICENCIA COREL14', 'LICENCIA A.CAD07', '04LAPT26', 'AC1RET-012',
                               'EQ DIV315', 'EQ COMP/OF SEG', '02CAMA2', '02CAMA3', '02CAMA4',
                               '02CAMA1', 'SECS PINT AREN FOSF MET MAN15',
                               'SECS PINT AREN FOSF MET MAN16', 'MQ2MATR-074', 'EQ DIV107',
                               '03BOBI146', '03BOBI147', '03BOBI148', '02SILL2', '03IMPR1',
                               '02MUEB25', 'EQ DIV96', 'EQ DIV120', '02IMPR10', '02LOCK1',
                               '03HERR44', '03CAMA1', 'MQ2MATR-064 INST1', '02ANDA26',
                               'AC1LJEB-011', 'AC1LJEB-012', 'EQ DIV2', 'EQ MEDIC35'
       )
    )
  loop
    for periodo in periodos loop
      --       depreciacion.elimina(periodo.ano, periodo.mes, activo.cod_activo_fijo);
      depreciacion.procesa(periodo.ano, periodo.mes, activo.cod_activo_fijo);
    end loop;
  end loop;
end;
