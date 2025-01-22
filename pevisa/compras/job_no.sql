begin
  delete from tmp_provisiones_fallidas where serie <> 0;
  commit;
  for rec in (
    select distinct serie, num_ped
      from orden_de_compra_historia
     where glosa = 'APROBADO'
       and creacion_cuando >= trunc(sysdate)
    )
  loop
    declare
      v_voucher varchar2(100);
    begin
      oc_procesador.procesar_cuotas(rec.serie, rec.num_ped, v_voucher);
      dbms_output.put_line('VOUCHER : ' || v_voucher);
      commit;
    exception
      when others then
        insert into tmp_provisiones_fallidas
          (serie, num_ped)
        values
          (rec.serie, rec.num_ped);
        commit;
        dbms_output.put_line('Error procesando serie: ' || rec.serie || ' num_ped: ' ||
                             rec.num_ped || ' - ' || sqlerrm);
    end;
  end loop;
  declare
    v_count integer;
  begin
    select count(*)
      into v_count
      from tmp_provisiones_fallidas
     where serie <> 0;
    if v_count > 0 then
      dbms_output.put_line('se encontro ' || v_count || '  errados ejecuta envio correo');
      report_provisiones_fallidas.envia_correo();
    else
      dbms_output.put_line('todo ok :)');
      --REPORT_PROVISIONES_FALLIDAS.envia_correo();
    end if;
  end;
end;
