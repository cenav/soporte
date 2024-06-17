-- CTE common table expression (recursion)
  with numbers(n) as ( -- CTE name
    select 1 as n
      from dual -- base condition, first iteration show these results
     union all
    select n + 1 -- n refers to de previos result, in the first case 1 from base condition
      from numbers -- call to recursive
     where n < 10 -- termination condition to avoid infinetly loops
    )
select *
  from numbers;

-- todos de jefes de un empleado
  with empleados as (
    select p.c_codigo, p.nombres, p.apellido_paterno, j.c_codigo as c_jefe
      from planilla10.personal p
           left join planilla10.tar_encarga e on p.encargado = e.codigo
           left join planilla10.personal j on e.c_codigo = j.c_codigo
    )
     , jerarquia(c_codigo, nombres, apellido_paterno, c_jefe) as (
    select e.c_codigo, e.nombres, e.apellido_paterno, c_jefe
      from empleados e
     where e.c_codigo = 'E1084'
     union all
    select e.c_codigo, e.nombres, e.apellido_paterno, e.c_jefe
      from jerarquia b
           join empleados e on b.c_jefe = e.c_codigo
     where e.c_codigo != e.c_jefe
    )
select b.c_codigo, b.nombres, b.apellido_paterno, b.c_jefe, e.nombres, e.apellido_paterno
  from jerarquia b
       join empleados e on b.c_jefe = e.c_codigo;

-- todos de emplados de un jefe
  with empleados as (
    select p.c_codigo, p.nombres, p.apellido_paterno, j.c_codigo as c_jefe
      from planilla10.personal p
           left join planilla10.tar_encarga e on p.encargado = e.codigo
           left join planilla10.personal j on e.c_codigo = j.c_codigo
     where p.situacion not in (
       select codigo
         from planilla10.t_situacion_cesado
       )
    )
     , jerarquia(c_codigo, nombres, apellido_paterno, c_jefe) as (
    select e.c_codigo, e.nombres, e.apellido_paterno, c_jefe
      from empleados e
     where e.c_codigo = 'E1138'
     union all
    select e.c_codigo, e.nombres, e.apellido_paterno, e.c_jefe
      from jerarquia b
           join empleados e on b.c_codigo = e.c_jefe
     where e.c_codigo != e.c_jefe
    )
select b.c_codigo, b.nombres, b.apellido_paterno, b.c_jefe, e.nombres, e.apellido_paterno
  from jerarquia b
       join empleados e on b.c_jefe = e.c_codigo;
