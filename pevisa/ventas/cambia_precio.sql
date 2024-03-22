declare
  c_fmtdate   constant varchar2(30) := 'dd/mm/yyyy';
  c_fmtnumber constant varchar2(30) := '9999999.99';

  subtype t_string is varchar2(32767);

  type t_precios is record (
    numero  expedido_d.numero%type,
    nro     expedido_d.nro%type,
    cod_art expedido_d.cod_art%type,
    preuni  expedido_d.preuni%type
  );

  l_file               utl_file.file_type;
  l_line               t_string;
  l_precios            t_precios;

  function get_column(
    p_linea   varchar2
  , p_columna simple_integer
  ) return varchar2 is
  begin
    return regexp_substr(replace(trim(p_linea), chr(13), null), '(.*?)(,|$)', 1, p_columna, null,
                         1);
  end;
begin
  l_file := utl_file.fopen('ARCHIVO_PAGOS_DIR', 'cambia_precio.csv', 'R');
  if utl_file.is_open(l_file) then
    loop
      begin
        utl_file.get_line(l_file, l_line, 1000);

        if l_line is null then
          exit;
        end if;

        l_precios.numero := to_number(get_column(l_line, 1));
        l_precios.nro := to_number(get_column(l_line, 2));
        l_precios.cod_art := get_column(l_line, 3);
        l_precios.preuni := to_number(get_column(l_line, 4), c_fmtnumber);

        update expedido_d
           set preuni = l_precios.preuni
             , totlin = l_precios.preuni * canti
         where numero = l_precios.numero
           and nro = l_precios.nro;

        dbms_output.put_line(l_precios.numero || '-' || l_precios.nro);
      exception
        when no_data_found then
          exit;
        when others then
          dbms_output.put_line(l_precios.numero || '-' || l_precios.nro);
          raise;
      end;
    end loop;
  end if;
  utl_file.fclose(l_file);
end;

