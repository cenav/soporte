-- CREAR EN USUARIOS
select rowid, u.*
  from usuarios u
 where usuario in ('IVEGA', 'DAYALA');

create user powerbi
  identified by "sistemas.pevisa768"
  default tablespace pevisad
  temporary tablespace temp
--     profile profile_usuario_sig
  account unlock;

grant create session to powerbi;

-- 1 Role for DAYALA
grant privilegios_usuarios_sig to dayala;

alter user dayala default role all;

alter user dayala identified by "PEVISA.123";

alter user dayala password expire;


-- PARA COPIAR DESDE OTRO USUARIO
select rowid, s.*
  from seccrus s
 where co_usrusr = 'IVEGA';

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
 where usuario = 'IVEGA';


select rowid, u.*
  from usuarios_almacenes_perfil u
 where usuario = 'IVEGA'
 order by cod_alm;


select rowid, u.*
  from almacenes_perfil u
 where cod_alm = '97';
