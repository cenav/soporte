call puntualidad.automatico(2024, 12);

call puntualidad.email(2024, 12);

select *
  from proceso_puntualidad
 order by id_proceso desc;

select *
  from proceso_puntualidad_pers
 where id_personal = 'E43229';

select *
  from proceso_puntualidad_pers
 where id_proceso = 29
   and meses_consecutivos = 2;

select p.cod_personal, p.persona, p.cod_encargado, p.encargado, p.tot_he_hr
     , p.tot_tardanza_hr, p.tingreso_fmt, p.trefrigerio_fmt, p.hes25_fmt, p.hes35_fmt, p.hedn_fmt
  from vw_puntualidad p
 where p.idperiodo = 3287
   and p.tot_tardanza_hr = 0
   and p.tot_he_hr >= 34
   and p.cod_personal = 'E43229';

select *
  from planilla10.personal
 where c_codigo = 'E43229';

select idperiodo
  from asistencia.periodo
 where extract(year from fecha_fin) = 2024
   and extract(month from fecha_fin) = 5;

  with detalle as (
    select v.idperiodo, v.cod_personal, v.persona, e.codigo as cod_encargado, e.nombre as encargado
         , sum(v.hes25) as hes25, sum(v.hes35) as hes35, sum(v.hedn) as hedn
         , sum(v.tingreso) as tingreso
         , sum(v.trefrigerio) as trefrigerio, sum(v.tot_he) as tot_he
         , sum(v.tot_tardanza) as tot_tardanza
      from vw_puntualidad_det v
           join planilla10.personal p on v.cod_personal = p.c_codigo
           join planilla10.tar_encarga e on p.encargado = e.codigo
     where p.sector in ('10', '40')
     group by v.idperiodo, v.cod_personal, v.persona, e.codigo, e.nombre
    )
select d.idperiodo, d.cod_personal, d.persona, d.cod_encargado, d.encargado
     , trunc(d.tot_he / 60) as tot_he_hr
     , trunc(d.tot_tardanza / 60) as tot_tardanza_hr
     , to_char(trunc(d.tingreso / 60), 'fm00') || ':' ||
       to_char(mod(d.tingreso, 60), 'fm00') as tingreso_fmt
     , to_char(trunc(d.trefrigerio / 60), 'fm00') || ':' ||
       to_char(mod(d.trefrigerio, 60), 'fm00') as trefrigerio_fmt
     , to_char(trunc(d.hes25 / 60), 'fm00') || ':' || to_char(mod(d.hes25, 60), 'fm00') as hes25_fmt
     , to_char(trunc(d.hes35 / 60), 'fm00') || ':' || to_char(mod(d.hes35, 60), 'fm00') as hes35_fmt
     , to_char(trunc(d.hedn / 60), 'fm00') || ':' || to_char(mod(d.hedn, 60), 'fm00') as hedn_fmt
  from detalle d;

select v.idperiodo, v.cod_personal, v.persona, e.codigo as cod_encargado, e.nombre as encargado
     , sum(v.hes25) as hes25, sum(v.hes35) as hes35, sum(v.hedn) as hedn
     , sum(v.tingreso) as tingreso
     , sum(v.trefrigerio) as trefrigerio, sum(v.tot_he) as tot_he
     , sum(v.tot_tardanza) as tot_tardanza
  from vw_puntualidad_det v
       join planilla10.personal p on v.cod_personal = p.c_codigo
       join planilla10.tar_encarga e on p.encargado = e.codigo
 where p.sector in ('10', '40')
   and v.cod_personal = 'E43229'
   and v.idperiodo = 3287
 group by v.idperiodo, v.cod_personal, v.persona, e.codigo, e.nombre;


declare
  l_emails     util.t_list := util.t_list();
  l_emails_txt util.string_type;
begin
  l_emails := rrhh.all_bosses_mails_from_employee('E1137');
  util.add_to_list(l_emails, 'jcabezas@pevisa.com.pe');
  util.add_to_list(l_emails, 'icatalan@pevisa.com.pe');
  util.add_to_list(l_emails, 'gthh@pevisa.com.pe');
--   l_emails_txt := util.concat_list(l_emails, '; ');
  l_emails_txt := util.concat_list(set(l_emails), '; ');
  dbms_output.put_line(l_emails_txt);
end;