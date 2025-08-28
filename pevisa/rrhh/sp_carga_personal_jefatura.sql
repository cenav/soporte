create or replace procedure sp_carga_personal_jefatura(
  p_codemp varchar2
, p_cesado pls_integer := 0
, p_modulo varchar2
) as
begin
  delete from tmp_codigo_empleado;

  insert into tmp_codigo_empleado(c_codigo)
    with empleados as (
      select p.c_codigo, p.nombres, p.apellido_paterno, o.email, j.c_codigo as c_jefe
        from planilla10.personal p
             left join planilla10.hr_personal o on p.c_codigo = o.c_codigo
             left join planilla10.tar_encarga e on p.encargado = e.codigo
             left join planilla10.personal j on e.c_codigo = j.c_codigo
       where ((p.situacion not in (
         select s.codigo
           from planilla10.t_situacion_cesado s
         ) and p_cesado = 0) or p_cesado = 1)
      )
       , autorizados as (
      select u.codigo_trabajador as c_codigo
        from usuario_modulo um
             join usuarios u on um.usuario = u.usuario
       where um.modulo = p_modulo
         and um.supermaestro = 'SI'
      )
       , raiz as (
      select e.c_codigo, e.nombres, e.apellido_paterno, e.c_jefe
        from empleados e
       where (p_codemp in (
         select c_codigo
           from autorizados
         ) or e.c_codigo = p_codemp)
      )
       , jerarquia (c_codigo, nombres, apellido_paterno, c_jefe, nivel) as (
      select r.c_codigo, r.nombres, r.apellido_paterno, r.c_jefe, 1 as nivel
        from raiz r
       union all
      select e.c_codigo, e.nombres, e.apellido_paterno, e.c_jefe, j.nivel + 1
        from empleados e
             join jerarquia j on e.c_jefe = j.c_codigo
       where e.c_codigo != j.c_codigo -- evita ciclos directos
      )
  select j.c_codigo
    from jerarquia j;

end;

create public synonym sp_carga_personal_jefatura for sp_carga_personal_jefatura;