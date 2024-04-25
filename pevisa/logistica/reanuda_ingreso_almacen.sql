select distinct o.num_ped, o.cod_proveed, p.nombre, o.cond_pag, o.moneda, o.moneda as moneda_factura
              , o.por_desc1
              , o.por_desc2, c.descripcion as descripcion_pago, o.fecha, p.ruc, o.impsto
              , o.tot_valvta
              , o.tot_impu
              , o.tot_orden, c.v01
              , decode(o.moneda, 'D', 'US$', 'S', 'S/.', 'XXX') as simbolo_moneda
              , o.tot_valvta as tot_valvta_back, o.total_facturado
  from orden_de_compra o
     , itemord i
     , proveed p
     , lg_condpag c
 where o.tipo_docto = (82)
   and o.estado >= 2
   and o.estado <= 4
   and i.serie = o.serie
   and i.num_ped = o.num_ped
   and nvl(i.saldo, 0) > 0
   and o.cod_proveed = p.cod_proveed
   and o.cond_pag = c.cond_pag
   and o.serie = :serie_oc
   and o.num_ped = :numero_c
   and c.tipo <> 'A'
 order by o.num_ped;

-- ESTADO ORDEN
select *
  from orden_de_compra
 where serie = :serie_oc
   and num_ped = :numero_oc;

-- SALDO ITEM
select *
  from itemord
 where serie = :serie_oc
   and num_ped = :numero_oc;

-- BORRAR SOLO NUMERO INGRESO ALMACEN
select *
  from oc_registro_facturas
 where serie_oc = :serie_oc
   and numero_oc = :numero_oc;

-- BORRAR TODA LA FILA DE INGRESO ALMACEN
select *
  from kardex_g_movglos
 where serie_oc = :serie_oc
   and numero_oc = to_char(:numero_oc);

-- ELIMINA APROBACION PEVISA
select *
  from orden_de_compra_historia
 where serie = :serie_oc
   and num_ped = :numero_oc;

---------------------------------
-- BUSCA POR OTRAS REFERENCIAS --
---------------------------------
select *
  from kardex_g_movglos
 where serie_cp = 'F001'
   and numero_cp = '68447';


select *
  from oc_registro_facturas
 where cod_alm = 'F0'
   and tp_transac = '11'
   and serie = 11
   and numero = 128;


-- 15	11	2	7378
select *
  from kardex_g
 where cod_alm = 'F0'
   and tp_transac = '11'
   and serie = 11
   and numero = 128;

-- costo correcto dolares
-- 3.645000883
select d.*, costo_s / costo_d
  from kardex_d d
 where cod_alm = 'A1'
   and tp_transac = '11'
   and serie = 1
   and numero = 31224;

select *
  from kardex_d d
 where cod_alm = 'A1'
   and tp_transac = '11'
   and serie = 1
   and numero = 31224;

select *
  from almacen
 where cod_art = 'SLIM400.141';

select *
  from kardex_g_movglos
 where cod_alm = 'A3'
   and tp_transac = '11'
   and serie = 1
   and numero in (60861);

select *
  from kardex_g_movglos
 where cod_proveedor = '205113256133'
   and serie_cp = '0001'
   and numero_cp = '4437';

select *
  from factpag
 where cod_proveedor = '20252370481'
   and serie_num = '001'
   and numero = '0009359';

select *
  from kardex_g_movglos
 where cod_alm = '30'
   and tp_transac = '11'
   and serie = 1
   and numero = 27630;

select *
  from kardex_d
 where cod_alm = '02'
   and tp_transac = '11'
   and serie = 1
   and numero = 30550;

select *
  from oc_registro_facturas
 where cod_proveedor = '20382072023'
   and tipdoc_cp = '01'
   and serie_cp = 'F010'
   and numero_cp = '119260';

select *
  from lg_pedjam
 where num_importa = 'PAF21020';

select *
  from lg_itemjam
 where num_importa = 'PAF21020';

-- A1	11	2	5868
select *
  from kardex_d
 where cod_art = 'RII-MARCO ALUM. 36X78'
 order by fch_transac desc;

select *
  from activo_fijo
 where cod_activo_fijo = 'EQAA1-031INST';

select *
  from kardex_g_movglos
 where guia_remision_serie = 'T001';

select a.tp_transac as tp_transac, b.descripcion as descripcion
  from usuarios_almacenes_perfil a
     , transacciones_almacen b
 where a.usuario = 'DCONTRERAS'
   and a.cod_alm = '02'
   and a.tp_transac = b.tp_transac
   and b.ingreso_salida = 'I'
   and a.estado = 1
   and nvl(b.ingreso_compras, '0') = 'S';

select *
  from usuarios_almacenes_perfil
 where usuario = 'DCONTRERAS'
   and cod_alm = '01';
