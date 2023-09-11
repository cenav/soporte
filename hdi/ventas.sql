select *
  from cotizacion
 where serie = 20
   and num_ped = 222493;

select *
  from pedido
 where num_ped = 222493;

-- GET_CORREO_EFACT

select correo
  from cliente_resp
 where cod_cliente = '20505542364'
   and cod_respo = '80'; ----------------- UBICACION DEL CORREO PARA EFACT

select *
  from cliente_resp
 where cod_cliente = '20505542364';

select *
  from clientes
 where cod_cliente in (
                       '20602385338', '20603366302'
   );

-- tabla de categorias clientes
select *
  from tablas_auxiliares
 where tipo = 24
 order by codigo;

select *
  from clientes
 where grupo_de_precios = '10';

select distinct grupo_de_precios
  from clientes
 where grupo_de_precios is not null;

select *
  from usuarios_cotizacion
 where usuario in ('MGALLARDO', 'HOCANA');

select *
  from comisiones_planilla
 where ano = 2023
   and mes = 7
   and origen = 'PROD';

select *
  from view_cotiza2_estado
 where cotiza = 203553;

select *
  from view_cotiza2_estado
 where cotiza = 203553
   and (fecha between to_date('01/08/2023', 'dd/mm/yyyy') and to_date('31/08/2023', 'dd/mm/yyyy'))
   and (cod_vende like :p_vende)
   and (estado_pedi like :p_estado);

select *
  from cotizacion
 where num_ped = 203416;

select *
  from pedido
 where num_ped = 226598;

select codigo_area, descripcion
  from vw_area_retenido;

begin
  if :estado_pedi = '0' then
    :p_des_Estado := 'Emitido';
  elsif :estado_pedi = '5' then
    if nvl(:total_facturado, 0) = 0 then
      :p_des_Estado := 'Aprobado';
    elsif nvl(:total_facturado, 0) = nvl(:total_cotiza, 0) then
      :p_des_Estado := 'Facturado';
    else
      :p_des_Estado := 'Fact.Parcial';
    end if;
  elsif :estado_pedi = '6' then
    if nvl(:total_facturado, 0) = 0 then
      :p_des_Estado := 'Cerrado';
    else
      :p_des_Estado := 'Facturado';
    end if;
  elsif :estado_pedi = '4' then
    :p_des_Estado := 'No Aprobado';
  elsif :estado_pedi = '9' then
    :p_des_Estado := 'Anulado';
  elsif :estado_pedi = '2' then
    :p_des_Estado := 'Netos';
  elsif :estado_pedi = 'x' then
    :p_des_Estado := 'en Cotiza';
  else
    :p_des_Estado := '';
  end if;
end;

select *
  from cotizacion
 where num_ped = 203553;

select *
  from cotizacion
 where num_ped = 204002;

select *
  from pedido
 where num_ped = 227263;

select *
  from pedido
 where numero_ref = '203553';

select *
  from cotizacion
 where estado = '2';
--    and cod_vende in (
--    select cod_vendedor from vendedores where supervisor like :GLOBAL.supervisor
--    )

-- estado 0 ==> emitida
-- estado 6 ==> cerrada
select *
  from cotizacion
 where num_ped in (204104, 204108);

select *
  from pedido
 where num_ped in (227363, 227362);

select *
  from itemped
 where num_ped in (227363, 227362);