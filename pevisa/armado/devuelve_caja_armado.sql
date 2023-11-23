declare
  cursor cr_cajas is
    select cod_caja as codigo_caja
      from vw_cajas_armado
     where cod_caja = 279706;
begin
  dbms_output.put_line('=====================');
  for r in cr_cajas loop
    dbms_output.put_line('0.. CODIGO_CAJA: ' || r.codigo_caja);
    --------------------------------- -- 1. Cambia a "En producción" el estado de  las órdenes que están dentro de la caja
    update produccion_armado
       set estado = 2
     where numero_oa in (
       select p.numero_oa
         from produccion_armado p, produccion_armado_log l
        where p.numero_oa = l.numero_oa and l.cod_caja = (r.codigo_caja)
       );
    dbms_output.put_line('1.. CODIGO_CAJA: ' || r.codigo_caja || '  procesados...: ' ||
                         sql%rowcount);
    --
--
    --------------------------------- 2. Inserta el historial de cada una de las ordenes
    insert into produccion_armado_his
    select p.numero_oa, 2, sysdate, 'ORDEN REGRESADA A PRODUCCION A PEDIDO DE DAVID', user, null
      from produccion_armado p, produccion_armado_log l
     where p.numero_oa = l.numero_oa and l.cod_caja = (r.codigo_caja);
    dbms_output.put_line('2.. CODIGO_CAJA: ' || r.codigo_caja || '  procesados...: ' ||
                         sql%rowcount);
    --
--
    ------------------------------------ 3. Cambia a "Producción" el estado de la caja
    update produccion_armado_cajas
       set estado    = 1,
           peso      = null,
           peso_neto = null,
           inspector = null
     where cod_caja = (r.codigo_caja);
    dbms_output.put_line('3.. CODIGO_CAJA: ' || r.codigo_caja || '  procesados...: ' ||
                         sql%rowcount);
    --
--
    -------------------------------------------------- 4. Inserta el historial de la caja
    insert into produccion_armado_cajas_his
    values ((r.codigo_caja), 1, sysdate, 'CAJA ABIERTA A PEDIDO DE DAVID', user, '07', null);
    dbms_output.put_line('4.. CODIGO_CAJA: ' || r.codigo_caja || '  procesados...: ' ||
                         sql%rowcount);
    --
--
    ---------------------------------------------------- 5. Elimina el detalle de la caja
    delete produccion_armado_cajas_det
     where cod_caja = (r.codigo_caja);
    dbms_output.put_line('5.. CODIGO_CAJA: ' || r.codigo_caja || '  procesados...: ' ||
                         sql%rowcount);
    --
--
    ------------------------------------------------------ 6. Elimina la revisión de la caja
    delete produccion_armado_rev
     where cod_caja = (r.codigo_caja);
    dbms_output.put_line('6.. CODIGO_CAJA: ' || r.codigo_caja || '  procesados...: ' ||
                         sql%rowcount);
    --
--
    ------------------------------------------ 7. Pasar el estado de las ordenes a 4 en el módulo antiguo
    update pr_ot
       set estado = 4
     where numero in (
       select p.numero_oa
         from produccion_armado p, produccion_armado_log l
        where p.numero_oa = l.numero_oa
          and l.cod_caja = (r.codigo_caja)
       )
       and nuot_tipoot_codigo = 'AR'
       and estado = 6;
    dbms_output.put_line('7.. CODIGO_CAJA: ' || r.codigo_caja || '  procesados...: ' ||
                         sql%rowcount);
  end loop;

  commit;
end;