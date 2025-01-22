select * from proveed;

declare

begin
  mail.send_simple(
      p_to => 'fabricio.sanchez@pevisa.com.pe; evaliente@pevisa.com.pe; cnavarro@pevisa.com.pe'
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
end;