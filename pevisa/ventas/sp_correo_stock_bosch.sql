create or replace procedure sp_correo_stock_bosch is
  /*
   * Envia correo de los encargados por personal con archivo csv atachado
   *   ejecutando el procedimiento "send_mail"
   */
  type arr_var is table of varchar2(256) index by binary_integer;

  x_mails      arr_var;
  x_fecha_al   date;
  x_from       varchar2(89)   := 'sistemas@pevisa.com.pe';

  cursor c1_stock is
    select get_marca_articulo(l.cod_art) as marca, get_deslinea(a.cod_lin) as descri_linea
         , l.cod_art, f_stock_almacen(l.cod_art, 'F0') as stock_f0
      from lispred l
         , articul a
     where l.cod_art = a.cod_art (+)
       and f_lista_precio(l.cod_art, 1) > 0
       and l.nro_lista = 1
       and a.grupo = '41'
       and a.indicador <> 'XX'
       and a.cod_lin <> 'ZZ'
       and a.cod_lin <> '515'
       and f_stock_almacen(l.cod_art, 'F0') > 0
     order by 1, 2, 3;

  x_correo     varchar2(32767);
  x_correo1    varchar2(32767);
  x_correo2    varchar2(32767);
  l_name       varchar2(2000) := 'stock_baterias_bosch.csv';
  l_blob       blob;
  dest_offset  integer;
  src_offset   integer;
  lang_context integer;
  warning      varchar2(1000);

  procedure p_enviar_correos is
  begin
    dbms_lob.createtemporary(l_blob, false);
    dest_offset := 1;
    src_offset := 1;
    lang_context := 0;

    -- convert to a BLOB here:
    dbms_lob.converttoblob(l_blob, x_correo, dbms_lob.getlength(x_correo), dest_offset, src_offset,
                           0, lang_context, warning);

    x_mails(1) := 'cnavarro@pevisa.com.pe';
    x_mails(2) := 'baterias.bosch@pevisa.com.pe';

    for i in 1..2 loop
      send_mail(
          p_to => x_mails(i),
          p_from => x_from,
          p_subject => 'Reporte Stock de Baterias BOSCH' || to_char(x_fecha_al, 'DD/MM/YYYY'),
          p_text_msg => x_correo1,
          p_attach_name => l_name,
          p_attach_mime => 'text/plain',
          p_attach_blob => l_blob,
          p_smtp_host => '10.0.0.42',
          p_smtp_port =>'25'
      );
    end loop;

  end;

  procedure p_carga_correos is
  begin
    x_correo1 := rtrim(x_correo1) || 'REPORTE STOCK BATERIAS BOSCH' || chr(10);
    x_correo1 := rtrim(x_correo1) || '   ' || chr(10);
    x_correo1 := rtrim(x_correo1) || '   ' || chr(10);
    x_correo1 := rtrim(x_correo1) || 'Se adjunta archivo  de Stocks' || chr(10);
    x_correo1 := rtrim(x_correo1) || '   ' || chr(10);
    x_correo1 := rtrim(x_correo1) || '   ' || chr(10);
    x_correo1 := rtrim(x_correo1) || '   ' || chr(10);
    x_correo1 := rtrim(x_correo1) || 'Gracias' || chr(10);
    x_correo1 := rtrim(x_correo1) || '  ' || chr(10);
    x_correo1 := rtrim(x_correo1) || 'Sistemas' || chr(10);
    x_correo1 := rtrim(x_correo1) || '  ' || chr(10);

    x_correo := null;

    x_correo :=
        rtrim(x_correo) || ',Reporte Stock de Baterias BOSCH al ' || to_char(x_fecha_al, 'DD/MM/YYYY') ||
        chr(10) || chr(10);
    x_correo := rtrim(x_correo) || 'MARCA,DESCRIPCION LINEA,CODIGO ARTICULO,STOCK' || chr(10);

    for rec2 in c1_stock
    loop
      begin
        x_correo :=
            rtrim(x_correo) || rec2.marca || ',' || rec2.descri_linea || ',' || rec2.cod_art ||
            ',' || rec2.stock_f0 || chr(10);
      end;
    end loop;

    p_enviar_correos();

  end;

begin /******************** MAIN ********************/
  select trunc(sysdate) into x_fecha_al from dual;
  x_correo := null;
  x_correo1 := null;
  x_correo2 := null;
  p_carga_correos();
end;
/

