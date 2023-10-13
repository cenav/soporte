begin
  dbms_scheduler.create_job(
      job_name => 'JOB_FACTURAS_PENDIENTES_EXPO'
    , job_type => 'STORED_PROCEDURE'
    , job_action => 'FACTURAS_PENDIENTES_EXPO_XLS.LISTADO_PARA_VENDEDORES'
    , start_date => to_date('09/10/2023 16:30:00', 'DD/MM/YYYY HH24:MI:SS')
    , repeat_interval => 'FREQ=MONTHLY;BYMONTHDAY=9,10'
    , auto_drop => false
    , enabled => true
    , comments => 'envio automatico correo facturas pendientes exportacion'
    );
end;

begin
  dbms_scheduler.create_job(
      job_name => 'JOB_FACTURAS_PENDIENTES_EXPO'
    , job_type => 'STORED_PROCEDURE'
    , job_action => 'FACTURAS_PENDIENTES_EXPO_XLS.LISTADO_PARA_VENDEDORES'
    , start_date => timestamp '2023-10-09 16:30:00 -5:00'
    , repeat_interval => 'FREQ=MONTHLY;BYMONTHDAY=9,10'
    , auto_drop => false
    , enabled => true
    , comments => 'envio automatico correo facturas pendientes exportacion'
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

call dbms_scheduler.drop_job('JOB_FACTURAS_PENDIENTES_EXPO');

--call dbms_scheduler.disable('PEVISA.JOB_STOCK_EMBALAJES');

call dbms_scheduler.enable('JOB_CANCELACION_LEASING');

call dbms_scheduler.enable('JOB_CANCELACION_PAGARES');

select *
  from dba_scheduler_jobs
 where owner = upper('pevisa')
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

select *
  from all_source
 where upper(text) like upper('%procede recojo de reclamo%');

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