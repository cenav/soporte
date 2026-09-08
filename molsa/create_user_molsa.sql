-- CREAR EN USUARIOS
select username, account_status, created, lock_date, expiry_date
  from dba_users
 where username like '%JZAPATA%';

-- yanis1219$
alter user jzapata identified by "yanis1219$";

select *
  from usuarios
 where usuario like '%JZAPATA%';

create user jzapata
  identified by "pevisa.123"
  default tablespace data_molsa
  temporary tablespace temp
  profile default
  account unlock;
-- 1 Role for GMEZA
grant privilegios_usuarios_sig to jzapata;
alter user jzapata default role all;
-- 1 Object Privilege for GMEZA
grant delete on pevisa.movdeta to jzapata;
