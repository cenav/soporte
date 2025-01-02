-- emite uno por uno
declare
  op pr_ot%rowtype;
begin
  emite.op('70028-I CS-2', 140, false, op);
  commit;
  dbms_output.put_line(op.numero);
end;

--revisar consumo anual
select *
  from vw_articulo
 where cod_art in ('450.254', '450.287SIL');

select cod_art, cantidad from tmp_carga_data;

-- emite listado desde tabla temporal
declare
  l_op pr_ot%rowtype;
begin
  for r in (select cod_art, cantidad from tmp_carga_data) loop
    emite.op(r.cod_art, r.cantidad, false, l_op);
    dbms_output.put_line(rpad(r.cod_art, 31) || rpad(r.cantidad, 10) || l_op.numero);
  end loop;
  commit;
end;

-- emite standard
declare
  l_ordenes api_pr_ot.aat;
begin
  emite.standard('NPC 330.605-2', 30, l_ordenes);
  for i in 1 .. l_ordenes.count loop
    dbms_output.put_line(
        l_ordenes(i).nuot_tipoot_codigo || ' ' || l_ordenes(i).nuot_serie || ' ' ||
        l_ordenes(i).numero
    );
  end loop;
  commit;
end;

-- emite standard segun listado
declare
  l_ordenes api_pr_ot.aat;
begin
  for r in (select cod_art, cantidad from tmp_carga_data) loop
    emite.standard(r.cod_art, r.cantidad, l_ordenes);
    commit;
    for i in 1 .. l_ordenes.count loop
      dbms_output.put_line(
          l_ordenes(i).nuot_tipoot_codigo || ' ' || l_ordenes(i).nuot_serie || ' ' ||
          l_ordenes(i).numero
      );
    end loop;
  end loop;
end;


declare
  l_op pr_ot%rowtype;
begin
  for r in (select cod_art, cantidad from tmp_carga_data) loop
    emite.op(r.cod_art, r.cantidad, false, l_op);
    dbms_output.put_line(rpad(r.cod_art, 31) || rpad(r.cantidad, 10) || l_op.numero);
  end loop;
end;

-- listado op emitidas
select a.dsc_grupo as grupo, o.numero as op
     , o.formu_art_cod_art as codigo, o.cant_prog as cantidad
  from pr_ot o
       join pr_trasab_estado e
            on o.nuot_tipoot_codigo = e.tipo
              and o.nuot_serie = e.serie
              and o.numero = e.numero
       join vw_articulo a on o.formu_art_cod_art = a.cod_art
 where trunc(e.fecha) = to_date('28/12/2024', 'dd/mm/yyyy')
   and e.usuario = 'PEVISA'
   and e.t1 = '25.0.3.33'
   and e.estado = 1
 order by a.dsc_grupo;

-- ordenes caucho abril no impresas
select a.dsc_grupo, o.numero, o.formu_art_cod_art, o.fecha, o.cod_lin, o.cant_prog
  from pr_ot o
       join vw_articulo a on o.formu_art_cod_art = a.cod_art
 where o.nuot_tipoot_codigo = 'PR'
   and to_char(o.fecha, 'yyyymm') = '202404'
   and not exists (
   select 1
     from pr_ot_impresion i
    where i.nuot_tipoot_codigo = o.nuot_tipoot_codigo
      and i.nuot_serie = o.nuot_serie
      and i.numero = o.numero
   )
   and a.id_grupo = '06';
