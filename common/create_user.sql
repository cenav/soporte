-- CREAR EN USUARIOS
select username, account_status, created, lock_date, expiry_date
  from dba_users
 where username like '%MVARGAS%';

select *
  from usuarios u
 where usuario in ('FORIUNDO', 'MVARGAS');

select *
  from vw_personal
 where nombre like '%VILLAR%'
   and situacion not in ('8', '9');

---------------------------
---------------------------
---------------------------

create user foriundo
  identified by "pevisa.123"
  default tablespace pevisad
  temporary tablespace temp
  profile default
  account unlock;

grant privilegios_usuarios_sig to foriundo;

alter user foriundo default role all;

alter user foriundo password expire;

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
 where usuario in ('SVALENCIA', 'ACOLLAZOS');

select *
  from vendedores
 where cod_vendedor = 'L2';

select * from articul_archivos;

select * from tipo_archivo;