--- solicitar numero de recibo a gabriela o te envia por correo
--- aca busca que no tenga voucher  para que se pueda anular ---
--- h.numero_planilla, h.cod_cobrador
select h.*
  from planilla_cobranzas_h h
 where numero_planilla in (
   :numero_recibo
   )
   and voucher_c is null;

select *
  from movfigl
 where ano = 2023
   and mes = 5
   and tipo = '5'
   and voucher = 50098;

-------------- procedimiento para anular recibos de cobranzas -----------
declare
  xcodart varchar2(30);
  xrecibo number(8);

  cursor c1 is
    select h.numero_planilla, h.cod_cobrador
      from planilla_cobranzas_h h
     where numero_planilla in (
       :numero_recibo
       )
       and estado <> 9
       and voucher_c is null;
begin
  for rec in c1 loop
    delete planilla_cobranzas_d
     where numero_planilla = rec.numero_planilla;
    delete planilla_cobranzas_i
     where numero_planilla = rec.numero_planilla;
    update planilla_cobranzas_h
       set estado  = 9
         , detalle = '*** ANULADO ***'
     where numero_planilla = rec.numero_planilla;
    update cobradores_recibos
       set estado   = 9
         , importe  = 0
         , imported = 0
     where numero_recibo in rec.numero_planilla;
    begin
      null;
    end;
  end loop;
--.    DBMS_OUTPUT.PUT_LINE ( '<----------- fin' );
end;

-- update pedido
--    set total_facturado = total_facturado - :docuvent.importe
--  where serie = :docuvent.ser_doc_ref and num_ped = :docuvent.nro_doc_ref;
--
-- select imp_neto
--      , imp_igv
--      , imp_interes
-- -- , (imp_neto + (imp_igv - imp_interes * igvdoc))
--   from docuvent
--  where tipodoc = '01'
--    and serie = 'F055'
--    and numero = 1;
--
-- select valor
--   from impuesto
--  where codigo = '1';