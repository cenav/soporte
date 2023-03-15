select * from planilla10.t_cargo;

select * from planilla10.t_area order by c_area;

select *
  from proceso_bono_oa
 where cod_emp = 'E41862'
 order by periodo_ini desc;

select *
  from planilla10.personal
 where apellido_paterno = 'DIAZ'
   and nombres like '%MIULER%';

select i.*
  from planilla10.ingre_fijo i
       join planilla10.personal p on i.c_codigo = p.c_codigo
 where i.c_concepto = '1001'
   and i.valor = 2500
   and p.situacion not in (
   select p.situacion
     from planilla10.t_situacion_cesado
   );