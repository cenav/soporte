select *
  from articul
 where cod_art = 'PUB116-0301001';


select a.cod_art, a.descripcion, a.unidad, n.stock, a.u_eqv, l.linea, l.grupo, v.importe as precio
     , pr_medpza as cod_ing, l.grupo_venta, v.estado
  from articul a
     , tab_lineas l
     , lispred v
     , almacen n
 where a.tp_art in ('T', 'S')
   and l.linea = a.cod_lin
   and l.grupo is not null
   and v.cod_art = a.cod_art
   and v.nro_lista = :nro_lista
   and l.grupo_venta = :unidad_negocio
   and n.cod_art(+) = a.cod_art
   and n.cod_alm(+) = 'F0'
   and a.cod_lin <> '248'
   and a.cod_art = 'PUB116-0301001'
 order by a.cod_art;


begin
  if round(:itemped.precio * :itemped.factor_desc, 2) < get_costos(:ITEMPED.cod_art, '02') then
    mal('DESCUENTOS MAYORES AL COSTO !!!');
  end if;
end;