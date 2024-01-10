select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and estado != '9'
   and numero in (
                  496945, 496959, 497092, 497229, 497238, 497257, 497296, 497309, 507659, 513043,
                  516638, 516639, 516680, 516684, 516731, 516737, 516742, 516747, 516757, 516771,
                  516772, 516774, 516781, 516787, 516801, 516805, 516806, 527837, 529006, 529487,
                  529490, 529510, 529511, 529525, 529527, 529529, 529536, 529537, 529542, 529546,
                  529548, 529552, 529553, 529554, 529555, 529561, 529564, 529566, 529571, 529575,
                  531642, 531644, 531646, 531658, 533807, 535979, 535981, 535984, 537027, 537311,
                  538314, 538638, 538639, 538643, 538644, 538645, 538646, 538647, 538650, 538651,
                  538652, 538653, 538654, 539171, 539172, 539173, 539174, 539175, 539176, 539177,
                  539178, 539179, 539180, 539181, 539182, 539183, 539184, 539185, 539186, 539187,
                  539188, 539189, 539190, 539191, 539192, 539193, 539194, 539195, 539196, 539197,
                  539198, 539199, 539200, 539201, 539202, 539203, 539204, 539205, 539206, 539207,
                  539208, 539209, 539210, 539211, 539212, 539213, 539214, 539215, 539216, 539217,
                  539218, 539219, 539220, 539221, 539222, 539223, 539224, 539225, 539226, 539227,
                  539228, 539229, 539230, 539231, 539232, 539233, 539234, 539235, 539236, 539237,
                  539238, 539239, 539240, 539241, 539242, 539243, 539244, 539245, 539246, 539247,
                  539248, 539249, 539250, 539251, 539252, 539253, 539254, 539255, 539256, 539257,
                  539258, 539259, 539260, 539261, 539262, 539263, 539264, 539265, 539266, 539267,
                  539268, 539269, 539270, 539271, 539272, 539273, 539274, 539275, 539276, 539277,
                  539278, 539279, 539280, 539281, 539282, 539283, 539284, 539285, 539286, 539287,
                  539288, 539289, 539290, 539291, 539292, 539293, 539294, 539295, 539296, 539297,
                  539298, 539299, 539300, 539301, 539302, 539303, 539304, 539305, 539306, 539307,
                  539308, 539309, 539310, 539311, 539312, 539313, 539314, 539315, 539316, 539317,
                  539318, 539319, 539320, 539321, 539322, 539323, 539324, 539325, 539326, 539327,
                  539328, 539329, 539330, 539331, 539332, 539333, 539334, 539335, 539336, 539337,
                  539338, 539339, 539340, 539341, 539342, 539343, 539344, 539345, 539346, 539347,
                  539348, 539349, 539350, 539351, 539352, 539353, 539354, 539355, 539356, 539357,
                  539358, 539359, 539360, 539361, 539362, 539363, 539364, 539365, 539366, 539367,
                  539368, 539369, 539370, 539371, 539372, 539373, 539374, 539375, 539376, 539377,
                  539378, 539379, 539380, 539381, 539382, 539383, 539384, 539385, 539386, 539387,
                  539388, 544869
   );

select * from pr_estados;

select * from pr_estadopr;

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero in (
   515055
   );

select *
  from kardex_g
 where cod_alm = '30'
   and tp_transac = '18'
   and serie = 2
   and numero = 544031;

select *
  from kardex_d
 where cod_alm = '30'
   and tp_transac = '18'
   and serie = 2
   and numero = 544031;

-- parametro ano mes
select * from pr_para_pro;

select *
  from proveed
 where cod_proveed = '';

select *
  from cliente_grupo
 where grupo = 'B003';

select * from grupo_cliente;

select cod_cliente, nombre
  from clientes
 where cod_cliente in (
                       '20273061526', '20455719390', '20600574907', '20600637372', '20600711335',
                       '20600898214', '20601014956', '20601041163', '20608545591', '20602035906'
   )
 minus
select cod_cliente, nombre
  from clientes
 where grupo = 'B018';

select *
  from clientes
 where grupo = 'B018'
   and cod_cliente in (
                       '20273061526', '20455719390', '20600574907', '20600637372', '20600711335',
                       '20600898214', '20601014956', '20601041163', '20608545591', '20602035906'
   );

select cod_cliente, nombre
  from clientes
 where grupo = 'B018'
   and cod_cliente in (
                       '20273061526', '20455719390', '20600574907', '20600637372', '20600711335',
                       '20600898214', '20601014956', '20601041163', '20608545591', '20602035906'
   );

select *
  from planilla10.personal
 where c_codigo = 'E42889';

select *
  from planilla10.t_cargo
 where c_cargo = 'TMMT';

select *
  from planilla10.t_sector
 where c_sector = '40';

select * from locales;

select *
  from pr_ot_impresion
 where nuot_tipoot_codigo = 'AR'
   and numero in (
                  1018054, 1018055, 1018064, 1018066, 1018067, 1018062, 1018069, 1018070, 1018074,
                  1018080, 1018186, 1018206, 1018192, 1018193, 1018194, 1018195, 1018197, 1018199,
                  1018201, 1018204, 1018209, 1018208, 1018732, 1018737, 1018738, 1018741, 1018877,
                  1018185, 1018870, 1018744, 1018745, 1018742, 1018746, 1018748, 1018751, 1018755,
                  1018411, 1018760, 1019458, 1018864, 1018868, 1018879, 1018875, 1018882, 1018885,
                  1019357, 1019200, 1019354, 1019358, 1019359, 1019196, 1019367, 1019382, 1019379,
                  1019456, 1018346, 1019455, 1017896, 1017885, 1019134, 1017994, 1017903, 1019479,
                  1017897, 1017991, 1018006, 1018507, 1017997, 1018642, 1018015, 1017992, 1018005,
                  1018504, 1018498, 1018522, 1018635, 1018637, 1019285, 1018536, 1019297, 1019305,
                  1017923, 1019295, 1017943, 1019296, 1018541, 1018410, 1018421, 1018535, 1019202,
                  1017928, 1017934, 1019070, 1018405, 1018811, 1019206, 1018537, 1018166, 1018184,
                  1018590, 1018592, 1018721, 1018722, 1018840, 1018841, 1018348, 1018350, 1018172,
                  1018959, 1018972, 1017600, 1018012, 1018343, 1019026, 1019220, 1019221, 1019219,
                  1019218, 1018086, 1019243, 1019242, 1018803, 1018802, 1019320, 1019321, 1018087,
                  1019338, 1019340, 1018655, 1019345, 1018444, 1019424, 1017947, 1018570, 1019439,
                  1019447, 1018698, 1018900, 1018115, 1018097, 1018713, 1018712, 1017661, 1019312,
                  1018553, 1018114, 1018837, 1019397, 1018652, 1017761, 1018961, 1017771, 1017773,
                  1017776, 1018020, 1017851, 1017852, 1018028, 1017861, 1017862, 1019388, 1017872,
                  1018563, 1018564, 1017876, 1019117, 1017880, 1017881, 1017951, 1017962, 1018032,
                  1018796, 1018053, 1018470, 1018472, 1018853, 1018703, 1019417, 1018604, 1018692,
                  1018614, 1019112, 1017679, 1017818, 1019144, 1019249, 1018390, 1019262, 1019053,
                  1017974, 1018991, 1019343, 1017783, 1017785, 1019442, 1017789, 1018929, 1019331,
                  1017814, 1018819, 1019434, 1019043, 1017768, 1017659, 1018484, 1018824, 1018481,
                  1019280, 1017973, 1018363, 1019263, 1017820, 1018058, 1018207, 1018880, 1018871,
                  1019356, 1019463, 1019360, 1018749, 1017837, 1018750, 1019012, 1017989, 1019185,
                  1018516, 1019167, 1018789, 1019178, 1019290, 1018157, 1017940, 1018776, 1019091,
                  1017586, 1019210, 1018092, 1017609, 1019016, 1017662, 1017664, 1018726, 1018769,
                  1017749, 1017751, 1018846, 1019406, 1018779, 1019683, 1019413, 1018034, 1017688,
                  1018019, 1018675, 1018050, 1018042, 1018030, 1018480, 1018558, 1018441, 1018809,
                  1018855, 1018988, 1019228, 1017647, 1017960, 1017770, 1017815, 1018823, 1017727,
                  1018372, 1017799, 1018938, 1018939, 1018387, 1019353, 1017638, 1018945, 1018948,
                  1018367, 1017745, 1018149
   );

select *
  from pr_ot_impresion
 where nuot_tipoot_codigo = 'PR'
   and numero between 505341 and 505419;

  with op_curso as (
    select cod_art
         , sum(saldo) as saldo_op
         , listagg(numero || '(' || estado || ',' || cant_prog || ')', ' | ')
                   within group ( order by estado, numero) as numero_op
      from vw_ordenes_curso
     where nuot_tipoot_codigo = 'PR'
     group by cod_art
    )
     , requerimiento as (
    select cod_art
         , sum(cant_requerida) as cant_requerida
         , sum(cant_separado) as cant_separado
         , sum(faltante) as cant_faltante
         , sum(stock) as stock_requerida
      from vw_requerimiento_articulo
     group by cod_art
    )
     , stock_art as (
    select cod_art, sum(stock) as stock
      from almacen
     group by cod_art
    )
select a.cod_art, a.descripcion, a.cod_lin, g.id_grupo, g.dsc_grupo
     , r.cant_requerida, r.cant_separado, r.cant_faltante
     , nvl(s.stock, 0) as stock, r.stock_requerida, o.numero_op, o.saldo_op
     , c.consumo_anual, c.consumo_mensual, c.frecuencia_meses
     , a.s_act - r.cant_separado as cant_disponible
  from articul a
       left join op_curso o on a.cod_art = o.cod_art
       left join requerimiento r on a.cod_art = r.cod_art
       left join stock_art s on a.cod_art = s.cod_art
       left join vw_articulo_consumo c on a.cod_art = c.cod_art
       left join vw_articulo_grupo g on a.cod_art = g.cod_art;

select cod_art
     , sum(saldo) as saldo_op
     , listagg(numero || '(' || estado || ',' || cant_prog || ')', ' | ')
               within group ( order by estado, numero) as numero_op
  from vw_ordenes_curso
 where nuot_tipoot_codigo = 'PR'
 group by cod_art;

select *
  from vw_articulo
 where cod_art = '1015TG';

select *
  from pr_consd
 where cod_art = '300.506SR';

declare
  orden pr_ot%rowtype;
begin
  emite.op('65000S', 1, false, orden);
end;

select *
  from error_log
 order by id_log desc;

select f.art_cod_art, f.cantidad, f.almacen, a.descripcion, a.c_pro
     , f.cod_lin, f.pr_secuencia
  from pr_for_ins f
     , articul a
 where formu_art_cod_art = '65000S'
   and formu_receta = 1
   and art_cod_art = cod_art
   and rtrim(a.flag_cal) is null;

select *
  from pr_formu f
 where f.vigencia = 1
   and f.art_cod_art = '65000S';

select *
  from planilla10.t_cargo
 where c_cargo = 'OIQ';

select *
  from planilla10.t_cargo
 where descripcion like '%IQ%';

select *
  from responsabilidad_cargo
 where id_cargo in ('MLS', 'OM', 'OP', 'OSL', 'OIQ');


select *
  from reparacion
 where numero = 4024;

select cod_art, cant_faltante, saldo_op, numero_op, stock, stock_requerida
  from vw_articulo
 where cod_art = '180.654FIB';

select *
  from pr_ot
 where abre01 = '15758'
   and nuot_tipoot_codigo = 'AR';

select pa.numero, pa.nuot_serie, pa.nuot_tipoot_codigo, pa.cant_prog, pa.receta
     , pa.formu_art_cod_art, pa.plazo, pa.fecha_plazo, pa.per_env, pa.abre01, pa.abre02, pa.destino
     , pa.cod_eqi, pa.empaque, pa.embalaje, pa.prioridad, pa.cod_lin, pa.pais
     , get_grupo_ventas_marcas(pa.formu_art_cod_art) as marca
  from pr_ot pa
     , articul a
     , pr_formu f
 where pa.origen = 'PLANEADA'
   and pa.nuot_tipoot_codigo = 'PA'
   and pa.destino in ('1', '2')
   and pa.formu_art_cod_art = a.cod_art
   and f.art_cod_art = pa.formu_art_cod_art
   and f.receta = 1
   and pa.abre01 = '15758'
   and pa.nuot_tipoot_codigo = 'PA'
   and not exists
   (
     select distinct 1
       from pr_for_ins i
          , articul a
      where i.formu_art_cod_art = pa.formu_art_cod_art
        and i.art_cod_art = a.cod_art
        and a.cod_lin in
            (
              select cod_lin
                from pr_grupos_lineas_desarrollo
               union
              select '1980'
                from dual
               union
              select 'ZZ'
                from dual
              )
     );

select *
  from pr_num_ot
 where tipoot_codigo = 'AR'
   and serie = 3;

select *
  from pr_ot
 where numero = 915811
   and nuot_tipoot_codigo = 'AR';

select max(numero)
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and nuot_serie = 3;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and fecha >= to_date('01/06/2023', 'dd/mm/yyyy')
 order by cant_prog desc;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero = 513326;

select *
  from solicita_emision
 where numero = 1256;

select distinct a.cod_lin
  from solicita_emision_det s
       join articul a on s.cod_art = a.cod_art
 where s.numero = 1256;

select *
  from solicita_emision_ot
 where numero = 513326;

select *
  from solicita_cambio_ot
 where ot_nro = 513326;

select *
  from emite_op_log
 where numero = 513326;

  with estado_inicial as (
    select tipo, serie, numero, fecha
      from pr_trasab_estado
     where tipo = 'PR'
       and serie = 8
       and numero = 512106
       and estado = 1
    )
select o.numero, o.fecha, o.estado
  from pr_ot o
       join estado_inicial i
            on o.nuot_tipoot_codigo = i.tipo
              and o.nuot_serie = i.serie
              and o.numero = i.numero
 where o.nuot_tipoot_codigo = 'PR'
   and i.fecha >= sysdate - 16
   and o.estado != '9'
 order by o.fecha;

select *
  from pr_trasab_estado
 where tipo = 'PR'
   and serie = 8
   and numero = 512106
   and estado = 1;

select *
  from pr_trasab_estado
 where tipo = 'PR'
   and serie = 8
   and numero = 513298
   and estado = 1;

-- ordenes emitidas hace 15 dias
select o.numero, o.fecha, o.formu_art_cod_art, o.cod_lin, o.estado, o.cant_prog, o.usuario
  from pr_ot o
 where o.nuot_tipoot_codigo = 'PR'
   and o.fecha >= sysdate - 16
   and o.estado != '9'
 order by cant_prog desc, o.fecha;

select *
  from emite_op_log
 where creacion_quien = 'JCABEZAS'
 order by creacion_cuando desc;

select *
  from emite_op_log
 where numero = 514563;

select *
  from emite_op_log
 where cod_art = '400.973';

select * from vw_ordenes_curso;

-- cantidad en curso de op generadas por el modulo de emision max 100
select c.cod_art, c.saldo, c.numero
  from vw_ordenes_curso c
 where c.nuot_tipoot_codigo = 'PR'
   and c.cod_art = '400.973'
   and exists(
   select 1
     from emite_op_log e
    where c.nuot_tipoot_codigo = e.tipo
      and c.numero = e.numero
   );

select p.numero, p.formu_art_cod_art, p.cant_prog, p.fecha, g.descripcion
     , substr(to_char(100000000 + p.numero), 2, 8) as orden_etiqueta
     , substr(to_char(100 + p.nuot_serie), 2, 2) as serie_etiqueta, p.nuot_tipoot_codigo
     , p.nuot_serie, nvl(peso_por_bolsa, 0) as peso_por_bolsa
  from pr_ot p
     , articul a
     , pr_grupos_lineas gl
     , pr_grupos g
     , pr_formu f
 where p.nuot_tipoot_codigo = 'AR'
   and p.nuot_serie = 3
   and p.estado in ('1', '3')
   and p.formu_art_cod_art = a.cod_art
   and a.cod_lin = gl.cod_lin
   and gl.id_grupo = g.id
   and g.id = '11'
   and p.formu_art_cod_art = f.art_cod_art
 order by p.numero;

select *
  from gastos_de_viaje
 where id_vendedor = 'M1'
   and numero = 123;

select *
  from gastos_de_viaje_m
 where id_vendedor = 'M1'
   and numero = 123;

select *
  from gastos_de_viaje_d
 where id_vendedor = 'M1'
   and numero = 123;

select *
  from gastos_de_viaje_habilitado
 where id_vendedor = 'M1'
   and numero = 123;

select *
  from gastos_de_viaje_habilitado_d
 where id_vendedor = 'M1'
   and numero = 123;

select *
  from kardex_d
 where cod_alm = 'D2'
   and tp_transac = '18'
   and serie = 2
   and numero = 536898;

select *
  from kardex_d
 where pr_tipot = 'PR'
   and pr_numot = 451073;

select *
  from kardex_g_historia
 where cod_alm = 'D2'
   and tp_transac = '29'
   and serie = 1
   and numero = 1686257;

select *
  from lg_itemjam
 where num_importa = 'PVM23025';

select d.cod_art, d.cantidad, d.aprobado
     , listagg(o.ot_numero, ' | ') within group ( order by o.ot_numero) as ordenes
  from solicita_emision_det d
       left join solicita_emision_ot o on d.numero = o.numero and d.item = o.item
 where d.numero = 910
 group by d.cod_art, d.cantidad, d.aprobado;

select *
  from solicita_emision_det
 where numero = 910;

select *
  from solicita_emision_det
 where ot_numero = 527657;

select *
  from solicita_emision_ot
 where ot_numero = 527657;

select *
  from linea_cambio_cantidad
 where cod_lin = '1615'
 order by cod_lin;

select to_char(pr_numot) as pr_numot, cod_art, cantidad
     , to_char(fch_transac, 'DD/MM/YYYY') as fecha, fch_transac
  from kardex_d
 where tp_transac = '18'
   and cod_alm = :xalmacen
   and cod_art = :art_cod_art
   and pr_tipot = :pr_tipo_orden
 order by fch_transac desc;

select *
  from transacciones_almacen
 where tp_transac = '18';

select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR' and estado < '3' and formu_art_cod_art in (
   select cod_art from articul where cod_lin not in ('1970', '1971', '1972')
   );

select *
  from pr_ot
 where abre01 = '370'
   and per_env = '189'
   and nuot_tipoot_codigo = 'AR';

select *
  from solicita_cambio_ot
 where ot_nro = 451073;


create or replace view vw_grupos_lineas_prod as
select g.id as cod_grupo, g.descripcion as dsc_grupo, l.cod_lin, l.tp_art, f.cod_fam
     , f.descripcion as dsc_fam
  from pr_grupos g
       join pr_grupos_lineas l on g.id = l.id_grupo
       join tfamlin f on l.tp_art = f.tp_art and l.cod_fam = f.cod_fam and l.cod_lin = f.cod_lin;

select cod_grupo, dsc_grupo, cod_lin, tp_art, cod_fam, dsc_fam
  from vw_grupos_lineas_prod
 where cod_grupo = '02';

select *
  from linea_sin_tope_emision
 where cod_lin = '1604';

select *
  from articul
 where cod_art = 'BATCH 3172N';

select * from linea_cambio_cantidad;

select *
  from pr_ot
 where formu_art_cod_art = 'PL 86067-1NA';

select *
  from vacaciones
 where numero = 18403;

select *
  from pr_ot_sec
 where cod_art = '180.1382ZN';

select *
  from vendedores
 order by cod_vendedor;

select *
  from pr_trasab_estado
 where tipo = 'PR'
   and numero = 536050;

select *
  from solicita_emision_ot
 where ot_numero = 536050;

select *
  from solicita_emision_det
 where ot_numero = 536050;

select *
  from emite_op_log
 where numero = 536050;

select *
  from pr_trasab_estado
 where tipo = 'PR'
   and numero in (536067, 536065);

select ua.cod_alm as cod_alm, a.descripcion as descripcion
  from usuarios_almacenes ua
     , almacenes a
 where usuario = 'KCASTILLO'
   and ua.cod_alm = a.cod_alm
   and nvl(ua.estado, 0) = 1
 order by 1;

select *
  from usuarios_almacenes
 where usuario = 'MDIAZH';