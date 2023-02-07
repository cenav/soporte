declare
  l_file          utl_file.file_type;
  l_line          varchar2(32767);
  l_fmt           varchar2(30) := 'dd/mm/yyyy';
  l_id_personal   vacunacion.id_personal%type;
  l_fch_1_dosis   vacunacion.fch_vacunacion%type;
  l_fch_2_dosis   vacunacion.fch_vacunacion%type;
  l_fch_3_dosis   vacunacion.fch_vacunacion%type;
  l_id_fabricante vacunacion.id_fabricante%type;

  function get_column(
    p_linea   varchar2
  , p_columna simple_integer
  ) return varchar2 is
  begin
    return regexp_substr(replace(trim(p_linea), chr(13), null), '(.*?)(,|$)', 1, p_columna, null, 1);
  end;
begin
  l_file := utl_file.fopen('ARCHIVO_PAGOS_DIR', 'vacunas.csv', 'R');
  if utl_file.is_open(l_file) then
    loop
      begin
        utl_file.get_line(l_file, l_line, 1000);
        if l_line is null then
          exit;
        end if;
        l_id_personal := get_column(l_line, 1);
        l_fch_1_dosis := to_date(get_column(l_line, 4), l_fmt);
        l_fch_2_dosis := to_date(get_column(l_line, 5), l_fmt);
        l_fch_3_dosis := to_date(get_column(l_line, 6), l_fmt);
        l_id_fabricante := case get_column(l_line, 7)
                             when 'PFIZER' then 1
                             when 'SINOPHARM' then 2
                             when 'ASTRAZENECA' then 3
                           end;

        if l_fch_1_dosis is not null then
          insert into vacunacion(id_personal, id_vacunacion, id_vacuna, fch_vacunacion, dosis, id_fabricante)
          values (l_id_personal, 1, 1, l_fch_1_dosis, 1, l_id_fabricante);
        end if;

        if l_fch_2_dosis is not null then
          insert into vacunacion(id_personal, id_vacunacion, id_vacuna, fch_vacunacion, dosis, id_fabricante)
          values (l_id_personal, 2, 1, l_fch_2_dosis, 2, l_id_fabricante);
        end if;

        if l_fch_3_dosis is not null then
          insert into vacunacion(id_personal, id_vacunacion, id_vacuna, fch_vacunacion, dosis, id_fabricante)
          values (l_id_personal, 3, 1, l_fch_3_dosis, 3, l_id_fabricante);
        end if;
      exception
        when no_data_found then
          exit;
        when others then
          dbms_output.put_line(l_id_personal);
          raise;
      end;
    end loop;
  end if;
  utl_file.fclose(l_file);
end;