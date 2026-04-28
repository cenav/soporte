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
      job_name => 'JOB_ALERTA_STOCK'
    , job_type => 'STORED_PROCEDURE'
    , job_action => 'reporte_alerta_stock.envia_correo'
    , start_date => timestamp '2025-11-01 00:00:00 -5:00'
    , repeat_interval => 'FREQ=WEEKLY;BYDAY=MON;BYHOUR=8;BYMINUTE=0;BYSECOND=0'
    , auto_drop => false
    , enabled => true
    , comments => 'reporte de stock de reposicion e IQF'
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

begin
  dbms_scheduler.set_attribute(
      name => 'JOB_STOCK_ALMACEN_63',
      attribute => 'repeat_interval',
      value => 'FREQ=DAILY;BYHOUR=6;BYMINUTE=0;BYSECOND=0'
  );
end;

call dbms_scheduler.run_job('JOB_FACT_NO_EMB1');

call dbms_scheduler.drop_job('JOB_AVANCE_REGISTRO_PLANOS');

call dbms_scheduler.disable('JOB_PREMIO_PUNTUALIDAD');

call dbms_scheduler.enable('JOB_CANCELACION_LEASING');

call dbms_scheduler.enable('JOB_CANCELACION_PAGARES');

call dbms_scheduler.enable('JOB_AVANCE_REGISTRO_PLANOS');

select *
  from dba_scheduler_jobs
 where owner = upper('pevisa')
   and upper(job_action) like upper('%reporte%')
 order by job_name;

select *
  from dba_scheduler_jobs
 where owner = upper('pevisa')
   and upper(job_name) like '%PLANOS%'
 order by job_name;


select *
  from dba_scheduler_jobs
 where owner = upper('pevisa')
   and upper(job_action) like upper('%REPORTE_TRX_PENDIENTE_TRANSITO%')
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

select *
  from powerbi.pbi_planeamiento_estados
 where tipo = 'AR'
   and numero = 1104903;

select user as usuario, a.tipo, a.serie, a.numero, a.estado, a.estado_old
     , to_char(a.fecha, 'DD/MM/YYYY HH24:MI:SS') as fecha, a.t4 as fecha_fin_de_mes
     , a.usuario as usuario_armado, a.t1, b.abre01 as pedido, b.abre02 as cliente
     , c.totlin as importe, b.cant_prog as cantidad, b.formu_art_cod_art, (
  select distinct 'IMPRESO'
    from vw_ot_impresos_planeamiento_20 i
   where i.numero = b.numero
   union
  select distinct 'IMPRESO'
    from pr_trasab_estado pte
   where pte.numero = b.numero
     and estado in ('2', '3', '4', '5', '6', '7')
  ) as impreso, (
  select max(pk_numero)
    from pk_detal
   where ot_numero = a.numero
     and ot_serie = a.serie
     and ot_tipo = a.tipo
     and estado < '9'
  ) as numero_packing, (
  select count(distinct pk_numero)
    from pk_detal
   where ot_numero = a.numero
     and ot_serie = a.serie
     and ot_tipo = a.tipo
     and estado < '9'
  ) as contador_packing, (
  select numero || '  ' || to_char(fecha, 'DD/MM/YYYY')
    from exfacturas
   where paclis =
         (
           select max(pk_numero)
             from pk_detal
            where ot_numero = a.numero
              and ot_serie = a.serie
              and ot_tipo = a.tipo
              and estado < '9'
           )
     and estado < '9'
  ) as numero_y_fecha_factura, (
  select fch_impresion
    from vw_ot_impresos_planeamiento_20
   where numero = a.numero
  ) as fch_impresion_ot, (
  select min(fecha)
    from pr_trasab_estado
   where numero = a.numero
     and tipo = a.tipo
     and serie = a.serie
  ) as fch_impresion_estado
  from pr_trasab_estado a
     , pr_ot b
     , vw_ot_total_planeamiento_25 c
 where a.tipo = 'AR'
   and a.serie = 3
   and trunc(a.fecha) >= trunc(to_date('31/05/2025', 'dd/mm/yyyy'))
   and a.numero = b.numero
   and a.serie = b.nuot_serie
   and a.tipo = b.nuot_tipoot_codigo
   and b.abre01 = c.numero
   and b.destino = c.destino
   and b.per_env = c.nro
   and b.nuot_tipoot_codigo = 'AR'
   and b.numero = 1104903
   --and  b.estado < '7'
   --and  b.estado not in('9')
   and b.abre02 not like 'PC1%'
   and b.cod_lin not in ('1970', '1971', '1972');

select *
  from powerbi.pbi_planeamiento_estados
 where tipo = 'AR'
   and numero = 1104903
 order by fecha desc;

begin
  powerbijob.estados_oa(to_date('31/05/2025', 'dd/mm/yyyy'));
end;

select * from pr_trasab_estado;

