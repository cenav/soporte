select *
  from cotizacion
 where serie = 24
   and num_ped in (5767);

select *
  from itemcot
 where serie = 24
   and num_ped in (5767);

select *
  from cotizacion
 where serie = 27
   and num_ped = 3;

select *
  from itemcot
 where serie = 27
   and num_ped = 3
 order by item;

select *
  from pedido
 where num_ped in (267144);

select *
  from clientes
 where cod_cliente = '10024496193';

select *
  from itemped
 where num_ped in (261802);

select *
  from cotizacion
 where refe_pedido = 267144;

-- 20608751531

select *
  from transporte
 where cod_transp = '20608751531';

select *
  from transporte
 where nombre like '%MARVISUR%';

-- cambia transportista
-- cod_transp
select *
  from pedido
 where num_ped in (261802);

select *
  from clientes
 where cod_cliente = '10024496193';

select *
  from itemped
 where num_ped = 248675;

select *
  from articul
 where cod_art = 'S4 38DA-NS40';

select *
  from articul
 where cod_art = 'S4 38DA-NS40';

select *
  from tab_lineas
 where linea = '253';

select p.num_ped, a.estado, p.fecha, p.cod_cliente, e.nombre, e.cond_pag, p.moneda, p.cod_vende
     , i.cod_art
  from pedido p
       join itemped i
            on p.serie = i.serie
              and p.num_ped = i.num_ped
       join articul a on i.cod_art = a.cod_art
       join clientes e on p.cod_cliente = e.cod_cliente
 where a.cod_lin = '253'
   and p.moneda = 'S'
   and p.estado != '9'
   and extract(year from p.fecha) = 2024;

-- cotizaciones Bosch
select p.num_ped, p.estado, p.fecha, p.cod_cliente, e.nombre, e.cond_pag, p.moneda, p.cod_vende
     , v.nombre as vendedor, p.refe_pedido, i.imp_vvb as importe
  from cotizacion p
       join itemcot i
            on p.serie = i.serie
              and p.num_ped = i.num_ped
       join articul a on i.cod_art = a.cod_art
       join clientes e on p.cod_cliente = e.cod_cliente
       join vendedores v on p.cod_vende = v.cod_vendedor
 where a.cod_lin = '253'
   and p.moneda = 'S'
   and p.estado not in ('0', '9')
   and extract(year from p.fecha) = 2024
 order by fecha;

-- acceso MGVENTAS
select *
  from seccrus
 where co_usrusr = 'PEVISA'
   and co_ctrctr = 'M_GVENTAS';

select *
  from transporte
 where cod_transp = '20603099088';

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
 where cod_vendedor = 'B10';

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
   and serie = 'F055'
   and numero = 922;

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
 where num_ped in
       (254751, 254752, 254746, 254747, 254750, 254735, 254735, 254736, 254737, 254738, 254748,
        254742, 254740, 254739, 254697)
   and codigo_area = '01'
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
 where cod_linea = '272';

select * from grupo_venta;

select * from tab_descuento_comercial order by cod_grupo_venta;

select * from tab_descuento_gpolin;

select * from tab_descuento_rango;

select * from lispreg order by nro_lista;

select * from tab_grupos;

select *
  from tab_descuento_gpolin
 where cod_grupo_venta = '82';

select *
  from lispred
 where cod_art = '28100-0L200 +LINE /O-MU';

select *
  from tab_lineas
 where linea = '144';

select *
  from unidades_negocio
 where codigo_unidad_negocio = '07';

select *
  from grupo_venta
 where cod_grupo_venta = '7000';

select *
  from tab_grupos
 where ind_vta1 = '7000';

select get_rango_descuento('', '') from dual;

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

-- 000676465 carnet extranjeria

select *
  from clientes
 where cod_cliente = '000676465';

select *
  from clientes_otros
 where cod_cliente = '000676465';

select * from tipo_documento_identidad;

alter table clientes_otros
  add id_tipo_dociden number(3);

select *
  from articul
 where cod_art = 'V 95120 R';

select codigo, descripcion, indicador3
  from tablas_auxiliares
 where tipo = 29 and codigo <> '....'
   and codigo in (
   select cod_vendedor
     from vendedores
    where abreviada = user
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
  from cotizacion
 where serie = 20
   and num_ped = 225627;

select *
  from histcot
 where serie = 20
   and num_ped = 226261;

declare
  l_nombre varchar2(40);

  function get_customer_name(
    v1 in number
  , v in  varchar2
  )
    return varchar2 is
    rv varchar2(40);
  begin
    if v1 is not null then
      select descripcion
        into rv
        from tablas_auxiliares t
       where t.tipo = v1 and t.codigo = v;
      return (rv);
    end if;
  exception
    when
      others
      then
        null;
    --   message ('Codigo no existe en tablas auxiliares');
  end;
begin
  l_nombre := get_customer_name(29, 'N5');
  dbms_output.put_line(l_nombre);
end;


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
   and l.grupo not in (41)
 order by a.cod_art;


select *
  from tab_grupos
 where descripcion like '%BATERIAS%';

select *
  from kardex_g
 where num_importa = '4734';

select *
  from embarques_g
 where numero_embarque = '4734';

select *
  from embarques_d
 where numero_embarque = 4734;

select *
  from embarques_d e
       join kardex_d d
            on e.kardex_cod_alm = d.cod_alm
              and e.kardex_tp_transac = d.tp_transac
              and e.kardex_serie = d.serie
              and e.kardex_numero = d.numero
 where e.numero_embarque = 4734;

select *
  from kardex_d
 where cod_alm = '';

select *
  from expedidos
 where numero = 16417;

select *
  from articul
 where cod_art = 'PUB144-0301001';

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
   and l.grupo not in (41)
 order by a.cod_art;

select *
  from lispred
 where cod_art = '2C4090';

select *
  from lispred
 where cod_art in ('PUB144-0301001', 'PUB116-0301001')
 order by nro_lista;

select *
  from lispred
 where cod_art = 'PDG-1160000041';

select *
  from tab_lineas
 where linea = '501';

select *
  from articul
 where cod_art = 'PUB144-0301001';

select *
  from articul
 where cod_lin = '501';

select *
  from tab_lineas
 where descripcion like '%PUBLICIDAD%';

select *
  from itemped
 where cod_art = 'PDG-1160000041';

select *
  from pedido
 where serie = 24
   and num_ped = 6190;

select *
  from itemped
 where serie = 24
   and num_ped = 6190;

select *
  from articul
 where cod_art = 'PUB116-0301001';

select *
  from cotizacion
 where serie = 24
   and num_ped = 5095;

select *
  from itemcot
 where serie = 24
   and num_ped = 5095;

select total_facturado
  from pedido
 where serie = 'F050' and num_ped = '19575';

select total_facturado
  from pedido
 where serie = 20 and num_ped = '19575';

select *
  from itemped
 where serie = 20
   and num_ped = 19575;

select *
  from docuvent
 where serie = 'F050'
   and numero = '18849'
   and tipodoc = '08';

select *
  from docuvent
 where serie = 'F050'
   and numero = '18847'
   and tipodoc = '08';

select *
  from docuvent
 where serie = 'F050'
   and tipodoc = '08'
   and extract(year from fecha) = 2024;

select *
  from docuvent
 where serie = 'F050'
   and numero = '199575'
   and tipodoc = '01';

select *
  from itemdocu
 where serie = 'F050'
   and numero = '199575'
   and tipodoc = '01';

select *
  from itemdocu
 where serie = 'F050'
   and numero = '18847'
   and tipodoc = '08';

select * from pedido;

select * from vendedores;

select distinct supervisor from vendedores;

select *
  from vendedores
 where cod_vendedor in ('N1', '84');

select *
  from vendedores
 where cod_vendedor in ('N3', '77');

select *
  from vendedores
 where cod_vendedor in ('79', 'N4', '22', 'N5');

select *
  from vendedores
 where cod_vendedor in ('25', '34', '35', '38', '41', '45', '48', 'B1', 'B3', 'B4', 'B10');

select *
  from vendedores
 where nombre like '%FIGUE%';

select *
  from vendedores
 where abreviada is null;

select *
  from vendedores
 where telefono = :id_jefatura -- Filtra a los empleados bajo la jefatura
    or cod_vendedor = :id_jefatura; -- Incluye a la propia jefatura

select cod_vendedor
  from vendedores
 where upper(abreviada) = upper(:usuario);

select *
  from cotizacion
 where cod_vende = '06'
 order by fecha desc;

select *
  from vendedores
 where cod_vendedor = '06';

select *
  from clientes
 where cod_cliente = '10422033306';

select *
  from clientes
 where cod_cliente in (
                       '20521093880', '10422033306', '10428823147', '20603482621', '10428823147',
                       '20601251494'
   );

select sysdate from dual;

select * from unidades_negocio;

select *
  from tab_grupos
 where grupo = 44;

select grupo, descripcion
  from tab_grupos
 where ind_vta1 <> '1000'
 order by descripcion, grupo;

select * from grupo_venta;

select *
  from tab_grupos
 where ind_vta1 = '7000';

select *
  from tab_lineas
 where linea in (
                 '272', '273', '276'
   );

select distinct cod_lin
  from articul
 where cod_lin in ('272', '273', '276');

select *
  from proveed_bancos
 where cod_proveed = '20196464086';

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
   and exists (
   select *
     from tab_lineas lin
          join tab_grupos gpo on lin.grupo = gpo.grupo
    where lin.linea = l.cod_linea
      and gpo.ind_vta1 = '7000'
   )
 order by l.cod_grupo, a.cod_art;

select *
  from cotizacion
 where serie = 20
   and num_ped = 232060;

select *
  from cotizacion
 where serie = 20
   and num_ped = 232060;

select *
  from vendedores
 where abreviada = 'PEVISA';

select *
  from pedido
 where num_ped = 253412;

select *
  from itemped
 where num_ped = 253412;

select *
  from sistabgen
 where sistabcod = 600
 order by sistabcod, sisdatcod;

select condpag_venta, descripcion
  from condpag_venta
 where cond_pag = ''
 group by condpag_venta, descripcion
 order by condpag_venta;

select * from condpag_venta order by condpag_venta;

select distinct cond_pag from condpag_venta;

select sysdate from dual;

select * from view_categoria_cliente;

select *
  from clientes
 where cod_cliente = '20608010654';

select abreviada
  from tablas_auxiliares
 where tipo = 24
   and codigo = to_char('40');

select *
  from tablas_auxiliares
 where tipo = 24
   and codigo != '....'
 order by codigo;

/*
0	TELEVENTAS	TELEVENTAS
10	TURQUEZA - TELEVENTAS	TURQUEZA
15	FLOTAS	FLOTAS
20	BRONCE	BRONCE
25	PLATA	PLATA
30	ORO	ORO
35	SAFIRO	SAFIRO
40	DIAMANTE	DIAMANTE
45	PERLA	PERLA
*/

select *
  from clientes
 where cod_cliente in (
                       '20479078026', '20605794301', '10406789972', '10437571673', '20571413443',
                       '10443505747', '10180422230', '20482636072', '20529348267', '20530344208',
                       '10433097098', '20605389636', '10471289715', '20609796082', '20608257609',
                       '20603461500', '20604117292'
   );

select *
  from tab_lineas
 where linea = '650';

select *
  from tfamlin
 where cod_lin = '650';

-- cierre de ventas
select count(*)
  from docuvent_cierre
 where ano_cierre = :P_ANO
   and mes_cierre = :P_MES
   and expo = 'S';

select count(*)
  from docuvent_cierre
 where ano_cierre = :P_ANO
   and mes_cierre = :P_MES
   and nac = 'S';

select p.cod_art, p.precio, p.linea, 0 as stock, l.grupo, p.indicador
     , l.factor1 as factor_nac1, l.factor2 as factor_imp2, round(
    nvl(decode(substr(p.indicador, 1, 1), 'I', p.precio * l.factor2, p.precio * l.factor1),
        0), 2) as precio_factor_lista1
     , 1 as lista, p.precio2 as precio_especial, nvl(p.oferta, 0) as oferta
     , l.factor3 as tcambio
  from articul_pev p
     , tab_lineas l
 where l.linea = p.linea
   and p.linea <> 'ZZ'
   and p.cod_art like 'S4 55DH-H5-B'
 order by p.linea, p.cod_art;

select *
  from articul_pev
 where cod_art in ('S4 45D-51R-B', 'S4 55DH-H5-B');

select *
  from articul_mis
 where cod_art = 'S4 45D-51R-B';

select *
  from lispred
 where cod_art = 'S4 45D-51R-B';

select * from articul_pev;

select sysdate from dual;

select cod_transp, nombre, domicilio, ruc_transp
  from transporte
 where estado is null
 order by cod_transp;

select u.cod_ubc, u.nom_dpt, u.nom_pvc, u.nom_dtt
     , u.nom_dtt || ' ' || u.nom_pvc || ' ' || u.nom_dpt as nombre
  from ubigeo u
 where nacional_internacional = 'N'
 order by u.nom_dtt;

select *
  from ubigeo
 where cod_ubc = '150126';

select c.cod_cliente as ruc_llegada, c.nombre as nombre_llegada, s.nro_sucur, s.direccion, u.cod_ubc
     , u.nom_dpt, u.nom_pvc, u.nom_dtt, u.nom_dtt || ' ' || u.nom_pvc || ' ' || u.nom_dpt as nombre
  from ubigeo u
     , sucursales s
     , clientes c
 where s.cod_cliente = c.cod_cliente
   and u.nacional_internacional = 'N'
   and s.cod_ubc = u.cod_ubc
   and nvl(s.estado, 0) < 9
 order by c.cod_cliente, s.nro_sucur;


select *
  from sucursales
 where cod_cliente = '20100084768';

-- RM-45 L1-N


select *
  from vendedores
 where cod_vendedor = 'B12';

select *
  from vendedores
 where cod_vendedor = '26';

select *
  from vendedores
 where abreviada = 'JFLORES';

select *
  from planilla10.personal
 where c_codigo = 'E1207';

select *
  from usuarios
 where usuario = 'JFLORES';

select *
  from usuarios_cotizacion
 where usuario = user
   and indicador3 = '1';

select *
  from usuarios_cotizacion
 where usuario = 'JFLORES'
   and indicador3 = '1';

select codigo, descripcion, indicador3
  from tablas_auxiliares
 where tipo = 29
   and codigo <> '....'
   and codigo in (
   select cod_vendedor
     from vendedores
    where abreviada = 'JFLORES'
   )
 union all
select codigo, descripcion, indicador3
  from tablas_auxiliares
 where tipo = 29 and codigo <> '....'
   and exists (
   select usuario
     from usuarios_cotizacion
    where usuario = 'JFLORES'
      and indicador3 = '1'
   )
 order by 1;

select *
  from tablas_auxiliares
 where tipo = 29
   and codigo = '26'
 order by codigo;

select p.num_ped, p.cod_cliente, p.nombre, p.estado, p.fecha, p.cod_vende, v.nombre, p.moneda
     , p.total_pedido
  from pedido p
       left join vendedores v on p.cod_vende = v.cod_vendedor
 where nvl(p.estado, '0') in ('0', '1', '2', '3', '4', '5', '6')
   and extract(year from fecha) >= 2025
 order by p.fecha desc;

select distinct estado
  from pedido
 where nvl(estado, '0') != '9'
 order by estado;

select *
  from pedido
 where num_ped = 262717;

select *
  from cotizacion
 where refe_pedido = 262717;


-- for LOV
select p.num_ped, p.cod_cliente, p.nombre, p.estado, p.fecha, p.cod_vende, v.nombre as vendedor
     , v.supervisor, p.moneda, p.total_pedido
  from pedido p
       left join vendedores v on p.cod_vende = v.cod_vendedor
 where nvl(p.estado, '0') in ('0', '1', '2', '3', '4', '5', '6')
   and extract(year from fecha) >= 2025
   and ((exists (
   select 1
     from vendedores
    where abreviada = :user
      and indicador1 = 'GC' --> [G]erente [C]omecial
   )
   and cod_vendedor in (
     select e.cod_vendedor
       from vendedores e
            join vendedores j on e.supervisor = j.cod_vendedor
      where j.abreviada = case :user when 'RRODRIGUEZ' then 'RR VTAS' else :user end
     ))
   or (exists (
     select *
       from usuario_modulo
      where modulo = 'VA_RETPEDCOT'
        and maestro = 'SI'
        and supermaestro = 'SI'
        and usuario = :user
     )))
 order by p.fecha desc, p.num_ped desc;

select *
  from vendedores
 where indicador1 = 'GC';

select v.cod_vendedor, v.nombre, j.cod_vendedor as cod_jefe, j.nombre as jefe
  from vendedores v
       join vendedores j on v.supervisor = j.cod_vendedor
 where j.abreviada = 'RRODRIGUEZ';

select v.cod_vendedor, v.nombre as empleado, j.cod_vendedor as id_jefe, j.nombre as jefe
     , j.abreviada
  from vendedores v
       join vendedores j on v.supervisor = j.cod_vendedor
 where j.abreviada = case :user when 'RRODRIGUEZ' then 'RR VTAS' else :user end;

select *
  from vendedores
 where abreviada = 'JCHIRINOS';

select *
  from vendedores
 where abreviada = :user
   and indicador1 = 'GC'; --> [G]erente [C]omecial

select *
  from vendedores v
       join vendedores j on v.supervisor = j.cod_vendedor
 where j.abreviada = case :user when 'RRODRIGUEZ' then 'RR VTAS' else :user end

select p.num_ped, p.cod_cliente, p.nombre, p.estado, p.fecha, p.cod_vende, v.nombre as vendedor
     , v.supervisor, p.moneda, p.total_pedido
  from pedido p
       left join vendedores v on p.cod_vende = v.cod_vendedor
 where nvl(p.estado, '0') in ('0', '1', '2', '3', '4', '5', '6')
   and extract(year from fecha) >= 2025
   and (exists (
   select 1
     from vendedores
    where abreviada = :user
      and indicador1 = 'GC' --> [G]erente [C]omecial
   )
   and p.cod_vende in (
     select v.cod_vendedor
       from vendedores v
            join vendedores j on v.supervisor = j.cod_vendedor
      where j.abreviada = case :user when 'RRODRIGUEZ' then 'RR VTAS' else :user end
     ));

-- LOV cotizacion
select p.num_ped, p.cod_cliente, p.nombre, p.estado, p.fecha, p.cod_vende, v.nombre as vendedor
     , v.supervisor, p.moneda, p.total_pedido
  from cotizacion p
       left join vendedores v on p.cod_vende = v.cod_vendedor
 where nvl(p.estado, '0') in ('0', '1', '2', '3', '4', '5', '6')
   and extract(year from fecha) >= 2025
   and ((exists (
   select 1
     from vendedores
    where abreviada = :usuario
      and indicador1 = 'GC'
   )
   and cod_vendedor in (
     select e.cod_vendedor
       from vendedores e
            join vendedores j on e.supervisor = j.cod_vendedor
      where j.abreviada = case :usuario when 'RRODRIGUEZ' then 'RR VTAS' else :usuario end
     ))
   or (exists (
     select 1
       from usuario_modulo
      where modulo = 'VA_RETPEDCOT'
        and maestro = 'SI'
        and supermaestro = 'SI'
        and usuario = :usuario
     )))
 order by p.fecha desc, p.num_ped desc;

-- ZDELAPUENTE
select *
  from vendedores
 where cod_vendedor = 'E2';

select *
  from vendedores
 where abreviada = 'PEVISA';

select *
  from cotizacion
 where unidad_negocio in ('01', '02')
   and cod_vende like '%'
   and num_ped = 242674;


select *
  from clientes
 where categoria_ventas is not null
    or categoria_pagos is not null;

select *
  from pedido
 where num_ped = 266611;

select serie, automatico, descmax
     , decode(serie, 21, 'Consumo', 22, 'Liquidacion', 23, 'Muestras', 24, 'Obsequios',
              null) as des_serie
  from nrodoc
 where tipodoc = (
   select tpedido
     from paramfa
   );

select p.num_ped, p.cod_cliente, p.nombre
  from cotizacion p
 where p.serie = :pedido.serie
 order by p.num_ped;


select p.num_ped, p.cod_cliente, p.nombre
  from cotizacion p
 where p.serie = :serie
 order by p.num_ped;

select *
  from cotizacion
 where serie = 27
   and num_ped = 3
   and unidad_negocio in ('01', '02');

select *
  from caja
 where id_serie = 1
   and id_numero = 258;

select *
  from serie_caja_usuario
 where usuario = 'PEVISA'
 order by id_serie;

select c.serie, c.num_ped, c.fecha, c.nombre as cliente, c.total_pedido, c.moneda
--      , v.nombre as vendedor, c.numero_ref, c.nro_sucur, s.nombre_sucursal
  from cotizacion c
     , vendedores v
     , sucursales s
 where c.estado in ('0', '5')
   and v.cod_vendedor = c.cod_vende
   and s.cod_cliente(+) = c.cod_cliente
   and s.nro_sucur(+) = c.nro_sucur
   and (
         select count(*)
           from itemcot x
          where x.num_ped = c.num_ped
            and x.serie = c.serie
            and x.precio_sugerido > 0
         ) = 0
   and c.serie = 24
   and c.num_ped = 5767;

union
select c.serie, c.num_ped, c.fecha, c.nombre as cliente, c.total_pedido, c.moneda
     , v.nombre as vendedor, c.numero_ref, c.nro_sucur, s.nombre_sucursal
  from cotizacion c
     , vendedores v
     , sucursales s
 where c.estado in ('0', '5')
   and v.cod_vendedor = c.cod_vende
   and c.cod_cliente in '20100085578'
   and s.cod_cliente(+) = c.cod_cliente
   and s.nro_sucur(+) = c.nro_sucur
 order by 1, 2 desc;


select nro_sucur, direccion, vendedor
  from sucursales
 where cod_cliente = '10024496193' and estado <> 9
 order by nro_sucur;

-- 025-0045668

select user, p.numero, p.zona, p.cod_cliente
     , c.nombre || '  ' || p.referencia as nombre, d.nro, d.cod_art, d.canti, d.preuni, d.estado_pk
     , a.grupo, t.descripcion, d.saldo_pk
  from expedstock p
     , expedstock_d d
     , articul_pev a
     , exclientes c
     , tablas_auxiliares t
 where p.estado not in ('8', '7', '9', 'T', '85')
   and p.cod_cliente = c.cod_cliente
   and d.numero = p.numero
   and nvl(d.id, '0') = '0'
   and d.estado_pk not in ('9', '8', 'T')
   and d.cod_art = a.cod_art
   and t.tipo = 39
   and t.codigo = d.estado_pk;

select user, p.zona as vendedor, p.numero, p.zona, p.cod_cliente, c.nombre, d.nro, d.cod_art
     , d.canti, d.preuni, d.estado_pk, a.grupo, t.descripcion, d.saldo_pk
     , o.numero as numero_orden_armado, o.nuot_tipoot_codigo, o.estado as estado_orden_armado
  from expedidos p
     , expedido_d d
     , articul_pev a
     , exclientes c
     , tablas_auxiliares t
     , pr_ot o
 where nvl(p.zona, '0') in ('02', '05', '70', '00', '97', '99')
   and p.estado not in ('8', '7', '9', 'T', '85')
   and p.cod_cliente = c.cod_cliente
   and d.numero = p.numero
   and nvl(d.id, '0') = '0'
   and d.estado_pk not in ('9', '8', 'T')
   and d.cod_art = a.cod_art
   and t.tipo = 39
   and t.codigo = d.estado_pk
   and o.abre01 = to_char(d.numero)
   and o.per_env = d.nro
   and o.estado < 9
   --and o.estado = 7
   and not exists (
   select d.ot_tipo, d.ot_serie, d.ot_numero, g.fecha_despacho
     from pk_detal d
        , pk_gnumero g
    where d.ot_numero = o.numero
      and d.ot_serie = o.nuot_serie
      and d.ot_tipo = o.nuot_tipoot_codigo
      and g.pk_numero = d.pk_numero
      and g.fecha_despacho is not null
   )
   and d.numero = 16602
   and a.cod_art = 'EK BV 66101 R';

select *
  from pk_detal
 where numero = 16551;

select * from pk_gnumero where pk_numero = 61207;

select * from excomirepre_2017;

select * from excomirepre_2018;

select * from excomision_repre;