select username, account_status, created, lock_date, expiry_date
  from dba_users
 where username like 'PFALMAUX005';


-- desbloquear usuario
declare
  l_usuario varchar2(30) := 'PFALMAUX005';
begin
  execute immediate 'alter user ' || l_usuario || ' account unlock';
end;

