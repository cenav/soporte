select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and numero in (
   1075267
   );

select * from pr_estados;

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'AR'
   and ot_numero in (
   1071505
   );

select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and estado = 1
   and extract(year from fecha) = 2024
   and extract(month from fecha) = 9;

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'AR'
   and estado = 1;

-- select * from prot;

select *
  from pr_trasab_estado
 where tipo = 'AR'
   and numero in (
   1050925
   )
 order by fecha desc;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and estado is null;

select *
  from pr_ot
 where estado is null;


select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and numero in (
   1050925
   );

select *
  from pr_ot
 where nuot_tipoot_codigo = 7304398;

select *
  from view_oa_cambio_de_piezas
 where numero in (730438, 803387, 809057);

select *
  from pr_ot_cambios_piezas
 where numero in (730438, 803387, 809057)
   and nuot_tipoot_codigo = 'AR';

-- INSERT INTO PEVISA.PR_OT_CAMBIOS_PIEZAS (ID_MOTIVO, NUMERO, NUOT_SERIE, NUOT_TIPOOT_CODIGO, ART_COD_ART, FECHA, USUARIO, IP_USUARIO, DETALLE, RESPUESTA, GLOSA, FECHA_RESPUESTA, CANTIDAD_FALTANTE, CANTIDAD_SOBRANTE, CANTIDAD_DETERIORADA, KARDEX_COD_ALM, KARDEX_TP_TRANSAC, KARDEX_SERIE, KARDEX_NUMERO, PR_NUMERO, PR_NUOT_SERIE, PR_NUOT_TIPOOT_CODIGO, PR_NOMBRE_TRABAJADOR, CALIDAD_USUARIO, CALIDAD_RESPUESTA, CALIDAD_FECHA, KARDEX_COD_ALM_FALLADO, KARDEX_TP_TRANSAC_FALLADO, KARDEX_SERIE_FALLADO, KARDEX_NUMERO_FALLADO, PR_NOMBRE_TRABAJADOR_ALMACEN, PR_COD_TRABAJADOR, PR_COD_TRABAJADOR_ALMACEN) VALUES ('PIEZA DETERIORADA', 809057, '3', 'AR', '54204AGR-HS', TIMESTAMP '2022-02-10 15:59:16', 'AMUNANTE', '10.0.0.134', 'D.D.1', null, 'D.D.1', null, null, null, 1.0000, null, null, null, null, null, '8', 'PR', 'LEVIS', 'ZGUEVARA', 'PASE ACEPTADO', TIMESTAMP '2022-02-10 16:27:32', null, null, null, null, null, null, null);
-- INSERT INTO PEVISA.PR_OT_CAMBIOS_PIEZAS (ID_MOTIVO, NUMERO, NUOT_SERIE, NUOT_TIPOOT_CODIGO, ART_COD_ART, FECHA, USUARIO, IP_USUARIO, DETALLE, RESPUESTA, GLOSA, FECHA_RESPUESTA, CANTIDAD_FALTANTE, CANTIDAD_SOBRANTE, CANTIDAD_DETERIORADA, KARDEX_COD_ALM, KARDEX_TP_TRANSAC, KARDEX_SERIE, KARDEX_NUMERO, PR_NUMERO, PR_NUOT_SERIE, PR_NUOT_TIPOOT_CODIGO, PR_NOMBRE_TRABAJADOR, CALIDAD_USUARIO, CALIDAD_RESPUESTA, CALIDAD_FECHA, KARDEX_COD_ALM_FALLADO, KARDEX_TP_TRANSAC_FALLADO, KARDEX_SERIE_FALLADO, KARDEX_NUMERO_FALLADO, PR_NOMBRE_TRABAJADOR_ALMACEN, PR_COD_TRABAJADOR, PR_COD_TRABAJADOR_ALMACEN) VALUES ('PIEZA DETERIORADA', 803387, '3', 'AR', '70064-CH GR', TIMESTAMP '2022-01-20 11:08:30', 'AMUNANTE', '10.0.0.134', 'D.D.2.1', null, 'D.D.2.1', null, null, null, 2.0000, null, null, null, null, null, '8', 'PR', 'SANDRA', 'JGONZALES', 'PASE ACEPTADO', TIMESTAMP '2022-01-20 11:45:40', null, null, null, null, null, null, null);
-- INSERT INTO PEVISA.PR_OT_CAMBIOS_PIEZAS (ID_MOTIVO, NUMERO, NUOT_SERIE, NUOT_TIPOOT_CODIGO, ART_COD_ART, FECHA, USUARIO, IP_USUARIO, DETALLE, RESPUESTA, GLOSA, FECHA_RESPUESTA, CANTIDAD_FALTANTE, CANTIDAD_SOBRANTE, CANTIDAD_DETERIORADA, KARDEX_COD_ALM, KARDEX_TP_TRANSAC, KARDEX_SERIE, KARDEX_NUMERO, PR_NUMERO, PR_NUOT_SERIE, PR_NUOT_TIPOOT_CODIGO, PR_NOMBRE_TRABAJADOR, CALIDAD_USUARIO, CALIDAD_RESPUESTA, CALIDAD_FECHA, KARDEX_COD_ALM_FALLADO, KARDEX_TP_TRANSAC_FALLADO, KARDEX_SERIE_FALLADO, KARDEX_NUMERO_FALLADO, PR_NOMBRE_TRABAJADOR_ALMACEN, PR_COD_TRABAJADOR, PR_COD_TRABAJADOR_ALMACEN) VALUES ('PIEZA DETERIORADA', 730438, '3', 'AR', 'ME 997357 MLS', TIMESTAMP '2022-01-19 16:09:29', 'AMUNANTE', '10.0.0.134', 'D.D.2.2', null, 'D.D.2.2', null, null, null, 1.0000, null, null, null, null, null, '8', 'PR', 'VERONICA', 'ZGUEVARA', 'PASE ACEPTADO', TIMESTAMP '2022-01-19 16:26:22', null, null, null, null, null, null, null);


select p.c_codigo as cod_personal
     , rtrim(p.apellido_paterno) || ' ' || rtrim(p.apellido_materno) || ', ' ||
       rtrim(p.nombres) as nombre
  from planilla10.personal p
       join planilla10.tar_secc s on p.seccion = s.codigo
 where c_area = '004'
   and p.situacion not in (
   select codigo
     from planilla10.t_situacion_cesado
   );


select * from planilla10.t_area;

select *
  from planilla10.tar_secc
 where c_area = '004';

-- select rtrim(p.apellido_paterno) || ' ' || rtrim(p.apellido_materno) || ', ' ||
--        rtrim(p.nombres) as nombres
--      , p.c_codigo
--   from planilla10.personal p
--      , personal_armado_produccion pa
--  where p.c_codigo = pa.cod_personal;


select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and extract(year from fecha) = 2023;

select *
  from produccion_armado a
 where a.id_linea_prod = '05'
   and a.estado = 2;

select *
  from produccion_armado a
 where a.id_linea_prod = '05'
   and a.estado = 2
   and not exists(
   select *
     from pr_ot o
    where a.numero_oa = o.numero
      and o.nuot_tipoot_codigo = 'AR'
      and o.estado = '9'
   );

select *
  from produccion_armado
 where numero_oa = 695966;

select *
  from produccion_armado
 where id_linea_prod = '05'
   and estado <> 5
   and nvl((
             select estado
               from pr_ot
              where numero = produccion_armado.numero_oa
                and nuot_tipoot_codigo = 'AR'
             ), 0) = 4;

select estado
  from pr_ot
 where numero = 704465
   and nuot_tipoot_codigo = 'AR';


select *
  from produccion_armado
 where id_linea_prod = '05'
   and estado = 2
 minus
select *
  from produccion_armado
 where id_linea_prod = '05'
   and estado <> 5
   and nvl((
             select estado
               from pr_ot
              where numero = produccion_armado.numero_oa
                and nuot_tipoot_codigo = 'AR'
             ), 0) = 4;


select *
  from produccion_armado
 where numero_oa in (
                     653015, 695966, 704465, 735779, 793641, 828762, 865055, 901931, 901993, 901994,
                     901995, 902001
   );

select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and numero = 695966;

select distinct estado from produccion_armado;

select *
  from produccion_armado a
 where not exists(
   select *
     from pr_ot o
    where a.numero_oa = o.numero
      and o.nuot_tipoot_codigo = 'AR'
      and o.estado = '9'
   );


select *
  from pr_parte_armado
 where numero_oa = 980502;

select * from personal_armado_produccion;

select rtrim(p.apellido_paterno) || ' ' || rtrim(p.apellido_materno) || ', ' ||
       rtrim(p.nombres) as nombres
     , p.c_codigo
  from planilla10.personal p
       join planilla10.tar_secc s on p.seccion = s.codigo
 where c_area = '004'
   and p.situacion not in (
   select codigo
     from planilla10.t_situacion_cesado
   );

select c.cod_caja, c.estado, c.abrev_cli, c.cantidad, c.tipo_caja, c.nvl_contenido, c.dato_agrupa
     , c.recibe, h.linea_prod, max(fecha)
  from (
    select c.cod_caja, c.estado, null as abrev_cli, c.cantidad, c.tipo_caja, c.nvl_contenido
         , '' as dato_agrupa, c.recibe
      from produccion_armado_cajas c
         , produccion_armado_log l
     where c.cod_caja = l.cod_caja(+)
       and l.id_linea_prod is null and c.estado = '1'
     union
    select c.cod_caja, c.estado, decode(substr(p.dato_agrupa, 1, 1), '2', 'LIMA',
                                        p.abrev_cli) as abrev_cli
         , c.cantidad, c.tipo_caja
         , c.nvl_contenido, p.dato_agrupa, c.recibe
      from produccion_armado_log l
         , produccion_armado p
         , produccion_armado_cajas c
     where l.numero_oa = p.numero_oa and l.cod_caja = c.cod_caja
       and c.estado in (1, 2) and (nvl_contenido = 'NLL' or c.estado = 1)
       and p.dato_agrupa = :x_dato_agrupa
     union
    select c.cod_caja as cod_caja, c.estado, decode(substr(p.dato_agrupa, 1, 1), '2', 'LIMA',
                                                    p.abrev_cli) as abrev_cli
         , c.cantidad
         , c.tipo_caja, c.nvl_contenido, p.dato_agrupa, c.recibe
      from produccion_armado_log l
         , produccion_armado p
         , produccion_armado_cajas c
     where l.numero_oa = p.numero_oa and l.cod_caja = c.cod_caja
       and c.estado = '1'
       and p.dato_agrupa <> :x_dato_agrupa
    ) c
     , produccion_armado_cajas_his h
 where c.cod_caja = h.cod_caja
   and h.estado = '1'
   and h.linea_prod = '05'
 group by c.cod_caja, c.estado, c.abrev_cli, c.cantidad, c.tipo_caja, c.nvl_contenido, c.dato_agrupa
        , c.recibe, h.linea_prod
 order by c.estado, c.cod_caja desc;

select distinct c.cod_caja, c.estado, null as abrev_cli, c.cantidad, c.tipo_caja, c.nvl_contenido
              , '' as dato_agrupa, c.recibe
  from produccion_armado_cajas c
     , produccion_armado_log l
     , produccion_armado_cajas_his h
 where c.cod_caja = l.cod_caja(+)
   and c.cod_caja = h.cod_caja
   and l.id_linea_prod is null
   and h.linea_prod = '05'
   and c.estado = '1';

select *
  from produccion_armado
 where numero_oa = 993912;


select distinct pe.nombre
  from produccion_armado_log l
     , pr_parte_armado pa
     , vw_personal pe
 where l.numero_oa = pa.numero_oa
   and id_proceso = 'ENCAJADO'
   and pa.id_trabajador = pe.c_codigo
   and l.cod_caja = :COD_CAJA;

select *
  from produccion_armado
 where abrev_ped = 15960;

select *
  from produccion_armado
 where numero_oa = 996814;


select cod_cliente, cod_sucursal
  from expedidos
 where numero = 15960;

select *
  from produccion_armado_cajas_his
 where cod_caja = 266441;

select distinct p.abrev_cli, p.abrev_ped, c.cod_caja, c.tipo_caja, p.dato_agrupa, c.nvl_contenido
  from produccion_armado_log l
     , produccion_armado p
     , produccion_armado_cajas c
 where l.numero_oa = p.numero_oa
   and l.cod_caja = c.cod_caja
   and l.cod_caja = 266477
   and rownum = 1;

select p.c_codigo as cod_personal
     , rtrim(p.apellido_paterno) || ' ' || rtrim(p.apellido_materno) || ', ' ||
       rtrim(p.nombres) as nombre
  from planilla10.personal p
       join planilla10.tar_secc s on p.seccion = s.codigo
 where c_area = '008'
   and p.situacion not in (
   select codigo
     from planilla10.t_situacion_cesado
   );

select * from planilla10.t_area;

select * from prod_term_personal;

select cod_personal, nombre
  into :PRODUCCION_ARMADO_CAJAS.inspector, :PRODUCCION_ARMADO_CAJAS.x_inspector
  from prod_term_personal
 where cod_personal = :GLOBAL.inspector;

select cod_personal, nombre from prod_term_personal;

select c_codigo, nombre
  from vw_personal
 where c_area = '004';

select c_codigo, nombre, situacion
  from vw_personal
 where c_area = '004'
   and situacion not in (
   select codigo
     from planilla10.t_situacion_cesado
   );

select nombre as nombres, c_codigo
  from vw_personal
 where c_area = '004'
   and situacion not in (
   select codigo
     from planilla10.t_situacion_cesado
   );

-- ordenes linea armado
select *
  from pr_ot
 where abre01 = '435'
   and destino = 2
   and nuot_tipoot_codigo = 'AR'
   and estado = 4
 order by estado;

-- que no este programado
select *
  from produccion_armado
 where numero_oa = 995309;

select distinct o.numero, o.formu_art_cod_art, o.cant_prog, 0 as cant_resul, o.abre02, o.abre01
              , '<SIN LINEA>' as linea_prod, '0' as estado, decode((
                                                                     select count(pd.saldo)
                                                                       from pr_ot_det pd
                                                                      where pd.ot_nuot_serie = 3
                                                                        and pd.ot_nuot_tipoot_codigo = 'AR'
                                                                        and length(pd.cod_lin) = 3
                                                                        and (
                                                                        to_number(pd.cod_lin) between 800 and 831 or
                                                                        to_number(pd.cod_lin) between 850 and 854)
                                                                        and saldo = 0
                                                                        and pd.estado <> '9'
                                                                        and ot_numero = o.numero
                                                                     ), 0, 'COMPLETO',
                                                                   'INCOMPLETO') as surtido
  from pr_ot o
 where o.nuot_tipoot_codigo = 'AR'
   and o.estado = 4
   and o.numero not in (
   select p.numero_oa
     from produccion_armado p
   )
   and o.formu_art_cod_art not like 'RPKN%'
   and o.formu_art_cod_art not like 'ATZ%'
   and o.formu_art_cod_art not like 'CVM%'
   and o.formu_art_cod_art not like 'PFB%'
--    AND O.ABRE02 NOT LIKE 'PJ%'
 union all
select p.numero_oa, p.formu_art_cod_art, p.cant_prog, p.cant_resul, p.abrev_cli, p.abrev_ped
     , p.id_linea_prod as linea_prod, p.estado, 'COMPLETO' as surtido
  from produccion_armado p
 where p.estado = 6
   and p.id_linea_prod <> '05'
   and nvl((
             select estado
               from pr_ot
              where numero = p.numero_oa
                and nuot_tipoot_codigo = 'AR'
             ), 0) = 4
 order by 8 desc, 5, 6;

select *
  from expednac
 where numero = 443;

select *
  from expednac_d
 where numero = 443;

----------------------------------

select *
  from produccion_armado
 where numero_oa = 1011587;

select *
  from produccion_armado_log
 where cod_caja = 279706;

select *
  from produccion_armado_his
 where numero_oa = 1011587;

select *
  from produccion_armado_cajas_his
 where cod_caja = 279706;

select *
  from produccion_armado_cajas
 where cod_caja = 279706;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and numero = 1014934;

select *
  from pr_embarques
     , exparamexpo
 where ano_embarque = to_char(sysdate, 'YYYY')
   and mes_embarque = to_char(sysdate, 'MM')
   and id_pedido = 16097;

select * from pr_embarques;

select *
  from produccion_armado_cajas
 where cod_caja = 281628;

select *
  from produccion_armado_cajas_his
 where cod_caja = 281628
 order by estado;

select *
  from vw_ordenes_pedido_pendiente
 where cod_cliente = '990249';


select id_pedido
  from view_pedidos_pendientes_38
 where exists(
   select 1
     from pr_embarques p
          join pr_programa_embarques_id i
               on p.ano_embarque = i.ano and p.mes_embarque = i.mes and i.estado = 1
    where p.id_pedido = view_pedidos_pendientes_38.id_pedido
   );

select *
  from view_pedidos_pendientes_38
 where id_pedido = 16175;

select *
  from expedidos
 where numero = 16175;

select *
  from pr_consul
 where pedido = 16175;

select *
  from tmp_pedidos_30
 where numero = 16175;

select ex.cod_vende as id_vendedor, t.descripcion as nombre_vendedor, e.numero as id_pedido, e.fecha
     , ex.nombre as nombre_cliente, (nvl(tmp.n1, 0)
  + nvl(tmp.n2, 0)
  + nvl(tmp.n3, 0)
  + nvl(tmp.n4, 0)
  + nvl(tmp.n8, 0)
  + nvl(tmp.n13, 0))
  as monto_completo
     , nvl(tmp.n5, 0) as monto_incompleto, nvl(tmp.n10, 0) as monto_pendiente
     , nvl(tmp.n11, 0) as monto_saos_por_armar, nvl(tmp.n12, 0) as servicio_cuno, p.prioridad
     , ex.cod_cliente, nvl(e.no_despachar_antes_de, 0) as no_despachar_antes_de
     , f_pedidos_rojo_a_facturar_30(e.numero) as rojo_a_facturar, ex.pais
     , get_pais(ex.pais) as nombre_pais
  from expedidos e
     , extablas_expo t
     , tmp_pedidos_30 tmp
     , pr_consul p
     , exclientes ex
 where e.estado not in ('8',
                        '9',
                        'T',
                        '85')
   and t.tipo = 13
   and t.codigo = ex.cod_vende
   and tmp.usuario = (
   select usuario_30
     from exparamexpo
   )
   and tmp.vendedor = ex.cod_vende
   and tmp.numero = e.numero
   and nvl(tmp.n0, 0) <> nvl(tmp.n6, 0)
   and e.numero = p.pedido
   and p.tipo = '1'
   and ex.cod_cliente = e.cod_cliente
   and e.numero = 16175
 union all
select '77', t.descripcion as nombre_vendedor, e.numero, e.fecha, ex.nombre as nombre, (
  nvl(tmp.n1, 0)
    + nvl(tmp.n2, 0)
    + nvl(tmp.n3, 0)
    + nvl(tmp.n4, 0)
    + nvl(tmp.n8, 0)
    + nvl(tmp.n13, 0))
  as monto_completo
     , nvl(tmp.n5, 0) as monto_incompleto, nvl(tmp.n10, 0) as monto_pendiente
     , nvl(tmp.n11, 0) as monto_saos_por_armar, nvl(tmp.n12, 0) as servicio_cuno, p.prioridad
     , e.referencia as cod_cliente, 0 as no_despachar_antes_de
     , f_pedidos_rojo_a_facturar_30(e.numero) as rojo_a_facturar, '800' as pais
     , get_pais('800') as nombre_pais
  from expednac e
     , extablas_expo t
     , tmp_pedidos_30 tmp
     , pr_consul p
     , exclientes ex
 where e.estado not in ('8',
                        '9',
                        'T',
                        '85')
   and t.tipo = 13
   and t.codigo = '77'
   and tmp.usuario = (
   select usuario_30
     from exparamexpo
   )
   and tmp.vendedor = '77'
   and tmp.numero = e.numero
   and nvl(tmp.n0, 0) <> nvl(tmp.n6, 0)
   and e.numero = p.pedido
   and p.tipo = '2'
   and ex.cod_cliente = e.cod_cliente
   and substr(e.referencia, 1, 2) <> 'PC'
   and e.numero = 16175
 union all
select '78', t.descripcion as nombre_vendedor, e.numero, e.fecha, ex.nombre as nombre, (
  nvl(tmp.n1, 0)
    + nvl(tmp.n2, 0)
    + nvl(tmp.n3, 0)
    + nvl(tmp.n4, 0)
    + nvl(tmp.n8, 0)
    + nvl(tmp.n13, 0))
  as monto_completo
     , nvl(tmp.n5, 0) as monto_incompleto, nvl(tmp.n10, 0) as monto_pendiente
     , nvl(tmp.n11, 0) as monto_saos_por_armar, nvl(tmp.n12, 0) as servicio_cuno, p.prioridad
     , e.referencia as cod_cliente, 0 as no_despachar_antes_de
     , f_pedidos_rojo_a_facturar_30(e.numero) as rojo_a_facturar, '800' as pais
     , get_pais('800') as nombre_pais
  from expedstock e
     , extablas_expo t
     , tmp_pedidos_30 tmp
     , pr_consul p
     , exclientes ex
 where e.estado not in ('8',
                        '9',
                        'T',
                        '85')
   and t.tipo = 13
   and t.codigo = '78'
   and tmp.usuario = (
   select usuario_30
     from exparamexpo
   )
   and tmp.vendedor = '78'
   and tmp.numero = e.numero
   and nvl(tmp.n0, 0) <> nvl(tmp.n6, 0)
   and e.numero = p.pedido
   and p.tipo = '3'
   and ex.cod_cliente = e.cod_cliente
   and e.numero = 16175
   and substr(e.referencia, 1, 2) <> 'PC';


select ex.cod_vende as id_vendedor, t.descripcion as nombre_vendedor, e.numero as id_pedido, e.fecha
     , ex.nombre as nombre_cliente, (nvl(tmp.n1, 0)
  + nvl(tmp.n2, 0)
  + nvl(tmp.n3, 0)
  + nvl(tmp.n4, 0)
  + nvl(tmp.n8, 0)
  + nvl(tmp.n13, 0))
  as monto_completo
     , nvl(tmp.n5, 0) as monto_incompleto, nvl(tmp.n10, 0) as monto_pendiente
     , nvl(tmp.n11, 0) as monto_saos_por_armar, nvl(tmp.n12, 0) as servicio_cuno, p.prioridad
     , ex.cod_cliente, nvl(e.no_despachar_antes_de, 0) as no_despachar_antes_de
     , f_pedidos_rojo_a_facturar_30(e.numero) as rojo_a_facturar, ex.pais
     , get_pais(ex.pais) as nombre_pais
  from expedidos e
     , extablas_expo t
     , tmp_pedidos_30 tmp
     , pr_consul p
     , exclientes ex
 where e.estado not in ('8', '9', 'T', '85')
   and t.tipo = 13
   and t.codigo = ex.cod_vende
   and tmp.usuario = (
   select usuario_30
     from exparamexpo
   )
   and tmp.vendedor = ex.cod_vende
   and tmp.numero = e.numero
   and nvl(tmp.n0, 0) <> nvl(tmp.n6, 0)
   and e.numero = p.pedido
   and p.tipo = '1'
   and ex.cod_cliente = e.cod_cliente
   and e.numero = 16175;

select *
  from pr_consul
 where pedido = 16175;

select *
  from tmp_pedidos_30
 where numero = 16175
   and usuario = 9;

select *
  from expedidos
 where numero = 16175;

select *
  from exclientes
 where cod_cliente = '990249';

select usuario_30
  from exparamexpo;

select *
  from almacenes
 where cod_alm in ('01', '03', '08');

select *
  from vendedores
 where cod_vendedor = 'Z6';

select *
  from movdeta_cua
 where ano = 2024
   and mes = 2;

select *
  from planilla10.personal
 where c_codigo in ('E43280', 'E567');

select *
  from planilla10.personal_hist
 where codigo = 'E43280'
 order by fecha desc;

select *
  from vw_ordenes_impresas_piezas
 where art_cod_art = '180.236';

select sum(nvl(cant_formula, 0)) as stock_oa_impresa
  from vw_ordenes_impresas_piezas
 where art_cod_art = '180.236';

select * from pk_cajas;

select * from articul_varios;

select *
  from view_prodterm_pedidos
 where pedido = 15692;

select nvl(sum(stock), 0) as stock_d3
  from almacen
 where cod_art = '400.906'
   and cod_alm = '03';

select j.ranking, j.cod_cliente, j.nom_cliente, p.nro_pedido, p.itm_pedido, j.fch_pedido, j.ot_tipo
     , j.ot_serie, j.ot_numero, j.ot_estado, j.cod_jgo, j.valor, j.es_juego, j.tiene_importado
     , j.impreso, j.fch_impresion, j.tiene_stock_ot, p.cod_pza, p.cantidad, p.cant_final
     , p.stock_inicial, p.stock_actual, p.saldo_stock, p.sobrante, p.faltante, p.linea
     , p.rendimiento
     , case j.partir_ot when 0 then 'NO' when 1 then 'SI' end as se_puede_partir
     , case p.es_importado when 0 then 'NO' when 1 then 'SI' end as es_importado
     , case p.tiene_stock_itm when 0 then 'NO' when 1 then 'SI' end as tiene_stock_itm
     , case p.es_sao when 0 then 'NO' when 1 then 'SI' end as es_sao
     , case p.es_armado when 0 then 'NO' when 1 then 'SI' end as es_armado
     , p.id_color, c.dsc_color, c.nom_color, c.colorindex, c.orden
  from tmp_surte_jgo j
       join tmp_surte_pza p on j.nro_pedido = p.nro_pedido and j.itm_pedido = p.itm_pedido
       left join color_surtimiento c on p.id_color = c.id_color;

select *
  from pr_estadistica_armado_d
 where usuario = 'PEVISA';

select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR';

select *
  from kardex_g
 where cod_alm = '06'
   and tp_transac = '29'
   and serie = 3
   and numero = 669282;

select *
  from kardex_d
 where cod_alm = '06'
   and tp_transac = '29'
   and serie = 3
   and numero = 669282;

select *
  from kardex_g
 where tipo_pguia = 'AR'
   and serie_pguia = 3
   and numero_pguia = 1045150;

select *
  from kardex_d
 where pr_tipot = 'AR'
   and pr_numot = 1045150;

-- no existe en karde_g
select *
  from kardex_g
 where cod_alm = '01'
   and tp_transac = '17'
   and serie = 1
   and numero = 742053;

-- no existe en karde_g
select *
  from kardex_d
 where cod_alm = '01'
   and tp_transac = '17'
   and serie = 1
   and numero = 742053;

select *
  from kardex_d d
 where d.pr_tipot = 'AR'
   and d.fch_transac = to_date('14/05/2024', 'dd/mm/yyyy')
   and d.estado != '9'
   and not exists(
   select *
     from kardex_g g
    where g.cod_alm = d.cod_alm
      and g.tp_transac = d.tp_transac
      and g.serie = d.serie
      and g.numero = d.numero
   )
 order by cod_alm, tp_transac, serie, numero;

select distinct d.cod_alm, tp_transac, d.serie, d.numero, d.fch_transac, d.pr_tipot, d.pr_numot
              , o.abre01 as pedido, o.per_env as itemped
  from kardex_d d
       join pr_ot o
            on d.pr_tipot = o.nuot_tipoot_codigo
              and o.nuot_serie = 3
              and d.pr_numot = o.numero
 where d.pr_tipot = 'AR'
   and d.fch_transac = to_date('14/05/2024', 'dd/mm/yyyy')
   and d.estado != '9'
   and not exists(
   select *
     from kardex_g g
    where g.cod_alm = d.cod_alm
      and g.tp_transac = d.tp_transac
      and g.serie = d.serie
      and g.numero = d.numero
   )
 order by cod_alm, tp_transac, serie, numero;

select *
  from kardex_g
 where cod_alm = '06'
   and tp_transac = '29'
   and serie = 3
   and numero = 669282;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and nuot_serie = 3
   and numero = 1045150;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and nuot_serie = 3
   and numero = 1045150;

select * from tipo_linea;

select * from tab_lineas_tipo_linea;

-- anula para emitir SAO
select o.nuot_tipoot_codigo, o.nuot_serie, o.numero, o.estado, o.fecha
     , o.formu_art_cod_art, o.cant_prog
  from pr_ot o
       join articul a on o.formu_art_cod_art = a.cod_art
 where o.nuot_tipoot_codigo = 'AR'
   and o.estado = 1
   and a.tp_art = 'A'
   and not exists(
   select *
     from pr_ot_impresion i
    where i.nuot_tipoot_codigo = o.nuot_tipoot_codigo
      and i.nuot_serie = o.nuot_serie
      and i.numero = o.numero
   );

update pr_ot
   set estado = '9'
 where nuot_tipoot_codigo = 'AR'
   and nuot_serie = 3
   and numero in (
                  1054985, 1049036, 1055133, 1049817, 1035462, 1050045, 1049831, 1051636, 1049917,
                  1049522, 1049277, 1049544, 1051647, 1049523, 1049825, 1049546, 1052016, 1055083,
                  1052114, 1049265, 1049919, 1049444, 1049516, 1055076, 1050198, 1055592, 1055032,
                  1049297, 1049274, 1056172, 1058736, 1058649, 1049588, 1055139, 1049153, 1055068,
                  1049355, 1052248, 1049356, 1050041, 1049502, 1052386, 1049298, 1038084, 1049922,
                  1049923, 1049225, 1055570, 1049487, 1052115, 1058518, 1051632, 1060920, 1054741,
                  1049924, 1058658, 1051658, 1055634, 1055084, 1055124, 1057520, 1055565, 1049457,
                  1049519, 1054987, 1055052, 1035505, 1049592, 1049427, 1055141, 1058643, 1055632,
                  1055085, 1049595, 1054989, 1050043, 1060986, 1059667, 1052316, 1049492, 1060944,
                  1049597, 1055039, 1050081, 1054733, 1055562, 1057476, 1050635, 1057498, 1049599,
                  1049489, 1049334, 1055086, 1049344, 1049538, 1052989, 1049679, 1059345, 1052673,
                  1049250, 1049504, 1051614, 1049520, 1055569, 1052646, 1049403, 1054766, 1055601,
                  1055582, 1049539, 1055087, 1052070, 1049215, 1058519, 1049696, 1049372, 1060917,
                  1055011, 1049601, 1049602, 1055066, 1054772, 1058508, 1058532, 1049236, 1055125,
                  1049990, 1049604, 1049347, 1052014, 1049605, 1054781, 1055088, 1051679, 1049119,
                  1055136, 1050112, 1049252, 1049606, 1061598, 1050142, 1058593, 1055089, 1060961,
                  1058666, 1049231, 1058679, 1055624, 1050027, 1049429, 1058609, 1052059, 1052351,
                  1051606, 1052665, 1049408, 1052216, 1052308, 1052617, 1025820, 1058664, 1051669,
                  1049220, 1049230, 1049608, 1049390, 1060947, 1050113, 1051661, 1049609, 1058669,
                  1052299, 1049610, 1055090, 1058665, 1049289, 1049611, 1049612, 1055619, 1059648,
                  1058647, 1055077, 1050136, 1055783, 1055073, 1049392, 1049343, 1050120, 1059632,
                  1049335, 1058628, 1050121, 1052352, 1049170, 1052373, 1049828, 1049465, 1026439,
                  1049423, 1049446, 1052387, 1052121, 1049269, 1059625, 1049549, 1057444, 1055040,
                  1049318, 1055091, 1058516, 1055092, 1052122, 1060926, 1058581, 1060855, 1050306,
                  1055795, 1052667, 1052272, 1051662, 1052668, 1055794, 1050034, 1058652, 1049233,
                  1055051, 1050046, 1049823, 1058676, 1049027, 1049395, 1049346, 1049424, 1051613,
                  1049396, 1058680, 1049553, 1055623, 1058644, 1049664, 1049518, 1055581, 1057465,
                  1049397, 1060948, 1049665, 1057474, 1049110, 1049132, 1038003, 1049474, 1057491,
                  1058654, 1057940, 1058635, 1051599, 1055842, 1051618, 1049555, 1049184, 1058637,
                  1049710, 1049500, 1051650, 1049556, 1049120, 1058631, 1049524, 1052023, 1052022,
                  1049135, 1051592, 1050131, 1055137, 1044388, 1052357, 1042071, 1049558, 1049847,
                  1051674, 1049525, 1049560, 1049666, 1049561, 1049478, 1049227, 1060863, 1049841,
                  1049319, 1059702, 1059629, 1060831, 1049562, 1049272, 1052039, 1052060, 1049425,
                  1049563, 1048825, 1049364, 1049706, 1059623, 1037964, 1049564, 1055746, 1050126,
                  1049402, 1052623, 1058668, 1052621, 1056184, 1059662, 1049214, 1050096, 1054999,
                  1060949, 1052663, 1050135, 1055128, 1049844, 1058651, 1058662, 1049566, 1055593,
                  1055063, 1049462, 1049667, 1055608, 1049526, 1049570, 1049426, 1049466, 1050104,
                  1055596, 1049479, 1055031, 1049149, 1059703, 1049571, 1049572, 1049203, 1049908,
                  1049100, 1049054, 1060983, 1055131, 1052691, 1049928, 1050107, 1049480, 1055598,
                  1049669, 1055094, 1056176, 1055056, 1060890, 1055049, 1055014, 1049368, 1049375,
                  1055005, 1055095, 1049573, 1049574, 1049575, 1049576, 1052678, 1058587, 1055616,
                  1055096, 1055563, 1042072, 1049295, 1058659, 1061259, 1055013, 1055041, 1060885,
                  1049577, 1058683, 1060891, 1055097, 1049376, 1055132, 1059353, 1058650, 1059628,
                  1057503, 1057502, 1058482, 1049481, 1049511, 1049528, 1049145, 1060922, 1060856,
                  1058640, 1052319, 1060923, 1055101, 1061260, 1060959, 1056203, 1048602, 1049111,
                  1049325, 1055047, 1055102, 1049369, 1052298, 1055035, 1051664, 1049261, 1055564,
                  1050116, 1049362, 1049030, 1059349, 1059633, 1054836, 1051919, 1049161, 1055543,
                  1049188, 1049449, 1049531, 1058625, 1058608, 1060911, 1055103, 1049578, 1058617,
                  1049150, 1055462, 1055129, 1049510, 1049675, 1049178, 1055104, 1052057, 1049450,
                  1055105, 1049579, 1058630, 1051638, 1058750, 1059631, 1049385, 1049340, 1049581,
                  1058542, 1058632, 1049235, 1049247, 1049532, 1049180, 1010229, 1058661, 1049533,
                  1049514, 1049814, 1049361, 1024391, 1048807, 1049827, 1049416, 1060892, 1049484,
                  1055524, 1049534, 1049331, 1059663, 1059615, 1057445, 1049583, 1055106, 1055042,
                  1055008, 1050038, 1051633, 1054982, 1052024, 1049452, 1055053, 1055779, 1049262,
                  1051676, 1049584, 1049485, 1050118, 1049698, 1049676, 1058571, 1058689, 1052571,
                  1050124, 1055000, 1054994, 1049909, 1055743, 1052068, 1056183, 1060919, 1049618,
                  1049619, 1049463, 1059367, 1058627, 1055012, 1049076, 1057453, 1049472, 1049151,
                  1049063, 1055107, 1049467, 1049434, 1057475, 1017547, 1055028, 1055528, 1057517,
                  1050134, 1061599, 1054996, 1049127, 1055001, 1050049, 1049845, 1059669, 1052250,
                  1049620, 1050125, 1056169, 1057524, 1051595, 1049624, 1055020, 1049436, 1049625,
                  1055126, 1050132, 1055062, 1056197, 1055542, 1055110, 1060918, 1049671, 1055527,
                  1052234, 1049541, 1049627, 1060852, 1058752, 1055140, 1055638, 1049628, 1049278,
                  1057529, 1055800, 1059627, 1055111, 1052990, 1049197, 1049143, 1059645, 1059774,
                  1058634, 1059634, 1059635, 1049672, 1058754, 1049630, 1049673, 1055843, 1058554,
                  1055584, 1049470, 1055112, 1051673, 1050114, 1049715, 1050007, 1049818, 1050044,
                  1049154, 1055024, 1049405, 1050130, 1055629, 1049634, 1044389, 1058677, 1058539,
                  1058582, 1050108, 1049542, 1051603, 1049512, 1049912, 1049635, 1055019, 1055018,
                  1049183, 1052017, 1055030, 1055114, 1049418, 1055054, 1008138, 1058639, 1049163,
                  1055536, 1052323, 1052596, 1054997, 1052612, 1050127, 1057493, 1025838, 1055115,
                  1055061, 1049944, 1049685, 1055135, 1049350, 1051659, 1056177, 1059344, 1060943,
                  1003939, 1049471, 1049714, 1052018, 1058673, 1049497, 1049507, 1052026, 1052027,
                  1050630, 1051671, 1059653, 1049353, 1052321, 1055004, 1051906, 1051607, 1057507,
                  1054981, 1055615, 1049716, 1049139, 1055116, 1059768, 1049147, 1049641, 1051677,
                  1049443, 1049642, 1049643, 1049644, 1058626, 1049095, 1051678, 1056166, 1055033,
                  1059374, 1049130, 1049688, 1055059, 1049646, 1059614, 1049648, 1050029, 1049689,
                  1055017, 1057935, 1049473, 1059767, 1049690, 1058656, 1050123, 1049320, 1055118,
                  1049410, 1049649, 1049419, 1050138, 1049406, 1049379, 1049345, 1058535, 1058648,
                  1058636, 1049440, 1041246, 1049711, 1055074, 1050141, 1055069, 1049134, 1033233,
                  1055010, 1057342, 1037638, 1057363, 1055007, 1058517, 1058531, 1049411, 1051637,
                  1049377, 1057461, 1049169, 1055119, 1049650, 1049691, 1049651, 1049498, 1058678,
                  1049324, 1060940, 1049945, 1058726, 1052664, 1059637, 1050137, 1059670, 1049243,
                  1051604, 1049499, 1055748, 1049692, 1055603, 1010111, 1049292, 1055120, 1049653,
                  1055121, 1059636, 1058653, 1049491, 1058642, 1049242, 1049654, 1049080, 1058663,
                  1059649, 1060883, 1059352, 1051611, 1049693, 1058672, 1058660, 1049442, 1058646,
                  1058667, 1049697, 1055080, 1055058, 1049323, 1037749, 1055078, 1049210, 1049694,
                  1055070, 1057477, 1055122, 1051597, 1050143, 1055123, 1049287, 1056174, 1058638,
                  1054675, 1049657, 1061246, 1051670, 1049695, 1049659, 1049206, 1049660, 1049279,
                  1052331, 1054689, 1049339, 1049661, 1050140, 1049328, 1049508, 1049192, 1049662,
                  1049910, 1050197, 1059363, 1058690, 1049221, 1049430, 1049329, 1052330, 1052209,
                  1049157, 1049459, 1052249, 1052322, 1055130, 1058684, 1055075, 1055081, 1058572,
                  1049433, 1054983, 1052381, 1049614, 1049540, 1055537, 1049683, 1058641, 1057508,
                  1055555, 1054728, 1055046, 1049824, 1051656, 1058657, 1057518, 1058502, 1049615,
                  1059652, 1054690, 1049245, 1049044, 1055055, 1049218, 1049067, 1051668, 1055022,
                  1049126, 1055079, 1051660, 1049088, 1049616, 1049185, 1049010, 1058655, 1052988,
                  1049782, 1049315, 1055006, 1055023, 1057495, 1055016, 1058674, 1050117, 1049348,
                  1055057, 1052651, 1049128, 1059359, 1055034, 1049367, 1049712, 1049002, 1049237,
                  1048998, 1052707
   );

select * from pla_control;

select * from locales;

insert into pevisa.pr_ot ( numero, fecha, estado, cant_prog, nuot_serie, nuot_tipoot_codigo
                         , observacion, lote, fecha_prog_ini, fecha_prog_fin, fecha_cierre, parcial
                         , receta, referencia, formu_art_cod_art, formu_receta, cdc_centro_costo
                         , num_lote, cant_resul, aprueba_gte, serie_ot_fab, numero_ot_fab
                         , cant_ingresado, hora_fab, hora_env, hora_enc, per_fab, per_env, per_enc
                         , bolsal, bolfec, abre01, abre02, boling, destino, plazo, fecha_plazo
                         , cod_eqi, pais, empaque, usuario, origen, embalaje, prioridad, cant_merma
                         , fecha_prioridad, cod_lin, peso_pieza, saldo_pk, categ_merma)
values ( 1061725, timestamp '2024-07-12 05:01:20', '9', 840.0000, '3', 'AR', 'ORDEN :19783614', 0
       , null, null, date '2024-08-20', 'S', 1, 0.0000, 'KIT SB 9903341', 1, '91', null, 840.00, 'S'
       , null, null, 0.0000, 25.00, null, null, null, 1.00, null, null, null, '16440', 'SABO', null
       , '1', 20, timestamp '2024-07-31 21:01:33', '9903341', '11', '40', 'PEVISA', 'CONVIERTE'
       , '**SIN MARCA', 6148, 0.00, null, '03', 0.0000, 840.0000, 0);

insert into pevisa.pr_ot_det ( cant_formula, cant_usada, cost_formula, cost_usada, almacen
                             , ot_numero, ot_nuot_serie, ot_nuot_tipoot_codigo, art_cod_art
                             , cant_despachada, rendimiento, cod_lin, pr_secuencia, flag_kardex
                             , estado, prioridad, fecha_prioridad, cant_surtida, saldo)
values ( 840.0000, 7.0000, 7.0000, 7.0000, '03', 1061725, '3', 'AR', '200.2086ZN', 0.0000, 1.0000
       , '1049', 0, 'N', '1', 6148, null, 0.0000, 840.0000);

select *
  from pr_num_ot
 where tipoot_codigo = 'AR'
   and serie = '3';

select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and numero in (
   1071693
   );

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'AR'
   and ot_numero in (
   1071693
   );

select *
  from expedido_d
 where numero = 16440
   and nro = 1;

select * from pla_control;


select * from articul_iqf
where cod_art = 'SOL 815';