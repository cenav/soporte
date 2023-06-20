declare
  op pr_ot%rowtype;
begin
  emite.op('CL-O 200.4169', 294, false, op);
  commit;
  dbms_output.put_line(op.numero);
end;

select * from articul where cod_art = 'CL-O 200.4169';

-- emite listado desde tabla temporal
declare
  l_op pr_ot%rowtype;
begin
  for r in (select cod_art, cantidad from tmp_carga_data) loop
    emite.op(r.cod_art, r.cantidad, false, l_op);
    dbms_output.put_line(rpad(r.cod_art, 31) || rpad(r.cantidad, 10) || l_op.numero);
  end loop;
end;


-- emite standard
declare
  l_ordenes api_pr_ot.aat;
begin
  emite.standard('NPC 330.605-2', 30, l_ordenes);
  commit;
  for i in 1 .. l_ordenes.count loop
    dbms_output.put_line(
          l_ordenes(i).nuot_tipoot_codigo || ' ' || l_ordenes(i).nuot_serie || ' ' || l_ordenes(i).numero
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
            l_ordenes(i).nuot_tipoot_codigo || ' ' || l_ordenes(i).nuot_serie || ' ' || l_ordenes(i).numero
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

select rpad('codigo', 10) || rpad('300', 10) || rpad('155979', 10)
  from dual;

select cod_art, cantidad from tmp_carga_data;

select * from tmp_carga_data;

select *
  from gastos_de_viaje_habilitado
 where id_vendedor = '03'
   and numero = 154;

select *
  from gastos_de_viaje_habilitado
 where fecha_del between to_date('01/02/2022', 'dd/mm/yyyy') and to_date('28/02/2022', 'dd/mm/yyyy')
   and estado != '8';

select *
  from gastos_de_viaje_habilitado_d
 where id_vendedor = '03'
   and numero = 154;

select *
  from pagos_h
 where serie_planilla = 21
   and numero_planilla = 871;

select *
  from pagos_i
 where serie_num = '03'
   and numero = 154;

select *
  from gastos_de_viaje_habilitado
 where estado = 8
   and moneda = 'S'
   and trunc(fecha_cierre) >= to_date('30/01/2022', 'dd/mm/yyyy')
   and trunc(fecha_cierre) <= to_date('05/02/2022', 'dd/mm/yyyy')
   and not exists
   (
     select 1
       from pagos_i i
      where i.serie_planilla in (21, 22)
        and i.serie_num = gastos_de_viaje_habilitado.id_vendedor
        and i.numero = gastos_de_viaje_habilitado.numero
        and nvl(i.estado, 0) < 9
   );
