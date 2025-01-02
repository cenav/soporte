-- CREAR EN USUARIOS
select *
  from usuarios u
 where usuario in ('SVARGAS', 'ISAIAS_MECHATO');

create user omar_torres
  identified by "pevisa.123"
  default tablespace pevisad
  temporary tablespace temp
  profile default
  account unlock;

-- 1 Role for RCARRION
grant privilegios_usuarios_sig to omar_torres;
alter user omar_torres default role all;


alter user omar_torres password expire;


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
 where usuario in ('MVARGAS', 'JSOTOMAYOR');

