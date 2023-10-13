-- CREATE USER ksiguenas PROFILE 'profile_usuario_sig';
alter user powerbi account unlock;


alter user gfalcon account lock;


alter user powerbi identified by "pevisa.123";


alter user epapel password expire;


grant select any table, insert any table, delete any table, update any table to asocial;


alter user epesado profile default;


-- Account locked
select username, account_status, created, lock_date, expiry_date
  from dba_users
 where username like 'POWERBI';

select *
  from dba_users
 where username like 'CBO%';

-- Dependencies
select *
  from dba_dependencies
 where referenced_name = 'VW_BONO_HE'
   and owner = user;

-- Invalid Objects
select owner, object_type, object_name, status
  from all_objects
 where status = 'INVALID'
   and owner = user;

-- Looping chain of synonyms
select s.owner as syn_owner
     , s.synonym_name as syn_name
     , s.table_owner as obj_owner
     , s.table_name as obj_name
     , case when o.owner is null then 'MISSING' else o.status end as obj_status
  from dba_synonyms s
       left join dba_objects o on s.table_owner = o.owner and s.table_name = o.object_name
 where o.owner is null
    or o.status != 'VALID';

-- acceso MGVENTAS
select *
  from seccrus
 where co_usrusr = 'PEVISA'
   and co_ctrctr = 'M_RECLAMOS';

select *
  from sig_conexiones
 where usuario = 'YBERROSPI'
 order by creacion_cuando desc;


select *
  from dba_registry
 where comp_id = 'APEX';



select *
  from dba_source
 where upper(text) like upper('%ubevilacqua%')
   and owner = 'PEVISA';


select *
  from all_source
 where upper(text) like upper('%Activación de código%')
   and owner = 'PEVISA';

select owner, table_name
  from all_tab_columns
 where column_name like '%KARDEX%'
   and owner = 'PEVISA';


select *
  from v$version;


select *
  from user_types;


select *
  from alcontrol
 where usuario in ('MFERNANDEZ', 'WQUISPE');


-- menu almacenes materia prima
select *
  from alcontrol
 where usuario in ('GPALOMINO', 'BETY');

select *
  from seccrus
 where co_usrusr = 'GPALOMINO';

select *
  from seccrus
 where co_usrusr in ('MVILLANUEVA');

select *
  from seccrus
 where co_ctrctr = 'M_COSTO_M'
   and co_usrusr = 'APASTRANA';

select *
  from usuarios
 where usuario = 'EALVITES';

select distinct co_ctrctr
  from seccrus
 order by 1;

select *
  from seccrus
 where co_ctrctr = 'M_CONSULTAS_M';


select *
  from seccrus
 where co_usrusr in ('JNEYRA');

-- copia menu a usuario
insert into tab_menu
select cod_menu
     , descripcion
     , menus
     , titulo
     , nivel
     , 'GCORDOVA'
     , estado
     , sistema
     , id_programa
  from tab_menu
 where usuario = 'CHARO'
   and sistema = 'M_LOGIST_M';

select *
  from tab_menu
 where usuario = 'GCORDOVA'
   and sistema = 'M_LOGIST_M';

select *
  from tab_menu
 where sistema = 'M_CONSULTAS';

select *
  from modulo;

select *
  from usuarios
 where usuario = 'MVILLANUEVA';

-- BRAMOS

select *
  from modulo
 where id_modulo like 'CAMPANA_SEGUIMIENTO';

select *
  from usuario_modulo
 where usuario in ('CNAVARRO', 'DCONTRERAS')
 order by usuario, modulo;

select *
  from usuario_modulo
 where usuario in ('CNAVARRO')
 order by usuario, modulo;

select *
  from usuario_modulo
 where modulo in ('CAMBIO_ESTADO_OA')
 order by usuario, modulo;

select *
  from modulo
 where descripcion like '%ESTADO%';

select *
  from usuario_modulo
 where usuario = 'APASTRANA'
   and modulo like 'CAJA%';

select *
  from usuario_modulo
 where modulo in ('PERMISO')
 order by usuario, modulo;

select *
  from usuario_modulo
 where usuario = 'NBELANDRIA';

select *
  from usuario_modulo_alterno
 where id_alterno in ('NBELANDRIA');

select *
  from usuario_modulo
 where usuario = 'JMANAYAY';

select *
  from usuario_modulo_alterno
 where id_alterno = 'JMANAYAY';

select *
  from usuario_modulo_alterno
 where id_usuario in ('HOLIVARES');

select *
  from usuario_modulo
 where modulo like 'PERMISO';


select *
  from usuario_modulo
 where modulo like 'ANALISIS_PLANILLA';


select *
  from usuario_modulo
 where modulo = 'PLAN_PRODUCCION';

select *
  from usuario_modulo
 where modulo = 'VACACIONES';

select *
  from tab_menu
 where sistema = 'M_RECLAMOS'
   and cod_menu in (
                    '4018', '401802'
   )
   and usuario in (
                   'ALBERTO', 'HOLIVARES', 'BULISES', 'JMENDEZ', 'MCASTILLA', 'DCONTRERAS',
                   'CFERNANDEZ',
                   'RGONZALES', 'MGARCIA', 'IVEGA', 'EJACHO', 'EVALIENTE', 'PEVISA', 'JCABEZAS',
                   'DTIRAVANTI'
   );


select *
  from usuario_modulo
 where usuario in ('BRAMOS')
 order by modulo;

-- copiar opciones de otro usuario
insert into usuario_modulo
select 'BRAMOS', modulo, maestro, supermaestro
  from usuario_modulo
 where usuario in ('EFLORES')
   and modulo not in ('CAMPANA_CARGA', 'CAMPANA_SEGUIMIENTO')
 order by modulo;

-- copiar opciones de otro usuario
insert into usuario_modulo
select 'ALBERTO', modulo, maestro, supermaestro
  from usuario_modulo u1
 where usuario in ('JCABEZAS')
   and not exists(
   select *
     from usuario_modulo u2
    where u2.usuario in ('ALBERTO')
      and u2.modulo = u1.modulo
   )
 order by modulo;

select *
  from usuario_modulo_alterno
 where id_alterno in ('KCASTILLO');

--49844

select *
  from usuario_modulo
 where modulo = 'SUBSIDIO'
 order by modulo;

select *
  from modulo
 where id_modulo = 'CONTROL_COVID';

select *
  from usuario_modulo
 where usuario in ('CFERNANDEZ')
 order by usuario, modulo;
select *
  from usuario_modulo_alterno
 where id_usuario = 'NBELANDRIA';

select *
  from usuario_modulo_alterno
 where id_alterno = 'CFERNANDEZ';

select *
  from otm_serie_usuario
 where usuario = 'AMUNANTE';

select *
  from usuarios
 where usuario = 'GPALOMINO';


select *
  from tab_menu
 where sistema = 'M_COSTO_M'
   and cod_menu = '300218';

select *
  from tab_menu
 where sistema = 'M_PRECIOS_M'
   and usuario = 'MCANALES';

select *
  from seccrus
 where co_usrusr = 'LSALCEDO';

select *
  from seccrus
 where co_usrusr = 'MGUIELAC';

-- ORACLE

-- APEX_030200
select username, account_status
  from dba_users
 where username like '%APEX%';

-- drop user apex_instance_admin_user cascade;

-- select dbms_xdb.gethttpport from dual;

-- version 3.2.1.00.12
select *
  from dba_registry
 where comp_id = 'APEX';

select distinct sgm.tablespace_name, dtf.file_name
  from dba_segments sgm
       join dba_data_files dtf on (sgm.tablespace_name = dtf.tablespace_name)
 where sgm.owner = 'PEVISA';

select *
  from dba_users
 where account_status = 'OPEN';

-- jmendez
-- 123.jmendez

select id_usuario
  from usuario_modulo_alterno
 where id_modulo = 'PERMISO'
   and id_alterno = 'JMENDEZ';

select u.usuario, u.nombres
  from usuarios u
       join dba_users d on u.usuario = d.username
 where d.account_status = 'OPEN'
 order by usuario;

select * from usuarios;

select *
  from seccrus
 where co_usrusr = 'GCORDOVA';

select *
  from seccrus
 where co_usrusr = 'BETY';

insert into tab_menu
select cod_menu
     , descripcion
     , menus
     , titulo
     , nivel
     , 'GCORDOVA'
     , estado
     , sistema
     , id_programa
  from tab_menu
 where usuario = 'BETY'
   and sistema = 'M_CONSULTAS_M';

select *
  from vendedores;

select *
  from usuario_modulo
 where usuario in ('MBONDY', 'APASTRANA')
 order by usuario, modulo;

-- CAMBIO_OT
select *
  from usuario_modulo
 where usuario = 'NBELANDRIA'
 order by modulo;

select *
  from usuarios
 where usuario in ('BRAMOS', 'EFLORES', 'PEVISA');

select *
  from usuarios_almacenes
 where usuario in ('MVILLANUEVA', 'ASEGURIDAD');

insert into usuarios_almacenes_perfil
select 'MVILLANUEVA', cod_alm, tp_transac, insertar_registros, consulta, estado
  from usuarios_almacenes_perfil
 where usuario = 'ASEGURIDAD'
 order by cod_alm, tp_transac;

select *
  from almacenes_perfil
 where cod_alm = '30'
 order by tp_transac;

select *
  from pr_usualma
 where usuario = 'LARIAS'
 order by cod_alm;

select *
  from usuarios_almacenes_perfil
 where usuario = 'MPEREZ';

select *
  from gastos_de_viaje_habilitado
 where id_vendedor = '77'
   and numero = 236;

select *
  from gastos_de_viaje
 where id_vendedor = '77'
   and numero = 236;

select *
  from gastos_de_viaje
 where id_vendedor = '77'
   and num_habilitado = 236;


select *
  from tab_menu
 where usuario = 'MGARCIA'
   and sistema = 'M_LOGIST_M';


select *
  from tab_menu
 where usuario = 'JQUISPE'
   and sistema = 'M_LOGIST_M'
   and estado = '1'
 order by cod_menu;

select *
  from seccrus
 where co_usrusr = 'MVILLANUEVA';

select *
  from seccrus
 where co_usrusr = 'SARA';

select a.tp_transac as tp_transac, b.descripcion as descripcion
  from usuarios_almacenes_perfil a
     , transacciones_almacen b
 where a.usuario = 'MFERNANDEZ'
   and a.cod_alm = '03'
   and a.tp_transac = b.tp_transac
   and b.ingreso_salida = 'I'
   and a.tp_transac <> '11'
   and a.estado = 1;

select *
  from usuarios_almacenes_perfil
 where usuario = 'CFERNANDEZ'
   and cod_alm = 'D2';

select *
  from usuarios_libros
 where usuario = 'SCASTRO';

select *
  from planilla10.personal
 where apellido_paterno = 'ALVITES';

select *
  from usuarios
 where nombres like '%PA%';

select * from pcarticul;

select *
  from usuario_modulo
 where modulo like 'CAMBIO_OT';

select 'GRANT SELECT ON ' || object_name || ' TO USERNAME;'
  from user_objects
 where object_type = 'TABLE' and object_name != 'PLANILLA'
 order by object_name;

select *
  from usuarios
 where usuario = 'ECOMMERCE';

select *
  from traslados_almacenes
 where cod_alm_origen = 'A1';

select *
  from traslados_almacenes
 where cod_alm_origen = '62';

select *
  from pr_usualma
 where usuario = 'MPEREZ'
   and cod_alm = 'A1';

select *
  from usuarios_almacenes
 where usuario = 'MPEREZ'
   and cod_alm in ('A1', '62');

select *
  from usuarios_almacenes_perfil
 where usuario = 'MPEREZ'
   and cod_alm in ('A1', '62');

select *
  from transacciones_almacen
 where tp_transac = '27';

create public synonym mxx_login for mxx_login;

grant select any table to pruebas;

select *
  from otm_serie_usuario
 where usuario = 'EALVITES';

select *
  from tab_menu
 where usuario = 'EALVITES'
   and sistema = 'M_LOGIST_M';

select *
  from tab_menu
 where cod_menu = '6041'
   and sistema = 'M_SOLIMAT_M';

select * from menu_inventario;

select * from kardex_g_movglos;

select cod_alm, tp_transac, serie, numero
  from kardex_g_movglos
 where serie_oc = '30'
   and numero_oc = '519';

select a.cod_activo_fijo
  from kardex_d k
       join activo_fijo a on k.cod_art = a.cod_activo_fijo
 where cod_alm = 'A3'
   and tp_transac = '11'
   and serie = 1
   and numero = 30472;

select * from activo_fijo_asiento;

select *
  from docuvent
 where tipodoc = '01'
   and numero = 15936
   and serie = 'F055';

select *
  from itemdocu
 where tipodoc = '01'
   and numero = 15936
   and serie = 'F055';

select to_char(pr_numot) as pr_numot, cod_art, cantidad, to_char(fch_transac, 'DD/MM/YYYY') as fecha
     , fch_transac
  from kardex_d
 where tp_transac = '18'
   and cod_alm = :xalmacen
   and cod_art = :art_cod_art
   and pr_tipot = :pr_tipo_orden
 order by fch_transac;

select *
  from transacciones_almacen
 where tp_transac = '18';

select *
  from tab_menu
 where usuario = 'LDANIEL';

select *
  from usuario_modulo
 where modulo = 'VACACIONES'
   and usuario = 'JFIGUEROA';

select *
  from planilla10.personal
 where c_codigo = 'E017';

select *
  from planilla10.personal
 where apellido_paterno like '%MESTANZA%';

select *
  from cobradores_recibos
 where codigo_cobrador = 'G5';

select *
  from clientes
 where grupo != 'S';

select *
  from notificacion
 where sistema = 'ACTIVO_FIJO'
   and proceso = 'ACTIVACION';

select * from vw_proveed_volumen_compra;