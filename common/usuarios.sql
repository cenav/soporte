-- CREATE USER ksiguenas PROFILE 'profile_usuario_sig';
alter user cmarcelo account unlock;


alter user apastrana account lock;


alter user wcoronel identified by "patg10$vt";


alter user jquispeb password expire;


grant select any table, insert any table, delete any table, update any table to asocial;

-- Account locked
select username, account_status, created, lock_date, expiry_date
  from dba_users
 where username like 'PEVISA';

select *
  from dba_users
 where username like 'CBO%';

-- Dependencies
select *
  from dba_dependencies
 where referenced_name = 'PKG_ANTIGUEDAD_INVENTARIO'
   and owner = user;

-- Invalid Objects
select owner, object_type, object_name, status
  from all_objects
 where status = 'INVALID'
   and owner = user;

-- Looping chain of synonyms
select s.owner                                                    as syn_owner
     , s.synonym_name                                             as syn_name
     , s.table_owner                                              as obj_owner
     , s.table_name                                               as obj_name
     , case when o.owner is null then 'MISSING' else o.status end as obj_status
  from dba_synonyms s
       left join dba_objects o on s.table_owner = o.owner and s.table_name = o.object_name
 where o.owner is null
    or o.status != 'VALID';


select *
  from sig_conexiones
 where usuario = 'YBERROSPI'
 order by creacion_cuando desc;


select *
  from dba_registry
 where comp_id = 'APEX';


-- busca procedimineto
select *
  from dba_source
 where upper(text) like upper('%asiscont3@pevisa.com.pe%')
   and owner = 'PEVISA';


select *
  from all_source
 where upper(text) like upper('%La comunidad de Colaboradores de%')
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
 where co_usrusr = '';

select *
  from seccrus
 where co_usrusr in ('MVILLANUEVA');

select *
  from seccrus
 where co_ctrctr = 'M_COSTO_M'
   and co_usrusr = 'APASTRANA';

select *
  from usuarios
 where usuario = 'ADELA';

select *
  from planilla10.hr_personal
 where c_codigo = 'E840';

select *
  from planilla10.personal
 where apellido_paterno = 'QUISPE';

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

select *
  from planilla10.personal
 where apellido_paterno = 'VILLANUEVA'
 order by f_ingreso desc;

-- BRAMOS

select *
  from modulo
 where id_modulo like 'CAMPANA_SEGUIMIENTO';

select *
  from usuario_modulo
 where usuario in ('GPALOMINO', 'DCONTRERAS')
 order by usuario, modulo;

select *
  from usuario_modulo
 where modulo in ('EMBARQUES')
 order by usuario, modulo;

select *
  from modulo
 where id_modulo like '%HALLAZGO%';

select *
  from usuario_modulo
 where usuario = 'APASTRANA'
   and modulo like 'CAJA%';

select *
  from serie_caja_usuario
 where usuario = 'APASTRANA';

insert into serie_caja_usuario
select id_serie, 'APASTRANA', maestro, supermaestro
  from serie_caja_usuario
 where usuario = 'PEVISA';

select *
  from usuario_modulo
 where modulo in ('PERMISO')
 order by usuario, modulo;

select *
  from usuario_modulo
 where usuario = 'KCASTILLO';

select *
  from usuario_modulo_alterno
 where id_alterno in ('KCASTILLO');

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
  from planilla10.tar_encarga
 where estado = 1;

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
  from serie_caja
 order by id_serie;

select *
  from serie_caja_usuario
 where usuario = 'RBARRIENTOS';

select *
  from usuario_modulo
 where usuario in ('CFERNANDEZ')
 order by usuario, modulo;

select *
  from serie_caja_usuario
 where usuario in ('EFLORES', 'PEGUILUZ');

select *
  from serie_caja_usuario
 where usuario = 'RBARRIENTOS';

select *
  from serie_caja
 order by id_serie;

select *
  from caja;

select *
  from planilla10.personal
 where apellido_paterno like '%BARRIENTOS%';

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

select *
  from planilla10.tar_encarga
 where upper(usuario) = 'LARANIBAR';

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


select *
  from usuario_modulo
 where usuario = 'CFERNANDEZ'
 order by modulo;

select *
  from serie_caja;

select *
  from serie_caja_usuario
 where id_serie = 1;

select *
  from planilla10.personal
 where apellido_paterno = 'RAMOS'
   and situacion not in ('8', '9');

select *
  from usuarios
 where usuario in ('BRAMOS', 'EFLORES', 'PEVISA');

select *
  from caja
 where id_serie = 1
   and id_numero = 5;

select *
  from planilla10.personal
 where c_codigo = 'E42421';

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
 where usuario = 'MROJAS';

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
  from usuarios_almacenes_perfil a, transacciones_almacen b
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
  from pr_usualma
 where usuario = 'CFERNANDEZ';

select *
  from activo_fijo
 where cod_activo_fijo = 'MAQ4GEN-003';

select *
  from pr_for_ins;

-- codigo prueba 30015MLS

-- jneira

select *
  from planilla10.tar_encarga
 order by nombre;

select *
  from planilla10.personal
 where apellido_paterno = 'NEYRA';

select *
  from planilla10.t_cargo
 where c_cargo = 'JADT';

select *
  from planilla10.personal
 where encargado = '044';

select per.c_codigo
     , per.apellido_paterno || ' ' || per.apellido_materno || ', ' || per.nombres as nombre
  from planilla10.personal per
     , planilla10.tar_encarga enc
 where per.c_codigo = enc.c_codigo
   and per.situacion not in ('8', '9')
   and upper(enc.usuario) like (case
                                    when :usuario in (
                                        select usuario
                                          from usuario_modulo
                                         where modulo = 'EVALUACION'
                                           and maestro = 'SI'
                                        ) then '%'
                                    else upper(:usuario)
                                end)
 order by per.apellido_paterno;

select *
  from usuario_modulo
 where usuario = 'JCABEZAS'
 order by modulo;

select *
  from usuario_modulo
 where usuario = 'JNEYRA';

select per.c_codigo
     , per.apellido_paterno || ' ' || per.apellido_materno || ', ' || per.nombres as nombre
     , per.conini
     , per.confin
     , per.clase
  from planilla10.personal per
     , planilla10.tar_encarga enc
 where per.encargado = enc.codigo
   and enc.c_codigo = 'E961'
   and per.situacion not in ('8', '9')
 order by per.apellido_paterno;

select a.cod_alm, t.descripcion, a.nombre
  from pr_usualma a, tablas_auxiliares t
 where a.cod_alm = t.codigo
   and t.tipo = '33'
   and a.usuario = 'JNEYRA'
 order by a.cod_alm;

select *
  from pr_usualma
 where usuario = 'MFERNANDEZ'
 order by cod_alm;

select *
  from usuarios_almacenes_perfil
 where usuario = 'AVULCANO'
   and cod_alm = '41';

select a.cod_alm, t.descripcion, a.nombre
  from pr_usualma a, tablas_auxiliares t
 where a.cod_alm = t.codigo
   and t.tipo = '33'
   and a.usuario = 'MFERNANDEZ'
 order by a.cod_alm;

select ua.cod_alm as cod_alm, a.descripcion as descripcion
  from usuarios_almacenes ua, almacenes a
 where usuario = 'AVULCANO'
   and ua.cod_alm = a.cod_alm
   and nvl(ua.estado, 0) = 1
 order by 1;

select ap.tp_transac as tp_trasac, ta.descripcion as descripcion
  from almacenes_perfil ap, transacciones_almacen ta
 where ap.tp_transac = ta.tp_transac
   and cod_alm = '41'
   and ta.ingreso_salida = 'S'
   and nvl(ap.estado, 0) = '1'
 order by 1;

select *
  from almacenes_perfil
 where cod_alm = '41';

select *
  from otm_serie_usuario
 where usuario = 'HOLIVARES';

-- 01

select *
  from kardex_d;

select *
  from seccrus
 where co_usrusr = 'MPRIMA';

select *
  from seccrus
 where co_ctrctr = 'M_PLANEAMIENTO_M';

select *
  from sistemas;

select *
  from pr_ot_impresion;


select t.codigo, t.descripcion
  from tablas_auxiliares t
 where t.tipo = 33
   and t.codigo <> '....'
   and exists
     (
         select *
           from usuarios_almacenes_perfil uap
          where uap.usuario = user
            and uap.cod_alm = t.codigo
            and uap.tp_transac = '51'
            and nvl(uap.estado, 0) = 1
         )
 order by t.codigo;

select *
  from usuarios_almacenes_perfil
 where usuario = 'HOLIVARES';


select t.codigo, t.descripcion
  from tablas_auxiliares t
 where t.tipo = 33
   and t.codigo <> '....'
   and exists
     (
         select *
           from usuarios_almacenes_perfil uap
          where uap.usuario = user
            and uap.cod_alm = t.codigo
            and uap.tp_transac = :tp_transac_ing
            and nvl(uap.estado, 0) = 1
         )
 order by t.codigo;


select *
  from orden_de_compra_historia
 where serie = 22
   and num_ped = 19
 order by creacion_cuando;

select *
  from ruta_docvirtual;

-- 6434

select *
  from otm_serie_usuario
 where usuario = 'JNEYRA'
 order by id_serie;
--


select per.c_codigo
     , per.apellido_paterno || ' ' || per.apellido_materno || ', ' || per.nombres as nombre
  from planilla10.personal per
     , planilla10.tar_encarga enc
 where per.c_codigo = enc.c_codigo
   and per.situacion not in ('8', '9')
   and (upper(enc.usuario) = (
     select usuario
       from usuario_modulo
      where usuario = :user
        and modulo = :modulo
      union
     select id_usuario
       from usuario_modulo_alterno
      where id_alterno = :user
        and id_modulo = :modulo
     ) or :user in (
     select usuario
       from usuario_modulo
      where modulo = :modulo
        and maestro = 'SI'
     ))
 order by per.apellido_paterno;

select *
  from evaluacion
 where (:user in (
     select usuario
       from usuario_modulo
      where modulo = :modulo
        and maestro = 'SI'
     ) or id_evaluador = (
     select c_codigo
       from planilla10.tar_encarga
      where (upper(usuario) = upper(:user) or
             upper(usuario) = (
                 select id_usuario
                   from usuario_modulo_alterno
                  where id_alterno = :user
                    and id_modulo = :modulo
                 ))
     ));

select *
  from serie_caja
 order by id_serie;

select *
  from serie_caja_usuario
 where usuario = 'BRAMOS';

select *
  from planilla10.personal
 where apellido_paterno = 'MIRANDA';

select *
  from caja
 where id_serie = 1
 order by id_numero desc;

select *
  from usuarios
 where usuario = 'MBONDY';

select *
  from grupo_cliente;

select *
  from grupo_cliente_cliente;

select *
  from usuario_modulo
 where modulo = 'CAMBIO_OT';

select *
  from planilla10.personal
 where c_codigo = 'E42660';

select *
  from planilla10.personal
 where c_codigo = 'E42660';

select *
  from planilla10.tar_secc
 where codigo = '17';

select *
  from kardex_g_historia
 where cod_alm = '03'
   and tp_transac = '08'
   and serie = 1
   and numero = 21495;

select *
  from usuarios
 where usuario = 'ECHINCHA';

select *
  from tmp_imprime_ot;

-- 80275CS-2

-- DDIAZ
-- FURTEAGA

select *
  from planilla10.personal
 where encargado = '006'
   and situacion not in ('8', '9');

select *
  from planilla10.tar_encarga
 where codigo = '006';

select *
  from usuario_modulo
 where usuario = 'MGUIELAC'
   and modulo = 'EVALUACION';

select *
  from usuario_modulo_alterno
 where id_alterno = 'MGUIELAC';

select *
  from usuario_modulo_alterno
 where id_usuario = 'MGUIELAC';

select *
  from planilla10.personal
 where apellido_paterno = 'GARCIA';

select *
  from planilla10.t_cargo
 where c_cargo = 'CTH';

select *
  from usuario_modulo
 where modulo like 'CAMPANA%';

select *
  from usuario_modulo
 where usuario = 'HOCANA';

select *
  from usuario_modulo
 where usuario = 'LSALCEDO';

select *
  from usuario_modulo
 where usuario = 'RRODRIGUEZ';

select *
  from usuario_modulo_alterno
 where id_usuario = 'RRODRIGUEZ';

select *
  from permiso
 where numero = 56161;

select *
  from proceso_puntualidad_pers
 where id_personal = 'E42964';

select *
  from planilla10.personal
 where apellido_paterno = 'VASQUEZ'
   and apellido_materno = 'FLORES';

select *
  from usuarios
 where nombres like '%ROMERO%';

select *
  from motivo_hallazgo_cliente;

select *
  from usuarios
 where usuario = 'DARENAS';

select *
  from planilla10.personal
 where apellido_paterno = 'ARENAS'
   and nombres like '%DIEGO%';

select *
  from planilla10.t_cargo
 where c_cargo = 'AMKT';

-- matrices corte
select cod_art, descripcion, cod_lin
  from vw_articulo
 where cod_art like '%MATRIZ DE CORTE%';

select *
  from planilla10.personal
 where apellido_paterno = 'HERMOZA';

select *
  from planilla10.tar_encarga;

select *
  from planilla10.personal
 where encargado = '049';

select *
  from personal_mantto;

select *
  from usuario_modulo_alterno
 where id_modulo = 'ACCIDENTES'
   and id_alterno = 'NBELANDRIA';

select *
  from usuario_modulo
 where usuario = 'NBELANDRIA';

select *
  from planilla10.tar_encarga;

select *
  from planilla10.personal
 where encargado = '042';

select *
  from caja_chica_d
 where serie = 7
   and numero = 22184;

select *
  from cese_personal
 where id_personal = 'E42736';

select *
  from usuario_modulo
 where modulo = 'EMBARQUES';

select *
  from expedidos
 where numero = 15501;

select *
  from packing_agrupar
 order by 1;

