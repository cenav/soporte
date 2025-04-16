select c_codigo, c_codigo as codigo2, nombre, v.c_area, dsc_area, seccion, desc_seccion, turno
     , desc_horario, c_encargado, desc_encargado
  from vw_personal v
     , usuarios u
 where u.usuario(+) = v.usuario_encargado
   and v.c_area in ('001', '002', '003', '012', '013', '014', '015', '016', '017', '018', '019')
   and sector = '40'
   and situacion not in (8, 9)
   and c_codigo = 'E43397';

select *
  from planilla10.personal
 where c_codigo = 'E43397';

select *
  from vw_personal
 where c_codigo = 'E43397';

select *
  from planilla10.t_area
 order by c_area;

select * from planilla10.tar_secc order by codigo;

select c_codigo, c_codigo as codigo2, nombre
  from seccion_perxprod s
     , vw_personal v
     , pr_secciones ps
 where s.cod_seccion_per = v.seccion
   and ps.id = s.cod_seccion_prod
   and situacion not in (8, 9)
   and c_codigo = 'E43397';

select *
  from pr_secciones
 order by id;

select * from seccion_perxprod order by cod_seccion_per;

select *
  from modulo
 where id_modulo like '%VA_RETPED%';

select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and extract(year from fecha) = 2025;

select *
  from pr_parte_produccion
 where estado in (1, 2)
   and (id_seccion like :seccion or :seccion is null)
   and numero_op = 590740
   and id_trabajador = 'E41311';

select *
  from pr_parte_produccion
 where numero_op = 590740
   and id_trabajador = 'E41311';

select *
  from pr_proceso
 where codigo = 'CORI';