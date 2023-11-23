CREATE OR REPLACE PROCEDURE PEVISA.ENVIAR_CORREO (
  msg_from    varchar2 := 'oracle',
  msg_to      varchar2,
  msg_subject varchar2 := 'E-Mail message from your database',
  msg_text    varchar2 := '' )
  IS
  c  utl_tcp.connection;
  rc integer;
BEGIN
  begin
    pkg_utiles.p_envia_mail_maxx  (msg_to,
                                   msg_subject,
                                   'TEXT',
                                   msg_text);
  end;
  --
/*
     c := utl_tcp.open_connection('10.0.0.42', 25);       -- open the SMTP port 25 on local machine
     dbms_output.put_line(utl_tcp.get_line(c, TRUE));
     rc := utl_tcp.write_line(c, 'HELO localhost');
     dbms_output.put_line(utl_tcp.get_line(c, TRUE));
     rc := utl_tcp.write_line(c, 'MAIL FROM: '||msg_from);
     dbms_output.put_line(utl_tcp.get_line(c, TRUE));
     rc := utl_tcp.write_line(c, 'RCPT TO: '||msg_to);
     dbms_output.put_line(utl_tcp.get_line(c, TRUE));
     rc := utl_tcp.write_line(c, 'DATA');                 -- Start message body
     dbms_output.put_line(utl_tcp.get_line(c, TRUE));
     rc := utl_tcp.write_line(c, 'Subject: '||msg_subject);
     rc := utl_tcp.write_line(c, '');
     rc := utl_tcp.write_line(c, msg_text);
     rc := utl_tcp.write_line(c, '.');                    -- End of message body
     dbms_output.put_line(utl_tcp.get_line(c, TRUE));
     rc := utl_tcp.write_line(c, 'QUIT');
     dbms_output.put_line(utl_tcp.get_line(c, TRUE));
     utl_tcp.close_connection(c);                         -- Close the connection
*/
EXCEPTION
  when others then
    raise_application_error(
        -20000, 'Unable to send e-mail message from pl/sql because of: '||
                sqlerrm);
END;
/
