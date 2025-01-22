begin
  pr_calcula_consumo_piezas_falt();
end;

begin
  pr_calcula_consumo_subpza_falt();
end;

select *
  from consumo_piezas_resumen
 where id_grupo = '01';


declare
  tope_total         number := 1200; -- Tope total de la orden
  max_meses          number := 24; -- Límite máximo de meses
  cantidad_inicial   number := 7655; -- Cantidad inicial de la orden
  promedio_mensual   number := 0; -- Incremento promedio mensual
  incremento_mensual number; -- Incremento total en los meses
  cantidad_agregar   number; -- Cantidad a agregar calculada
begin
  -- Calcular el incremento total en 24 meses
  incremento_mensual := promedio_mensual * max_meses;

  -- Calcular la cantidad a agregar necesaria para alcanzar el tope total
  cantidad_agregar := incremento_mensual;

  -- Validar que no supera el tope total
  if (cantidad_inicial + incremento_mensual) > tope_total then
    cantidad_agregar := tope_total - cantidad_inicial;
  end if;

  -- Si la cantidad a agregar es negativa, se establece en 0
  if cantidad_agregar < 0 then
    cantidad_agregar := 0;
  end if;

  -- Mostrar el resultado
  dbms_output.put_line('Cantidad a agregar: ' || cantidad_agregar);
end;

