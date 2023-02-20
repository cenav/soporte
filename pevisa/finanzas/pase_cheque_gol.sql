declare
  cursor c1 is
    select g.ano, g.mes, g.tipo, g.voucher, g.numero, g.fecha, g.a_la_orden, g.importe
      from movfigl g
         , ctabnco_cheques chq
     where g.ano = 2022
       and g.mes = 3
       and g.tipo = '8'
       and g.voucher between 30113 and 30113
       and g.numero = chq.id_cheque;

begin
  for rec in c1 loop
    update ctabnco_cheques g
       set estado     = 11
         , a_la_orden = rec.a_la_orden
         , importe    = rec.importe
         , ano        = rec.ano
         , mes        = rec.mes
         , libro      = rec.tipo
         , voucher    = rec.voucher
         , fecha      = rec.fecha
     where id_cheque = rec.numero;

    dbms_output.put_line(rec.voucher || '    * CHEQUE:' || rec.numero || '  ' || rec.fecha || ' ' ||
                         sql%rowcount || ' actualizada');
  end loop;
end;
