select username, account_status, created, lock_date, expiry_date
  from dba_users
 where username like 'GFALCON';


-- desbloquear usuario
declare
  l_usuario varchar2(30) := 'GFALCON';
begin
  execute immediate 'alter user ' || l_usuario || ' account unlock';
end;

