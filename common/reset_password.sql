declare
  l_usuario varchar2(30) := 'mvillanueva';
begin
  --   execute immediate 'alter user ' || l_usuario || ' account unlock;';
  execute immediate 'alter user ' || l_usuario || ' account unlock;';
  execute immediate 'alter user ' || l_usuario || ' identified by "pevisa.123";';
  execute immediate 'alter user ' || l_usuario || ' password expire;';
end;

select username, account_status, created, lock_date, expiry_date
  from dba_users
 where username like upper('mvillanueva');
