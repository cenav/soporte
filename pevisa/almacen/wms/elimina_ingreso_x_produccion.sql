declare
  k_estado         constant pls_integer := 1;
  k_saldo          constant pls_integer := 0;
  k_cant_ing       constant pls_integer := 0;
  l_rowcount                pls_integer := 0;

  cursor cur_orden is
    select *
      from pr_ot
     where nuot_tipoot_codigo = 'PR'
       and numero in (606356);

  cursor cur_transacciones(p_tipo varchar2, p_serie varchar2, p_numero varchar2, p_ingsal varchar2) is
    select *
      from kardex_g
     where tipo_pguia = p_tipo
       and serie_pguia = p_serie
       and numero_pguia = p_numero
       and ing_sal = p_ingsal
       and tp_transac = '18'
       and cod_alm = '37';
begin
  for r in cur_orden loop
    for rc in cur_transacciones(r.nuot_tipoot_codigo, r.nuot_serie, r.numero, 'I') loop
      delete kardex_d
       where cod_alm = rc.cod_alm
         and tp_transac = rc.tp_transac
         and serie = rc.serie
         and numero = rc.numero;

      l_rowcount := l_rowcount + sql%rowcount;

      delete kardex_g
       where cod_alm = rc.cod_alm
         and tp_transac = rc.tp_transac
         and serie = rc.serie
         and numero = rc.numero;
    end loop;

    update pr_ot o
       set estado           = k_estado
         , o.cant_ingresado = k_cant_ing
     where o.nuot_tipoot_codigo = r.nuot_tipoot_codigo
       and o.nuot_serie = r.nuot_serie
       and o.numero = r.numero;

    update pr_ot_det o
       set saldo = k_saldo
     where o.ot_nuot_tipoot_codigo = r.nuot_tipoot_codigo
       and o.ot_nuot_serie = r.nuot_serie
       and o.ot_numero = r.numero;
  end loop;

  dbms_output.put_line(l_rowcount);
  commit;
end;
