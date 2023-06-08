declare
  c_codigo_clasificacion constant varchar2(2) := '5';
  c_longitud             constant pls_integer := 11;

  cursor cur_asiento is
    select distinct ano, mes, libro, voucher
      from movdeta
     where ano = 2023
       and mes = 4
       and libro = '08'
       and length(relacion) = c_longitud;
begin
  for r in cur_asiento loop
    begin
      insert into movglos_anexos (ano, mes, libro, voucher, codigo_clasificacion_del_bien)
      values (r.ano, r.mes, r.libro, r.voucher, c_codigo_clasificacion);
    exception
      when dup_val_on_index then
        update movglos_anexos
           set codigo_clasificacion_del_bien = c_codigo_clasificacion
         where ano = r.ano
           and mes = r.mes
           and libro = r.libro
           and voucher = r.voucher
           and codigo_clasificacion_del_bien is null;
      when others then
        sys.dbms_output.put_line(r.ano || '-' || r.mes || '-' || r.libro || '-' || r.voucher);
    end;
  end loop;

  commit;
end;
