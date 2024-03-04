select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and numero in (
                  1027570, 1028650
   );

-- select * from prot;

select *
  from pr_trasab_estado
 where tipo = 'AR'
   and numero in (
   102811
   )
 order by fecha desc;

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'AR'
   and ot_numero = 1007861;

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