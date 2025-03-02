-- cambia el tipo de transaccion y la serie que son el id correlativo
declare
  k_trx_new constant numdoc.tp_transac%type := '28';
  l_num              numdoc.numero%type     := 0;
  l_kardexg_changes  pls_integer            := 0;
  l_kardexd_changes  pls_integer            := 0;

  cursor cr_trx_to_change is
    select *
      from kardex_g g
     where exists (
       select 1
         from tmp_carga_data t
        where g.cod_alm = t.cod_alm
          and g.tp_transac = t.tp_transac
          and g.serie = t.serie
          and g.numero = t.numero
       );

begin
  for r in cr_trx_to_change loop
    l_num := api_numdoc.next_id(k_trx_new, r.serie);

    update kardex_g
       set tp_transac = k_trx_new
         , numero     = l_num
     where cod_alm = r.cod_alm
       and tp_transac = r.tp_transac
       and serie = r.serie
       and numero = r.numero;

    l_kardexg_changes := l_kardexg_changes + sql%rowcount;

    update kardex_d
       set tp_transac = k_trx_new
         , numero     = l_num
     where cod_alm = r.cod_alm
       and tp_transac = r.tp_transac
       and serie = r.serie
       and numero = r.numero;

    l_kardexd_changes := l_kardexd_changes + sql%rowcount;
  end loop;
  dbms_output.put_line('cambios kardexg ' || l_kardexg_changes);
  dbms_output.put_line('cambios kardexd ' || l_kardexd_changes);
end;

-- revisa cambios
select *
  from kardex_g g
 where exists (
   select 1
     from tmp_carga_data t
    where g.cod_alm = t.cod_alm
      and g.tp_transac = t.tp_transac
      and g.serie = t.serie
      and g.numero = t.numero
   );

select *
  from kardex_d g
 where exists (
   select 1
     from tmp_carga_data t
    where g.cod_alm = t.cod_alm
      and g.tp_transac = t.tp_transac
      and g.serie = t.serie
      and g.numero = t.numero
   );

select *
  from kardex_g
 where cod_alm = 'FJ'
   and tp_transac = '27'
   and serie = 1
   and nro_doc_ref in ('393', '394', '395', '396')
 order by fch_transac desc, nro_doc_ref desc;

select *
  from kardex_g
 where cod_alm = '03'
   and tp_transac = '51'
   and serie = 1
   and numero = 25911
 order by fch_transac desc;

select *
  from kardex_g
 where cod_alm = '03'
   and tp_transac = '28'
   and serie = 1
   and numero = 25911
 order by fch_transac desc;


select *
  from kardex_d
 where cod_alm = '03'
   and tp_transac = '51'
   and serie = 1
   and numero = 25898
 order by fch_transac desc;

select *
  from kardex_d
 where cod_alm = '03'
   and tp_transac = '28'
   and serie = 1
   and cod_art = '200.3249NA'
 order by fch_transac desc;

select cod_alm, tp_transac, serie, numero
  from tmp_carga_data;