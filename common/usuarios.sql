alter user pchumacero account unlock;

alter user MVARGAS account lock;

alter user powerbi identified by "pevisa.pbi";

alter user apinedo password expire;

grant select any table, insert any table, delete any table, update any table to asocial;

alter user uarmado profile default;

-- Account locked
select username, account_status, created, lock_date, expiry_date
  from dba_users
 where username like 'MVARGAS';

-- alter trigger tbu_movglos_cierre enable;

select *
  from dba_objects
 where object_name = 'PLA_CONTROL';

-- roxana tarrillo

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
 where co_ctrctr = 'M_PLANEAMIENTO_M';


select *
  from seccrus
 where co_usrusr in ('ECARDENAS', 'LOBISPO', 'FURTEAGA')
 order by co_usrusr;

select *
  from seccrus
 where co_usrusr in ('PEVISA');

select *
  from all_constraints
 where constraint_name = 'PK_DESPACHO_GUIAS';

select *
  from all_objects
 where object_name = 'RRHH';

select *
  from sig_conexiones
 where usuario = 'YBERROSPI'
 order by creacion_cuando desc;

select *
  from dba_registry
 where comp_id = 'APEX';

select *
  from dba_source
 where upper(text) like upper('%KOCAMPO%')
   and owner = 'PEVISA';

select *
  from dba_source
 where upper(text) like upper('%inicio de labores%')
   and owner = 'PLANILLA10';

select *
  from all_source
 where upper(text) like upper('%contratos que vencen%')
   and owner = 'PEVISA';

select owner, table_name
  from all_tab_columns
 where column_name like '%KARDEX%'
   and owner = 'PEVISA';


select *
  from v$version;

select * from v$parameter where lower("NAME") like '%result_cache%';

-- result cache disabled
select dbms_result_cache.status() from dual;

select *
  from user_types;


select *
  from alcontrol
 where usuario in ('JCABEZAS', 'OLGA');

-- menu almacenes materia prima
select 'APASTRANA', tp_art
  from alcontrol
 where usuario in ('EDITH', 'APASTRANA');

select *
  from seccrus
 where co_usrusr in ('JENNY_LEON');

select *
  from seccrus
 where co_ctrctr = 'M_COSTO_M'
   and co_usrusr = 'APASTRANA';

select usuario, nombres, estado, email, codigo_trabajador
  from usuarios
 where estado = 1;

select c_codigo, nombre, email, email_p, situacion
  from vw_personal
 where c_codigo = 'E017' and situacion not in (
   select codigo
     from planilla10.t_situacion_cesado
   );
select * from vw_personal where nombre like '%GOMEZ%';
select *
  from planilla10.personal
 where c_codigo = 'EI';

select *
  from planilla10.tar_encarga
 where codigo = '050';

select *
  from planilla10.personal
 where apellido_paterno = 'VARGAS';

select distinct co_ctrctr
  from seccrus
 order by 1;

select *
  from seccrus
 where co_ctrctr = 'M_PLANEAMIENTO_M';

select *
  from seccrus
 where co_usrusr in ('JNEYRA', 'PCALDERON');

-- copia menu a usuario
insert into tab_menu
select cod_menu, descripcion, menus, titulo, nivel, 'JPOZO', estado, sistema, id_programa
  from tab_menu
 where usuario = 'PEVISA'
   and sistema = 'M_CONSULTAS_M';

select *
  from tab_menu
 where usuario = 'PEVISA'
   and sistema = 'M_PRODUC_M'
   and upper(descripcion) like '%ANALI%';

select *
  from tab_menu
 where sistema = 'M_CONSULTAS_M';

select *
  from modulo
 where descripcion like '%COSTO%';

select *
  from usuarios
 where usuario in ('ECARDENAS', 'LOBISPO');

select *
  from planilla10.personal
 where c_codigo = '';

select *
  from planilla10.personal
 where apellido_paterno = 'POMALAZO';

-- BRAMOS

select *
  from usuarios_cotizacion
 where usuario in ('SLATORRE', 'CMIESES');

select *
  from vendedores
 where nombre like '%TIRAVA%';

select *
  from vendedores
 where cod_vendedor in ('Z11', 'Z7');

select *
  from gastos_de_viaje_habilitado
 where id_vendedor in ('Z11', 'Z7');

select *
  from gastos_de_viaje
 where id_vendedor in ('Z11', 'Z7');

select *
  from vendedores
 where nombre like '%COLLANTES%';

select * from ruta_docvirtual;

select *
  from vendedores
 where cod_vendedor = 'Z11';

select *
  from modulo
 where id_modulo like 'ABRIR_FILE';

select *
  from usuario_modulo
 where usuario in ('RICARDO_TOVAR')
 order by usuario, modulo;

select *
  from usuario_modulo
 where modulo in ('CAMBIO_OT')
 order by usuario, modulo;

select *
  from usuario_modulo
 where modulo in ('CAMBIO_OT')
   and usuario in ('CNAVARRO', 'PEVISA')
 order by usuario, modulo;

select *
  from usuario_modulo
 where usuario in ('MZONCO', 'LROCA', 'MGUTIERREZ')
   and modulo in ('EVALUACION_PENDIENTE')
 order by usuario, modulo;

select *
  from aut_rol_usuario
 where usuario in ('MZONCO', 'LROCA', 'MGUTIERREZ');

select * from modulo;

select *
  from usuario_modulo
 where modulo in ('HENCARGA_COSTO')
 order by usuario, modulo;

select *
  from usuario_modulo_alterno
 where id_usuario = 'JMENDEZ';

select *
  from usuario_modulo_alterno
 where id_usuario = 'JCABEZAS'
 order by id_usuario;

select *
  from usuarios
 where usuario like '%DELGADO%';

select *
  from usuario_modulo
 where modulo = 'ACTIVO_FIJO'
--    and supermaestro = 'SI'
 order by usuario, modulo;

select *
  from usuario_modulo
 where usuario in ('APASTRANA')
 order by usuario, modulo;

-- abre libro 10
-- meses 3 4 5

select *
  from usuario_modulo
 where modulo = 'ABRE_MES'
 order by modulo;

insert into usuario_modulo(usuario, modulo, maestro, supermaestro)
select 'JSOTOMAYOR', modulo, maestro, supermaestro
  from usuario_modulo
 where modulo in ('AMONESTACION', 'PERMISO', 'VACACIONES', 'MATRIZ_PERSONAL', 'EVALUACION',
                  'EVALIACION_PENDIENTE')
   and usuario = 'DCONTRERAS'
 order by usuario, modulo;

select *
  from usuario_modulo
 where modulo = 'AMONESTACION'
   and usuario = 'JCABEZAS'
 order by usuario, modulo;

select *
  from usuario_modulo_alterno
 where id_alterno = 'NBELANDRIA';

select *
  from usuario_modulo
 where modulo in ('CAMBIO_OT')
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
 where modulo in ('CAMBIO_ESTADO_OA')
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
   and not exists (
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
  from otm_serie_usuario
 where usuario = 'JJUAREZ';

select *
  from ot_mantto_serie
 where id_tipo = 'PY';

select *
  from usuarios
 where nombres like '%DIAZ%';

select *
  from tab_menu
 where sistema = 'M_COSTO_M'
   and cod_menu = '300218';

select *
  from planilla10.personal
 where apellido_paterno = 'DIAZ';

select *
  from tab_menu
 where sistema = 'M_EXPO_M'
   and usuario = 'DTIRAVANTI';

select *
  from seccrus
 where co_usrusr = 'CNAVARRO'
 order by co_ctrctr;

select *
  from seccrus
 where co_ctrctr = 'M_RECLAMOS'
   and co_usrusr = 'DANGELES';

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
 where usuario in ('AAVELLANEDA')
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
 where cod_alm = 'A1'
 order by tp_transac;

select *
  from usuarios_almacenes_perfil
 where usuario = 'MJUAREZ'
   and cod_alm = 'A1';

select *
  from pr_usualma
 where usuario in ('ECARDENAS', 'LOBISPO', 'FURTEAGA')
   and cod_alm in ('03', '79')
 order by cod_alm;

select *
  from usuarios_almacenes_perfil
 where usuario = 'PEVISA'
   and cod_alm in ('MM', '02');

select *
  from transacciones_almacen
 where tp_transac = '11';

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
 where usuario = 'PEVISA'
   and cod_alm = '30';

select *
  from usuarios_almacenes
 where usuario = 'PEVISA'
   and cod_alm in ('30', '37');

select *
  from usuarios_almacenes_perfil
 where usuario = 'PEVISA'
   and cod_alm in ('30', '37');

select *
  from almacenes_perfil
 where cod_alm in ('30', '37');

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

insert into usuario_modulo
select 'JPOZO', modulo, maestro, supermaestro
  from usuario_modulo
 where usuario = 'PEVISA';

select usuario, modulo, maestro, supermaestro
  from usuario_modulo
 where usuario = 'JPOZO';


select *
  from usuarios
 where usuario = 'JPOZO';

select * from usuarios_caja_chica;

select * from caja_chica_serie;

select u.serie, s.nombres
  from usuarios_caja_chica u
     , caja_chica_serie s
 where u.usuario = user
   and u.estado = '1'
   and s.id_serie = u.serie
   and s.tipo_caja = 'CAJA CHICA'
   and not exists (
   select distinct ch.serie
     from caja_chica ch
    where ch.serie = u.serie and ch.estado = 1
   )
 order by 1;


select nvl(count(1), 0)
  from vendedores p
     , planilla10.personal h
     , planilla10.doc_per d
 where 'E931' = h.c_codigo
   and h.c_codigo = p.cod_personal
   and d.c_codigo = p.cod_personal
   and d.c_doc in ('LE', 'CE')
   and h.for_pago = 'C'
   and h.c_banco in ('02');


-- Salinas
select *
  from planilla10.personal
 where c_codigo = 'E3469';

begin
  envia_email_cotiza_simula.envia_correo_coti_simu();
end;


-- imartinez

select * from vendedores where abreviada = 'IMARTINEZ';

select n.serie, n.automatico
  from numdoc n
     , almacen_trasaccion_serie t
 where n.tp_transac = '35'
   and n.tp_transac = t.tp_transac
   and t.cod_alm = '05'
   and n.serie = t.serie
 order by 1;


select cod_alm, tp_transac, serie
  from almacen_trasaccion_serie
 where tp_transac = '35'
   and cod_alm = '05';

select ta.cod_alm_destino, a.descripcion
  from traslados_almacenes ta
     , almacenes a
 where ta.cod_alm_destino = a.cod_alm
   and ta.cod_alm_origen = '05'
 order by 1;


select *
  from traslados_almacenes
 where cod_alm_origen = '05';

select *
  from planilla10.personal
 where apellido_paterno = 'RAMOS'
   and nombres like '%CESAR%';

select * from modulo;

select *
  from usuario_modulo
 where modulo = 'CAMPANA_CARGA';

select *
  from usuario_modulo
 where modulo like '%CAMP%';

select *
  from usuario_modulo
 where modulo like 'EMITE_OP';

select t.codigo, t.descripcion, t.indicador1
  from tablas_auxiliares t
 where t.tipo = 33
   and t.codigo in (
   select cod_alm
     from pr_usualma
    where cod_alm = t.codigo
      and usuario = 'LARIAS'
   )
   and t.codigo in (
   select distinct cod_alm_origen
     from traslados_almacenes
   );

select *
  from traslados_almacenes
 where cod_alm_origen = 'V0';

select n.serie, n.automatico
  from numdoc n
     , almacen_trasaccion_serie t
 where n.tp_transac = '35'
   and n.tp_transac = t.tp_transac
   and t.cod_alm = '06'
   and n.serie = t.serie
 order by 1;

select *
  from almacen_trasaccion_serie
 where cod_alm = '06';

select *
  from almacen_trasaccion_serie
 where cod_alm = 'V0';

select *
  from pr_usualma
 where usuario = 'LARIAS';

select *
  from serie_caja_usuario
 where usuario = 'MBONDY';

select *
  from serie_caja_usuario
 where id_serie = 1;

select *
  from usuarios
 where usuario = 'AAVELLANEDA';

select *
  from planilla10.personal
 where apellido_paterno = 'AVELLANEDA';

select *
  from planilla10.personal
 where c_codigo = 'E1027';

select *
  from planilla10.hr_personal
 where c_codigo = 'E1027';

select * from serie_caja;

select *
  from dba_tab_columns
 where column_name = 'COD_GRUPO_VENTA'
   and owner = 'PEVISA';

select * from estado_campana;

select * from activo_fijo_depreciacion;

select *
  from pcformulas
 where cod_art = '200.3029'
   and linea between '800' and '899';

select * from vcos_formulas;

select *
  from usuarios_almacenes
 where usuario = 'APASTRANA';

select *
  from usuario_modulo_alterno
 where id_usuario = 'EMESTANZA';

-- almacen
select t.codigo, t.descripcion, t.indicador1
  from tablas_auxiliares t
 where t.tipo = 33
   and t.codigo in (
   select cod_alm
     from pr_usualma
    where cod_alm = t.codigo
      and usuario = 'PFALMAUX031'
   )
   and t.codigo in (
   select distinct cod_alm_origen
     from traslados_almacenes
   );

select *
  from traslados_almacenes
 where cod_alm_origen = 'FP';

select *
  from exclientes
 where nombre like '%STOCK%';

select *
  from tab_menu
 where usuario = 'PEVISA'
   and sistema = 'M_CONSULTAS_M'
   and cod_menu in (
                    2031, 203101, 20310101, 20310102, 20310103, 203102, 20310201, 20310202,
                    20310203, 203103, 20310301, 20310302, 203104, 203105
   );

select * from expedido_d;

create public synonym vw_seguimiento_bono for vw_seguimiento_bono;

select name, line, text
  from dba_source
 where upper(text) like upper('%SUBPIEZA%');

select s.id_serie
     , s.descripcion
     , s.nombre as encargado
  from ot_mantto_serie s
     , otm_serie_usuario u
 where s.id_serie = u.id_serie
   and s.id_tipo = u.id_tipo
   and u.usuario = 'SVARGAS'
   and u.id_tipo = :id_tipo
 order by s.id_serie;


select *
  from otm_serie_usuario
 where usuario = 'JVILLON';

select *
  from usuarios
 where usuario = 'SVARGAS';

select *
  from planilla10.personal
 where c_codigo = 'E1137';

select *
  from planilla10.tar_encarga
 where codigo = '062';

select *
  from planilla10.personal
 where encargado = '062';

select *
  from usuario_modulo
 where modulo = 'VACACIONES';

select *
  from usuario_modulo_alterno
 where id_modulo = 'VACACIONES';

select per.apellido_paterno || ' ' || per.apellido_materno || ', ' || per.nombres as nombre
     , per.c_codigo, per.seccion as cod_seccion, s.nombre as seccion, enc.nombre as encargado
     , per.f_ingreso
  from planilla10.personal per
     , planilla10.tar_encarga enc
     , planilla10.tar_secc s
 where per.encargado = enc.codigo
   and per.seccion = s.codigo(+)
   and (upper(enc.usuario) in (
   select usuario
     from usuario_modulo
    where usuario = :p_usuario and modulo = :modulo
    union
   select id_usuario
     from usuario_modulo_alterno
    where id_alterno = :p_usuario and id_modulo = :modulo
   ) or :p_usuario in (
   select usuario from usuario_modulo where modulo = :modulo and maestro = 'SI'
   ))
   and per.situacion not in ('8', '9')
 order by enc.nombre, per.apellido_paterno;

select *
  from usuario_modulo
 where modulo = 'EVALUACION'
   and usuario in ('JACUNA', 'SVARGAS', 'JVILLON');

select *
  from planilla10.plcontrol
 where usuario = 'NPOMALAZO';

select *
  from usuarios_cotizacion
 where usuario in ('LILY', 'LSALCEDO', 'CNAVARRO');

select * from usuarios;

select * from tab_menu;

select * from modulo;

select * from roles;

select * from permisos order by id_permiso;

select * from roles_modulo;

select * from rol_concepto_permiso;

select * from concepto_permiso;

--------------------------
select * from roles_menus;

select * from menu_roles;
--------------------------

select * from menu; -- por crear

select * from tipo_linea;

select * from tab_lineas_tipo_linea;

select *
  from articul
 where cod_art = 'PLANCHA NYLON 6MM';

select *
  from articul_historia
 where cod_art = 'PLANCHA NYLON 6MM';

select *
  from usuario_modulo
 where usuario = 'PLANILLA10';

select *
  from usuario_modulo
 where usuario = 'KCASTILLO';

select *
  from usuario_modulo_alterno
 where id_modulo = 'AMONESTACION'
   and id_alterno = 'KCASTILLO';

select *
  from usuario_modulo_alterno
 where id_modulo = 'AMONESTACION'
   and id_usuario = 'KCASTILLO';


select *
  from usuario_modulo_alterno
 where id_modulo = 'PERMISO'
   and id_alterno = 'KCASTILLO';

declare
  l_usumod usuario_modulo%rowtype;
begin
  l_usumod := api_usuario_modulo.principal_alterno('LDANIEL', 'CAMBIO_TRX');
  dbms_output.put_line(l_usumod.maestro);
end;

select * from aut_rol_usuario order by id_rol;

select *
  from aut_rol_usuario
 where usuario = 'FELIPE_CRUZ';

select *
  from pr_usualma
 where usuario = 'RICARDO_TOVAR';

select * from paramfa;

select *
  from otm_serie_usuario
 where usuario = 'JCABEZAS'
   and id_tipo = 'MQ';

select *
  from ot_mantto_serie
 where id_tipo = 'MQ'
 order by id_serie;

select *
  from otm_serie_usuario
 where usuario = 'PEVISA';

select *
  from ot_mantto
 where id_serie = 1
   and id_numero = 3397;

select *
  from ot_mantto_serie
 where id_serie = 1;

select *
  from otm_serie_usuario
 where usuario = 'NYABAR';

select *
  from tab_menu
 where sistema = 'M_LOGIST_M'
   and cod_menu = '1600'
   and cod_menu = '1612'
   and estado = '1';

select *
  from tab_menu
 where sistema = 'M_LOGIST_M'
   and cod_menu in ('1600', '1612')
   and estado = '1';

select *
  from tab_menu
 where cod_menu = '300233'
   and estado = '0'
   and usuario = 'OLGA';

select *
  from planilla10.personal
 where apellido_paterno like '%VASQUE%'
   and nombres like '%JESUS%'
   and situacion not in ('8', '9');

select *
  from planilla10.personal
 where encargado = '073';

select *
  from planilla10.tar_encarga
 where codigo = '073';

select *
  from usuarios
 where usuario = 'JVASQUEZ';

select per.apellido_paterno || ' ' || per.apellido_materno || ', ' || per.nombres as nombre
     , per.c_codigo, per.seccion as cod_seccion, s.nombre as seccion, enc.nombre as encargado
     , per.f_ingreso
  from planilla10.personal per
     , planilla10.tar_encarga enc
     , planilla10.tar_secc s
 where per.encargado = enc.codigo
   and per.seccion = s.codigo(+)
   and (upper(enc.usuario) in (
   select usuario
     from usuario_modulo
    where usuario = :usuario and modulo = :modulo
    union
   select id_usuario
     from usuario_modulo_alterno
    where id_alterno = :usuario and id_modulo = :modulo
   ) or :usuario in (
   select usuario from usuario_modulo where modulo = :modulo and maestro = 'SI'
   ))
   and per.situacion not in ('8', '9')
 order by enc.nombre, per.apellido_paterno;

select per.apellido_paterno || ' ' || per.apellido_materno || ', ' || per.nombres as nombre
     , per.c_codigo, per.seccion as cod_seccion, s.nombre as seccion, enc.nombre as encargado
     , per.f_ingreso
  from planilla10.personal per
     , planilla10.tar_encarga enc
     , planilla10.tar_secc s
 where per.encargado = enc.codigo
   and per.seccion = s.codigo(+)
   and per.c_codigo = 'E1226';

select *
  from planilla10.personal
 where c_codigo = 'E139';

select *
  from tab_menu
 where sistema = 'M_PRECIOS_M'
   and usuario = 'FURTEAGA';

select *
  from usuarios
 where usuario in ('ECARDENAS', 'FURTEAGA', 'LOBISPO');

select *
  from vw_personal
 where nombre like '%URTEAGA%';

select ta.cod_alm_destino, a.descripcion
  from traslados_almacenes ta
     , almacenes a
 where ta.cod_alm_destino = a.cod_alm
   and ta.cod_alm_origen = '03'
 order by 1;

select *
  from traslados_almacenes
 where cod_alm_origen = '03';

select *
  from almacen_punto_partida_llegada
 where cod_alm = '03';

select nro_sucur, direccion
  from sucursales
 where cod_cliente = '20100084768'
   and nro_sucur = (
   select punto
     from almacen_punto_partida_llegada
    where cod_alm = '79'
   );

select *
  from almacenes
 where cod_alm = '79';

select *
  from almacenes
 where cod_alm = 'TL';

select *
  from tablas_auxiliares
 where codigo in ('79', 'TL')
   and tipo = 33;

select *
  from almacenes
 where descripcion like '%TRANSITO%'
 order by cod_alm;

select g.serie, g.numero, g.estado, to_char(g.fecha, 'DD/MM/YYYY') as fecha, g.cod_alm01
     , g.cod_alm02, g.observacion, g.numero_ref
  from solimat_g g
 where g.estado < 4
   and exists (
   select distinct -1
     from solimat_d d
    where g.serie = d.serie
      and g.numero = d.numero
      and d.saldo > 0
   )
   and nvl(cod_tipo_solimat, 'OTRO') = 'OTRO'
   and g.cod_alm01 = '03'
   and g.cod_alm02 = '79'
   and g.cod_alm01 in (
   select cod_alm
     from pr_usualma
    where cod_alm = g.cod_alm01 and usuario = user
   )
 order by g.serie, g.numero desc;

select *
  from solimat_g
 where numero = 161444;
