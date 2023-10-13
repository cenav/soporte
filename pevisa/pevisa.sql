select *
  from packing_agrupar;

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
select precio * cant_ped
     , factor_uc
     , total
     , precio * cant_ped
     , total as factor_calculado
     , factor_uc
     , precio * 93
     , factor_uc
     , total
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

select *
  from kardex_d
 where cod_art = '05IMPR02';

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

select *
  from prestamo_activo_fijo;

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

select *
  from ruta_docvirtual;

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

select *
  from vw_personal;

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


select *
  from pr_prioridad_htmp_30;

select *
  from pr_prioridad_tmp_30;

select *
  from pr_prioridad_pza_30;

select *
  from extablas_expo
 where codigo = '....';


select *
  from extablas_expo
 where tipo = '13';

select nvl(t.abreviada, 'OFICINA') as p_vende
     , nvl(e.cod_vende, '00') as vende
     , sum(decode(to_char(e.fecha, 'MM'), '01', e.imp_neto, 0)) as ene
     , sum(decode(to_char(e.fecha, 'MM'), '02', e.imp_neto, 0)) as feb
     , sum(decode(to_char(e.fecha, 'MM'), '03', e.imp_neto, 0)) as mar
     , sum(decode(to_char(e.fecha, 'MM'), '04', e.imp_neto, 0)) as abr
     , sum(decode(to_char(e.fecha, 'MM'), '05', e.imp_neto, 0)) as may
     , sum(decode(to_char(e.fecha, 'MM'), '06', e.imp_neto, 0)) as jun
     , sum(decode(to_char(e.fecha, 'MM'), '07', e.imp_neto, 0)) as jul
     , sum(decode(to_char(e.fecha, 'MM'), '08', e.imp_neto, 0)) as ago
     , sum(decode(to_char(e.fecha, 'MM'), '09', e.imp_neto, 0)) as sep
     , sum(decode(to_char(e.fecha, 'MM'), '10', e.imp_neto, 0)) as oct
     , sum(decode(to_char(e.fecha, 'MM'), '11', e.imp_neto, 0)) as nov
     , sum(decode(to_char(e.fecha, 'MM'), '12', e.imp_neto, 0)) as dic
  from docuvent e
     , clientes c
     , extablas_expo t
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

select c_empleador
  from pla_control;

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

select *
  from pcmasters;

select *
  from pcformulas f
       join articul a on f.cod_for = a.cod_art
 where a.tp_art = 'P';

select *
  from pcformulas;

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
   )) or
        :estado != '3')
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

select *
  from vw_bono_ordenes_armado;

select *
  from seg_letras;

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

select *
  from tmp_imprime_ot;

select *
  from orden_impresa_surtimiento;

select user
     , b.numero
     , b.nuot_serie
     , b.nuot_tipoot_codigo
     , a.estado
     , a.estado_old
     , trunc(a.fecha) as fecha
     , nvl(f_grupo_formu(b.formu_art_cod_art), 99) as grupo
     , b.cod_lin
     , b.formu_art_cod_art
     , b.cant_prog
     , b.abre02 as cliente
     , b.abre01 as pedido
     , b.per_env as item
     , b.destino
     , decode(b.destino, 1, c.totlin, 2, e.totlin) as total
     , a.usuario
     , 'PLANEAMIENTO'
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
   (
     select 1
       from orden_impresa_surtimiento i
      where b.nuot_tipoot_codigo = i.ot_tpo
        and b.nuot_serie = i.ot_ser
        and b.numero = i.ot_nro
     )
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

select kd.cod_alm
     , kd.tp_transac
     , kd.serie
     , kd.numero
     , kd.fch_transac
     , kd.cod_art
     , kd.cantidad
  from kardex_d kd
 where kd.cod_art in ('UPENTRENTM', 'UPENTRENTS', 'UPENTRENTL')
   and extract(year from kd.fch_transac) = 2023
 order by kd.fch_transac, kd.cod_art;

select d.cod_alm
     , d.tp_transac
     , d.serie
     , d.numero
     , d.fch_transac
     , d.cod_art
     , d.cantidad
     , g.cod_relacion
     , p.nombre as empleado
     , o.nombre as proveedor
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

select p.c_codigo
     , p.apellido_paterno || ' ' || p.apellido_materno || ', ' || p.nombres as nombre
     , p.c_cargo
     , c.descripcion as desc_cargo
     , p.seccion
     , s.nombre as desc_seccion
     , g.c_codigo as encargado
     , p.sexo
     , g.nombre as desc_encargado
     , h.local
     , l.descripcion as desc_local
     , p.f_ingreso
     , p.fnatal
     , d.num_doc as dni
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
    where usuario = :user
      and modulo = :modulo
    union
   select id_usuario
     from usuario_modulo_alterno
    where id_alterno = :user
      and id_modulo = :modulo
   ) or :user in (
   select usuario
     from usuario_modulo
    where modulo = :modulo
      and maestro = 'SI'
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

select *
  from pr_prioridad_htmp_30;

select *
  from caja_chica
 where serie = 7
   and numero = 22161;

select *
  from estado_caja
 order by id_estado;

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

select *
  from kardex_d;

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

select *
  from estado_campana;

select cod_alm
  from almacen_activo_fijo;

select *
  from kardex_d
 where cod_art = '04EQ D17';

select cod_cliente, nombre
  from exclientes;

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

select *
  from itemdocu;

select *
  from pedido
 where num_ped = 216754;

select *
  from itemped
 where num_ped = 216754;

select *
  from planilla10.personal
 where encargado = '057';

select *
  from planilla10.tar_encarga;

select cod_proveedor, detalle, bateria
  from tmp_carga_data;

select *
  from planilla10.personal
 where apellido_paterno = 'CANDELA';

select *
  from planilla10.personal;

select *
  from planilla10.t_cargo
 where c_cargo = 'ASOP';

select c_codigo
     , nombre
     , c_cargo
     , desc_cargo
     , desc_doc
     , num_doc
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

select *
  from pla_control;

select *
  from exproforma_libre;

select *
  from planilla10.tar_encarga;

select *
  from planilla10.personal
 where encargado = '039';

select *
  from usuario_modulo
 where modulo = 'ACCIDENTES';

select *
  from usuario_modulo_alterno
 where id_modulo = 'ACCIDENTES';

select *
  from activo_fijo_asigna;

select *
  from activo_fijo
 where cod_activo_fijo = 'EQ COMP/OF35';

select *
  from tema_capacitacion
 order by id_tema;

select *
  from capacitacion
 where id_tema = 'CAP 154';

select *
  from pr_forsec
 where cod_art in (
   select cod_art
     from solicita_emision_det
    where numero = 595
   )
   and codigo_proceso is null;

select *
  from pr_forsec
 where cod_art = '400.2758VIT';

select *
  from pr_forsec
 where codigo_proceso is null;

select *
  from permiso
 where numero = 58785;

select * from estado_permiso;

select *
  from concepto_permiso;

select *
  from planilla10.personal
 where apellido_paterno = 'GONZALES';

select *
  from planilla10.personal
 where c_codigo = 'E851';

select *
  from planilla10.t_situacion_cesado;

select *
  from view_cli_para_booking
 where cod_cliente = '998103';

select *
  from exbooking_d
 where numero_factura = '55014185';

select *
  from exbooking
 where numero_booking like 'TER-%';

select nf.cod_cliente
     , nf.nombre
     , sum(nf.total_mercaderia) as total_mercaderia
     , min(fecha) as fecha_factura_mas_antigua
  from vw_fac_para_booking nf
--  where 1 = 1
 where nf.fecha_despacho is null
   and nf.numero not in (
   select h.numero
     from exfacturas_his h
    where h.numero = nf.numero
      and h.accion in ('70', '71', '72')
   )
   and nf.numero = '55014185'
 group by nf.cod_cliente, nf.nombre
 order by 1;

select *
  from exfacturas
 where numero = 55014185;

-- cambio para Adela
select *
  from pk_gnumero
 where pk_numero = 52495;

select *
  from personal_mantto;

select *
  from amonestacion
 where numero = 252;

select *
  from factcob
 where numero = '354270';

select *
  from vw_personal
 where c_codigo = 'E42951';

select *
  from proveed
 where nombre like '%VALCARCEL%';

select *
  from orden_de_compra
 where cod_proveed = '10254971133'
 order by fecha desc;

select *
  from activo_fijo
 where abreviatura = 'MESA SUPERIOR YANGLI 80-';

select *
  from serie_caja_usuario
 where usuario = 'APASTRANA';

select *
  from serie_caja;

select *
  from serie_caja_usuario
 where usuario = 'VMONTANEZ';

select *
  from usuarios
 where usuario = 'APASTRANA';

select *
  from usuario_modulo
 where modulo = 'EMBARQUES';

select *
  from articul
 where cod_art = '2741MFX-OSRAM';

select *
  from cotizacion
 where num_ped = 193646;

select *
  from cotizacion
 where refe_pedido = '217757';

select *
  from pedido
 where num_ped = 217757;

select *
  from planilla10.personal
 where encargado = '057';

select *
  from planilla10.tar_encarga;

-- jcarrera
-- jmedina

select *
  from gastos_de_viaje_habilitado
 where id_vendedor = '85'
   and numero = 129;

select *
  from usuarios_caja_chica
 where usuario = 'IVEGA';

select *
  from usuarios_caja_chica
 where usuario = 'DACOSTA';

select *
  from caja_chica_serie;

select *
  from caja
 where id_serie = 3;

select *
  from estado_caja;

select *
  from activo_fijo
 where cod_activo_fijo = 'MQ1METP-125';

select *
  from kardex_d
 where cod_art = 'MQ1METP-125';

select *
  from campana_cliente;

select *
  from exfacturas
 where numero in (55014872, 55014889, 55015146);

select *
  from pk_gnumero
 where pk_numero in (
                     53529, 53564, 53949
   );

select *
  from pedido
 where extract(year from fecha) = 2023
   and extract(month from fecha) = 3;

select *
  from analisis_consumo
 where ano = 2023
   and mes = 4;

select *
  from pedido
 where num_ped = 219816;

select *
  from docuvent
 where cod_cliente = '';

select *
  from exfacturas
 where numero = 55015050;

select *
  from exfacturas
 where numero = 55015261;

select *
  from docuvent
 where tipodoc = '01'
   and serie = 'F055'
   and numero = 15261;

select *
  from factcob
 where tipdoc = '01'
   and numero = '15261';

select *
  from factcob
 where tipdoc = '03'
   and serie_num = 'B053'
   and numero = '309';

insert into pevisa.factcob ( cod_cliente, tipdoc, serie_num, numero, fecha, f_vencto, f_aceptacion
                           , f_transfe, ano, mes, libro, voucher, item, tipo_referencia, serie_ref
                           , nro_referencia, concepto, sistema_origen, vended, banco, l_agencia
                           , l_refbco, l_condle, moneda, importe, tcam_imp, saldo, tcam_sal
                           , numero_canje, estado, ctactble, importex, saldox, numero_factura_unix
                           , cobrador, f_cobranza, cond_pag, fecha_origen, igv, gasban, f_incobrable
                           , vended_origen, unidad_negocio, situacion, origen, imp_percep
                           , por_percep, factor_dist)
values ( '20601933056', '01', 'F053', '337', date '2023-04-25', date '2023-04-25', null, null, 2023
       , 4, null, null, null, 'P2', '24', '5506', 'DISTRIBUIDOR ELECTRO INVERSIONES CASTILL', 'VENT'
       , '32', null, null, null, null, 'S', 1089.99, 3.7610, 1089.99, 3.7610, null, '0', '12110102'
       , 0.00, 0.00, null, null, null, 'W', date '2023-04-25', null, null, null, null, null, null
       , null, 0.00, 0.00, 1.000000);

insert into pevisa.factcob ( cod_cliente, tipdoc, serie_num, numero, fecha, f_vencto, f_aceptacion
                           , f_transfe, ano, mes, libro, voucher, item, tipo_referencia, serie_ref
                           , nro_referencia, concepto, sistema_origen, vended, banco, l_agencia
                           , l_refbco, l_condle, moneda, importe, tcam_imp, saldo, tcam_sal
                           , numero_canje, estado, ctactble, importex, saldox, numero_factura_unix
                           , cobrador, f_cobranza, cond_pag, fecha_origen, igv, gasban, f_incobrable
                           , vended_origen, unidad_negocio, situacion, origen, imp_percep
                           , por_percep, factor_dist)
values ( '72846359', '03', 'B053', '309', date '2023-04-10', null, null, null, 2023, 4, null, null
       , null, '03', 'B053', '309', 'TAIPE HUAMAN EDITH KARINA', 'VENT', '50', null, null, null
       , null, 'S', 193.79, 3.7740, 193.79, 3.7740, null, '0', '12110102', 0.00, 0.00, null, null
       , null, 'W', date '2023-04-10', null, null, null, null, null, null, null, 0.00, 0.00
       , 1.000000);

select *
  from permiso
 where numero = 18083;

select *
  from estado_permiso;

select *
  from vacaciones
 where numero = 18343;

select * from pla_control;

-- borrar de esta tabla
select * from instrumento_asigna where id_instrumento = '623';

-- aca buscas el intrumento
select * from instrumento;

select * from instrumento where serie = 'Wi-207';

select *
  from solimat_g
 where numero = 181432;

select *
  from solimat_d
 where numero = 181432;

select *
  from kardex_g
 where nro_doc_ref = '181432';

select *
  from kardex_g g
       join kardex_d d
            on g.cod_alm = d.cod_alm and g.tp_transac = d.tp_transac and g.serie = d.serie and
               g.numero = d.numero
 where g.cod_alm = '15'
   and g.tp_transac = '16'
   and g.serie = 1
   and g.numero = 194663
   and g.estado != '9';

select *
  from cotizacion
 where num_ped = 196784;

select *
  from pedido
 where num_ped = 220553;

select *
  from cotizacion
 where refe_pedido = 220553;

select *
  from caja_chica
 where numero = 22200;

select *
  from vw_personal
 where c_codigo = 'E42281';

select *
  from bono_obrero_excluye
 where id_personal = 'E42281';

select *
  from proceso_bono_oa
 where codigo in (1223, 1224);

select *
  from planilla10.t_cargo
 where descripcion like '%MOLINO%';

select *
  from responsabilidad_cargo
 where id_cargo = 'OIQ';

select *
  from proceso_puntualidad_pers
 where id_personal = 'E42472'
 order by id_proceso desc;

select *
  from proceso_puntualidad
 where id_proceso = 16;

select *
  from planilla10.personal
 where c_codigo = 'E43059';

select *
  from cese_personal
 where id_personal = 'E43059';

select *
  from solimat_g
 where numero in (181599, 181597, 181596, 181595);

select *
  from cotizacion
 where num_ped = 194972;

select *
  from evaluacion
 where id_evaluacion = 213;

select *
  from prestamo_activo_fijo
 where cod_prestamo = '62128AFB';

select *
  from prestamo_banco
 where cod_prestamo = '62128AFB';

select * from error_log order by id_log desc;

select *
  from accidente
 where id_accidente = 213;

select * from pr_programas_compras;

declare
  p_articulo pr_ot.formu_art_cod_art%type;
  p_cantidad pr_ot.cant_prog%type;
  arti       vw_articulo%rowtype;
begin
  arti := api_vw_articulo.onerow(p_articulo);

  if p_cantidad > (arti.consumo_mensual * 2) - arti.stock - arti.saldo_op + arti.cant_requerida then
    raise_application_error(-20001, 'NO puede emitir cantidad mayor a 1 año');
  end if;
end;

select *
  from caja_chica
 where serie = 4
   and numero = 230068;

select * from solicita_cambio_trx;

select *
  from solicita_cambio_trx_det
 where cod_alm = '02';

select *
  from pagos_h
 where serie_planilla = 21
   and numero_planilla = 1053;

select *
  from solimat_g
 where numero = 254870;

select *
  from solimat_d
 where numero = 182123;

select *
  from transacciones_almacen
 where tp_transac = '22';

select cod_art, consumo_mensual
  from vw_articulo
 where cod_art = 'FOR3202';

select *
  from emite_op_log
 order by creacion_cuando desc;

-- :solicita_emision_det.cantidad > :x_promedio_anual - :x_stock - :x_ordenes + :x_requerida

select cod_art, consumo_mensual, stock, saldo_op, cant_requerida
     , (consumo_mensual * 2) - stock - saldo_op + cant_requerida as maximo_emitir
  from vw_articulo
 where cod_art = 'FOR3202';

select *
  from cotizacion
 where num_ped = 198566;

select *
  from itemcot
 where num_ped = 198566
 order by item;

select *
  from itemcot
 where num_ped = 198367
   and item in (1, 2, 11, 12)
 order by item;

select *
  from itemcot
 where num_ped = 198566;

select *
  from cambdol
 where extract(year from fecha) = 2023
   and extract(month from fecha) = 6
 order by fecha;

select cod_art, descripcion, unidad, tp_art, cod_alm
  from articul a
 where exists (
   select 1
     from almacen l
    where l.cod_art = a.cod_art
      and l.cod_alm = '30'
   )
   and exists (
   select 1
     from linea_solicitud_material s
    where s.tipo = 'MATRICERIA'
      and a.cod_lin = s.cod_lin
   )
 order by cod_art;

select *
  from articul
 where cod_art = 'MATRIZ DE CORTE 30015CS-2';

select *
  from linea_solicitud_material
 where tipo = 'MATRICERIA'
   and cod_lin = '9000';

select *
  from articul
 where cod_lin = '1620';

select *
  from articul
 where cod_art = 'NI 2900 0.4-300';


declare
  l_max_emitir number := 0;
  l_art        articul%rowtype;

  function max_emitir(
    p_articulo varchar2
  ) return number is
    l_cant_max number := 0;
  begin
    select (nvl(consumo_mensual, 0) * 2) - nvl(stock, 0) - nvl(saldo_op, 0) +
           nvl(cant_requerida, 0) as maximo_emitir
      into l_cant_max
      from vw_articulo
     where cod_art = p_articulo;

    return greatest(round(l_cant_max, 2), 0);
  end;
begin
  l_max_emitir := max_emitir(:p_cod_art);
  l_art := api_articul.onerow(:p_cod_art);
  if :p_cantidad > l_max_emitir and
     ((l_art.cod_lin not between '1620' and '1623' and length(l_art.cod_lin) = 4) and
      (l_art.cod_lin not between '1628' and '1629' and length(l_art.cod_lin) = 4))
  then
    dbms_output.put_line('Maxima cantidad a emitir ' || l_max_emitir);
  else
    dbms_output.put_line('no');
  end if;
end;

begin
  if (:cod_lin not between '1628' and '1629' and length(:cod_lin) = 4) then
    dbms_output.put_line('si');
  else
    dbms_output.put_line('no');
  end if;
end ;

select *
  from solimat_d
 where ot_mantto_tipo = 'MQ'
   and ot_mantto_serie = 7
   and ot_mantto_numero = 6720
   and nvl(estado, '0') != '9'
   and saldo > 0;

select *
  from articul
 where cod_art = 'MANGUERA FLEXIBLE 3/8';

select *
  from solimat_g
 where numero = 181599;

select * from vw_personal;

select *
  from evaluacion
 where id_evaluacion = 6832;

select *
  from respuesta
 where id_evaluacion = 6832;

select * from estado_evaluacion;

select *
  from pk_gnumero
 where pk_numero = 54650;

select * from concepto_permiso;

select * from planilla10.planilla;

select *
  from dba_tab_privs
 where owner = 'PEVISA'
   and table_name = 'PLANILLA';

select *
  from dba_sys_privs
 where grantee = 'PEVISA';

select *
  from dba_tab_privs
 where owner = 'PLANILLA10'
   and table_name = 'PLANILLA';

select *
  from dba_tab_privs
 where table_name = 'PLANILLA';

select *
  from orden_de_compra
 where cod_proveed = '10727264057';

select * from view_salidas_pre_guias;

select c.num_pla, t.despla, r.ano || '-' || r.mes, r.ano, r.mes
  from planilla10.plcontrol c
     , planilla10.parampla r
     , planilla10.tipoplan t
 where c.num_pla = r.num_pla and t.c_eo = r.c_eo and t.tipo_pla = r.tipo_pla and c.usuario = user
   and r.tipo_pla in ('N', 'M', 'V', 'G', 'U');

select * from planilla10.plcontrol;

select * from vw_boleta_pagos_email;

select s.nro_sucur, s.direccion, u.cod_ubc, u.nom_dpt, u.nom_pvc, u.nom_dtt
     , u.nom_dtt || ' ' || u.nom_pvc || ' ' || u.nom_dpt as nombre
     , nvl(s.codigo_establecimiento_sunat, '0000') as codigo_establecimiento_sunat
  from ubigeo u
     , sucursales s
 where s.cod_cliente = '20100084768'
   and u.nacional_internacional = 'N'
   and s.cod_ubc = u.cod_ubc
   and s.nro_sucur <> '04'
 order by u.nom_dtt;

select ot.nuot_tipoot_codigo as tipo_ot
     , ot.nuot_serie as serie_ot
     , ot.numero as numero_ot
     , ot.estado
     , ot.formu_art_cod_art
     , ot.cod_lin as linea_formula
     , ot.fecha
     , ot.fecha_cierre
     , nvl(ot.cant_prog, 0) as cant_prog
     , nvl(ot.cant_ingresado, 0) as cant_ingresado
     , nvl(ot.cant_merma, 0) as cant_merma
     , case ot.lote when 0 then 1 else ot.lote end as lote
     , sum(kxd.cantidad) as cant_ing_prod_mes
     , otd.art_cod_art
     , otd.cod_lin
  from pr_ot ot
       join pr_ot_det otd
            on (ot.numero = otd.ot_numero
              and ot.nuot_serie = otd.ot_nuot_serie
              and ot.nuot_tipoot_codigo = otd.ot_nuot_tipoot_codigo)
       join kardex_g kx
            on (ot.nuot_tipoot_codigo = kx.tipo_pguia
              and ot.nuot_serie = kx.serie_pguia
              and ot.numero = kx.numero_pguia)
       join kardex_d kxd
            on (kx.cod_alm = kxd.cod_alm
              and kx.tp_transac = kxd.tp_transac
              and kx.serie = kxd.serie
              and kx.numero = kxd.numero)
 where nvl(ot.estado, '0') < '9'
   and nvl(otd.estado, '0') != '9'
   and ot.nuot_tipoot_codigo in ('PR', 'AR', 'VA')
   and kx.tp_transac = '18'
   and nvl(kx.estado, '0') != '9'
   and extract(year from kx.fch_transac) = 2023
   and extract(month from kx.fch_transac) = 6
   and ot.numero in (
   10020
   )
   and otd.art_cod_art in ('CL-O 200.3157ZN')
 group by extract(year from kx.fch_transac), extract(month from kx.fch_transac)
        , ot.nuot_tipoot_codigo, ot.nuot_serie
        , ot.numero, ot.estado, ot.formu_art_cod_art, ot.cod_lin
        , ot.fecha, ot.fecha_cierre, ot.cant_prog, ot.cant_ingresado
        , ot.cant_merma, otd.art_cod_art, otd.cod_lin, otd.rendimiento
        , otd.cant_formula, ot.lote
 order by ot.nuot_tipoot_codigo, ot.numero;

select * from vw_bono_he;

select *
  from tab_lineas
 where linea = '1999';

select *
  from articul
 where cod_lin = '1000';

select tipo, codigo, descripcion
  from tablas_auxiliares
 where tipo = 32 and codigo <> '....' and indicador1 = 'S' and codigo in ('01', '03');

select * from vw_analpla_personal_total;

select *
  from vw_personal
 where c_codigo = 'E1036';

select *
  from vw_personal
 where c_codigo = 'E1047';

select * from estado_otm order by id_estado;

select * from hallazgo_importacion;

select * from estado_hallazgo order by id_estado;

select nvl(sum(d.cantidad), 0)
  from kardex_d d
 where d.tp_transac in ('22', '29') -- transacciones de consumos
   and d.estado != '9'
   and d.pr_tipot = 'PR'
   and d.pr_numot = 456383
   and d.cod_art = '66100CS-4'
   and extract(year from d.fch_transac) = 2023
   and extract(month from d.fch_transac) = 5;

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 449806
   and art_cod_art = 'BOLSA P1822';

declare
  l_numero simple_integer := 3;
begin
  case
    when l_numero = 1 then
      dbms_output.put_line('ok');
    when l_numero = 2 then
      dbms_output.put_line('ok');
    when l_numero = 3 then
      dbms_output.put_line('ok');
  end case;
end;

select distinct p.serie from pedido p where p.tipo_docto = 2 and p.estado = 5 order by p.serie;

select serie, automatico from numdoc where tp_transac = '';

select * from numdoc;

select * from numdoc where serie = 170;

select asistencia.sq_justificacion.currval from dual;

select asistencia.sq_justificacion.nextval from dual;

select owner, object_type, object_name
  from all_objects
 where object_name = 'PERMISO_IDTECFLEX';

select * from paramlg;

select * from paramin;

select *
  from permiso
 where numero = 58570;

select * from estado_permiso;

select *
  from permiso_idtecflex
 where numero = 58571;

select * from cese_personal;

select datefmt.year_month_to_last_day(2023, 8) from dual;

select *
  from proceso_puntualidad_pers
 where id_personal = 'E42490'
 order by id_proceso desc;

select *
  from permiso
 where numero = 58615;

select * from usuarios_cotizacion;

select *
  from vacaciones
 where numero = 18285;

select codigo, descripcion, indicador3
  from tablas_auxiliares
 where tipo = 29 and codigo <> '....'
 order by codigo;

select *
  from tablas_auxiliares
 where tipo = 29;

select * from movfide_situacion_banco;


select *
  from clientes
 where cod_cliente in ('20609660296', '20100085578');

select *
  from clientes
 where cod_cliente in (
                       '20600320344', '10081340311', '20558175703', '10404178356', '20601479886',
                       '20501779041', '20537874105', '10406789972', '20604117292', '20546053319',
                       '20608057278', '20601581460', '20516062305', '20297867718', '20562733362',
                       '20504203370', '20517579981', '20568187581', '20604897310', '20560017945',
                       '10486118445', '20381499627', '20571413443', '20512960287', '20607512231',
                       '20100095531', '20549599665', '20607502341', '20600246705', '20536156438',
                       '10008848896', '20610212019', '20513933411', '20548970068', '10440072670',
                       '20602918069', '20101082840', '20100135699', '10215330091', '20536675621',
                       '10210022720', '10721915871', '20603785666', '20521042037', '20050908',
                       '20605018841', '20412408731', '20605572708', '20481410135', '10180422230',
                       '20516422018', '20605534342', '20604901465', '10431213481', '20558694212',
                       '20514691607', '20530344208', '10233760906', '20605196099', '20605304550',
                       '20518252411', '20505103794', '20501428176', '20486766183', '20503258901',
                       '20605794301', '20374914201', '20601601266', '20609182106', '10437363574',
                       '20601716136', '20600883152', '20259345392', '20542506572', '20455465606',
                       '10296622929', '20557347632', '20565482387', '20609211815', '20146796347',
                       '20609796082', '10705244401', '20427582648', '20524955475', '20610536167',
                       '20452288941', '20601436800', '20511866996', '20127141224', '20100310369',
                       '20393652510', '20433170599', '20605965831', '20103327378', '20567134092',
                       '20602010695', '20602893988', '20608559745', '20546850502', '20450384322',
                       '20564334732', '20564534669', '10421731565', '10476504312', '20100292875',
                       '10405824391', '20601838371', '20603156219', '10404814490', '10433097098',
                       '20304716950', '20603848072', '10026173634', '10469272856', '10027730103',
                       '10400400542', '20607419826', '20603712669', '20515395751', '20602757901',
                       '20566537088', '20607406601', '20552801181', '20604115486', '10455374664',
                       '20496892331', '20606145536', '20600429991', '20606424851', '20610476075',
                       '20529944978', '20606536373', '20606484977', '20606918276', '10405776788',
                       '20555683163', '20512915656', '10100890181', '7248386', '20511900841',
                       '20534325739', '20606017058', '20352473601', '10442977785', '10102043621',
                       '20604875391', '20610169334', '20602657028', '10431884998', '20100025915',
                       '10414681439', '20563189763', '20304420244', '20482636072', '20609067145',
                       '10100016945', '20519340918', '10074557282', '20553984701', '20482558764',
                       '20548108901', '20603366426', '20524382335', '20520616528', '20605257080',
                       '40277231', '10268273', '20608272136', '20602905081', '20609348551',
                       '10440894661', '20605718338', '20604980471', '15394255', '8559892',
                       '20524603285', '8221641', '41011447', '41467683', '20605495088', '15729361',
                       '42743572', '20610160949', '10159805854', '25769919', '10323052064',
                       '10430911061', '6709712', '44486640', '20607466352', '20608785338',
                       '20600320085', '20600105311', '20544502141', '20602978339', '10438679656',
                       '7617048', '20514789160', '20603847424', '21557360', '20605433007',
                       '20550074380', '10068000977', '43628490', '20600594398', '73013490',
                       '20602962807', '10073891138', '10103246089', '10455633732', '20604600074',
                       '20600213327', '10090458073', '20600389409', '20545743044', '20607589161',
                       '20109895319', '20600143493', '20603287984', '20601295025', '20552643179',
                       '10415521753', '20602966471', '20392998528', '20601233259', '10701502049',
                       '20601706424', '20603746288', '10099112846', '10749928901', '40056864',
                       '20601619696', '10068159518', '10085444391', '10101076721', '10429607863',
                       '10462343111', '20451828275', '20477932976', '20508315580', '20510526849',
                       '20511914125', '20514132535', '20600454031', '20601953375', '20602047076',
                       '20604355983', '20528911324', '10704171418', '20438469576',
                       '20608710591', '20600572262', '10442452895', '10224728188', '20602609741',
                       '20471638898', '20129669463', '20603149549', '20601497931', '20605324208',
                       '10448048263', '10001096732', '20608473352', '20573914300', '20601063647',
                       '20601028515', '10462645398', '20393260433', '10458276027', '20601742625',
                       '20602083757', '20604417318', '46532480', '10001758824', '10209060219',
                       '10224754472', '10336564188', '10403168489', '10403432437', '10443578256',
                       '10446816280', '10448316900', '10459407923', '20366410610', '20450365883',
                       '20480806779', '20493587090', '20493808100', '20523512782', '20556335096',
                       '20600097131', '20600729676', '20600730160', '20601135605', '20601670519',
                       '20602022154', '20602301142', '20603308132', '20606170409', '20607052281',
                       '20572198660', '20376624375', '10434586939', '20388944987', '20136905709',
                       '20565716396', '10090046107', '20608765124', '20609042363', '20385884789',
                       '20297970489', '20604523282', '20520536761', '20601442524', '20602723853',
                       '20606067357', '20344535435', '20330168243', '10098203554', '20601579953',
                       '20602295941', '20516902737', '15604545410', '20517616002', '20477800808',
                       '20538600441', '10096779475', '44043059', '9493966', '10069781573',
                       '10074568241', '10426853162', '10462595463', '10476235265', '20136615531',
                       '20429322562', '20501926524', '20545473403', '20545978351', '20550518016',
                       '20552609582', '20563049325', '20600480490', '20600575296', '20600778286',
                       '20602119531', '20602630855', '20606212250', '20606269537', '20464428730',
                       '20549906002', '20609028565',
                       '20602686231', '20101420249', '20347764664', '20101130160', '20566057621',
                       '10400064089', '41046159', '10425148171', '25583894', '10448246626',
                       '20602149910', '20548551766', '20419142116', '20605251197', '20509379841',
                       '20605840231', '20521259010', '20606776218', '20601630860', '10071764261',
                       '20555386461', '20506634858', '20606664100', '10700788348', '20603594143',
                       '20607492418', '20607637815', '10088399043', '8224752', '20505501927',
                       '20537967961', '9346685', '7765252', '20522555623', '7488961', '25564753',
                       '10076206266', '10400071620', '10435005425', '10455607723', '10461983869',
                       '10462311198', '10720507914', '10775429505', '20106472310', '20257226558',
                       '20318171701', '20375689619', '20508500999', '20536345834', '20538279341',
                       '20544244427', '20544275900', '20545596823', '20600017200', '20600883241',
                       '20601028388', '20601571570', '20602236227', '20602594557', '20603957203',
                       '20604334005', '20604993971', '20606310529', '20608138758',
                       '20497062781', '20300166611', '20535613819',
                       '20601784298', '20608867717', '20268214527', '20600467051', '7462594',
                       '20520818821', '20557304828', '10319855', '20102314264', '43557244',
                       '10440251752', '41945191', '20603042655', '8222632', '41318270',
                       '20559996514', '9340745', '10437679598', '6725529', '20608880616',
                       '20493034911', '20603673213', '20425402774', '20548696578', '20449456221',
                       '20601751900', '10106441770', '20502854136', '10534095', '20607395978',
                       '20100765790', '9336739', '20602777473', '47100387', '20514539309',
                       '20544519469', '6771578', '20557306791', '20101216471', '10224033',
                       '20512804315', '9969032', '10098388139', '20500229510', '9862971',
                       '20112273922', '10010453793', '20601893011', '10717924946', '20604713723',
                       '20115832027', '20507360671', '10103607456', '20494800838', '20606710535',
                       '20506006024', '20519693080', '20544672496', '10095992442', '45537466',
                       '20574793379', '20601211271', '20601622930', '20513504137', '20518807731',
                       '20417926632', '8248406', '10062896', '9390033', '46259529', '20605734074',
                       '6625437', '20606325470', '9342508', '8565883', '20601012864', '20602620400',
                       '7757487', '10101986557', '9341794', '10082297516', '20600848136',
                       '20537243709', '10408748629', '20171638250', '20101302475', '10609839',
                       '42269428', '8216117', '20491569523', '20608442074', '20543699641',
                       '20532759740', '42499046', '10167198533', '44262549', '40552077',
                       '20601766486', '10438264855', '45012111', '10011586061', '10059517',
                       '20509027651', '8146004', '43489550', '9338172', '20549785701',
                       '10269583725', '20536204343', '20522992411', '10753587697', '40343134',
                       '25512336', '40021216', '20396631041', '23952387', '10440237661', '42702081',
                       '43474848', '1036754', '20535608653', '20517171710', '10400549325',
                       '20530888135', '20606188332', '20606377453', '20509347485', '25856303',
                       '20604806667', '10076382242', '20393854651', '20600590058', '20601813069',
                       '20605769404', '15861996', '40843900', '71980272', '9516633', '44788704',
                       '9598723', '20603518528', '9489324', '10093535648', '25836536', '41896530',
                       '10764676900', '40360490', '1333081', '6795302', '6802353', '7636637',
                       '8227933', '8229751', '8261254', '8781402', '8885909', '9426395', '9604904',
                       '9639552', '9900517', '9920214', '9926553', '9973990', '9984613', '10029897',
                       '10135146', '10223225', '10277642', '10789929', '16481124', '19837729',
                       '25722328', '25726649', '25869439', '29480388', '32138306', '40128463',
                       '40177495', '40704067', '41145715', '41308285', '41406877', '44173230',
                       '44246764', '44599662', '44638375', '44815073', '46437956', '46804732',
                       '72415414', '72661044', '76748367', '80138650', '10026613057', '10064294348',
                       '10067845272', '10074912759', '10079034920', '10082188776', '10087814021',
                       '10090712123', '10092715162', '10093121681', '10101625571', '10156044666',
                       '10190986603', '10215280654', '10267303750', '10437837916', '10448013516',
                       '10451020183', '10461681862', '10468068473', '10713088175', '10728107192',
                       '10731092139', '10769872561', '20100623651', '20102827059', '20268311646',
                       '20382970820', '20385512563', '20385739771', '20408077568', '20411192254',
                       '20415712848', '20430594240', '20450733351', '20451839048', '20455673462',
                       '20455756082', '20487860221', '20491612046', '20495835759', '20504991033',
                       '20506676267', '20506925071', '20509451622', '20509512869', '20510473206',
                       '20512704795', '20513913142', '20516827425', '20517700640', '20517889661',
                       '20519224179', '20521093880', '20521833671', '20524045843', '20524581885',
                       '20525139795', '20528275312', '20528483772', '20536146394', '20536341685',
                       '20539587456', '20544357892', '20546746357', '20547583168', '20549165231',
                       '20552080263', '20554317791', '20554345221', '20554808001', '20560113235',
                       '20563634597', '20565323408', '20565529286', '20566584329', '20568096356',
                       '20574627282', '20600401492', '20600417291', '20600634519', '20600946057',
                       '20601006953', '20601451175', '20601653657', '20601750351', '20601776198',
                       '20601830338', '20602206832', '20602572162', '20602751326', '20603018274',
                       '20603190247', '20603328966', '20603583184', '20603366302', '10471289715',
                       '10275432755', '20479676861', '20601341671', '20526663846', '20399129614',
                       '20530996531', '20603288549', '20600402049', '20608257609', '20602207740',
                       '10411435798', '20538924424', '10443073073', '20609181525', '10316742896',
                       '20526445008', '20525251366', '10181612172', '10407498149', '20600908902',
                       '75283139', '2060825760', '10003253207', '10156309210', '10181089691',
                       '10316038609', '10329878282', '10401687802', '10429449397', '20479692808',
                       '20481574677', '20482773738', '20491708663', '20495815219', '20525422942',
                       '20525991645', '20529937840', '20530309631', '20530717161', '20531767048',
                       '20533964291', '20559585727', '20559742415', '20569309574', '20571299560',
                       '20601738351', '20602216145', '20602271456', '20602304010', '20602398782',
                       '20602601405', '20602984746', '20603461500', '20603507020', '20603516223',
                       '20603918038', '20604738190', '20480633572', '20605561153', '20602419089',
                       '20450733785', '20600238494', '20603782039', '10431636935', '10470580891',
                       '20455225800', '20534989572', '20528040609', '20601211093', '20532572674',
                       '10427562862', '20491208423', '10295590934', '10004473529', '10484590562',
                       '20494786584', '10004833517', '10021526121', '10214649263', '10243632418',
                       '10413223275', '10418204147', '10420636941', '10427087625', '10448430761',
                       '10452540903', '10465247555', '10706557941', '20447774101', '20454237197',
                       '20455417113', '20455778566', '20490332490', '20490359771', '20498095063',
                       '20527632740', '20540748838', '20559330818', '20564269817', '20600188519',
                       '20601940834', '20602574416', '20604403996'
   );

select '10' as codigo, 'LATA' as descripcion
  from dual
 union
select '20', 'BRONCE'
  from dual
 union
select '25', 'PLATA'
  from dual
 union
select '30', 'ORO'
  from dual
 union
select '35', 'SAFIRO'
  from dual
 union
select '40', 'DIAMANTE'
  from dual
 union
select '00', 'SIN/CATEGORIA'
  from dual;

select *
  from clientes
 where cod_cliente = '20479729141';

select *
  from clientes
 where cod_cliente = '20450497950';

select *
  from clientes
 where cod_cliente = '20450497950';

select abreviada
  from tablas_auxiliares
 where tipo = 24
   and codigo = to_char('10');

select get_categoria_cliente('20450497950') from dual;

select *
  from tablas_auxiliares
 where tipo = 24;

select * from itemped;

select * from pedido;

select *
  from vw_vacaciones
 where (usuario in (
   select usuario
     from usuario_modulo
    where usuario = :user and modulo = :modulo
    union
   select id_usuario
     from usuario_modulo_alterno
    where id_alterno = :user and id_modulo = :modulo
   ) or :user in (
   select usuario from usuario_modulo where modulo = :modulo and maestro = 'SI'
   ))
   and (id_personal = :id_trabajador or :id_trabajador is null)
   and (estado = :estado or :estado is null)
   and (f_inivac between :fecha_del and :fecha_al or
        (:fecha_del is null and :fecha_al is null));

select per.apellido_paterno || ' ' || per.apellido_materno || ', ' || per.nombres as nombre
     , per.c_codigo, per.seccion as cod_seccion, s.nombre as seccion, enc.nombre as encargado
     , per.f_ingreso
  from planilla10.personal per
     , planilla10.tar_encarga enc
     , planilla10.tar_secc s
 where per.encargado = enc.codigo
   and per.seccion = s.codigo(+)
   and (upper(enc.usuario) in (
   select usuario
     from usuario_modulo
    where usuario = :USER and modulo = :modulo
    union
   select id_usuario
     from usuario_modulo_alterno
    where id_alterno = :USER and id_modulo = :modulo
   ) or :USER in (
   select usuario from usuario_modulo where modulo = :modulo and maestro = 'SI'
   ))
   and per.situacion not in ('8', '9')
 order by per.apellido_paterno;

select usuario
  from usuario_modulo
 where usuario = :user and modulo = :modulo;


select id_usuario
  from usuario_modulo_alterno
 where id_alterno = :user and id_modulo = :modulo;

select *
  from usuario_modulo_alterno
 where id_alterno = 'NBELANDRIA';

select *
  from planilla10.personal
 where encargado = '056'
   and situacion not in (
   select codigo
     from planilla10.t_situacion_cesado
   );

select * from planilla10.tar_encarga;

select *
  from expedstock
 where numero = 45;

select *
  from expedstock_d
 where numero = 45;

select distinct estado_pk
  from expedstock_d
 where numero = 45;

select * from lg_pedjam_historia;

select *
  from planilla10.tar_encarga
 where codigo = '039';

select *
  from planilla10.personal
 where encargado = '039'
   and situacion not in (
   select codigo
     from planilla10.t_situacion_cesado
   );

select * from nrodoc;

select *
  from docuvent
 where tipodoc = '07'
   and serie = 'F055';

select *
  from itemdocu
 where tipodoc = '07'
   and serie = 'F055';

select *
  from orden_de_compra
 where estado in ('2', '3', '4')
   and serie in (3, 4, 8)
   and exists (
   select 1
     from usuarios u
    where orden_de_compra.c_resp = u.codigo_trabajador
      and u.usuario = 'WQUICHIS'
   )
   and not exists
   (
     select 1
       from orden_de_compra_calificacion
      where orden_de_compra.num_ped =
            orden_de_compra_calificacion.num_ped
        and orden_de_compra.serie =
            orden_de_compra_calificacion.serie
     );

select *
  from pevisa.vacaciones
 where numero = 18358;

select * from estado_vacaciones;

select *
  from almacen
 where cod_art = '365049111246474';

select *
  from activo_fijo
 where cod_activo_fijo = '365049111246474';

select *
  from kardex_d
 where cod_art = '365049111246474';

select *
  from caja_chica_d
 where serie = 2
   and numero = 230068;

select *
  from lg_monedas
 order by fecha desc;

select * from moneda;

select *
  from permiso
 where numero = 59296;

select *
  from kardex_d
 where cod_art = 'AC1METP-045';

select *
  from transacciones_almacen
 where tp_transac = '22';

select * from almacen_activo_fijo;

select *
  from almacenes
 where cod_alm in ('A1', 'A4');

select *
  from expedidos
 where numero = 15959;

select * from packing_agrupar;

select * from linea_sin_tope_emision;

select *
  from pk_gnumero
 where pk_numero = 41517;

select *
  from docu_ag
 where numero = 4561;

select *
  from item_ag
 where numero in (4561, 4560);

select * from responsabilidad_cargo;

select *
  from planilla10.t_cargo
 where descripcion like '%AYUDANTE%';

select * from exproforma_libre;

select *
  from caja
 where id_serie = 1
   and id_numero = 100;

-- correos sede faucett
select p.c_codigo, p.nombre, p.desc_cargo, h.email
  from vw_personal p
       join planilla10.hr_personal h on p.c_codigo = h.c_codigo
 where h.local = '0002'
   and situacion not in (
   select codigo
     from planilla10.t_situacion_cesado
   );

select *
  from planilla10.hr_personal
 where c_codigo = 'E567';
