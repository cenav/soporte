declare
  cursor transaccion_cur is
    select cod_alm, tp_transac, serie, numero
      from kardex_d
     where cod_alm = '30'
       and tp_transac = '22'
       and serie = 1
       and numero = 244896;
begin
  for r in transaccion_cur loop
    delete
      from kardex_g
     where cod_alm = r.cod_alm
       and tp_transac = r.tp_transac
       and serie = r.serie
       and numero = r.numero;

    dbms_output.put_line('maestro ' || sql%rowcount);

    delete
      from kardex_d
     where cod_alm = r.cod_alm
       and tp_transac = r.tp_transac
       and serie = r.serie
       and numero = r.numero;

    dbms_output.put_line('detalle ' || sql%rowcount);
  end loop;

  commit;
end;