alter user caucho account unlock;

alter user jhermoza account lock;

-- alter user rrodriguez identified by "$rodrichx9";
alter user rrodriguez identified by "$rodrichx9";

alter user evaliente password expire;

grant select any table, insert any table, delete any table, update any table to asocial;

alter user armado profile default;

-- Account locked
select username, account_status, created, lock_date, expiry_date
  from dba_users
 where username like '%CAUCHO%';

drop user csuarez cascade;

alter trigger tbiu_componentes_importados enable;


-- revisar correos cuando se eliminan
select u.usuario, u.email, c.cambio_linea_a_produccion
  from usuarios u
     , correos_programas c
 where u.usuario = c.usuario
   and c.cambio_linea_a_produccion = 'si';

select * from correos_programas;

select *
  from dba_objects
 where object_name = 'Stock Minimo IQF';

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
 where co_ctrctr = 'M_EXPO_M'
   and co_usrusr = 'JAIME';

insert into seccrus(co_usrusr, co_ctrctr)
values
  ('EALVITES', 'M_SOLIMAT_M');


-- rodrichx

select *
  from seccrus
 where co_usrusr in ('EBELTRAN')
 order by co_usrusr;

select *
  from seccrus
 where co_usrusr in ('AUXLASER');

select *
  from all_constraints
 where constraint_name = 'PK_DESPACHO_GUIAS';

select *
  from all_objects
 where object_name = 'RRHH';

select *
  from sig_conexiones
 where usuario = 'JCABEZAS'
 order by creacion_cuando desc;

select *
  from dba_registry
 where comp_id = 'APEX';

select *
  from dba_source
 where upper(text) like upper('%baterigama%')
   and owner = 'PEVISA'
   and type = 'TRIGGER';

select *
  from dba_source
 where upper(text) like upper('%CIERRE DE VENTAS EXPORTACION%')
   and owner = 'PEVISA';

-- ctacob>contab>reporte>contab>balance>balance compoc y vc excel

select *
  from all_source
 where upper(text) like upper('%PERMISO DE SALIDA NRO.%')
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
 where usuario in ('DCONTRERAS', 'EBELTRAN');

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
 where co_usrusr in ('JQUISPEB', 'APASTRANA')
 order by co_usrusr;

-- copia menu a usuario
insert into tab_menu
select cod_menu, descripcion, menus, titulo, nivel, 'JPOZO', estado, sistema, id_programa
  from tab_menu
 where usuario = 'PEVISA'
   and sistema = 'M_CONSULTAS_M';

select *
  from tab_menu
 where sistema = 'M_SOLIMAT_M'
   and cod_menu in ('2004', '2006')
   and usuario in (
                   'GFORTUN', 'GFALCON', 'DCONTRERAS', 'LDANIEL', 'KCUCHO', 'MJUAREZ', 'AGIL',
                   'JMEJIA', 'YCHUNGA', 'MGUIELAC'
   );


select *
  from tab_menu
 where sistema = 'M_SOLIMAT_M'
   and cod_menu in ('2055')
   and usuario in (
                   'GFORTUN', 'GFALCON', 'DCONTRERAS', 'LDANIEL', 'KCUCHO', 'MJUAREZ', 'AGIL',
                   'JMEJIA', 'YCHUNGA', 'MGUIELAC'
   );

select *
  from kardex_d
 where cod_alm = '01'
   and extract(year from fch_transac) = 2026
   and extract(month from fch_transac) = 1;

select distinct usuario
  from kardex_d_historia
 where extract(year from fecha) = 2026
   and extract(month from fecha) = 1
   and cod_alm = '01';

-- adescartes

select *
  from usuarios
 where usuario in (
                   'GFORTUN', 'GFALCON', 'DCONTRERAS', 'LDANIEL', 'KCUCHO', 'MJUAREZ', 'AGIL',
                   'JMEJIA', 'YCHUNGA', 'MGUIELAC'
   );

select *
  from tab_menu
 where sistema = 'M_CONSULTAS_M';

select *
  from modulo
 where descripcion like '%COSTO%';

select *
  from usuarios
 where usuario like ('%JMEDINA%');

select *
  from vw_personal
 where c_codigo = 'E43871';

select *
  from usuarios
 where nombres like ('%BARBARA%');

select * from aut_rol_usuario;

select *
  from usuario_modulo
 where usuario = 'APASTRANA';

select *
  from usuario_modulo
 where modulo = 'PLANEAMIENTO'
 order by usuario;

select *
  from usuarios_almacenes
 where usuario = 'RGONZALES';

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
 where modulo in ('GUIA_MANUAL')
 order by usuario, modulo;

select *
  from usuario_modulo
 where modulo in ('GUIA_MANUAL')
   and usuario in ('MMILLONES', 'PEVISA')
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
 where modulo in ('EMITE_OP')
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
 where co_usrusr = 'APASTRANA'
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
 where usuario = 'JMEJIA'
   and cod_alm = '48';

select *
  from transacciones_almacen
 where tp_transac in ('16', '27');

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

begin
  correo_stock_embalaje();
end;

select sysdate from dual;

select *
  from kardex_d a
 where serie = 131
   and numero in (1386);

select *
  from numdoc
 where tp_transac = '35'
   and serie = 131;

select *
  from sistabgen
 where sisdatcod = 220;

select u.usuario, u.email, c.stock_minimo_iqf
  from usuarios u
     , correos_programas c
 where u.usuario = c.usuario
   and stock_minimo_iqf = 'SI';


begin
  pr_stock_minimo_iqf('ENVIAR_CORREO_SIEMPRE');
end;

select *
  from correos_programas
 where usuario = 'DCONTRERAS';

select *
  from usuarios
 where usuario = 'JCORREA';

select sysdate from dual;

select resource_name, limit
  from dba_profiles
 where profile = 'DEFAULT'
   and resource_name = 'IDLE_TIME';

select p.numero, p.formu_art_cod_art, p.cant_prog, p.fecha, g.descripcion
     , substr(to_char(100000000 + p.numero), 2, 8) as orden_etiqueta
     , substr(to_char(100 + p.nuot_serie), 2, 2) as serie_etiqueta, p.nuot_tipoot_codigo
     , p.nuot_serie, nvl(peso_por_bolsa, 0) as peso_por_bolsa
  from pr_ot p
     , pr_grupos_lineas gl
     , pr_grupos g
     , pr_formu f
 where p.nuot_tipoot_codigo in ('PR', 'VA')
   and p.estado in (1, 2, 3, 4)
   and p.cod_lin = gl.cod_lin(+)
   and gl.id_grupo = g.id(+)
   and p.formu_art_cod_art = f.art_cod_art
 order by p.numero;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero = 609555;

select *
  from pr_formu
 where art_cod_art = 'CL-O 200.3364CS-1';

select *
  from pr_grupos_lineas
 where cod_lin = '1062';


select distinct v.encargado as codigo, v.nombre, t.ecorreo as correo
  from planilla10.v_contratos_encargados v
     , tar_encarga t
 where v.confin = to_date('01/09/2025', 'dd/mm/yyyy')
   and t.codigo = v.encargado
   and t.ecorreo is not null
 order by 3;


select *
  from tab_menu
 where usuario = 'MMIRANDA'
   and sistema = 'M_LOGIST_M'
   and estado = '1';

select *
  from almacenes
 where descripcion like '%DIFERENC%';

select *
  from usuario_modulo
 where modulo = 'PERMISO';

select *
  from usuario_modulo
 where modulo like '%GUIA_MANUAL%';

select * from modulo;

select *
  from usuario_modulo
 where modulo like '%MANUAL%';

select *
  from tab_menu
 where sistema = 'M_SOLIMAT_M'
   and cod_menu in (1017, 1000)
   and usuario in (
                   'DNUNEZM', 'JACUNA', 'DCONTRERAS', 'GFORTUN', 'EMURO', 'JJUAREZ', 'HOLIVARES',
                   'JQUISPEB', 'JCABEZAS', 'HREMUZGO', 'MDIAZH'
   );

select *
  from usuarios_almacenes
 where usuario = 'HREMUZGO'
   and cod_alm = 'M1';

select *
  from pr_usualma
 where cod_alm = 'D5';

select *
  from usuario_modulo
 where modulo like 'CAMBIO_TRX';

select *
  from solicita_cambio_ot
 where ot_nro = 631054;

select * from solicita_cambio_ot;

select *
  from usuario_modulo
 where modulo = 'EMITE_OP_LIMITE';

select *
  from articul
 where cod_art = 'SA 70046-1';

select *
  from log_auditoria
 where tabla = 'PCFORMULAS'
   and cod_id_pk = 'SA 70046-1'
 order by fecha desc;

select * from pcformulas;

select *
  from log_auditoria
 where tabla = '';


select count(*)
  from usuario_modulo
 where modulo = 'NOMBRE_CLIENTE'
   and usuario = 'JCABEZAS';

select * from view_oa_cambio_de_piezas;

  with permisos as (
    select count(*) as habilitado
      from usuario_modulo
     where modulo = 'NOMBRE_CLIENTE'
       and usuario = user
    )
select x.numero, x.nuot_serie, x.nuot_tipoot_codigo, o.cant_prog, o.formu_art_cod_art
     , o.abre01 as pedido
     , case when p.habilitado > 0 then o.abre02 else '*****' end as abreviatura
     , x.fecha, x.id_motivo, x.detalle, x.art_cod_art
     , x.glosa, x.cantidad_faltante as faltante, x.cantidad_sobrante as sobrante
     , x.cantidad_deteriorada as deteriorada, x.pr_numero, x.pr_nuot_serie, x.pr_nuot_tipoot_codigo
     , x.pr_nombre_trabajador, x.pr_nombre_trabajador_almacen, x.calidad_usuario
  from pr_ot_cambios_piezas x
       join pr_ot o
            on x.numero = o.numero
              and x.nuot_serie = o.nuot_serie
              and x.nuot_tipoot_codigo = o.nuot_tipoot_codigo
       cross join permisos p;

select *
  from pr_ot_cambios_piezas
 where pr_nombre_trabajador is not null;

select *
  from planilla10.personal
 where situacion not in (
   select *
     from planilla10.t_situacion_cesado
   );

select * from planilla10.t_area;

select *
  from planilla10.tar_secc
 where c_area = '004';

select c_codigo, nombre
  from vw_personal
 where c_area = '004'
   and situacion not in (
   select codigo
     from planilla10.t_situacion_cesado
   )
 order by nombre;

select *
  from almacenes
 where cod_alm = 'B1';

select * from expedido_d;

select * from expedido_d_historia;

select *
  from seccrus
 where co_usrusr = 'CWONG'
   and co_usrusr = 'M_LOGIST%';

select *
  from lg_personal_compras_series
 where serie_orden_de_compra = 6;

select *
  from planilla10.plcontrol
 where usuario = 'PEVISA';

select 0.105 * 100 from dual;

select * from orden_de_compra;

select * from caja_chica_serie;

select *
  from usuarios_caja_chica
 where usuario = 'KSMOLSA';

select * from vw_turno;

select r.id_cargo, p.desc_cargo, p.c_codigo, p.nombre, p.c_encargado, p.desc_encargado, p.turno
     , case p.turno
         when 1 then 'DIA'
         when 2 then 'TARDE'
         when 3 then 'NOCHE'
       end as dsc_turno
     , case p.turno
         when 1 then r.bono_dia
         when 2 then r.bono_tarde
         when 3 then r.bono_noche
         else 0
       end as bono
  from vw_personal p
       join responsabilidad_cargo r on p.c_cargo = r.id_cargo
 where p.situacion not in (
   select codigo
     from planilla10.t_situacion_cesado
   )
   and not exists (
   select id_personal
     from bono_obrero_excluye e
          join bono_obrero_excluye_modulo m on e.id_excluye = m.id_excluye
    where periodo_ano = 2026
      and periodo_mes = 2
      and id_personal = p.c_codigo
      and id_bono = 2
   )
 order by desc_cargo, desc_encargado, nombre;


select *
  from usuarios_almacenes_perfil
 where cod_alm = '30'
   and usuario = 'PEVISA';

select *
  from transacciones_almacen
 where flg_transferencia = 1;

select *
  from almacenes
 where cod_alm = 'FC';

select *
  from kardex_d
 where cod_alm = 'FC'
 order by fch_transac desc;

select *
  from usuario_modulo
 where modulo like '%BIENESTAR%';

select nvl(stock, 0)
  from almacen a
 where cod_art = 'aoeuaou'
   and cod_alm = 'aoeuaoue';


select *
  from pr_usualma
 where usuario = 'PEVISA'
   and cod_alm = '98';


select *
  from tab_menu m
 where m.sistema = 'M_PLANEAMIENTO_M'
   and m.cod_menu in ('2001')
   and m.estado = '1'
   and exists(
   select 1
     from tab_menu m2
    where m.usuario = m2.usuario
      and m.sistema = m2.sistema
      and m.cod_menu = m2.cod_menu
      and m2.cod_menu = '2000'
      and m2.estado = '1'
   );

select *
  from tab_menu m
 where m.sistema = 'M_PLANEAMIENTO_M'
   and m.cod_menu = '2001'
   and m.estado = '1'
   -- Validar que tenga el 2000 activo
   and exists (
   select 1
     from tab_menu m2
    where m2.usuario = m.usuario
      and m2.sistema = m.sistema
      and m2.cod_menu = '2000'
      and m2.estado = '1'
   )
   -- Validar que el usuario esté en SECCRUS
   and exists (
   select 1
     from seccrus s
    where s.co_usrusr = m.usuario
      and s.co_ctrctr = m.sistema
   )
 order by usuario;

select *
  from tab_menu
 where usuario = 'ARODRIGUEZ';

select co_usrusr, co_ctrctr, co_clave, nombres
  from seccrus
 where co_ctrctr = 'M_PLANEAMIENTO_M';

select *
  from usuario_modulo
 where modulo = 'PLANEAMIENTO';

select *
  from almacenes
 where cod_alm = '72';

select *
  from almacenes
 where cod_alm_transito = '72';

select *
  from kardex_g_historia
 where cod_alm = '62'
   and tp_transac = '22'
   and serie = 1
   and numero = 332399;

select *
  from ot_mantto
 where id_tipo = 'MQ'
   and id_serie = 2
   and id_numero = 1453;

select *
  from clientes
 where email = 'pepeperezlara@gmail.com';

select *
  from clientes
 where email = 'matse21032005@gmail.com';

select *
  from vw_solicitud_pedido
 where comprador_asignado_correo = 'richard.carrion@pevisa.com.pe';

select *
  from usuario_modulo
 where modulo = 'EMBARQUES'
   and usuario = 'APASTRANA';

select sysdate from dual;

-- por pais sacar promedio de pago (fecha de embarque -> fecha de pago)
-- ver que documentos entraron en los dias promedios de pago
-- lo que no esta transmitido debe llegar alerta de lo pendiente


select *
  from almacenes
 where cod_alm = 'D3';


select *
  from transacciones_almacen
 where tp_transac = '18';


select * from pla_control;