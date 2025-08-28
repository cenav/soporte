-- pedido que no se ve AutoZone 16755, 16794, 16787

select *
  from exbooking_d
 where numero_booking = 'AER-113';

select *
  from exfacturas
 where numero in (
   55019734
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
 where numero = 20202;

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

select nvl(t.abreviada, 'OFICINA') as p_vende
     , nvl(e.zona, '00') as vende
     , to_char(e.fecha, 'YYYY') as p_ano
     , to_char(e.fecha, 'MM') as p_mes
     , e.numero
     , p.zona
     , p.abrevia
     , e.nombre
     , e.cod_cliente
     , sum(round(d.preuni * d.canti / e.fflete, 2)) as total
  from expedidos e
     , expedido_d d
     , expaises p
     , exclientes c
     , extablas_expo t
 where d.numero = e.numero
   and nvl(d.id, '0') = '0'
   and e.pais like '%'
   and e.cod_cliente like '%'
   and (nvl(e.estado, '0') <> '9'
   and nvl(e.estado, '0') <> '85')
   and (not (nvl(e.estado, '0') = '8' and nvl(e.zona, '00') = '00'))
   and p.pais(+) = e.pais
   and c.cod_cliente = e.cod_cliente
   and t.tipo = '13'
   and t.codigo(+) = nvl(e.zona, '00')
   and nvl(e.tipo, '0') <> '04'
   and extract(year from e.fecha) = 2025
   and extract(month from e.fecha) = 8
   and e.zona = '02'
 group by nvl(t.abreviada, 'OFICINA')
        , nvl(e.zona, '00')
        , to_char(e.fecha, 'YYYY')
        , to_char(e.fecha, 'MM')
        , e.numero
        , p.zona
        , p.abrevia
        , e.nombre
        , e.cod_cliente
;
