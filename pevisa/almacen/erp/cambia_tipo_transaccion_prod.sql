-- cambia el tipo de transaccion y la serie que son el id correlativo produccion
declare
  k_sal_tran constant numdoc.tp_transac%type := '27';
  k_sal_prod constant numdoc.tp_transac%type := '29';
  l_nro               numdoc.numero%type     := 0;
  l_nueva_tran        numdoc.tp_transac%type;
  l_cambios_kardexg   pls_integer            := 0;
  l_cambios_kardexd   pls_integer            := 0;

  cursor cr_transacciones is
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

  function get_transaccion(
    p_transaccion numdoc.tp_transac%type
  ) return numdoc.tp_transac%type is
  begin
    return case p_transaccion
             when k_sal_tran then k_sal_prod
             when k_sal_prod then k_sal_tran
             else p_transaccion
           end;
  end;

begin
  for r in cr_transacciones loop
    l_nueva_tran := get_transaccion(r.tp_transac);
    l_nro := api_numdoc.next_id(l_nueva_tran, r.serie);

    update kardex_g
       set tp_transac = l_nueva_tran
         , numero     = l_nro
     where cod_alm = r.cod_alm
       and tp_transac = r.tp_transac
       and serie = r.serie
       and numero = r.numero;

    l_cambios_kardexg := l_cambios_kardexg + sql%rowcount;

    update kardex_d
       set tp_transac = l_nueva_tran
         , numero     = l_nro
     where cod_alm = r.cod_alm
       and tp_transac = r.tp_transac
       and serie = r.serie
       and numero = r.numero;

    l_cambios_kardexd := l_cambios_kardexd + sql%rowcount;
  end loop;
  dbms_output.put_line(l_cambios_kardexg);
  dbms_output.put_line(l_cambios_kardexd);
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
   and numero = 25911
 order by fch_transac desc;

select *
  from kardex_d
 where cod_alm = '03'
   and tp_transac = '28'
   and serie = 1
   and cod_art = 'MET 380.701NY'
 order by fch_transac desc;
