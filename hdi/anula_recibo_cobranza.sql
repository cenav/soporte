--- SOLICITAR NUMERO DE RECIBO A GABRIELA O TE ENVIA POR CORREO
--- ACA BUSCA QUE NO TENGA VOUCHER  PARA QUE SE PUEDA ANULAR ---
select h.* ------H.NUMERO_PLANILLA, H.COD_COBRADOR
  from planilla_cobranzas_h h
 where numero_planilla in (
   :XRECIBO
   )
   and voucher_c is null;

select *
  from movfigl
 where ano = 2023
   and mes = 4
   and tipo = '5'
   and voucher = 40029;

-----
-------------- PROCEDIMIENTO PARA ANULAR RECIBOS DE COBRANZAS -----------
--- AL FINALIZAR DAR COMMIT
declare
  xcodart varchar2(30);
  xrecibo number(8);

  cursor c1 is
    select h.numero_planilla, h.cod_cobrador
      from planilla_cobranzas_h h
     where numero_planilla in (
       :XRECIBO
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

update pedido
   set total_facturado = total_facturado - :docuvent.importe
 where serie = :docuvent.ser_doc_ref and num_ped = :docuvent.nro_doc_ref;

select *
  from pedido
 where num_ped = 2066
   and serie = 20;

select imp_neto
     , imp_igv
     , imp_interes
-- , (imp_neto + (imp_igv - imp_interes * igvdoc))
  from docuvent
 where tipodoc = '01'
   and serie = 'F055'
   and numero = 1;

select valor
  from impuesto
 where codigo = '1';
