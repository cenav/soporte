select *
  from cotizacion
 where num_ped in (223718);

select *
  from itemped
 where num_ped in (242761);

select *
  from cotizacion
 where refe_pedido = 246109;

select *
  from pedido
 where num_ped = 246109;

select *
  from itemped
 where num_ped = 246109;


-- acceso MGVENTAS
select *
  from seccrus
 where co_usrusr = 'PEVISA'
   and co_ctrctr = 'M_GVENTAS';

select *
  from transporte
 where cod_transp = '20603099088';

select nombre, cod_transp, domicilio, ruc_transp
  from transporte
 where nvl(indicador1, '0') = '1'
   and cod_transp = '20602535500'
 order by nombre;

select *
  from pedido
 where num_ped in (244631);

select *
  from itemped
 where num_ped in (242761);

select *
  from cotizacion
 where num_ped in (223718);

select *
  from cotizacion
 where refe_pedido in (244631);

select *
  from itemcot
 where num_ped = 219092;

select * from clientes_categoria;

select *
  from articul
 where cod_art = 'S4 75D-24-B';

select *
  from tab_lineas
 where linea = '253';

select *
  from cotizacion
 where refe_pedido = 236346
   and estado = '2'
   and cod_vende in (
   select cod_vendedor
     from vendedores
    where supervisor like '42'
   );

select *
  from vendedores
 where cod_vendedor = '77';

select *
  from pedido
 where num_ped = 236885;

select cond_pag, descripcion, dias_libres, letras, v01, v02, v03, v04, v05, v06
  from condpag;

select cod_cliente, ruc, c.nombre as nom_cliente, c.grupo, g.nombre as nom_grupo
  from clientes c
       left join cliente_grupo g on c.grupo = g.grupo;

select *
  from docuvent
 where tipodoc = '08'
   and serie = 'F050'
   and numero = 16541;

select *
  from factcob
 where tipdoc = '08'
   and serie_num = 'F050'
   and numero = 16541;


select *
  from cotizacion
 where num_ped = 217579
   and unidad_negocio in ('01', '02')
   and cod_vende like '27';

select *
  from itemcot
 where num_ped = 217579;

select *
  from pedido
 where num_ped = 246109;

select *
  from itemped
 where num_ped = 246109;

select *
  from pedido
 where num_ped = 230873;

select *
  from itemped
 where num_ped = 230873;

select *
  from pedido_flujo
 where num_ped = 230874
 order by item;


select per.c_codigo
     , per.apellido_paterno || ' ' || per.apellido_materno || ', ' || per.nombres as nombre
  from planilla10.personal per
     , planilla10.tar_encarga enc
 where per.c_codigo = enc.c_codigo
   and per.situacion not in ('8', '9')
   and (upper(enc.usuario) = (
   select usuario
     from usuario_modulo
    where usuario = user and modulo = 'EVALUACION'
    union
   select id_usuario
     from usuario_modulo_alterno
    where id_alterno = user and id_modulo = 'EVALUACION'
   ) or user in (
   select usuario from usuario_modulo where modulo = 'EVALUACION' and maestro = 'SI'
   ))
 order by per.apellido_paterno;

select per.c_codigo
     , per.apellido_paterno || ' ' || per.apellido_materno || ', ' || per.nombres as nombre
  from planilla10.personal per
     , planilla10.tar_encarga enc
 where per.c_codigo = enc.c_codigo
   and per.situacion not in ('8', '9')
   and (upper(enc.usuario) = (
   select usuario
     from usuario_modulo
    where usuario = :user and modulo = 'EVALUACION'
    union
   select id_usuario
     from usuario_modulo_alterno
    where id_alterno = :user and id_modulo = 'EVALUACION'
   ) or :user in (
   select usuario from usuario_modulo where modulo = 'EVALUACION' and maestro = 'SI'
   ))
 order by per.apellido_paterno;

select *
  from usuario_modulo
 where usuario = 'OOSTOLAZA';


select *
  from usuarios_cotizacion
 where usuario = 'BOBIAGA';

select *
  from usuarios_cotizacion
 where usuario = 'JZANABRIA';

select *
  from cotizacion
 where refe_pedido = 246109;

select *
  from pedido
 where num_ped = 210497;

select *
  from cotizacion
 where num_ped = 210497;

select *
  from transporte
 where cod_transp = '20100084768';

select *
  from transporte
 where nombre like '%CHAVIN%';

select *
  from vendedores
 where nombre like '%ALBUJAR%';

select *
  from vendedores
 where estado = '1'
   and indicador1 is null
 order by cod_vendedor;

select * from vendedores;

select * from consumo_piezas;

select * from campania_excedentes;

select *
  from campania_excedentes
 where cod_escala != 3;

select *
  from transacciones_almacen
 where tp_transac in ('22', '29');

select * from articul_tmp where usuario = 'PEVISA';

select * from pr_prioridad_pza_30;

select to_char(d.fch_transac, 'YYYY') as ano, to_char(d.fch_transac, 'MM') as mes, d.cod_art
     , a.cod_lin, sum(d.cantidad) as cantidad
  from kardex_d_consumo d
     , articul a
 where d.tp_transac in ('22', '29')
--    and d.fch_transac >= trunc(trunc(sysdate - 365), 'MONTH')
--    and d.fch_transac <= trunc(sysdate, 'MONTH') - 1
   and d.cod_art = a.cod_art
   and a.cod_art = 'FS 81118 MLS'
 group by to_char(d.fch_transac, 'YYYY'), to_char(d.fch_transac, 'MM'), d.cod_art, a.cod_lin;

select to_char(h.fecha, 'YYYY') as ano, to_char(h.fecha, 'MM') as mes, a.cod_art, a.linea as cod_lin
     , sum(d.cantidad) as cantidad
     , sum(decode(h.moneda, 'D', d.neto, d.neto / h.import_cam)) as totlin
  from itemdocu d
     , articul_pev a
     , docuvent h
 where d.tipodoc in ('01', '03', '07')
   and d.tipodoc = h.tipodoc
   and d.serie = h.serie
   and d.numero = h.numero
   and h.estado < 9
   and h.fecha >= trunc(trunc(sysdate - 365), 'MONTH')
   and h.fecha <= trunc(sysdate, 'MONTH') - 1
   and '00000' <> substr(h.cod_cliente, 1, 5)
   and h.origen <> 'EXPO'
   and a.cod_art = d.cod_art
   and a.cod_art = 'FS 81118 MLS'
   and a.indicador in ('I', 'IN', 'EN', 'FN', 'IC', 'IF', 'IS', 'IV', 'VO', 'OB')
--            AND    A.indicador IN ('I', 'IN', 'EN', 'FN', 'IC', 'IF', 'IS')  OLGA ORIGINAL
 group by to_char(h.fecha, 'YYYY'), to_char(h.fecha, 'MM'), a.cod_art, a.linea
 order by ano desc, mes desc;

select *
  from kardex_d
 where cod_art = 'FS 81118 MLS'
   and tp_transac in ('22', '29');

select *
  from consumo_piezas_resumen
 where pieza = 'FS 81118 MLS';

select *
  from consumo_piezas
 where ano = 2023
   and mes = 10;

select *
  from consumo_piezas
 where cod_art = 'FS 81118 MLS'
 order by ano desc, mes desc;

begin
  excedentes.elimina();
  excedentes.carga_tabla(
      p_moneda => 'D'
    , p_prom_meses => 4
    , p_fecha_al => sysdate
  );
end;


begin
  --   pr_consumo_piezas_imp_2020();
--   pr_consumo_piezas_imp_2021();
  pr_calcula_venta_nacional_10('PV');
end;


select *
  from lispreg
 order by nro_lista;

select *
  from tab_lineas
 where grupo = 41;

select *
  from articul
 where cod_lin = '253';

select a.cod_art, a.descripcion, a.unidad, n.stock, a.u_eqv, l.linea, l.grupo, v.importe as precio
     , pr_medpza as cod_ing, l.grupo_venta
  from articul a
     , tab_lineas l
     , lispred v
     , almacen n
 where a.tp_art in ('T', 'S')
   and l.linea = a.cod_lin
   and l.grupo is not null
   and v.cod_art = a.cod_art
   and v.nro_lista = :nro_lista
   and l.grupo_venta = :unidad_negocio
   and n.cod_art(+) = a.cod_art
   and n.cod_alm(+) = 'F0'
   and l.grupo = 41
 order by a.cod_art;

select *
  from lispred
 where nro_lista = 1
   and cod_art in (
                   '0986A00216', '0986A00223', '0092S37085', '0092S37093', '0092S37098',
                   '0986A00383', '0092S67106', '0986A02335', '0092S57024', '0092S47045',
                   '0092S47043', '0092S47030', '0092S47029', '0092S47028'
   );

select *
  from almacen
 where cod_art in (
                   '0986A00216', '0986A00223', '0092S37085', '0092S37093', '0092S37098',
                   '0986A00383', '0092S67106', '0986A02335', '0092S57024', '0092S47045',
                   '0092S47043', '0092S47030', '0092S47029', '0092S47028'
   );


select *
  from clientes
 where grupo_bateria is not null;


select a.cod_art, a.descripcion, a.unidad, n.stock, a.u_eqv, l.linea, l.grupo, v.importe as precio
     , pr_medpza as cod_ing, l.grupo_venta
  from articul a
     , tab_lineas l
     , lispred v
     , almacen n
 where a.tp_art in ('T', 'S')
   and l.linea = a.cod_lin
   and l.grupo is not null
   and v.cod_art = a.cod_art
   and v.nro_lista = :nro_lista
   and l.grupo_venta = :unidad_negocio
   and n.cod_art(+) = a.cod_art
   and n.cod_alm(+) = 'F0'
   and l.grupo = 41
 order by a.cod_art;


select *
  from vendedores
 where cod_vendedor = 'B8';

select *
  from campana
 where cod_campana in ('BD2023-7', 'BD2023-9');

select *
  from campana
 where cod_campana = 'BD2023-9';

select * from estado_campana;

select * from clientes;

select codigo, descripcion, indicador3
  from tablas_auxiliares
 where tipo = 29 and codigo <> '....'
   and codigo in (
   select cod_vendedor
     from vendedores
    where abreviada = 'BOBIAGA'
   )
 union all
select codigo, descripcion, indicador3
  from tablas_auxiliares
 where tipo = 29 and codigo <> '....'
   and exists (
   select usuario
     from usuarios_cotizacion
    where usuario = user and indicador3 = '1'
   )
 order by 1;

select *
  from usuarios_cotizacion
 where usuario = 'BOBIAGA';

select *
  from vendedores
 where abreviada = 'BOBIAGA';

select *
  from tab_grupos
 where grupo in (41, 42);

select * from cobradores_recibos;

select * from caja_chica_motivos;

select *
  from vendedores
 where cod_vendedor = 'Z6';

select *
  from docuvent
 where cod_vende = 'Z6';

select *
  from vendedores
 where cod_vendedor = '77';

select *
  from pedido
 where serie = 24
   and num_ped = 5878;

select * from tab_bancos;

select *
  from tablas_auxiliares
 where tipo = 11
 order by codigo;

select * from clientes_otros;

select decode(v.ind_vta1, '1000', '01-EMPAQUES', '2000', '02-COMERCIAL', '3000', '03-BATERIAS',
              '4000', '04-NEUMATICOS', '5000', '05-OTROS',
              decode(v.ind_vta1, null,
                     decode(v.supervisor, '01', '01-EMPAQUES', '42', '03-BATERIAS', '01-EMPAQUES'),
                     '05-OTROS')) as divi_grupo
     , to_char(v.grupo) as grupo, v.des_grupo, sum(v.dolares) as dolares
  from view_vendedor_grupo v
     , vendedores d
 where v.cod_vende like :p_vende
   and v.fecha between :p_fecha1 and :p_fecha2
   and v.cod_vende = d.cod_vendedor
   and v.tipo = 'NACIONAL'
   and v.ind_vta1 not in ('3000', '4000')
 group by decode(v.ind_vta1, '1000', '01-EMPAQUES', '2000', '02-COMERCIAL', '3000', '03-BATERIAS',
                 '4000', '04-NEUMATICOS', '5000', '05-OTROS',
                 decode(v.ind_vta1, null,
                        decode(v.supervisor, '01', '01-EMPAQUES', '42', '03-BATERIAS',
                               '01-EMPAQUES'), '05-OTROS'))
        , to_char(v.grupo), v.des_grupo
 union
select decode(v.ind_vta1, '1000', '01-EMPAQUES', '2000', '02-COMERCIAL', '3000', '03-BATERIAS',
              '4000', '04-NEUMATICOS', '5000', '05-OTROS',
              decode(v.ind_vta1, null,
                     decode(v.supervisor, '01', '01-EMPAQUES', '42', '03-BATERIAS', '01-EMPAQUES'),
                     '05-OTROS')) as divi_grupo
     , v.cod_lin, v.des_linea, sum(v.dolares) as dolares
  from view_vendedor_grupo v
     , vendedores d
 where v.cod_vende like :p_vende
   and v.fecha between :p_fecha1 and :p_fecha2
   and v.cod_vende = d.cod_vendedor
   and v.tipo = 'NACIONAL'
   and v.ind_vta1 in ('3000', '4000')
 group by decode(v.ind_vta1, '1000', '01-EMPAQUES', '2000', '02-COMERCIAL', '3000', '03-BATERIAS',
                 '4000', '04-NEUMATICOS', '5000', '05-OTROS',
                 decode(v.ind_vta1, null,
                        decode(v.supervisor, '01', '01-EMPAQUES', '42', '03-BATERIAS',
                               '01-EMPAQUES'), '05-OTROS'))
        , v.cod_lin, v.des_linea
 order by 1;

select *
  from articul
 where cod_art = '28100-0L200 +LINE /O-MU';

select a.cod_art, a.descripcion, a.unidad, n.stock, a.u_eqv, l.cod_linea as linea
     , l.cod_grupo as grupo, v.importe as precio, pr_medpza as cod_ing, t.grupo_venta
  from articul a
     , tab_descuento_gpolin l
     , lispred v
     , lispreg g
     , tab_lineas t
     , almacen n
 where a.tp_art in ('T', 'S')
   and l.cod_linea = a.cod_lin
   and l.cod_grupo is not null
   and g.nro_lista = :nro_lista
   and l.moneda = g.moneda
   and v.cod_art = a.cod_art
   and v.nro_lista = g.nro_lista
   and t.linea = l.cod_linea
   and n.cod_art(+) = a.cod_art
   and n.cod_alm(+) = 'F0'
   and a.cod_art = '28100-0L200 +LINE /O-MU'
 order by l.cod_grupo, a.cod_art;

select *
  from tab_descuento_gpolin
 where cod_linea = '560';

select *
  from lispred
 where cod_art = '28100-0L200 +LINE /O-MU';

select * from lispreg;

select *
  from almacen
 where cod_art = '28100-0L200 +LINE /O-MU';

select * from cotizacion;

select *
  from cotizacion
 where flag_riesgo is null;

update cotizacion
   set flag_riesgo = 'N'
 where flag_riesgo is null;

select distinct p.num_ped, p.cod_cliente, p.nombre, p.nro_sucur, p.cond_pag, p.moneda, p.cod_vende
              , p.por_desc1, p.por_desc2, p.ruc, p.cliente_afecto, nro_lista, p.cod_transp
              , p.domicilio, p.ruc_transp, p.direccion, numero_ref
  from pedido p
     , itemped i
 where p.tipo_docto in (2, 6, 20, 21, 22, 23, 24) and p.estado = 5 and i.serie = p.serie
   and i.num_ped = p.num_ped and i.saldo > 0

 order by p.num_ped;

select *
  from pedido
 where num_ped = 246530;

select *
  from pedido
 where num_ped = 246529;

select sysdate from dual;
