declare
  upd pls_integer := 0;

  cursor cur_prestamo is
    select p.cod_prestamo, p.cod_proveedor, p.tipdoc, c.serie_num, c.numero
         , c.fecha_vcto
      from prestamo_banco_cuota c
           join prestamo_banco p
                on c.cod_banco = p.cod_banco
                  and c.cod_prestamo = p.cod_prestamo
     where p.cod_prestamo = '0001CM8';
begin
  for rec in cur_prestamo loop
    update factpag
       set f_vencto = rec.fecha_vcto
     where cod_proveedor = rec.cod_proveedor
       and tipdoc = rec.tipdoc
       and serie_num = rec.serie_num
       and numero = rec.numero;

    if (sql%found) then
      upd := upd + sql%rowcount;
    end if;
  end loop;

  dbms_output.put_line('Registros Actualizados: ' || upd);
end;