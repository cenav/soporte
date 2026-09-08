begin
  enviar_correo(
      msg_from => 'ealvites@pevisa.pe'
    , msg_to => 'cnavarro@pevisa.pe'
    , msg_subject => 'nuevo zimbra'
    , msg_text => 'a zimbra'
  );
end;

begin
  enviar_correo(
      msg_from => 'avisos_sistema@pevisa.pe'
    , msg_to => 'cnavarro@pevisa.com.pe'
    , msg_subject => 'oracle zimbra'
    , msg_text => 'a 365'
  );
end;

begin
  enviar_correo(
      msg_from => 'avisos_sistema@pevisa.pe'
    , msg_to => 'cnavarro1112@gmail.com'
    , msg_subject => 'oracle zimbra'
    , msg_text => 'a gmail'
  );
end;

begin
  enviar_correo(
      msg_from => 'avisos_sistemas@pevisa.com.pe'
    , msg_to => 'cnavarro@pevisa.com.pe'
    , msg_subject => 'oracle dominio 365'
    , msg_text => 'a 365'
  );
end;

begin
  envia_correo_nuevo_c(
      msg_from => 'avisos_sistema@pevisa.com.pe'
    , msg_to => 'cnavarro@pevisa.com.pe'
    , msg_subject => 'oracle zimbra con dominio 365'
    , msg_text => 'a 365'
  );
end;


begin
  enviar_correo(
      msg_from => 'ealvites@pevisa.pe'
    , msg_to => 'cnavarro1112@gmail.com'
    , msg_subject => 'nuevo zimbra'
    , msg_text => 'a gmail'
  );
end;

begin
  utl_http.set_detailed_excp_support(true);
end;

begin
  enviar_correo(
      msg_from => 'ealvites@pevisa.pe'
    , msg_to => 'cnavarro@pevisa.com.pe'
    , msg_subject => 'nuevo zimbra'
    , msg_text => 'a 365'
  );
end;

begin
  enviar_correo(
      msg_from => 'cnavarro@pevisa.com.pe'
    , msg_to => 'cnavarro@pevisa.com.pe'
    , msg_subject => 'nuevo zimbra'
    , msg_text => 'a 365'
  );
end;

begin
  enviar_correo_nuevo(
      msg_from => 'cnavarro@pevisa.pe'
    , msg_to => 'cnavarro1112@gmail.com'
    , msg_subject => 'nuevo zimbra'
    , msg_text => 'a 365'
  );
end;

create procedure enviar_correo_nuevo (
  msg_from varchar2 := 'oracle', msg_to varchar2, msg_subject varchar2 := 'E-Mail message from your database', msg_text varchar2 := '')
  is
  c  utl_tcp.connection;
  rc integer;
begin
  c := utl_tcp.open_connection('10.0.0.73', 25); -- open the SMTP port 25 on local machine
  dbms_output.put_line(utl_tcp.get_line(c, true));
  rc := utl_tcp.write_line(c, 'HELO localhost');
  dbms_output.put_line(utl_tcp.get_line(c, true));
  rc := utl_tcp.write_line(c, 'MAIL FROM: ' || msg_from);
  dbms_output.put_line(utl_tcp.get_line(c, true));
  rc := utl_tcp.write_line(c, 'RCPT TO: ' || msg_to);
  dbms_output.put_line(utl_tcp.get_line(c, true));
  rc := utl_tcp.write_line(c, 'DATA'); -- Start message body
  dbms_output.put_line(utl_tcp.get_line(c, true));
  rc := utl_tcp.write_line(c, 'Subject: ' || msg_subject);
  rc := utl_tcp.write_line(c, '');
  rc := utl_tcp.write_line(c, msg_text);
  rc := utl_tcp.write_line(c, '.'); -- End of message body
  dbms_output.put_line(utl_tcp.get_line(c, true));
  rc := utl_tcp.write_line(c, 'QUIT');
  dbms_output.put_line(utl_tcp.get_line(c, true));
  utl_tcp.close_connection(c); -- Close the connection
exception
  when others then
    raise_application_error(
        -20000, 'Unable to send e-mail message from pl/sql because of: ' ||
                sqlerrm);
end;


select * from usuarios;