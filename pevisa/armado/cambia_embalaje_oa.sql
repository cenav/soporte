declare
  l_cambio        articul.cod_art%type;
  l_total_updates number := 0;
begin
  for r in (
    -- 75 rows
    select o.nuot_tipoot_codigo, o.nuot_serie, o.numero, d.art_cod_art
      from pr_ot o
           join pr_ot_det d
                on o.nuot_tipoot_codigo = d.ot_nuot_tipoot_codigo
                  and o.nuot_serie = d.ot_nuot_serie
                  and o.numero = d.ot_numero
     where o.nuot_tipoot_codigo = 'AR'
       and o.estado in ('1', '2', '3', '4')
       and exists(
       select 1
         from tmp_carga_data t
        where t.cod_art = d.art_cod_art
       )
    )
  loop
    select cod_activo_fijo
      into l_cambio
      from tmp_carga_data
     where cod_art = r.art_cod_art;

    update pr_ot_det d
       set d.art_cod_art = l_cambio
     where d.ot_nuot_tipoot_codigo = r.nuot_tipoot_codigo
       and d.ot_nuot_serie = r.nuot_serie
       and d.ot_numero = r.numero
       and d.art_cod_art = r.art_cod_art;

    l_total_updates := l_total_updates + sql%rowcount; -- suma filas afectadas en este UPDATE
  end loop;

  dbms_output.put_line('Total de filas actualizadas: ' || l_total_updates);
end;


select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'AR'
   and ot_numero in (
   1143035
   );


select cod_art, cod_activo_fijo
  from tmp_carga_data
 where cod_art = 'DUR 145.385';