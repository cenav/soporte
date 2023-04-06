select * from campana_cliente;

select *
  from planilla10.personal
 where encargado = '056'
 order by apellido_paterno;

select *
  from campana
 where cod_campana in (
                       'E2022-1', 'E2022-2', 'E2022-3', 'E2022-4'
   );

select *
  from proceso_comiacc
 where cod_proceso = '00268';

-- Los premios en soles, son montos fijos establecidos al inicio de la campaña, no fluctúan con el tipo de cambio.
-- Por tanto, solo deben cumplir la cuota en dólares valor venta y acceden al premio en soles establecido.

select *
  from vw_campana_det
 where cod_campana = 'E2022-1';