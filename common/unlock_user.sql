-- desbloquear usuario
declare
  l_usuario varchar2(30) := 'FURTEAGA';
begin
  execute immediate 'alter user ' || l_usuario || ' account unlock';
end;

select username, account_status, created, lock_date, expiry_date
  from dba_users
 where username like 'FURTEAGA';

