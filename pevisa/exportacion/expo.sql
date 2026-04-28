-- pedido que no se ve AutoZone 16755, 16794, 16787

select *
  from exbooking_d
 where numero_booking = 'AER-113';

select *
  from exfacturas
 where numero in (
   55022075
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
 where numero = 20017;

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
 where tipodoc = '07'
   and serie = 'F055'
   and numero in (9278);


select *
  from docuvent
 where tipodoc = '01'
   and serie = 'F055'
   and numero in ('22078', '22070');

select *
  from itemdocu
 where tipodoc = '07'
   and serie = 'F055'
   and numero in (9278);

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
 where numero = 20379;

-- 20379 / 20380/ 20381/ 20382 / 20383

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

select * from grupo_cliente;

select * from grupo_cliente_cliente;

select nvl(sum(total_no_despachado), 0) as total
  from vw_facturado_no_embarcado
 where nombre = :VIEW_PRIORIDADES_PENDIENTES.nombre_cliente;

select nvl(sum(total_no_despachado), 0) as total
  from vw_facturado_no_embarcado
 where nombre = 'AUTOZONE MX';

-- vw_facturado_no_embarcado
select f.numero, f.fecha, f.cod_cliente
     , coalesce(gc.dsc_grupo, c.nombre) as nombre
     , case
         when f.tflete != 1
           then
           case
             when f.tflete + f.tseguro > 0 then f.tbruto - f.tflete
             else f.tbruto
           end
         else
           f.tbruto
       end
  as total_mercaderia
     , p.pk_numero, p.fecha_despacho, case
                                        when p.fecha_despacho is not null
                                          then
                                          (case
                                             when f.tflete != 1
                                               then
                                               case
                                                 when f.tflete + f.tseguro > 0
                                                   then
                                                   f.tbruto - f.tflete
                                                 else
                                                   f.tbruto
                                               end
                                             else
                                               f.tbruto
                                           end)
                                        else
                                          0
                                      end
  as total_despachado
     , case
         when p.fecha_despacho is null
           then
           (case
              when f.tflete != 1
                then
                case
                  when f.tflete + f.tseguro > 0
                    then
                    f.tbruto - f.tflete
                  else
                    f.tbruto
                end
              else
                f.tbruto
            end)
         else
           0
       end
  as total_no_despachado
---f.total,
     , case
         when f.fflete != 1 then f.tbruto
         else f.tbruto + f.tseguro + f.tflete + f.tgasto
       end
---f.tbruto + f.tseguro + f.tflete,
     , ep.nombre as pais
  from exfacturas f
       join exclientes c on f.cod_cliente = c.cod_cliente
       left join pk_gnumero p on f.paclis = p.pk_numero
       left join expaises ep on c.pais = ep.pais
       left join grupo_cliente_cliente gcc on f.cod_cliente = gcc.cod_cliente
       left join grupo_cliente gc on gcc.cod_grupo = gc.cod_grupo
 where f.fecemb is null
   and f.estado != '9'
   and f.zona in ('02', '05')
   and f.cond_pago != '111'
   and not exists (
   select 1
     from exfacturas_his h
    where f.numero = h.numero and h.accion = '92'
   );

select * from exfacturas;

select *
  from articul
 where cod_art = 'SB V 41015 R';

select *
  from expedido_d
 where numero = 16913
   and cod_art = 'V 41015 R';

select *
  from exproforma_d
 where numero = 20154
   and cod_art = 'V 41015 R';


select d.numero, d.nro, d.cod_art, d.canti, d.cod_eqi, a.descripcion
  from expednac_d d
     , articul a
 where d.numero = :pedido
   and d.estado_pk in ('A', '0')
   and nvl(d.saldo_ot, 0) = 0
   and nvl(d.id, 0) = '0'
   and d.cod_art = a.cod_art
   and a.cod_art not in (
   select cod_lin
     from pr_grupos_lineas_desarrollo
    union all
   select cod_lin
     from pr_grupos_lineas_validacion
    union all
   select '1980'
     from dual
    union all
   select 'ZZ'
     from dual
    union all
   select '99'
     from dual
   )
 order by d.cod_art;

select *
  from pr_formu
 where art_cod_art = 'RP 45R-55B24RS-N';

select *
  from pr_formu
 where art_cod_art = 'R-AGM L4-N';


select sum(decode(c.cod_vende, '05', d.imp_neto, 0)) as oct
     , sum(decode(c.cod_vende, '02', d.imp_neto, 0)) as car
  from docuvent d
     , exclientes c
 where d.fecha >= :x_fecha_del
   and d.fecha <= :x_fecha_al
   and substr(d.cod_cliente, 6, 6) = c.cod_cliente
   and d.origen = 'EXPO'
   and d.estado < 9;

-- detalle facturacion
select case c.cod_vende
         when '02' then 'CARLOS'
         when '05' then 'OCTAVIO'
         else c.cod_vende
       end as vendedor
     , case d.tipodoc when '01' then 'FACT' when '07' then 'NC' else d.tipodoc end as documento
     , d.numero, d.fecha, d.nombre, d.imp_neto
  from docuvent d
     , exclientes c
 where d.fecha >= :x_fecha_del
   and d.fecha <= :x_fecha_al
   and substr(d.cod_cliente, 6, 6) = c.cod_cliente
   and d.origen = 'EXPO'
   and c.cod_vende in ('02')
   and d.estado < 9;

select * from grupo_cliente;

select * from grupo_cliente_cliente;

-- Olga pedido muestra
-- Anular y cerrar
-- el pedido no se anuló sino se cerró
-- descontar de comisión


select *
  from expedidos
 where numero = 16940;


select *
  from expedido_d
 where numero = 16940
   and nro = 6;


select *
  from expedido_d
 where numero = 16990
   and nro = 478
   and cod_art = 'FS 92004 TG';


select *
  from pr_ot
 where abre01 = '16990'
   and per_env = 478;

select d.*, a.cod_lin, a.grupo
  from expedido_d d
     , articul a
 where d.numero = 16974
   and nvl(d.id, 0) = '0'
   and a.cod_art = d.cod_art
   and d.canti - nvl(d.saldo_ot, 0) > 0
   and d.estado_pk not in ('8');


select *
  from pr_consul
 where nvl(secuencia, 0) > 0
   and estado not in ('8', '9')
   and pedido = 16974;


select *
  from pr_for_ins
 where formu_art_cod_art = 'CATALOGO PEVISA';


select d.*, a.cod_lin
  from expedido_d d
     , articul a
 where d.numero = 16865
   and nvl(d.id, 0) = '0'
   and d.nro = 103
   and a.cod_art = d.cod_art;


select *
  from pr_consul
 where nvl(secuencia, 0) > 0
   and estado not in ('8', '9')
--                 AND   TIPO <> '3' ---                   PEDIDOS DE STOCK ---
   and pedido = 16865
 order by secuencia;

select *
  from pr_for_ins
 where formu_art_cod_art = 'BV 106002 R';

select *
  from pr_ot
 where abre01 = '16865'
   and per_env = 103;

select *
  from expedido_d
 where numero = 16964
 order by nro desc;

select *
  from expednac
 where numero in (520, 521);

select *
  from expednac_d
 where numero in (520, 521);

select sum(total) as lima
  from view_despachos_a_lima
 where to_number(to_char(fecha, 'yyyy')) = 2025
   and to_number(to_char(fecha, 'mm')) = 10;

select *
  from transacciones_almacen
 where tp_transac = '25';

select *
  from view_despachos_a_lima
 where to_number(to_char(fecha, 'yyyy')) = 2025
   and to_number(to_char(fecha, 'mm')) = 10;

select *
  from almacenes
 where cod_alm = '01';

select d.cod_alm, d.tp_transac, d.serie, d.numero, d.fecha, d.ing_sal, d.cod_art, d.cantidad
     , d.pr_numot, d.pr_numped, d.nro_ped, e.preuni, d.cantidad * e.preuni as total, e.canti
  from kardex_dpk d
     , expednac_d e
 where d.tp_transac = '25'
   and e.numero = d.pr_numped
   and e.nro = d.nro_ped
   and e.cod_art = d.cod_art
   and d.estado < 9
   and to_number(to_char(d.fecha, 'yyyy')) = 2025
   and to_number(to_char(d.fecha, 'mm')) = 10
 order by d.pr_numped, d.nro_ped;


select sysdate from dual;


select nvl(c.cod_vende, '00') as cod_vende
     , c.pais
     , c.cod_cliente
     , c.cod_grupo as xxx
     , nvl(c.cod_grupo, c.cod_cliente) as cod_grupo
     , replace(c.nombre, ',', '/') as nombre
     , c.estado
     , ex_venta_por_cliente_nto(c.cod_cliente, :P_1ER_SEMESTRE_DEL, :P_1ER_SEMESTRE_AL) as facturas
     , ex_venta_por_cliente_nto(c.cod_cliente, :P_2DO_SEMESTRE_DEL,
                                :P_2DO_SEMESTRE_AL) as facturas_2sem
  from exclientes c
     , expaises p
 where nvl(c.cod_vende, '00') like :p_vende
   and c.pais like :p_pais
   and c.pais = p.pais
   and c.cod_cliente in ('996057', '990937', '990941')
   and exists  (
   select cod_cliente
     from docuvent
    where cod_cliente = '00000' || c.cod_cliente
      and fecha >= to_date('01/01/2022', 'dd/mm/yyyy')
   )
 order by c.cod_cliente
        , lpad(c.pais, 3, '0')
        , 4;

select *
  from exclientes
 where cod_grupo = '996057';


-- detalle facturas 2025
select f.cod_cliente, f.nombre, f.fecha, f.tipodoc, f.serie, f.numero
     , sum(imp_neto) as neto
  from docuvent f
 where f.cod_cliente in ('00000996057', '00000990937', '00000990941')
   and f.fecha between to_date('01/01/2025', 'dd/mm/yyyy') and to_date('31/12/2025', 'dd/mm/yyyy')
   and f.estado <> '9'
   and f.origen = 'EXPO'
 group by f.cod_cliente, f.nombre, f.fecha, f.tipodoc, f.serie, f.numero;


-- detalle pedidos 2025
select h.cod_cliente, h.nombre, h.fecha, i.nro, i.cod_art, sum(i.totlin) as total
  from expedido_d i
     , expedidos h
 where h.cod_cliente in ('996057', '990937', '990941')
   and i.numero = h.numero
   and nvl(i.id, '0') = '0'
   and h.fecha >= to_date('01/01/2025', 'dd/mm/yyyy')
   and h.fecha <= to_date('31/12/2025', 'dd/mm/yyyy')
   and h.estado <> '9'
 group by h.cod_cliente, h.nombre, h.fecha, i.nro, i.id, i.cod_art;


select sum(imp_neto)
  from docuvent f
 where f.cod_cliente = 996057
   and f.fecha between to_date('01/01/2025', 'dd/mm/yyyy') and to_date('30/06/2025', 'dd/mm/yyyy')
   and f.estado <> '9'
   and f.origen = 'EXPO';


select cod_cliente, nombre, cod_grupo
  from exclientes
 where cod_cliente in ('996057', '990937', '990941');

select *
  from expedido_d
 where numero = 16941
 order by nro;

select *
  from expedido_d
 where numero = 16364;

select *
  from expedido_d
 where extract(year from fecha) = 2024;

select *
  from exfacturas
 where numero = 55022078;

select *
  from ex_prefacturas
 where numero = 9056648;


-- escoge packing
select k.pk_numero
     , k.fecha
     , k.cod_cliente
     , c.nombre
     , 0 as guias
  from pk_gnumero k
     , exclientes c
 where c.cod_cliente = k.cod_cliente
   and nvl(k.estado, '0') = 'G'
 order by 5 desc
        , 1;


-- pedido a trabajar
select p.pk_numero
     , k.cod_eqi
     , k.cod_art
     , d.preuni
     , d.nro
  from pk_gnumero p
     , pk_detal k
     , expedido_d d
 where p.pk_numero = 64303
   and k.pk_numero = p.pk_numero
   and d.numero = k.numero
   and d.cod_eqi = k.cod_eqi
   and d.cod_art = k.cod_art
   and d.nro = k.nro_ped
--    and d.preuni = 0
 order by d.partida
        , k.cod_eqi
        , k.cod_art;


select *
  from pk_gnumero
 where pk_numero = 62912;


select *
  from pk_detal
 where pk_numero = 62912;


select *
  from pk_detal
 where extract(year from fecha) = 2025
   and extract(month from fecha) = 12;


select *
  from expedidos
 where numero = 16940;

select *
  from expedido_d
 where numero = 16940
   and nro = 6;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and abre01 = '16940'
   and per_env = 6;

select *
  from pr_ot_historia
 where nuot_tipoot_codigo = 'AR'
   and numero = 1133588;

select *
  from pr_ot_historia
 where nuot_tipoot_codigo = 'AR'
   and numero = 1133588;

select *
  from pr_ot_historia
 where numero = 1133588;

select *
  from pr_ot_historia;

select *
  from expedido_d_historia
 where numero = 16940
   and nro = 6
   and campo = 'CANTI';

select *
  from pr_ot_historia
 where numero = 1133588;

select *
  from pr_ot_detalles;

select trunc(to_date(:x_ano || lpad(:x_mes, 2, '0'), 'YYYYMM'), 'MM') from dual;

select total_expo
  from v_docuvent_ano
 where to_number(ano || lpad(mes, 2, '0')) between to_number(to_char(:x_fecha_ini, 'YYYY') ||
                                                             lpad(to_char(:x_fecha_ini, 'MM'), 2, '0'))
         and to_number(to_char(:x_fecha_fin, 'YYYY') || lpad(to_char(:x_fecha_fin, 'MM'), 2, '0'));


select total_expo
  from v_docuvent_ano
 where to_number(ano || lpad(mes, 2, '0')) between to_number(to_char(:x_fecha_ini, 'YYYY') ||
                                                             lpad(to_char(:x_fecha_ini, 'MM'), 2, '0'))
         and to_number(to_char(:x_fecha_fin, 'YYYY') || lpad(to_char(:x_fecha_fin, 'MM'), 2, '0'));

select * from v_docuvent_ano;

select x.ano, x.mes, sum(x.total), sum(x.total_nac), sum(x.total_expo)
  from (
         select to_char(v.fecha, 'yyyy') as ano
              , to_char(v.fecha, 'mm') as mes
              , (decode(v.moneda, 'D', v.imp_neto, round(v.imp_neto / v.import_cam, 2))) as total
              , (decode(v.origen, 'EXPO', 0, decode(v.moneda, 'D', v.imp_neto,
                                                    round(v.imp_neto / v.import_cam, 2)))) as total_nac
              , (decode(v.origen, 'EXPO',
                        decode(v.moneda, 'D', v.imp_neto, round(v.imp_neto / v.import_cam, 2)),
                        0)) as total_expo
           from v_docuvent v
          where v.estado <> '9' and not (v.tipodoc = '01' and v.origen = 'EXPO')
            and not exists (
            select 1
              from v_docuvent x
             where x.tipodoc = '07'
               and x.serie = 'F056'
               and x.numero in ('6983', '6982', '6984', '6979', '6981')
               and x.tipodoc = v.tipodoc
               and x.serie = v.serie
               and x.numero = v.numero
            )
          union all
         select to_char(f.fecha, 'YYYY') as ano, to_char(f.fecha, 'MM') as mes, (decode(
             nvl(d.merca, 0), 0, decode(nvl(d.fob, 0), 0, d.totlin, d.fob),
             nvl(d.merca, 0))) as total
              , 0 as total_nac
              , (decode(nvl(d.merca, 0), 0,
                        decode(nvl(d.fob, 0), 0, d.totlin, d.fob),
                        nvl(d.merca, 0))) as total_xpo
           from exfacturas f
              , exfactura_d d
          where f.estado <> '9'
            and d.numero = f.numero
            and d.canti > 0
            and f.numero not in (55022092, 55022096, 55022097, 55022095, 55022091)
         ) x
 group by x.ano, x.mes;


-- Detale facturacion módulo embarque
  with detalle as (
    select to_char(v.fecha, 'yyyy') as ano
         , to_char(v.fecha, 'mm') as mes
         , v.tipodoc
         , v.serie
         , v.numero as numero
         , (decode(v.moneda, 'D', v.imp_neto, round(v.imp_neto / v.import_cam, 2))) as total
         , (decode(v.origen, 'EXPO', 0, decode(v.moneda, 'D', v.imp_neto,
                                               round(v.imp_neto / v.import_cam, 2)))) as total_nac
         , (decode(v.origen, 'EXPO',
                   decode(v.moneda, 'D', v.imp_neto, round(v.imp_neto / v.import_cam, 2)),
                   0)) as total_expo
      from v_docuvent v
     where v.estado <> '9' and not (v.tipodoc = '01' and v.origen = 'EXPO')
       and not exists (
       select 1
         from v_docuvent x
        where x.tipodoc = '07'
          and x.serie = 'F056'
          and x.numero in ('6983', '6982', '6984', '6979', '6981')
          and x.tipodoc = v.tipodoc
          and x.serie = v.serie
          and x.numero = v.numero
       )
     union all
    select to_char(f.fecha, 'YYYY') as ano
         , to_char(f.fecha, 'MM') as mes
         , f.tipodoc
         , f.serie
         , f.numero
         , (decode(nvl(d.merca, 0), 0, decode(nvl(d.fob, 0), 0, d.totlin, d.fob),
                   nvl(d.merca, 0))) as total
         , 0 as total_nac
         , (decode(nvl(d.merca, 0), 0, decode(nvl(d.fob, 0), 0, d.totlin, d.fob),
                   nvl(d.merca, 0))) as total_xpo
      from exfacturas f
         , exfactura_d d
     where f.estado <> '9'
       and d.numero = f.numero
       and d.canti > 0
       and f.numero not in (55022092, 55022096, 55022097, 55022095, 55022091)
    )
select d.ano, d.mes, d.tipodoc, d.serie, d.numero, d.total_expo
--   select sum(d.total_expo)
  from detalle d
 where ano = 2026
   and mes = 2
   and d.total_expo is not null
   and d.total_expo <> 0;


select per.c_codigo
     , per.apellido_paterno || ' ' || per.apellido_materno || ', ' || per.nombres as nombre
     , per.conini
     , per.confin
     , per.clase
  from planilla10.personal per
     , planilla10.tar_encarga enc
 where per.encargado = enc.codigo
   and enc.c_codigo = :id_evaluador
   and per.situacion not in ('8', '9')
   and per.c_codigo not in (
   select id_personal
     from cese_personal
   )
   and to_char(per.confin, 'MM') = to_char(sysdate, 'MM')
   and pevisa.sf_eval(per.c_codigo, trunc(last_day(sysdate))) is null
 order by per.apellido_paterno;

select *
  from tmp_pedidos_30
 where numero = 17151;


select *
  from pr_consul
 where pedido = 17151;

select *
  from expedidos
 where numero = 17151;

select usuario_30 from exparamexpo;

select *
  from grupo_cliente_cliente
 where cod_cliente = '996057';

select *
  from view_pedidos_pendientes_38
 where id_pedido = 17151;

select ex.cod_vende as id_vendedor, t.descripcion as nombre_vendedor, e.numero as id_pedido, e.fecha
     , nvl(gc.dsc_grupo, ex.nombre) as nombre
     , (nvl(tmp.n1, 0) + nvl(tmp.n2, 0) + nvl(tmp.n3, 0) + nvl(tmp.n4, 0) + nvl(tmp.n8, 0) +
        nvl(tmp.n13, 0))
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
     , grupo_cliente_cliente gcc
     , grupo_cliente gc
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
   and e.cod_cliente = gcc.cod_cliente(+)
   and gc.cod_grupo(+) = gcc.cod_grupo
   and e.numero = 17151;

-- ???????????

select * from locales;

select *
  from almacenes
 where cod_alm = '76';

select *
  from almacen
 where cod_alm = '76'
   and stock > 0;

select *
  from articul
 where cod_art = 'THYR2436';

select *
  from almacenes
 where cod_alm = '31';


-- autozone 1 codigo por caja
-- otros clientes también

-- OA deberia imprimir notas, observaciones del cliente
-- notas AUTOZONE no mezclar item por caja
-- cuantas piezas de ese item unico van en la caja

-- en el pedido fecha del cliente, detalle

select *
  from pr_embarques
 where id_pedido = 17211;

select *
  from pr_embarques
 where ano_embarque = 2026
   and mes_embarque = 4;

select *
  from exclientes_detalle
 where texto like '%MEZCLAR%';