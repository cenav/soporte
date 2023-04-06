declare
  cursor cr_documentos is
    select tipdoc, serie_num, numerodoc, detalle
      from tmp_carga_data;

  i pls_integer := 0;
begin
  for r in cr_documentos loop
    update factcob
       set f_vencto = r.detalle
     where tipdoc = r.tipdoc and serie_num = r.serie_num and numero = r.numerodoc;
    i := i + sql%rowcount;
  end loop;
  sys.dbms_output.put_line('Registros actualizados ' || i);
end;
