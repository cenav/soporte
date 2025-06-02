begin
  dbms_scheduler.create_job(
      job_name => 'JOB_RSC'
    , job_type => 'STORED_PROCEDURE'
    , job_action => 'rsc.tarea'
    , start_date => to_date('15/03/2024 16:30:00', 'DD/MM/YYYY HH24:MI:SS')
    , repeat_interval => 'FREQ=MONTHLY;BYMONTHDAY=9,10'
    , auto_drop => false
    , enabled => true
    , comments => 'envio automatico correo facturas pendientes exportacion'
  );
end;

begin
  dbms_scheduler.create_job(
      job_name => 'JOB_AVANCE_REGISTRO_PLANOS'
    , job_type => 'STORED_PROCEDURE'
    , job_action => 'rpt_piezas_vs_registro.enviar_reporte'
    , start_date => timestamp '2025-05-12 09:00:00 -5:00'
    , repeat_interval => 'FREQ=WEEKLY;BYDAY=MON'
    , auto_drop => false
    , enabled => true
    , comments => 'Reporte de avance de carga de planos'
  );
end;

begin
  dbms_scheduler.create_job(
      job_name => 'JOB_POWERBI_ESTADOS_OA'
    , job_type => 'STORED_PROCEDURE'
    , job_action => 'powerbijob.estados_oa'
    , start_date => timestamp '2025-05-13 20:00:00 -5:00'
    , repeat_interval => 'FREQ=HOURLY;INTERVAL=1'
    , auto_drop => false
    , enabled => true
    , comments => 'carga cada hora el reporte de estado de ordenes de arado para el power bi'
  );
end;


begin
  dbms_scheduler.create_job(
      job_name => 'JOB_MATRIZ_VS_PIEZA'
    , job_type => 'STORED_PROCEDURE'
    , job_action => 'pkg_matriz_vs_pieza_xls.listado'
    , start_date => timestamp '2025-02-09 23:50:00 -5:00'
    , repeat_interval => 'FREQ=DAILY'
    , auto_drop => false
    , enabled => true
    , comments => 'herramental vs pieza registrado por operarios de produccion'
  );
end;

begin
  dbms_scheduler.set_attribute(
      name => 'JOB_CORREO_SALDO_BANCOS'
    , attribute => 'JOB_ACTION'
    , value => 'saldobanco.mail'
  );
end;

call dbms_scheduler.run_job('JOB_FACT_NO_EMB1');

call dbms_scheduler.drop_job('JOB_AVANCE_REGISTRO_PLANOS');

--call dbms_scheduler.disable('PEVISA.JOB_STOCK_EMBALAJES');

call dbms_scheduler.enable('JOB_CANCELACION_LEASING');

call dbms_scheduler.enable('JOB_CANCELACION_PAGARES');

call dbms_scheduler.enable('JOB_AVANCE_REGISTRO_PLANOS');

select *
  from dba_scheduler_jobs
 where owner = upper('pevisa')
 order by job_name;

select *
  from dba_scheduler_jobs
 where owner = upper('pevisa')
   and upper(job_name) like '%PLANOS%'
 order by job_name;

select *
  from dba_scheduler_jobs
 where owner = upper('pevisa')
   and job_name like '%BOSCH%'
 order by job_name;

-- SP_CORREO_STOCK_BOSCH
select *
  from dba_scheduler_jobs
 where owner = upper('pevisa')
   and job_action like '%VALID%'
 order by job_name;

select *
  from dba_scheduler_jobs
 where owner = upper('pevisa')
   and lower(job_action) like '%notif_matriceria%'
 order by job_name;

select job_name, job_action, start_date, repeat_interval
  from dba_scheduler_jobs
 where owner = upper('pevisa')
 order by job_name;

select *
  from dba_scheduler_jobs
 where owner = upper('pevisa')
   and job_name = 'JOB_BONO_ANIVERSARIO';

select *
  from dba_scheduler_jobs
 where job_name = 'JOB_PREMIO_PUNTUALIDAD';

select *
  from user_scheduler_jobs;

select * from all_directories;

select *
  from all_source
 where upper(text) like upper('%spastrana@pevisa.com.pe%');

select *
  from all_source
 where upper(text) like upper('%pr_prioridad_htmp_30%')
   and owner = 'PEVISA';

select *
  from dba_source
 where upper(text) like upper('%Codigos en linea de validacion%')
   and owner = 'PEVISA';

select sysdate
  from dual;

-- call puntualidad.automatico(2022, 5);

select * from all_directories;
-- \\10.0.0.125\powerbi-pevisa

begin
  powerbijob.estados_oa();
end;

select *
  from powerbi.pbi_planeamiento_estados
 where trunc(fecha) = trunc(sysdate);
