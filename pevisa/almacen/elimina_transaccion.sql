declare
  -- Anula transacciones masivo
  l_total simple_integer := 0;

  cursor trx is
    select *
      from kardex_g
     where cod_alm = 'TI'
       and tp_transac = '10'
       and serie = 118
       and numero = 3
     order by ing_sal desc, numero_pguia;
begin
  for r in trx loop
    delete
      from kardex_g
     where cod_alm = r.cod_alm
       and tp_transac = r.tp_transac
       and serie = r.serie
       and numero = r.numero;

    l_total := l_total + sql%rowcount;

    delete
      from kardex_d
     where cod_alm = r.cod_alm
       and tp_transac = r.tp_transac
       and serie = r.serie
       and numero = r.numero;

  end loop;

  dbms_output.put_line('total eliminado >>>>> ' || l_total);
end;