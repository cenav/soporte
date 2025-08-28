-- CREAR EN USUARIOS
select username, account_status, created, lock_date, expiry_date
  from dba_users
 where username like '%PFALMAUX%';

select *
  from usuarios u
 where usuario in ('EALVITES', 'AALACHE');

select *
  from vw_personal
 where nombre like '%LEON%'
   and situacion not in ('8', '9');

---------------------------
---------------------------
---------------------------

create user aalache
  identified by "pevisa.123"
  default tablespace pevisad
  temporary tablespace temp
  profile profile_usuario_sig
  account unlock;

grant privilegios_usuarios_sig to aalache;

alter user aalache default role all;

alter user aalache password expire;

---------------------------
---------------------------
---------------------------

-- PROFILES
-- profile_usuario_sig
-- profile_usuario_sig_expo
-- profile_usuario_aplicaciones
alter profile profile_usuario_aplicaciones
  limit
  sessions_per_user 10; -- Cambia el límite a 10 sesiones simultáneas

alter user ecardenas
  profile profile_usuario_sig;

---------------------------
---------------------------
---------------------------

select username, account_status, created, lock_date, expiry_date
  from dba_users
 where username like '%DOMINGUEZ%';

-- PARA COPIAR DESDE OTRO USUARIO
select rowid, s.*
  from seccrus s
 where co_usrusr = 'RICARDO_TOVAR';

select rowid, s.*
  from seccrus s
 where co_usrusr in ('IVEGA', 'DAYALA');


select rowid, u.*
  from tab_menu u
 where usuario = 'IVEGA'
   and sistema in (
   select co_ctrctr
     from seccrus s
    where co_usrusr = 'IVEGA'
   );


select rowid, u.*
  from pr_usualma u
 where usuario = 'IVEGA';


select rowid, u.*
  from usuarios_almacenes u
 where usuario = 'RICARDO_TOVAR';


select rowid, u.*
  from usuarios_almacenes_perfil u
 where usuario = 'IVEGA'
 order by cod_alm;


select rowid, u.*
  from almacenes_perfil u
 where cod_alm = '97';

select *
  from usuarios_cotizacion
 where usuario in ('VILLACRESIS', 'ACOLLAZOS');

select *
  from vendedores
 where cod_vendedor = 'L2';

select * from articul_archivos;

select * from tipo_archivo;

select * from estado_vacaciones;