create or replace trigger pevisa.tai_alerta_ingreso_iqbf
  after insert
  on pevisa.kardex_d
  for each row
  when (
    new.ing_sal = 'I'
    )
begin
  if iqbf.existe(:new.cod_art) then
    mail.send_simple(
        p_to => 'iqbf.notificacion@pevisa.com.pe'
      , p_bcc => 'cnavarro@pevisa.com.pe'
      , p_from => 'alertas_calidad@pevisa.com.pe'
      , p_subject => 'Ingreso IQBF'
      , p_message =>
          'Ingreso de artículo IQBF '
            || :new.cod_art
            || ' al almacen '
            || :new.cod_alm
            || ' con fecha '
            || to_char(:new.fch_transac, 'dd/mm/yyyy')
    );
  end if;

  if iqbf.es_otro_producto_quimico(:new.cod_art) then
    mail.send_simple(
        p_to => 'erp.avisos.calidad@pevisa.com.pe'
      , p_bcc => 'cnavarro@pevisa.com.pe'
      , p_from => 'alertas_calidad@pevisa.com.pe'
      , p_subject => 'Ingreso producto químico'
      , p_message =>
          'Ingreso de producto químico '
            || :new.cod_art
            || ' al almacen '
            || :new.cod_alm
            || ' con fecha '
            || to_char(:new.fch_transac, 'dd/mm/yyyy')
    );
  end if;
end;

alter package iqbf compile package;
alter package iqbf compile body;

