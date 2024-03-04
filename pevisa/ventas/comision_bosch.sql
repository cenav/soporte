select *
  from cominac_concepto
 where cod_concepto = 417;

select * from cominac_concepto_rango;

select * from cominac_base_venta;

select * from cominac_base_venta_linea;

select linea
  from tab_lineas
 order by lpad(linea, 4, '0');

select *
  from tab_grupos
 where grupo = 27;

select * from vw_campana_det;

select * from vendedores;

declare
  l_concepto cominac_concepto%rowtype;
  l_venta    number;
begin
  l_concepto := api_cominac_concepto.onerow(417);

  l_venta := pkg_cominac_qry.base_venta_total(
      '34'
    , to_date('21/01/2024', 'dd/mm/yyyy')
    , to_date('20/02/2024', 'dd/mm/yyyy')
    , 'D'
    , l_concepto
             );

  dbms_output.put_line(l_venta);
end;

select *
  from proceso_cominac_concepto
 where cod_proceso = 3658
   and cod_concepto = 417;

select sum(nvl(total_dolares, 0))
  from vw_venta_detalle
 where cod_vende = '34'
   and cod_grupo = 27
   and fecha between to_date('21/01/2024', 'dd/mm/yyyy') and to_date('20/02/2024', 'dd/mm/yyyy')
 order by fecha;

select *
  from cominac_concepto
 where cod_concepto = 417;

select *
  from cominac_concepto
 where descripcion like '%BONO RECORD 2023%';

select *
  from tab_grupos
 where descripcion like '%RECORD%';