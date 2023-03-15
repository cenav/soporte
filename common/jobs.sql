begin
  dbms_scheduler.create_job(
      job_name => 'JOB_BONO_ANIVERSARIO'
    , job_type => 'STORED_PROCEDURE'
    , job_action => 'bonoaniv.tarea'
    , start_date => to_date('01/03/2022 07:00:00', 'DD/MM/YYYY HH24:MI:SS')
    , repeat_interval => 'FREQ=MONTHLY;INTERVAL=1'
    , auto_drop => false
    , enabled => true
    , comments => 'Relacion de trabajadores que ganan el bono aniversario'
    );
end;

begin
  dbms_scheduler.create_job(
      job_name => 'JOB_PREMIO_PUNTUALIDAD'
    , job_type => 'STORED_PROCEDURE'
    , job_action => 'puntualidad.automatico'
    , start_date => timestamp '2022-04-28 23:59:00 -5:00'
    , repeat_interval => 'FREQ=MONTHLY;INTERVAL=1'
    , auto_drop => false
    , enabled => true
    , comments => 'Relacion de trabajadores que ganan el premio por puntualidad'
    );
end;

begin
  dbms_scheduler.set_attribute(
      name => 'JOB_CORREO_SALDO_BANCOS'
    , attribute => 'JOB_ACTION'
    , value => 'saldobanco.mail'
    );
end;

-- call dbms_scheduler.drop_job('JOB_PREMIO_PUNTUALIDAD');

--call dbms_scheduler.disable('PEVISA.JOB_STOCK_EMBALAJES');

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