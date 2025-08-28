declare
  l_stock almacen.stock%type := 0;
begin
  api_almacen.carga_stock();
  l_stock := api_almacen.stock('MET 450.094');
  dbms_output.put_line(l_stock);
end;


declare
  l_stock almacen.stock%type := 0;
begin
  api_almacen.carga_stock_oa();
  l_stock := api_almacen.stock_oa('400.2905');
  dbms_output.put_line(l_stock);
end;


declare
  l_embalaje vw_analisis_embalaje%rowtype;
begin
  surte_reporte.carga_embalaje();
  l_embalaje := surte_reporte.embalaje('AJU BMS 16124 E');
  dbms_output.put_line(l_embalaje.tipo_embalaje);
  dbms_output.put_line(l_embalaje.stock_06);
end;


select *
  from almacen
 where stock > 100;

select nvl(sum(stock), 0) as stock_03
  from almacen
 where cod_art = r.cod_pza
   and cod_alm in ('03', '05');

select art_cod_art, nvl(sum(cant_formula), 0) as stock_oa_impresa
  from vw_ordenes_impresas_piezas
 group by art_cod_art;

select *
  from vw_analisis_embalaje
 where cod_art = 'AJU BMS 16124 E';
