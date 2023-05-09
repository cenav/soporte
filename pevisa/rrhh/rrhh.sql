select *
  from planilla10.t_cargo;

select *
  from planilla10.t_area
 order by c_area;

select *
  from proceso_bono_oa
 where cod_emp = 'E41862'
 order by periodo_ini desc;

select *
  from planilla10.personal
 where apellido_paterno = 'CONTRERAS'
   and situacion not in (
     select *
       from planilla10.t_situacion_cesado
     );

select *
  from planilla10.ingre_fijo
 where c_concepto = '1001'
   and c_codigo = 'E820';

select *
  from planilla10.personal
 where c_codigo = 'E532';

select *
  from planilla10.doc_per
 where c_codigo = 'E532';

select *
  from planilla10.vw_utilidades_correos;

begin
    puntualidad.automatico(2023, 4);
end;