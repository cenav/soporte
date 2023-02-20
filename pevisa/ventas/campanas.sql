select * from campana_cliente;

begin
  mail.send_simple(
      p_to => 'apastrana@hdi.com.pe'
    , p_from => 'avisos_cobranzas@pevisa.com.pe'
    , p_subject => 'Creditos y Cobranzas - Validar Campaña Cliente'
    , p_message => 'Estimados: ' || chr(10) || chr(10) ||
                   'Por favor dar el visto bueno a la campana del cliente:' || chr(10) ||
                   'Nro: ' || '' || chr(10) ||
                   'Descripcion: ' || ''
    );
end;

begin
  enviar_correo(
      msg_to => 'apastrana@hdi.com.pe'
    , msg_from => 'avisos_cobranzas@pevisa.com.pe'
    , msg_subject => 'Creditos y Cobranzas - Validar Campaña Cliente'
    , msg_text => 'Estimados: ' || chr(10) || chr(10) ||
                  'Por favor dar el visto bueno a la campana del cliente:' || chr(10) ||
                  'Nro: ' || '' || chr(10) ||
                  'Descripcion: ' || ''
    );
end;

select *
  from planilla10.personal
 where encargado = '056'
 order by apellido_paterno;

select *
  from campana
 where cod_campana in (
                       'E2022-1', 'E2022-2', 'E2022-3', 'E2022-4'
   );

select *
  from proceso_comiacc
 where cod_proceso = '00268';