select sysdate from dual;

select * from packing_agrupar;

select *
  from pr_ot_anulacion
 where nuot_tipoot_codigo = 'PR'
   and numero = 448996;

select *
  from kardex_g
 where cod_alm = '92'
   and tp_transac = '22'
   and serie = 1
   and numero in (
   458204
   );

-- faucett
select *
  from kardex_g
 where cod_alm = 'F0'
   and tp_transac = '14'
   and serie = 10
   and numero in (
   16403
   )
 order by numero;


select *
  from kardex_g
 where cod_alm = '15'
   and tp_transac = '29'
   and serie = 1
   and numero in (
                  1574783, 1574782, 1574781, 1574780, 1574779, 1574778, 1574777, 1574776, 1574775,
                  1574774
   );


select *
  from kardex_d_otm
 where cod_alm = '62'
   and tp_transac = '22'
   and serie = 1
   and numero in (
   227677
   );

select *
  from kardex_g_movglos
 where cod_alm = 'A3'
   and tp_transac = '11'
   and serie = 1
   and numero in (
   28961
   );

select *
  from kardex_d
 where cod_alm = '03'
   and tp_transac = '29'
   and serie = 1
   and numero = 1573778;

select *
  from kardex_d
 where cod_art = 'CAJA RP-75'
   and tp_transac = '22'
   and cod_alm = 'FT'
 order by fch_transac desc;

select *
  from kardex_g_historia
 where cod_alm = '92'
   and tp_transac = '22'
   and serie = 1
   and numero in (
   232242
   );

select *
  from kardex_d_historia
 where cod_alm = 'D5'
   and tp_transac = '18'
   and serie = 2
   and numero in (
   492695
   );

select *
  from kardex_d_otm
 where cod_alm = '62'
   and tp_transac = '22'
   and serie = 1
   and numero = 225859;

select * from paramin;

select *
  from produccion_armado
 where numero_oa = 829026;

select ta.cod_alm_destino, a.descripcion
  from traslados_almacenes ta, almacenes a
 where ta.cod_alm_destino = a.cod_alm
   and ta.cod_alm_origen = '35'
 order by 1;

select *
  from traslados_almacenes
 where cod_alm_origen = '35';

select * from cargo_trabajador;

select *
  from vw_personal
 where situacion = '9';

select count(*)
  from vw_personal p
     , planilla10.t_situacion_cesado c
 where p.situacion = c.codigo
   and p.c_codigo = 'E567';

select *
  from cargo_trabajador
 where fch_seleccion is not null
    or file_name is not null;

select * from ruta_docvirtual;

select sum(hasta - desde + 1) as total_dias
  from permiso
 where id_concepto = 'DME'
   and id_estado != 9
   and extract(year from desde) = 2022
   and id_personal = 'E110';

select *
  from permiso
 where id_concepto = 'DME'
   and id_estado != 9
   and extract(year from desde) = 2022
   and id_personal = 'E110';

  with detalle as (
    select v.cod_cliente, v.nombre, v.fch_pedido, v.pedido, v.pedido_item, v.nuot_serie
         , v.nuot_tipoot_codigo, v.numero, v.fecha, v.formu_art_cod_art, v.estado, v.art_cod_art
         , v.cant_formula, v.rendimiento, v.saldo, v.despachar, v.cod_lin, v.abre02, v.preuni
         , v.valor
         , v.stock, v.tiene_stock, v.tiene_stock_ot, v.tiene_stock_item, v.tiene_importado
         , v.impreso
         , v.fch_impresion, v.es_juego, v.es_importado, v.es_prioritario, v.es_sao
         , case when lag(v.numero) over (order by null) = v.numero then null else v.numero end oa
         , dense_rank() over (
      order by case when p.prioritario = 1 then v.es_prioritario end desc
--             , case when trunc(sysdate) - v.fch_pedido > p_dias then 1 else 0 end desc --> 25/08/22 solo filtre mayores a fecha
        , case when v.valor > p.valor_item then 1 else 0 end desc
        , v.es_juego
        , v.valor desc
        , v.pedido
        , v.pedido_item
      ) as ranking
      from vw_ordenes_pedido_pendiente v
           join param_surte p on p.id_param = 1
     where (v.es_prioritario = 1
       or ((v.pais = :p_pais or :p_pais is null)
         and (v.vendedor = :p_vendedor or :p_vendedor is null)
         and (v.empaque = :p_empaque or :p_empaque is null)
         and (trunc(sysdate) - v.fch_pedido > :p_dias or :p_dias is null)
         and (v.es_juego = :p_es_juego or :p_es_juego is null)
         and (exists(select * from tmp_selecciona_cliente t where v.cod_cliente = t.cod_cliente) or
              not exists(select * from tmp_selecciona_cliente)))
       )
       and v.impreso = 'NO'
--            and pedido = 14660
--            and pedido_item = 135
    )
select *
  from detalle
 order by ranking;

select * from vw_ordenes_impresas_pendientes;

select user, b.numero, b.nuot_serie, b.nuot_tipoot_codigo, a.estado, a.estado_old
     , trunc(a.fecha) as fecha
     , nvl(f_grupo_formu(b.formu_art_cod_art), 99) grupo, b.cod_lin, b.formu_art_cod_art
     , b.cant_prog
     , b.abre02 cliente, b.abre01 pedido, b.per_env item, b.destino
     , decode(b.destino, 1, c.totlin, 2, e.totlin) total, a.usuario, 'ALMACEN'
  from pr_trasab_estado a, pr_ot b, expedido_d c, expednac_d e
 where a.fecha between :x_fecha_del and :x_fecha_al + 1
   and a.tipo = 'AR'
   and a.numero = b.numero
--    and a.estado in ('4')
   and a.serie = b.nuot_serie
   and a.tipo = b.nuot_tipoot_codigo
   and b.abre01 = c.numero(+)
   and b.per_env = c.nro(+)
   and b.abre01 = e.numero(+)
   and b.abre02 not like 'PC1%'
   and b.per_env = e.nro(+)
   and a.estado_old in ('0', '1')
--    and a.estado_old in ('1', '2', '3')
   and a.usuario not in ('BETY')
   and b.cod_lin not in ('1970', '1971', '1972')
   and a.fecha = (
   select max(fecha)
     from pr_trasab_estado p
    where p.numero = a.numero
      and p.serie = a.serie
      and p.tipo = a.tipo
      and p.estado = a.estado
      and p.estado_old in ('0', '1')
--       and p.estado_old in ('1', '2', '3')
      and p.usuario not in ('BETY')
   )
--    and exists(
--      select 1
--        from vw_ordenes_impresas_pendientes i
--       where b.nuot_tipoot_codigo = i.nuot_tipoot_codigo
--         and b.nuot_serie = i.nuot_serie
--         and b.numero = i.numero
--    )
   and exists(
     select 1
       from pr_ot_impresion i
      where b.nuot_tipoot_codigo = i.nuot_tipoot_codigo
        and b.nuot_serie = i.nuot_serie
        and b.numero = i.numero
   )
   and nvl(f_grupo_formu(b.formu_art_cod_art), 99) like :x_grupo;

select *
  from pr_ot_impresion
 where trunc(fecha) = to_date('07/10/2022', 'dd/mm/yyyy')
   and nuot_tipoot_codigo = 'AR';

select *
  from caja_chica
 where serie = 2
 order by numero desc;


select *
  from caja_chica
 where serie = 2
   and numero = 220099;

select *
  from itemord
 where serie = 3
   and num_ped in (
   42673
   );

select *
  from orden_de_compra_historia
 where serie = 20
   and num_ped in (
   982
   )
   and glosa = 'APROBADO'
   and creacion_quien = 'JAIME';

select sum(cantidad * precio) as total
  from itemord
 where serie = 4
   and num_ped in (
   58332
   );

select *
  from itemmatri
 where num_ped = 220169;

select * from articul where cod_art = 'VLC140';

select *
  from tab_grupos
 where descripcion like '%NEUMATICOS CHAOYANG - MOTOCICLETA%';

select *
  from tab_grupos
 where descripcion like '%MOTOC%';

select *
  from tab_lineas
 where grupo = '38';

select *
  from tab_lineas
 where grupo = ?;


select * from orden_de_compra_historia where serie = 30 and num_ped = 282;


select *
  from articul
 where cod_art like 'GASTO%';

select *
  from articul
 where cod_art = 'CCLOR 363';

--20131312955
select *
  from embarques_g
 where numero_embarque = 3486;

select *
  from lg_detalle_gastos
 where numero_embarque = 3486;

select *
  from lg_dua
 where numero_embarque = 3486;

select *
  from orden_matriceria
 where num_ped = 220051;


select *
  from itemmatri
 where num_ped = 220010;

select sum(cantidad * precio)
  from itemmatri
 where num_ped = 210078;

select * from orden_de_compra where serie = 4 and num_ped = 58095;


select *
  from kardex_g
 where cod_alm = '03'
   and tp_transac = '29'
   and serie = 1
   and numero in (1573777);

select *
  from kardex_d
 where cod_alm = '03'
   and tp_transac = '27'
   and serie = 2
   and numero in (760471);


select *
  from kardex_d
 where cod_art = '92045GR'
 order by fch_transac desc;


select *
  from kardex_g
 where cod_alm = '14' and tp_transac = '29'
   and serie = 1
   and numero in (
                  1573059, 1573061, 1573062, 1573064, 1573066
   );

select *
  from kardex_g_historia
 where cod_alm = 'D2'
   and tp_transac = '27'
   and serie = 1
   and numero in (
   1278250
   );

begin
  dbms_output.put_line(api_kardex_g_historia.mas_antiguo('03', '18', 2, 496189).usuario);
end;

select *
  from cambdol
 where fecha = to_date('16,06,2021', 'DD,MM,YYYY')
   and tipo_cambio = 'V';


select sum(total)
  from itemord
 where serie = 6
   and num_ped in (
   1468
   );


select *
  from artiprov
 where proveedor = '10086427481'
   and cod_art = 'LIMPIEZA GRANDE';


select *
  from orden_de_compra_historia
 where serie = 20
   and num_ped = 916;


select *
  from itemord
 where cod_maquina = 'CAMA VIGIL021';


select *
  from lg_condpag;


select *
  from instrumento_asigna;


select *
  from factpag
 where cod_proveedor = '20109464849'
   and serie_num = 'F003'
   and numero = '14157';

select *
  from kardex_g_movglos
 where cod_alm = '02'
   and tp_transac = '11'
   and serie = 1
   and numero in (28938);


select *
  from kardex_g_movglos
 where serie_oc = '30'
   and numero_oc = '361';

select *
  from kardex_g_movglos
 where tipdoc_cp = '01'
   and serie_cp = 'E001'
   and numero_cp = '36';

-- 97	11	1	26224
select *
  from kardex_d
 where cod_alm = '62'
   and tp_transac = '11'
   and serie = 1
   and numero = 28925;



select *
  from almacen
 where cod_art = 'CAJA EXT 085X28X21';


select *
  from transacciones_almacen
 where tp_transac = '27';

-- 487.290000
select cant_ped, factor_uc, cantidad * factor_uc, 637, cantidad
  from itemord
 where serie = 1
   and num_ped in (
   83659
   );


select cantidad, cant_ped, factor_uc, cantidad * precio * factor_uc as calculado
  from itemord
 where serie = 1
   and num_ped in (
   83659
   );


-- APROBADO	ACTUALIZACION ESTADO	JAIME
select *
  from orden_de_compra_historia
 where serie = 6
   and num_ped in (
   1464
   );


-- saldo anterior 48200
-- precio anterior 0.029441
select cod_art, saldo, precio, round(saldo * precio, 2) as total_calc, total
  from itemord
 where serie = 1
   and num_ped in (
   83925
   );

select *
  from usuario_modulo
 where usuario = 'JCABEZAS';


select sum(precio * cantidad) as total
  from itemord
 where serie = 1
   and num_ped in (82967);


select cod_art, sum(precio * cantidad) as total
  from itemord
 where serie = 30
   and num_ped in (185)
 group by cod_art
 order by cod_art;


-- debe cuadrar con el total de la factura
select precio * cant_ped, factor_uc, total
     , precio * cant_ped, total as factor_calculado, factor_uc
     , precio * 93, factor_uc, total
  from itemord
 where serie = 1
   and num_ped in (
   84265
   );


select *
  from itemord
 where serie = 1
   and num_ped = 84323;


-- factor segun la cantidad a ingresar y el total de la factura
select precio * 548.790, 3700.4
  from itemord
 where serie = 1
   and num_ped in (
   84426
   );


select *
  from caja_chica
 where serie = 2
   and numero = 220085;


select *
  from caja_chica_d
 where serie = 1
   and numero = 20235;


-- el factor calculado debe cuadrar con el valor de la factura
select precio * 546.1, 2.48227272727272727272727272727272727273
  from itemord
 where serie = 1
   and num_ped in (
   84453
   );


select total, precio * 1.09481287127158555729984301412872841444
  from itemord
 where serie = 1
   and num_ped in (
   83659
   );


select *
  from orden_de_compra_historia
 where serie = 6
   and creacion_quien = 'JAIME';

-- 2021-01-26 00:00:00

select *
  from kardex_g
 where cod_alm = '02'
   and tp_transac = '29'
   and serie = 1
   and numero in (1414549, 1414548, 1414547);


select *
  from kardex_d
 where cod_alm = '03'
   and tp_transac = '11'
   and serie = 2
   and numero in (5275);


-- INSERT INTO PEVISA.KARDEX_D (COD_ALM, TP_TRANSAC, SERIE, NUMERO, COD_ART, CANTIDAD, COSTO_D, COSTO_S, FCH_TRANSAC, POR_DESC1, POR_DESC2, IMP_VVB, ESTADO, CUENTA69, ORIGEN, ING_SAL, LOTE, CONOS, TARA, FLAG, AUTONUM, ORDEN, PR_PROVEEDOR, PR_REFERENCIA, PR_ORDCOMP, PR_CODPZA, PR_VALVTA, PR_COSFOB, PR_CANTHABI, PR_TIPOT, PR_NUMOT, PR_NUMPED) VALUES ('A1', '11', 1, 25450, 'EQ SEGU13', 1.0000, 272.02469135, 991.53, TO_DATE('2021-01-22 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0.00, 0.00, 991.53, '8', '335103', 'P', 'I', null, null, null, null, null, null, null, 'FE001-611', '160', null, null, null, null, null, null, null);

select *
  from articul
 where cod_art = 'EQ SEGU13';

select *
  from almacen
 where cod_art = 'EQ SEGU13';

-- 97	11	1	24600

select *
  from pevisa.kardex_g_movglos
 where cod_alm = '02'
   and tp_transac = '11'
   and serie = 1
   and numero = 25898;


select *
  from kardex_g
 where ser_doc_ref = 2
   and nro_doc_ref = 21827;

select *
  from kardex_g
 where ser_doc_ref = 2
   and nro_doc_ref = 21825;


select *
  from factpag
 where cod_proveedor = '20111281069'
--    AND serie_num = 'E001'
   and numero = '0001708';


select *
  from movglos
 where nro_referencia = '0000100'
   and cod_proveed = '10174137493';


select *
  from kardex_g_movglos
 where cod_proveedor = '10438689368'
   and numero_cp = '104';


select *
  from kardex_g_movglos
 where cod_alm = 'A1'
   and tp_transac = '11'
   and serie = 1
   and numero = 25156;


-- 62	11	1	24352

select *
  from pevisa.kardex_d
 where cod_alm = '62'
   and tp_transac = '11'
   and serie = 1
   and numero = 24352;


select sum(cantidad * precio)
  from itemord
 where serie = 1
   and num_ped in (82173);


select *
  from orden_de_compra_historia
 where serie = 4
   and num_ped in (55129);


select *
  from kardex_g_movglos
 where serie_oc = 30
   and numero_oc = 92
 order by fecha_cp;


select *
  from kardex_d
 where cod_art = '01MONI2';



select *
  from kardex_g
 where cod_alm = '97'
   and tp_transac = '11'
   and serie = 1
   and numero = 23733;


select *
  from kardex_d
 where cod_alm = '97'
   and tp_transac = '11'
   and serie = 1
   and numero = 23733;


-- 2340.00	421.20	2761.20

-- 3.393


select *
  from kardex_d
 where cod_alm = 'A1'
   and tp_transac = '11'
   and serie = 1
   and numero = 23198;



merge into itemord i
using orden_de_compra o
on (i.serie = o.serie
  and i.num_ped = o.num_ped
  and o.id_maquina is not null)
when matched then
  update
     set i.cod_maquina = o.id_maquina;


---------------------------------------------------------
---------------- REANUDA INGRESO ALMACEN ----------------
---------------------------------------------------------

-- obtiene el numero de transaccion y elimina de la tabla
select *
  from kardex_g_movglos
 where serie_oc = 30
   and numero_oc = 108;


-- verifica que la transaccion este anulada
select *
  from kardex_g
 where cod_alm = 'A1'
   and tp_transac = '11'
   and serie = 1
   and numero = 23575;


-- elimina ingreso almacen anulado
select *
  from oc_registro_facturas
 where serie_oc = 30
   and numero_oc = 275;

select *
  from oc_registro_facturas
 where serie_cp = 'F324'
   and numero_cp = 3375;

select *
  from usuarios_almacenes_perfil
 where usuario = user
   and cod_alm = 'A3';

select * from prestamo_activo_fijo;

-- reactiva saldo
select *
  from itemord
 where serie = 4
   and num_ped = 59107;


-- estado de la orden de compra
select *
  from orden_de_compra
 where serie = 30
   and num_ped = 108;

select *
  from kardex_d
 where cod_alm = 'A1'
   and tp_transac = '11'
   and serie = 1
   and numero = 25104;

select *
  from vendedores
 where nombre like '%BONDY%';

select * from ruta_docvirtual;

select *
  from caja_chica
 where serie = 5
 order by numero desc;


select *
  from caja_chica_d
 where serie = 5
   and numero = 20388;

select *
  from logger_logs
 order by id desc;

select * from vw_personal;

-- DESC_ENCARGADO

select *
  from pr_prioridad_pza_30
 where cod_pza = '380.947'
   and prioridad = 6190;

select *
  from pr_prioridad_pza_30
 where cod_pza = '380.947';

select *
  from pagos_h
 where serie_planilla = 61
   and numero_planilla = 714;

select *
  from pagos_i
 where serie_planilla = 61
   and numero_planilla = 714;


select * from pr_prioridad_htmp_30;

select * from pr_prioridad_tmp_30;

select * from pr_prioridad_pza_30;

select *
  from extablas_expo
 where codigo = '....';


select *
  from extablas_expo
 where tipo = '13';

select nvl(t.abreviada, 'OFICINA') p_vende, nvl(e.cod_vende, '00') vende
     , sum(decode(to_char(e.fecha, 'MM'), '01', e.imp_neto, 0)) ene
     , sum(decode(to_char(e.fecha, 'MM'), '02', e.imp_neto, 0)) feb
     , sum(decode(to_char(e.fecha, 'MM'), '03', e.imp_neto, 0)) mar
     , sum(decode(to_char(e.fecha, 'MM'), '04', e.imp_neto, 0)) abr
     , sum(decode(to_char(e.fecha, 'MM'), '05', e.imp_neto, 0)) may
     , sum(decode(to_char(e.fecha, 'MM'), '06', e.imp_neto, 0)) jun
     , sum(decode(to_char(e.fecha, 'MM'), '07', e.imp_neto, 0)) jul
     , sum(decode(to_char(e.fecha, 'MM'), '08', e.imp_neto, 0)) ago
     , sum(decode(to_char(e.fecha, 'MM'), '09', e.imp_neto, 0)) sep
     , sum(decode(to_char(e.fecha, 'MM'), '10', e.imp_neto, 0)) oct
     , sum(decode(to_char(e.fecha, 'MM'), '11', e.imp_neto, 0)) nov
     , sum(decode(to_char(e.fecha, 'MM'), '12', e.imp_neto, 0)) dic
  from docuvent e, clientes c, extablas_expo t
 where to_char(e.fecha, 'YYYY') = :P_ANO
   and nvl(e.estado, '0') <> '9'
   --AND  E.TIPODOC = '01'
   and e.origen = 'EXPO'
   and c.cod_cliente = e.cod_cliente
   and t.tipo = '13'
   and t.lista_pre(+) = nvl(e.cod_vende, '00')
 group by nvl(t.abreviada, 'OFICINA'), nvl(e.cod_vende, '00')
 order by 1;

select *
  from lg_itemjam
 where cod_art in (
                   'ELEVADOR DXTT48', 'ELEVADOR FOP3-45'
   );

select *
  from lg_itemjam
 where num_importa = 'PJ22118';

select *
  from solimat_d
 where numero = 170673;

select *
  from kardex_g
 where num_importa = 'BP-220826'
   and cod_alm in ('D2', 'D3', 'D5');

select c_empleador from pla_control;

select *
  from kardex_d
 where cod_alm = 'D3'
   and serie = 39
   and numero = 1030;


select *
  from kardex_d
 where cod_alm = '63'
   and serie = 39
   and numero = 1030;



select *
  from almacenes
 where cod_alm in ('D3', '63');

select *
  from kardex_g
 where num_importa = 'GN39-1030';

select *
  from kardex_d
 where cod_art = '95105GR'
 order by fch_transac desc;

select *
  from kardex_d
 where cod_alm = '03'
   and tp_transac = '10'
   and serie = 1
   and numero = 2781;

-- 95105GR	244.0000
-- 89019/20TG	350.0000

select *
  from lineas_bloqueadas_codigo
 where cod_art = '95105GR'
   and activo = 1
   and trunc(sysdate) between fch_ini and fch_fin;

select *
  from produccion_armado
 where numero_oa = 855790;

select * from pcmasters;

select *
  from pcformulas f
       join articul a on f.cod_for = a.cod_art
 where a.tp_art = 'P';

select * from pcformulas;

select *
  from pcformulas f
       join articul a on f.cod_for = a.cod_art
 where a.tp_art in ('P', 'M')
   and not exists(
     select 1
       from pcmasters m
      where f.cod_art = m.cod_art
   );

select *
  from pcmasters
 where cod_art = 'KITETF302-1';

select *
  from articul a
 where a.tp_art in ('P')
   and a.cod_lin != 'ZZ'
   and not exists(
     select 1
       from pcformulas f
      where a.cod_art = f.cod_for
   );

select *
  from pcformulas
 where cod_for = 'TM-290.4312SB';

select *
  from pr_tabmaq
 where codigo = 'LAMPARAS 24 V';

select cod_proveed, nombre, direccion
  from proveed
 order by nombre;


select *
  from kardex_g g
 where g.tipo_pguia = 'AR'
   and g.serie_pguia = '3'
   and g.numero_pguia = '804609'
 order by ing_sal desc, numero_pguia;

select *
  from kardex_g g
 where g.tipo_pguia = 'AR'
   and g.serie_pguia = '3'
   and g.numero_pguia = '804609'
   and ((:estado = '3' and exists(
     select 1
       from kardex_d d
            join articul a on d.cod_art = a.cod_art
      where g.cod_alm = d.cod_alm
        and g.tp_transac = d.tp_transac
        and g.serie = d.serie
        and g.numero = d.numero
        and ((length(a.cod_lin) = 3 and a.cod_lin between '800' and '833')
        or (length(a.cod_lin) = 3 and a.cod_lin between '850' and '854'))
   )) or :estado != '3')
 order by ing_sal desc, numero_pguia;

select *
  from kardex_d
 where cod_alm = '06'
   and tp_transac = '29'
   and serie = 3
   and numero = 564137;

select *
  from kardex_g
 where cod_alm = '08'
   and tp_transac = '06'
   and serie = 3
   and numero = 563908;

select * from vw_bono_ordenes_armado;

select * from seg_letras;

select *
  from lineas_bloqueadas_codigo
 where cod_art = 'RIONAH125023-4R01';

select *
  from pr_estadistica_armado_g
 where usuario = user;

select *
  from pr_estadistica_armado_d
 where usuario = user
   and t2 = 'PLANEAMIENTO';

begin
  surte.por_item();
end;

create public synonym surte for pevisa.surte;

alter package surte2 compile package;

select *
  from lineas_bloqueadas_codigo
 where fch_ini = to_date('10/10/2022', 'dd/mm/yyyy')
   and cod_alm = '41';

select *
  from itemdocu
 where cod_lin in ('526', '27');

select *
  from docuvent_cierre
 order by fecha desc;

select * from tmp_imprime_ot;

select * from orden_impresa_surtimiento;

select user, b.numero, b.nuot_serie, b.nuot_tipoot_codigo, a.estado
     , a.estado_old, trunc(a.fecha) as fecha, nvl(f_grupo_formu(b.formu_art_cod_art), 99) grupo
     , b.cod_lin
     , b.formu_art_cod_art, b.cant_prog, b.abre02 cliente, b.abre01 pedido, b.per_env item
     , b.destino
     , decode(b.destino, 1, c.totlin, 2, e.totlin) total, a.usuario, 'PLANEAMIENTO'
  from pr_trasab_estado a
     , pr_ot b
     , expedido_d c
     , expednac_d e
 where a.fecha between :x_fecha_del and :x_fecha_al + 1
   and a.tipo = 'AR'
   and a.numero = b.numero
   and a.serie = b.nuot_serie
   and a.tipo = b.nuot_tipoot_codigo
   and b.abre01 = c.numero(+)
   and b.per_env = c.nro(+)
   and b.abre01 = e.numero(+)
   and b.abre02 not like 'PC1%'
   and b.per_env = e.nro(+)
   and a.estado_old in ('0', '1')
   and a.fecha = (
   select max(fecha)
     from pr_trasab_estado p
    where p.numero = a.numero
      and p.serie = a.serie
      and p.tipo = a.tipo
      and p.estado = a.estado
      and p.estado_old in ('0', '1')
   )
   and exists
   (select 1
      from orden_impresa_surtimiento i
     where b.nuot_tipoot_codigo = i.ot_tpo
       and b.nuot_serie = i.ot_ser
       and b.numero = i.ot_nro)
   and nvl(f_grupo_formu(b.formu_art_cod_art), 99) like :x_grupo;

select *
  from pevisa.caja_chica_serie
 where id_serie = 7;

select *
  from proceso_bono_aniversario
 order by id_proceso desc;

select *
  from kardex_g
 where cod_alm = '97'
   and tp_transac = '22'
   and serie = 1
   and numero = 99685;

select *
  from kardex_d
 where cod_alm = '97'
   and tp_transac = '22'
   and serie = 1
   and numero = 99685;

select kd.cod_alm, kd.tp_transac, kd.serie, kd.numero, kd.fch_transac, kd.cod_art, kd.cantidad
  from kardex_d kd
 where kd.cod_art in ('UPENTRENTM', 'UPENTRENTS', 'UPENTRENTL')
   and extract(year from kd.fch_transac) = 2023
 order by kd.fch_transac, kd.cod_art;

select d.cod_alm, d.tp_transac, d.serie, d.numero, d.fch_transac, d.cod_art, d.cantidad
     , g.cod_relacion, p.nombre as empleado, o.nombre as proveedor
  from kardex_g g
       join kardex_d d
            on g.cod_alm = d.cod_alm and g.tp_transac = d.tp_transac and g.serie = d.serie and
               g.numero = d.numero
       left join vw_personal p on g.cod_relacion = p.c_codigo
       left join proveed o on g.cod_relacion = o.cod_proveed
 where d.cod_art in ('UPENTRENTM', 'UPENTRENTS', 'UPENTRENTL')
   and extract(year from d.fch_transac) = 2023
 order by d.fch_transac, d.cod_art;

select *
  from planilla10.tar_encarga
 order by codigo;

select *
  from planilla10.personal
 where apellido_paterno = 'CASTILLO'
   and nombres like '%KAREN%';

-- call bonohe.email(2022, 4);

select *
  from planilla10.tar_encarga
 where codigo = '056';

select *
  from proceso_puntualidad_pers
 where id_personal = 'E42807'
 order by id_proceso;

--ingreso almacen detraccion

select p.c_codigo, p.apellido_paterno || ' ' || p.apellido_materno || ', ' || p.nombres as nombre
     , p.c_cargo, c.descripcion as desc_cargo, p.seccion, s.nombre as desc_seccion
     , g.c_codigo as encargado, p.sexo, g.nombre as desc_encargado, h.local
     , l.descripcion as desc_local, p.f_ingreso, p.fnatal, d.num_doc as dni
     , trunc(months_between(sysdate, p.fnatal) / 12) as edad
     , trunc(months_between(sysdate, p.f_ingreso) / 12) || ' años' as tiempo_empresa
  from planilla10.personal p
       left join planilla10.t_cargo c on p.c_cargo = c.c_cargo
       left join planilla10.tar_secc s on p.seccion = s.codigo
       left join planilla10.tar_encarga g on p.encargado = g.codigo
       left join planilla10.doc_per d on p.c_codigo = d.c_codigo and d.c_doc = 'LE'
       left join planilla10.hr_personal h on p.c_codigo = h.c_codigo
       left join planilla10.pla_local l on h.local = l.local
 where p.situacion not in ('8', '9')
   and (upper(g.usuario) = (
   select usuario
     from usuario_modulo
    where usuario = :user and modulo = :modulo
    union
   select id_usuario
     from usuario_modulo_alterno
    where id_alterno = :user and id_modulo = :modulo
   ) or :user in (
   select usuario from usuario_modulo where modulo = :modulo and maestro = 'SI'
   ));

select *
  from usuario_modulo
 where usuario = 'KCASTILLO';

-- JMENDEZ,ACCIDENTES,KCASTILLO
-- JMENDEZ,EVALUACION,KCASTILLO
-- JMENDEZ,EVALUACION_PENDIENTE,KCASTILLO
-- JMENDEZ,MATRIZ_PERSONAL,KCASTILLO


select *
  from bono_obrero
 where estado = 1
 order by id_bono_obrero;

select *
  from hallazgo_importacion
 where id_hallazgo = 295;

select *
  from pk_gnumero
 where pk_numero in (
                     52018, 52084, 52255, 52363, 52569, 52721, 53002, 53188, 53274, 53300, 53308
   );

select *
  from pr_prioridad
 where ano = 2023
   and mes = 3;

select * from pr_prioridad_htmp_30;

select *
  from caja_chica
 where serie = 7
   and numero = 22161;

select * from estado_caja order by id_estado;

select *
  from caja_chica_d
 where serie = 7
   and numero = 22161;

select *
  from otm_serie_usuario
 where id_tipo = 'MQ';

select *
  from ot_mantto_serie
 where id_tipo = 'MQ'
 order by id_tipo, id_serie;

select *
  from articul
 where cod_art = 'PIED-PEV-0001';

select *
  from tab_lineas
 where linea = '2048';

select * from kardex_d;

select *
  from almacen
 where cod_art = 'PIED-PEV-0001';

select *
  from capacitacion
 where id_capacitacion = 2460;

select tp_transac, descripcion
  from transacciones_almacen
 order by tp_transac;

select *
  from lg_detalle_gastos
 where numero_embarque = 4036;

-- no se puede ver
select *
  from campana
 where cod_campana in (
   'ND2023-1'
   );

-- revisar importes
select *
  from campana
 where cod_campana in (
   'ND2023-2'
   );

select * from estado_campana;

select cod_alm from almacen_activo_fijo;

select *
  from kardex_d
 where cod_art = '04EQ D17';

select cod_cliente, nombre from exclientes;

select round(sysdate - to_date('25/03/2023', 'dd/mm/yyyy')) as atras
     , round(sysdate - to_date('31/03/2023', 'dd/mm/yyyy')) as adelante
  from dual;

select *
  from accidente
 where id_accidente = 196;

select *
  from activo_fijo
 where cod_activo_fijo like '%AREA COMUN ADM%'
 order by cod_activo_fijo;

select * from itemdocu;

select *
  from pedido
 where num_ped = 216754;

select *
  from itemped
 where num_ped = 216754;

select *
  from planilla10.personal
 where encargado = '057';

select * from planilla10.tar_encarga;

select cod_proveedor, detalle, bateria from tmp_carga_data;

select *
  from planilla10.personal
 where apellido_paterno = 'CANDELA';

select * from planilla10.personal;

select *
  from planilla10.t_cargo
 where c_cargo = 'ASOP';

select c_codigo, nombre, c_cargo, desc_cargo, desc_doc, num_doc
     , to_char(fnatal, 'dd/mm/yyyy') as nacimiento
     , to_char(f_ingreso, 'dd/mm/yyyy') as ingreso
  from vw_personal
 where c_codigo = 'E730';

select *
  from planilla10.personal
 where apellido_paterno = 'SALCEDO';

select *
  from vendedores
 where cod_vendedor = 'S1';

select * from pla_control;
