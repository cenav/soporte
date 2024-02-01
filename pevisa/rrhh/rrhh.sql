select *
  from planilla10.t_cargo
 where c_cargo = 'AP';

select *
  from planilla10.t_area
 order by c_area;

select *
  from proceso_bono_oa
 where cod_emp = 'E41862'
 order by periodo_ini desc;

select *
  from planilla10.personal
 where apellido_paterno = 'GARCIA'
   and situacion not in (
   select *
     from planilla10.t_situacion_cesado
   );

select *
  from planilla10.ingre_fijo
 where c_concepto = '1001'
   and c_codigo = 'E840';

select *
  from planilla10.personal
 where c_codigo = 'E123';

select *
  from planilla10.doc_per
 where c_codigo = 'E532';

select *
  from planilla10.vw_utilidades_correos;

begin
  puntualidad.automatico(2023, 4);
end;

select * from planilla10.plcontrol;

select *
  from planilla10.personal
 where apellido_paterno like 'ZA%';

select *
  from planilla10.personal
 where c_codigo = 'E41311';

select *
  from permiso
 where numero = 59050;