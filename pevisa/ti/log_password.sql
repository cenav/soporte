select os_username, /* nombre de usuario SO */
  username, /* nombre de usuario BD */
  terminal, decode(returncode, '0', 'Conectado',
                   '1005', 'Solo username, sin password',
                   '1017', 'Password incorrecto',
                   returncode) as estado
     , /* comprobacion de error */
  to_char(timestamp, 'DD-MON-YY HH24:MI:SS'), /* hora de entrada */
  to_char(logoff_time, 'DD-MON-YY HH24:MI:SS') /* hora de salida */
  from dba_audit_session
 where username in ('EVALIENTE')
 order by timestamp desc
