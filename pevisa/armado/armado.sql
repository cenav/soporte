select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and numero in (
   846367
   );

-- select * from prot;

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'AR'
   and ot_numero = 704793;

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
 where numero_oa = 994118;

select *
  from produccion_armado_cajas_his
 where cod_caja = 266477;

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
select * from pr_ot
where abre01 = '435'
and destino = 2
and nuot_tipoot_codigo = 'AR'
and estado = 4
order by estado;

-- que no este programado
select * from produccion_armado
 where numero_oa = 995309;

SELECT DISTINCT O.NUMERO, O.FORMU_ART_COD_ART, O.CANT_PROG,
  0 AS CANT_RESUL, O.ABRE02, O.ABRE01,
  '<SIN LINEA>' AS LINEA_PROD,  '0' AS ESTADO,
  DECODE((SELECT COUNT(PD.SALDO)
            FROM PR_OT_DET PD
           WHERE PD.OT_NUOT_SERIE = 3
             AND PD.OT_NUOT_TIPOOT_CODIGO = 'AR'
             AND LENGTH(PD.COD_LIN) = 3
             AND (TO_NUMBER(PD.COD_LIN) BETWEEN 800 AND 831 OR TO_NUMBER(PD.COD_LIN) BETWEEN 850 AND 854)
             AND SALDO = 0 AND PD.ESTADO <> '9'
             AND OT_NUMERO = o.numero
          ), 0, 'COMPLETO', 'INCOMPLETO') AS SURTIDO
  FROM PR_OT O
 WHERE O.NUOT_TIPOOT_CODIGO ='AR'
   AND O.ESTADO = 4
   AND O.NUMERO NOT IN (SELECT P.NUMERO_OA FROM PRODUCCION_ARMADO P)
   AND O.FORMU_ART_COD_ART NOT LIKE 'RPKN%'
   AND O.FORMU_ART_COD_ART NOT LIKE 'ATZ%'
   AND O.FORMU_ART_COD_ART NOT LIKE 'CVM%'
   AND O.FORMU_ART_COD_ART NOT LIKE 'PFB%'
--    AND O.ABRE02 NOT LIKE 'PJ%'
 UNION ALL
SELECT P.NUMERO_OA, P.FORMU_ART_COD_ART, P.CANT_PROG, P.CANT_RESUL,
  P.ABREV_CLI, P.ABREV_PED, P.ID_LINEA_PROD AS LINEA_PROD, P.ESTADO,
  'COMPLETO' AS SURTIDO
  FROM PRODUCCION_ARMADO P
 WHERE P.ESTADO = 6
   AND P.ID_LINEA_PROD <> '05'
   AND NVL((SELECT ESTADO
              FROM PR_OT
             WHERE NUMERO = P.NUMERO_OA
               AND NUOT_TIPOOT_CODIGO = 'AR'), 0) = 4
 ORDER BY 8 DESC, 5, 6;
