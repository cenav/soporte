select *
  from exbooking_d
 where numero_booking = 'AER-113';

select *
  from exfacturas
 where numero in (
   19684
   );

select *
  from ex_prefacturas
 where numero in (
   9052750
   );

select *
  from exbooking
 where numero_booking = 'TCL0000150/2024';

select *
  from exbooking_d
 where numero_booking = 'TCL0000150/2024';

select *
  from exproforma_d
 where numero = 19416
   and nro = 38;

select *
  from exproforma_d
 where numero = 19389
   and nro = 65;

select cod_art, nvl(canti, 0), nvl(preuni, 0)
  from exproforma_d
 where numero = 19389
   and nro = 65;

select * from view_cli_para_booking;

select *
  from exfacturas_his
 where numero in (
                  55014940, 55015020, 55015065, 55015168
   )
   and accion in ('70', '71', '72');

select *
  from vw_fac_para_booking
 where numero in (
                  55014940, 55015020, 55015065, 55015168
   )
   and fecha_despacho is null;

select *
  from exfacturas
 where numero in (
   15049
   );

select *
  from pk_gnumero
 where pk_numero in (
                     53610, 53675, 53837, 53943
   );

select *
  from docuvent
 where serie = 'F055'
   and numero in (14811, 14872, 15146, 14889);

select *
  from exfacturas
 where numero = 55014811;

select *
  from factcob_canje
 where numero = '15261';

select *
  from canjedoc
 where nrocanje = 87345;

select *
  from exproforma_libre
 where numero = 19684;

select *
  from pr_embarques
 where ano_embarque = 2023
   and mes_embarque = 8
   and id_pedido = 15937;

select * from view_pedidos_pendientes_38;

select *
  from pr_programa_embarques_id
 where ano = 2023
   and mes = 12;

select *
  from nrodoc
 where tipodoc = '82'
   and serie = 3;

select *
  from nrodoc
 where tipodoc = '82'
   and serie = 3;

select numorde from paramlg;

select *
  from itemord
 where serie = 3
 order by num_ped desc;

select *
  from caja_chica_d
 where serie = 5
   and numero = 20445;

select *
  from kardex_d
 where cod_alm = '01'
   and tp_transac = '25'
   and serie = 118
   and numero = 88;

select *
  from docuvent
 where tipodoc = '01'
   and numero = 15887;

select *
  from factcob
 where tipdoc = 'LV'
   and numero = '21527';

select *
  from factcob
 where tipdoc = 'LV'
   and numero in (
                  22867, 22868, 22869, 22870, 22871, 22872, 22873, 22874, 22875, 22876, 22877, 22878
   );

select *
  from tab_lineas
 where descripcion like '%HANKOOK%';

select *
  from tab_lineas
 where linea = '116';

select *
  from tab_grupos
 where grupo = 18;

select *
  from grupo_venta
 where cod_grupo_venta = '4000';

select l.linea, l.descripcion as dsc_linea, g.grupo, g.descripcion as dsc_grupo
     , m.cod_grupo_venta as megagrupo, m.descripcion as dsc_megagrupo
  from tab_lineas l
       join tab_grupos g on l.grupo = g.grupo
       join grupo_venta m on g.ind_vta1 = m.cod_grupo_venta
 where linea = '132';

select * from pr_grupos;

select *
  from kardex_dpk
 where cod_alm = '01'
   and tp_transac = '25'
   and serie = 118
   and numero = 88;

select *
  from kardex_g
 where cod_alm = '01'
   and tp_transac = '25'
   and serie = 118
   and numero in (88, 89, 90);

select packing_agrupar
  from expedidos
 where numero in (
                  16305, 16306
   );

select *
  from expedidos
 where numero = 16333;

select *
  from expedido_d
 where numero = 16333;


select *
  from expedido_d
 where numero = 16331
   and cod_art = 'KIT AUT JD 87862-2';

select *
  from pr_ot
 where abre01 = 16331
   and numero = 1040291;

select *
  from pr_ot
 where abre01 = '16331'
   and per_env = '166';

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'AR'
   and ot_numero = 1040291;

select codigo, descripcion from packing_agrupar;

select cod_cliente, nombre, ruc, lista_precio, vendedor, cond_pag, dscto_1, dscto_2, cliente_afecto
     , dscto_max, nivel_cp, direccion
  from clientes
 where nvl(estado, '0') in ('0', '4')
   and zona = '900' and cod_cliente like '00000%'
   and cod_cliente = '00000990559'
 order by nombre;

select *
  from clientes
 where cod_cliente = '00000990559';

select *
  from pk_gnumero
 where pk_numero in (56366);


select *
  from solicita_emision
 where numero = 1228;

select *
  from solicita_emision_det
 where numero = 1228;

select *
  from tab_lineas
 where linea = '526';

select *
  from exproforma_d
 where numero = 18961
   and cod_art in (
                   'CH 95234 TG', 'CHP 88087 GR', 'MS 80104 E', 'MS 80020 A', 'MS 95233 MLS E',
                   'OS 88075 VM', 'FS 87796 MLS', 'MS 88087 A'
   )
 order by nro;

select *
  from exproforma_d
 where cantidad_libre is not null;


select *
  from tablas_auxiliares
 where codigo = '....';

select *
  from tablas_auxiliares
 where tipo = 2
 order by codigo;

select *
  from articul
 where cod_art in ('NC1', 'NC6');

select *
  from docuvent
 where tipodoc = '07'
   and serie = 'F055'
   and numero = '8008';

select *
  from itemdocu
 where tipodoc = '07'
   and serie = 'F055'
   and numero = '8008';

select * from pla_control;

select *
  from ex_prefacturas
 where numero = 9051657;


select *
  from exclientes
 where cod_cliente = 990249;

select *
  from exproforma_libre
 where numero = 19415;



select *
  from caja_chica
 where serie = 7
   and numero = 22274;

select *
  from caja_chica_d
 where serie = 7
   and numero = 22274;

select *
  from caja_chica
 where serie = 7
   and numero = 24001;

select *
  from caja_chica_d
 where serie = 7
   and numero = 24001;

select *
  from kardex_g_guia_remision
 where guia_numero = 22128;

select *
  from view_salidas_pre_guias
 where numero = 22128;

select *
  from kardex_g_guia_remision
 where guia_numero = 22128;

-- insert into pevisa.kardex_g_guia_remision ( guia_serie, guia_numero, fecha_traslado, ubigeo_partida
--                                           , ubigeo_llegada, direccion_llegada, ruc, cod_alm
--                                           , tp_transac, serie, numero, motivo_traslado
--                                           , transporte_empresa, transporte_chofer, transporte_unidad
--                                           , bultos, peso, nro_sucursal_partida, nro_sucursal_llegada
--                                           , modalidad_traslado, detalle, contenedor, precinto
--                                           , numero_documento_relacionado
--                                           , codigo_documento_relacionado
--                                           , descri_documento_relacionado, peso_items, pk_serie
--                                           , pk_numero, pk_tipo, ruc_llegada
--                                           , descripcion_motivo_traslado
--                                           , codigo_establecimiento_partida
--                                           , codigo_establecimiento_llegada, fecha_emision
--                                           , precinto_linea, carreta, marca_1, cartones, marca_2
--                                           , marca_3)
-- values ( 'T019', 22128, date '2024-03-06', '150103', '070101'
--        , 'PARCELA 1 TERRENO RIBEREÑO AL MAR  CALLE G S/', '20508782013', '01', '26', 19, 22128, '09'
--        , '20502900006', '06', '42', 1.00, 381.0000, '04', '00', '01', null, null, '035922 / 036481'
--        , '118-2024-40-022042', '50', 'Declaración Aduanera de Mercancías', null, '1', 57498, 'PK'
--        , null, null, null, null, timestamp '2024-03-06 06:55:29', null, null, 'ENGINETECH', '18'
--        , 'U.S.A.', null);

select * from clientes_corporacion;

select * from clientes_sucursal;

select * from corporacion_sucursal;

select * from exclientes_varios;

select *
  from exclientes
 where nombre like '%ELRI%';

select *
  from expedidos
 where cod_cliente = '998034';

select cuenta, descripcion
  from plancta
 where titulo = 'D'
   and (cuenta like '2%'
   or cuenta in
      ('336901', '92330103', '92590102', '92590103', '337101', '333301', '333101', '925902',
       '925904', '336903', '915506', '925908')
   or cuenta like '33%'
   or cuenta like '9125%'
   or cuenta like '9155%')
   and nvl(txt2, '1') = '1'
 order by cuenta;

select *
  from plancta
 where txt2 is not null;

select *
  from plancta
 where cuenta in (
                  '231103', '231104', '231106', '231109', '231118', '231119', '231122', '231123',
                  '231125', '231203', '231204', '231205', '231206', '231207', '231208', '231209',
                  '231210', '231211', '231212', '231213', '231214', '231216', '231217', '231218',
                  '231220', '231224', '231230', '231233', '231236', '231240', '231241', '231242',
                  '231247'
   );

select * from cierre_contabilidad;

-- ultimo cierre 11

select *
  from exproforma_libre
 where numero in (
                  19174, 19175
   );


select d.fecha, '01' as tipo, d.serie, i.numero2 as numero, d.cod_cliente
     , replace(c.nombre, ',', ' ') as nombre, i.cod_art, lin.descripcion, a.unidad, i.canti
     , round(i.fob / i.canti, 2) as fob_uni_d
     , round((i.fob / i.canti) * dc.import_cam, 4) as fob_uni_s, case
                                                                   when d.fflete != 1
                                                                     then
                                                                     case
                                                                       when (d.tflete + d.tseguro) > 0
                                                                         then
                                                                         round(i.totlin - i.flete, 2)
                                                                     end
                                                                   else
                                                                     round(i.totlin, 2)
                                                                 end
  as total_fob_d
--      , dc.import_cam, d.pais, p.nombre as nom_pais
     , round(i.gastos * dc.import_cam, 4) as total_gastos_s, round(i.gastos, 2) as total_gastos_d
     , round(i.flete * dc.import_cam, 4) as total_flete_s, round(i.flete, 2) as total_flete_d
     , round(i.seguro * dc.import_cam, 4) as total_seguro_s, round(i.seguro, 2) as total_seguro_d
     , case
         when d.fflete != 1
           then
           case
             when (d.tflete + d.tseguro) > 0
               then
               round(i.totlin - i.flete, 2)
                 + round(i.flete, 2)
                 + round(i.seguro, 2)
                 + round(i.gastos, 2)
           end
         else
           round(i.totlin, 2)
             + round(i.flete, 2)
             + round(i.seguro, 2)
             + round(i.gastos, 2)
       end
  as total_venta_d
     , case
         when d.fflete != 1
           then
           case
             when (d.tflete + d.tseguro) > 0
               then
               round((i.totlin - i.flete) * dc.import_cam, 2)
           end
         else
           round(i.totlin * dc.import_cam, 2)
       end
  as cuadre_fob_s
     , case
         when d.fflete != 1
           then
           case
             when (d.tflete + d.tseguro) > 0
               then
               round(
                   ((i.totlin - i.flete)
                     + i.flete
                     + i.seguro
                     + i.gastos)
                     * dc.import_cam,
                   2)
           end
         else
           round(
               (i.totlin + i.flete + i.seguro + i.gastos) * dc.import_cam,
               2)
       end
  as cuadre_total_s
  from exfacturas d
     , exfactura_d i
     , docuvent dc
     , articul a
     , exclientes c
--      , expaises p
     , tab_lineas lin
 where d.numero = i.numero
   and a.cod_lin = lin.linea
   and d.estado <> '9'
   and substr(d.numero, 4) = dc.numero
   and d.serie = dc.serie
   and d.fecha = dc.fecha
   and a.cod_art = i.cod_art
   and c.cod_cliente = d.cod_cliente
   and dc.tipo_cambio = 'V'
   and extract(year from d.fecha) = 2023
   and extract(month from d.fecha) = 11
   and d.numero = 55016786;
--    and p.pais = d.pais;

select *
  from exfacturas
 where numero = 55016786;

select *
  from exfactura_d
 where numero = 55016786;

select *
  from docuvent
 where numero = 16786;

select *
  from exclientes
 where cod_cliente = '996057';

select d.tipodoc, t.descripcion, d.serie, d.numero as numero_factura, d.fecha, d.cod_cliente
     , cod_vende
     , decode(d.estado, '9', '<<*** A N U L A D O ***>>', f_cliente_nombre(d.cod_cliente)) as nombre
     , decode(d.estado, '9', 0, decode(imp_igv, 0, 0, (decode(:P_MONEDA, 'D', decode(d.moneda, 'S',
                                                                                     (d.imp_neto / d.import_cam),
                                                                                     d.imp_neto),
                                                              d.simp_neto)))) as imp_neto
     , decode(d.estado, '9', 0, decode(imp_igv, 0, (decode(:P_MONEDA, 'D', decode(d.moneda, 'S',
                                                                                  (d.imp_neto / d.import_cam),
                                                                                  d.imp_neto),
                                                           d.simp_neto)), 0)) as imp_exon
     , decode(d.estado, '9', 0,
              decode(:P_MONEDA, 'D', decode(d.moneda, 'S', (d.imp_igv / d.import_cam), d.imp_igv),
                     d.simp_igv)) as imp_igv
     , decode(d.estado, '9', 0, decode(:P_MONEDA, 'D',
                                       decode(d.moneda, 'S', (d.precio_vta / d.import_cam),
                                              d.precio_vta), d.sprecio_vta)) as precio_vta
     , decode(d.estado, '9', 0, decode(:P_MONEDA, 'D',
                                       decode(d.moneda, 'S', (d.imp_fletes / d.import_cam),
                                              d.imp_fletes), d.simp_fletes)) as imp_fletes
     , decode(d.estado, '9', 0, decode(:P_MONEDA, 'D',
                                       decode(d.moneda, 'S', (d.imp_seguros / d.import_cam),
                                              d.imp_seguros), d.simp_seguros)) as imp_seguros
     , decode(d.estado, '9', 0, decode(:P_MONEDA, 'D',
                                       decode(d.moneda, 'S', (d.imp_gastos / d.import_cam),
                                              d.imp_gastos), d.simp_gastos)) as imp_gastos
     , decode(d.estado, '9', 0, decode(:P_MONEDA, 'D',
                                       decode(d.moneda, 'S', (d.imp_descto / d.import_cam),
                                              d.imp_descto), d.simp_descto)) as imp_descto
     , d.tip_doc_ref, d.ser_doc_ref, d.nro_doc_ref, decode(d.tipodoc, '07', d.detalle,
                                                           (decode(d.tipodoc, '08', d.detalle, null))) as detall
  from docuvent d
     , tablas_auxiliares t
 where d.fecha between :fecha1 and :fecha2
   and t.tipo = 2
   and (t.codigo = d.tipodoc)
   and nvl(d.origen, '0') = 'EXPO'
   and d.numero = 15050
 order by d.tipodoc, d.serie, d.numero, d.fecha;

select *
  from docuvent
 where serie = 'F055'
   and numero = 15050;

select * from clientes_corporacion;

select * from clientes_sucursal;

select * from corporacion_sucursal;

select * from exclientes_varios;


select *
  from exprovision_comision
 where periodo_ano = 2024
   and periodo_mes = 2;

  with requerimiento as (
    select cod_art, sum(cant_requerida) as cant_requerida
         , sum(cant_separado) as cant_separado, sum(faltante) as cant_faltante
         , sum(stock) as stock_requerida
      from vw_requerimiento_articulo
     where es_stock = 0
     group by cod_art
    )
select a.cod_art, a.descripcion, a.cod_lin, g.id_grupo, g.dsc_grupo, r.cant_requerida
     , r.cant_separado, r.cant_faltante, r.stock_requerida
     , a.s_act - r.cant_separado as cant_disponible, a.pr_golpez as golpes
     , a.pr_golpza as cavidades
  from articul a
       left join requerimiento r on a.cod_art = r.cod_art
       left join vw_articulo_grupo g on a.cod_art = g.cod_art;

select *
  from expedido_d
 where numero = 15032
   and nro = 79;

select *
  from expedidos
 where numero = 16175;

select *
  from pr_embarques
 where ano_embarque = 2024
   and mes_embarque = 3
   and id_pedido = 16175;

select *
  from pr_embarques
 where ano_embarque = 2024
   and mes_embarque = 3
   and id_pedido = 16156;

select *
  from pr_consul
 where pedido = 16175;

-- COD_ART	CANTIDAD
-- CH 86030 TG	10
-- V 86030-I R	20
-- CH 86031 TG	10
-- CHP 93009A GR	10

select *
  from exproforma_d
 where numero = 19218
   and cod_art in (
                   'CHP 93009A GR', ''
   );

select *
  from exfacturas_his
 where accion in ('73', '74', '75')
   and numero in (
                  55017847, 55017848, 55017849, 55017850, 55017851, 55017852, 55017853, 55017854,
                  55017855, 55017856, 55017857, 55017858, 55017859, 55017860, 55017861, 55017862,
                  55017863, 55017864, 55017865, 55017866, 55017867, 55017868, 55017869, 55017870,
                  55017871, 55017872, 55017873, 55017874, 55017875, 55017876, 55017877
   );

update exfacturas_his
   set fecha = to_date('24/04/2024', 'dd/mm/yyyy')
 where accion in ('73', '74', '75')
   and numero in (
                  55017847, 55017848, 55017849, 55017850, 55017851, 55017852, 55017853, 55017854,
                  55017855, 55017856, 55017857, 55017858, 55017859, 55017860, 55017861, 55017862,
                  55017863, 55017864, 55017865, 55017866, 55017867, 55017868, 55017869, 55017870,
                  55017871, 55017872, 55017873, 55017874, 55017875, 55017876, 55017877
   );

select *
  from exfacturas
 where numero in (
                  55017847, 55017848, 55017849, 55017850, 55017851, 55017852, 55017853, 55017854,
                  55017855, 55017856, 55017857, 55017858, 55017859, 55017860, 55017861, 55017862,
                  55017863, 55017864, 55017865, 55017866, 55017867, 55017868, 55017869, 55017870,
                  55017871, 55017872, 55017873, 55017874, 55017875, 55017876, 55017877
   );

select * from view_prodterm_paletas;

select * from tmp_carga_data;

select *
  from exproforma_d_aprobar
 where numero = 19416
   and estado_respuesta is null and cantidad_libre is null;

select * from exproforma_libre;

select *
  from expedidos
 where numero = 16333;

select *
  from expedidos
 where numero = 16335;

select *
  from expedido_d
 where numero = 16333
   and saldo_pk != 0;

select *
  from expedido_d
 where numero = 16333
   and estado_pk = 8;


select max(nro)
  from expedido_d
 where numero = 16582;

select *
  from expedido_d
 where numero = 16582
   and cod_art = 'KIT MH CHP 30050 GR';

select *
  from expedido_d
 where numero = 16333
   and estado_pk = '1';

select *
  from pr_ot
 where abre01 = '16333'
   and per_env in (
                   '11', '12', '14', '20', '31', '33', '44', '51', '58', '89'
   );

select numero, fecha
  from expedidos
 where numero in (
   select pedido
     from pr_consul
    where prioridad = :prioridad_no_trabaja
      and estado < 9
   )
 order by 1;

select *
  from pr_consul
 where pedido = 16333;

select distinct estado
  from pr_consul;

select *
  from embarques_expo_g
 where numero_embarque = 1127;

select *
  from expedido_d
 where numero = 16293
   and nro in (
               3, 21, 12
   );

select *
  from expedido_d
 where numero = 16109
   and nro in (
               55, 78, 79, 80, 74
   );

select *
  from expedido_d
 where numero = 16582
   and cod_art in ('KIT MH CHP 30050 GR');

select *
  from pr_ot
 where abre01 = '16293'
   and per_env = '11';

select *
  from pr_ot
 where abre01 = '16582'
   and per_env = '47';

select * from exproformas;

select * from exproformas_param;

select * from clientes_corporacion;

select * from exclientes where cod_cliente = '996057';

-- 996057

select *
  from pevisa.exproformas
 where texto8 is not null
   and extract(year from fecha) = 2024;

select *
  from exclientes_marcas;

select cod_marca
  from exclientes_marcas
 where cod_cliente = '996057'
   and grupo = 'JUEGOS Y CULATAS'
 order by 1;

-- todo lo que mahle ha comprado en el año, facturacion
-- relacion de la demanda anual estimada de Mahle
-- explosion de piezas cuanto se consume al año, mayor y menor