select * from articul_iqf;

select *
  from kardex_d
 where extract(year from fch_transac) = 2024
   and extract(month from fch_transac) = 6
   and ing_sal = 'I'
   and cod_art in (
   select cod_art
     from articul_iqf
   );

begin
  mail.send_simple(
      p_to => 'cnavarro@pevisa.com.pe'
    , p_from => 'alertas@pevisa.com.pe'
    , p_subject => 'Ingreso IQBF'
    , p_message => 'Ingreso IQBF'
  );
end;

create or replace trigger tai_alerta_ingreso_iqbf
  after insert
  on kardex_d
  for each row
  when ( new.ing_sal = 'I' )
begin
  if iqbf.existe(:new.cod_art) then
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
  end if;
end;
