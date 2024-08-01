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
 where cod_alm = '01'
   and tp_transac = '17'
   and serie = 1
   and numero in (
   714126
   )
 order by numero;


select *
  from kardex_d
 where cod_alm = '01'
   and tp_transac = '17'
   and serie = 1
   and numero in (
   714126
   );

select *
  from almacen
 where cod_art = 'R-4955665';

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

select *
  from estado_permiso;

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
 where numero = 327;

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

select *
  from pla_control;

-- borrar de esta tabla
select *
  from instrumento_asigna
 where id_instrumento = '623';

-- aca buscas el intrumento
select *
  from instrumento;

select *
  from instrumento
 where serie = 'Wi-207';

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

select *
  from error_log
 order by id_log desc;

select *
  from accidente
 where id_accidente = 213;

select *
  from pr_programas_compras;

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

select *
  from solicita_cambio_trx;

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

select serie || '-' || num_ped as pedido, c.nombre, total_pedido as total
     , c.cod_vende || ' ' || v.abreviada as cod_vende
     , decode(c.moneda, 'S', 'S/.', 'US$.') as moneda, c.detalle, v.correo, c.atencion
     , decode(piso, 'U', 'URGENTE', 'I', 'INMEDIATO', 'NORMAL') as prioridad
  from pedido c
     , vendedores v
 where serie = 20
   and num_ped = 240159
--    and nvl(c.estado, 0) = '0'
   and v.cod_vendedor = c.cod_vende;

select * from cese_personal;

select *
  from permiso
 where numero = 63129;

select sysdate from dual;

select * from exproforma_d_aprobar;

select * from usuarios;

select * from roles;

-- select * from usuarios_roles;

select * from tab_menu;