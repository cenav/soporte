declare
  c_estado         constant pls_integer := 1;
  c_saldo          constant pls_integer := 0;

  cursor cur_orden is
    select *
      from pr_ot
     where nuot_tipoot_codigo = 'FC'
       and nuot_serie = 1
       and numero = 275;

  cursor cur_transacciones(p_tipo varchar2, p_serie varchar2, p_numero varchar2, p_ingsal varchar2) is
    select *
      from kardex_g
     where tipo_pguia = p_tipo
       and serie_pguia = p_serie
       and numero_pguia = p_numero
       and ing_sal = p_ingsal;
begin
  for r in cur_orden loop
    for rc in cur_transacciones(r.nuot_tipoot_codigo, r.nuot_serie, r.numero, 'S') loop
      delete kardex_d
       where cod_alm = rc.cod_alm
         and tp_transac = rc.tp_transac
         and serie = rc.serie
         and numero = rc.numero;

      delete kardex_g
       where cod_alm = rc.cod_alm
         and tp_transac = rc.tp_transac
         and serie = rc.serie
         and numero = rc.numero;
    end loop;

    for rc in cur_transacciones(r.nuot_tipoot_codigo, r.nuot_serie, r.numero, 'I') loop
      delete kardex_d
       where cod_alm = rc.cod_alm
         and tp_transac = rc.tp_transac
         and serie = rc.serie
         and numero = rc.numero;

      delete kardex_g
       where cod_alm = rc.cod_alm
         and tp_transac = rc.tp_transac
         and serie = rc.serie
         and numero = rc.numero;
    end loop;

    update pr_ot o
       set estado = c_estado
     where o.nuot_tipoot_codigo = r.nuot_tipoot_codigo
       and o.nuot_serie = r.nuot_serie
       and o.numero = r.numero;

    update pr_ot_det o
       set saldo = c_saldo
     where o.ot_nuot_tipoot_codigo = r.nuot_tipoot_codigo
       and o.ot_nuot_serie = r.nuot_serie
       and o.ot_numero = r.numero;
  end loop;

  commit;
end;
