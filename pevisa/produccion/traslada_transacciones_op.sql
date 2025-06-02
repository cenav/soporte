declare
  k_op_tpo     constant varchar2(2) := 'PR';
  k_op_ser     constant varchar2(2) := '8';
  k_op_origen  constant pls_integer := 602953;
  k_op_destino constant pls_integer := 602900;
  l_rowcount            pls_integer := 0;
begin
  delete from tmp_carga_data;

  insert into tmp_carga_data(cod_alm, tp_transac, serie, numero)
  select cod_alm, tp_transac, serie, numero
    from kardex_g
   where tipo_pguia = k_op_tpo
     and serie_pguia = k_op_ser
     and numero_pguia = k_op_origen;

  for r in (
    select cod_alm, tp_transac, serie, numero
      from tmp_carga_data
    )
  loop
    update kardex_g
       set tipo_pguia   = k_op_tpo
         , serie_pguia  = k_op_ser
         , numero_pguia = k_op_destino
         , num_importa  = 'OP/' || k_op_destino
     where cod_alm = r.cod_alm
       and tp_transac = r.tp_transac
       and serie = r.serie
       and numero = r.numero;

    update kardex_d
       set pr_tipot = k_op_tpo
         , pr_numot = k_op_destino
     where cod_alm = r.cod_alm
       and tp_transac = r.tp_transac
       and serie = r.serie
       and numero = r.numero;

    l_rowcount := l_rowcount + sql%rowcount;
  end loop;

  dbms_output.put_line(l_rowcount);
  commit;
end;
