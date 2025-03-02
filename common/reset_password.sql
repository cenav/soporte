select username, account_status, created, lock_date, expiry_date
  from dba_users
 where username like upper('MVARGAS');

-- reiniciar contraseña
declare
  l_usuario varchar2(30) := 'MVARGAS';
begin
  --   execute immediate 'alter user ' || l_usuario || ' account unlock;';
  execute immediate 'alter user ' || l_usuario || ' account unlock';
  execute immediate 'alter user ' || l_usuario || ' identified by "pevisa.123"';
  execute immediate 'alter user ' || l_usuario || ' password expire';
end;

select * from tmp_surte_jgo;