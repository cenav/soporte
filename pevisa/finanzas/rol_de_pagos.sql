select user as usuario
     , pro.nombre as proveedor_desc
     , 'PTMO. '
  || decode(bco.moneda, 'S', 'S/.', 'US$')
  || ' '
  || ltrim(to_char(bco.importe_prestamo, '99,999,990.00'))
  || ' ('
  || to_char(bco.fecha, 'DD/MM/YY')
  || ')'
  as descripcion
     , case when bco.cod_tipo_prestamo = 'LS' then 'LEASING' else 'PAGARE' end as tipo_prestamo
     , tde.descripcion as tipo_derivado
     , bco.cod_prestamo
     , bco.moneda
     , mon.simbolo as moneda_desc
     , bco.importe_prestamo
     , bco.tasa_interes
     , (
  select count(pbc.nro_cuota)
    from prestamo_banco pb
         join prestamo_banco_cuota pbc
              on (pb.cod_banco = pbc.cod_banco
                and pb.cod_prestamo = pbc.cod_prestamo)
   where pb.cod_banco = bco.cod_banco
     and pb.cod_prestamo = bco.cod_prestamo
  )
  as total_cuotas
     , pkg_deuda_bancos.cuotas_canc_a_fecha(bco.cod_banco, bco.cod_prestamo) as cuotas_pagadas
     , (
         select count(pbc.nro_cuota)
           from prestamo_banco pb
                join prestamo_banco_cuota pbc
                     on (pb.cod_banco = pbc.cod_banco
                       and pb.cod_prestamo = pbc.cod_prestamo)
          where pb.cod_banco = bco.cod_banco
            and pb.cod_prestamo = bco.cod_prestamo
         )
  - pkg_deuda_bancos.cuotas_canc_a_fecha(bco.cod_banco, bco.cod_prestamo)
  as cuotas_pendientes
     , cuo.nro_cuota
  || '/'
  || (
         select count(pbc.nro_cuota)
           from prestamo_banco pb
                join prestamo_banco_cuota pbc
                     on (pb.cod_banco = pbc.cod_banco
                       and pb.cod_prestamo = pbc.cod_prestamo)
          where pb.cod_banco = bco.cod_banco
            and pb.cod_prestamo = bco.cod_prestamo
         )
  as cuota_info
     , bco.cod_proveedor
     , pag.tipdoc
     , aux.abreviada as doc_desc
     , pag.serie_num
     , pag.numero
     , (
  select max(pbc.fecha_vcto)
    from prestamo_banco_cuota pbc
   where pbc.cod_banco = bco.cod_banco
     and pbc.cod_prestamo = bco.cod_prestamo
  )
  as fecha_ult_cuota
     , cuo.fecha_vcto as fecha_vcto
     , pag.tcam_imp as cambio
     , abs(pag.pventa) as importe
     , abs(pag.saldo) as saldo
     , abs(
    case bco.contrato_derivado
      when 'S' then (der.importe_cuota)
      else (case pag.moneda
              when 'D' then cuo.importe_cuota
              else round(cuo.importe_cuota / pag.tcam_sal, 2)
            end)
    end
       )
  as importe_equidol
     , abs(
    case bco.contrato_derivado
      when 'S' then (case pag.saldo when 0 then 0 else der.importe_cuota end)
      else (case pag.moneda when 'D' then pag.saldo else round(pag.saldo / pag.tcam_sal, 2) end)
    end
       )
  as saldo_equidol
     , pkg_deuda_bancos.calcula_saldo_dol(bco.cod_banco, bco.cod_prestamo) as saldo_equidol_total
     , (
  select min(pbc.fecha_vcto)
    from prestamo_banco_cuota pbc
   where pbc.cod_banco = bco.cod_banco
     and pbc.cod_prestamo = bco.cod_prestamo
  )
  as primera_cuota
     , row_number() over (partition by bco.cod_proveedor, bco.cod_prestamo order by cuo.fecha_vcto) as bco_rn
  from prestamo_banco bco
       left join vw_prestamo_banco_cuota cuo
                 on (bco.cod_banco = cuo.cod_banco
                   and bco.cod_prestamo = cuo.cod_prestamo
                   and cuo.fecha_vcto between :g_fecha_ini and :g_fecha_fin)
       left join factpag pag
                 on (cuo.cod_proveedor = pag.cod_proveedor
                   and cuo.tipdoc = pag.tipdoc
                   and cuo.serie_num = pag.serie_num
                   and cuo.numero = pag.numero
                   and pag.estado != '9')
       left join contrato_derivado cde
                 on (cuo.cod_banco = cde.cod_banco
                   and cuo.cod_prestamo = cde.cod_prestamo)
       left join contrato_derivado_cuota der
                 on (cde.cod_banco = der.cod_banco
                   and cde.cod_prestamo = der.cod_prestamo
                   and cuo.nro_cuota = der.nro_cuota)
       left join derivado_prestamo_banco tde on (cde.cod_derivado = tde.cod_derivado)
       left join proveed pro on (bco.cod_proveedor = pro.cod_proveed and pro.origen = 'N')
       left join tablas_auxiliares aux
                 on (pag.tipdoc = aux.codigo
                   and aux.tipo = 2)
       left join moneda mon on (bco.moneda = mon.id_moneda)
 where pkg_deuda_bancos.calcula_saldo(bco.cod_banco, bco.cod_prestamo, :g_fecha_fin) * -1 > 1
   and bco.fecha <= :g_fecha_fin
   and exists
   (
     select 1
       from tab_bancos tab
      where tab.cod_proveed = bco.cod_proveedor
     )
   and bco.cod_tipo_prestamo != 'LS'
 order by proveedor_desc
        , fecha_vcto;

alter table tmp_deuda_bancos
  add mas_de_una_cuota_en_mes number(4);

declare
  l_saldo number;
begin
  pkg_deuda_bancos.genera_cuadro(2024, 4);
  l_saldo := pkg_deuda_bancos.calcula_saldo_dol('02', '3484117');
  dbms_output.put_line(l_saldo);
end;

select *
  from tmp_deuda_bancos
 where usuario = user
   and tipo_prestamo = 'PAGARE'
   and proveedor_desc = 'BANCO DE CREDITO DEL PERU'
   and mas_de_una_cuota_en_mes = 1;

select pkg_deuda_bancos.calcula_saldo_dol('02', '3484117') from dual;

select *
  from prestamo_banco
 where cod_prestamo = '3484117';


-- saldos
select tmp.proveedor_desc as res_nombre
     , tmp.tipo_prestamo as res_tipo
     , sum(tmp.saldo_equidol_total) as res_saldo
  from tmp_deuda_bancos tmp
 where tmp.usuario = user
   and tmp.tipo_prestamo != 'SALDO BANCOS'
 group by tmp.proveedor_desc
        , tmp.tipo_prestamo
 order by tmp.proveedor_desc
        , tmp.tipo_prestamo;

select bco.cod_banco
     , bco.cod_prestamo
     , bco.moneda as moneda_bco
     , bco.contrato_derivado
     , cuo.nro_cuota
     , f.cod_proveedor
     , f.tipdoc
     , f.serie_num
     , f.numero
     , f.moneda
     , f.pventa
     , f.pventax
     , nvl(decode(f.moneda, 'D', f.pventa, f.pventax), 0) as dolares_doc
     , nvl(sum(decode(c.moneda, 'D', c.importe, c.importe_x)), 0) as dolares_canc
     , nvl(decode(f.moneda, 'D', f.pventa, f.pventax), 0) +
       nvl(sum(decode(c.moneda, 'D', c.importe, c.importe_x)), 0) as saldo_dolar
     ,
  nvl(f.pventa, 0) + nvl(sum(case when f.moneda = c.moneda then c.importe else 0 end), 0) as saldo
  from prestamo_banco bco
       join prestamo_banco_cuota cuo
            on (bco.cod_banco = cuo.cod_banco
              and bco.cod_prestamo = cuo.cod_prestamo)
       left join factpag f
                 on (bco.cod_proveedor = f.cod_proveedor
                   and bco.tipdoc = f.tipdoc
                   and cuo.serie_num = f.serie_num
                   and cuo.numero = f.numero)
       left join cabfpag c
                 on (f.cod_proveedor = c.cod_proveedor
                   and f.tipdoc = c.tipdoc
                   and f.serie_num = c.serie_num
                   and f.numero = c.numero
                   and c.fecha <= :p_al)
 where bco.cod_banco = :p_cod_banco
   and bco.cod_prestamo = :p_cod_prestamo
 group by bco.cod_banco
        , bco.cod_prestamo
        , bco.moneda
        , bco.contrato_derivado
        , cuo.nro_cuota
        , f.cod_proveedor
        , f.tipdoc
        , f.serie_num
        , f.numero
        , f.moneda
        , f.pventa
        , f.pventax
 order by f.serie_num;


  with letras_descuento as (
    select f.tipdoc as tipdoc
         , auxdoc.descripcion as nombre_doc
         , b.banco as banco
         , pro.nombre as nombre_bco
         , f.cod_cliente
         , f.serie_num
         , f.numero
         , f.moneda
         , f.importe
         , f.importex
         , f.tcam_sal
         , f.f_vencto
         , nvl(decode(f.moneda, 'D', f.importe, f.importe / f.tcam_sal), 0) as importe_dolar
         , sum(cob.importe) as cancelacion
         , nvl(sum(decode(cob.moneda, 'D', cob.importe, cob.importe_x)),
               0) as cancelacion_dolar
         , nvl(f.importe + nvl(sum(cob.importe), 0), 0) as saldo_a_fecha
      from factcob f
           left join ctabnco b on (f.banco = b.codigo)
           left join plancta p on (b.cuenta = p.cuenta)
           left join clientes c on (f.cod_cliente = c.cod_cliente)
           left join tablas_auxiliares auxdoc
                     on (f.tipdoc = auxdoc.codigo
                       and auxdoc.tipo = 2)
           left join tablas_auxiliares auxbco
                     on (b.banco = auxbco.codigo
                       and auxbco.tipo = 11)
           left join proveed pro on (auxbco.obs = pro.cod_proveed)
           left join cabfcob cob
                     on (f.tipdoc = cob.tipdoc
                       and f.serie_num = cob.serie_num
                       and f.numero = cob.numero
                       and cob.fecha <= :g_fecha_fin)
     where f.tipdoc = 'LD'
       and f.estado != '9'
       and f.f_vencto between :g_fecha_ini and last_day(add_months(:g_fecha_ini, :c_meses_hacia_adelante))
     group by f.tipdoc
            , auxdoc.descripcion
            , b.banco
            , pro.nombre
            , f.cod_cliente
            , f.serie_num
            , f.numero
            , f.moneda
            , f.importe
            , f.importex
            , f.tcam_sal
            , f.f_vencto
    having nvl(f.importe + nvl(sum(cob.importe), 0), 0) != 0
     order by numero
    )
select user
     , ld.tipdoc
     , ld.nombre_doc
     , ld.banco
     , ld.nombre_bco
     , count(*) as cant_tot
     , count(case
               when ld.f_vencto between add_months(:g_fecha_ini, 0) and last_day(add_months(:g_fecha_ini, 0))
                 then 1
               else null
             end)
  as cant_mes_0
     , count(case
               when ld.f_vencto between add_months(:g_fecha_ini, 1) and last_day(add_months(:g_fecha_ini, 1))
                 then 1
               else null
             end)
  as cant_mes_1
     , count(case
               when ld.f_vencto between add_months(:g_fecha_ini, 2) and last_day(add_months(:g_fecha_ini, 2))
                 then 1
               else null
             end)
  as cant_mes_2
     , count(case
               when ld.f_vencto between add_months(:g_fecha_ini, 3) and last_day(add_months(:g_fecha_ini, 3))
                 then 1
               else null
             end)
  as cant_mes_3
     , round(sum(ld.importe_dolar + ld.cancelacion_dolar), 2) as saldo_tot
     , round(
    sum(
        case
          when ld.f_vencto between add_months(:g_fecha_ini, 0) and last_day(add_months(:g_fecha_ini, 0))
            then
            ld.importe_dolar + ld.cancelacion_dolar
          else
            0
        end
    )
  , 2
       )
  as saldo_mes_0
     , round(
    sum(
        case
          when ld.f_vencto between add_months(:g_fecha_ini, 1) and last_day(add_months(:g_fecha_ini, 1))
            then
            ld.importe_dolar + ld.cancelacion_dolar
          else
            0
        end
    )
  , 2
       )
  as saldo_mes_1
     , round(
    sum(
        case
          when ld.f_vencto between add_months(:g_fecha_ini, 2) and last_day(add_months(:g_fecha_ini, 2))
            then
            ld.importe_dolar + ld.cancelacion_dolar
          else
            0
        end
    )
  , 2
       )
  as saldo_mes_2
     , round(
    sum(
        case
          when ld.f_vencto between add_months(:g_fecha_ini, 3) and last_day(add_months(:g_fecha_ini, 3))
            then
            ld.importe_dolar + ld.cancelacion_dolar
          else
            0
        end
    )
  , 2
       )
  as saldo_mes_3
     , 0 as porc_participacion
  from letras_descuento ld
 group by ld.tipdoc
        , ld.nombre_doc
        , ld.banco
        , ld.nombre_bco;

select to_date('01/05/2024', 'dd/mm/yyyy'), to_date('31/05/2024', 'dd/mm/yyyy') from dual;

  with letras_descuento as (
    select f.tipdoc as tipdoc
         , auxdoc.descripcion as nombre_doc
         , b.banco as banco
         , pro.nombre as nombre_bco
         , f.cod_cliente
         , f.serie_num
         , f.numero
         , f.moneda
         , f.importe
         , f.importex
         , f.tcam_sal
         , f.f_vencto
         , nvl(decode(f.moneda, 'D', f.importe, f.importe / f.tcam_sal), 0) as importe_dolar
         , sum(cob.importe) as cancelacion
         , nvl(sum(decode(cob.moneda, 'D', cob.importe, cob.importe_x)),
               0) as cancelacion_dolar
         , nvl(f.importe + nvl(sum(cob.importe), 0), 0) as saldo_a_fecha
      from factcob f
           left join ctabnco b on (f.banco = b.codigo)
           left join plancta p on (b.cuenta = p.cuenta)
           left join clientes c on (f.cod_cliente = c.cod_cliente)
           left join tablas_auxiliares auxdoc
                     on (f.tipdoc = auxdoc.codigo
                       and auxdoc.tipo = 2)
           left join tablas_auxiliares auxbco
                     on (b.banco = auxbco.codigo
                       and auxbco.tipo = 11)
           left join proveed pro on (auxbco.obs = pro.cod_proveed)
           left join cabfcob cob
                     on (f.tipdoc = cob.tipdoc
                       and f.serie_num = cob.serie_num
                       and f.numero = cob.numero
                       and cob.fecha <= :g_fecha_fin)
     where f.tipdoc = 'LD'
       and f.estado != '9'
       and f.f_vencto between :g_fecha_ini and last_day(add_months(:g_fecha_ini, :c_meses_hacia_adelante))
     group by f.tipdoc
            , auxdoc.descripcion
            , b.banco
            , pro.nombre
            , f.cod_cliente
            , f.serie_num
            , f.numero
            , f.moneda
            , f.importe
            , f.importex
            , f.tcam_sal
            , f.f_vencto
    having nvl(f.importe + nvl(sum(cob.importe), 0), 0) != 0
     order by numero
    )
select user
     , ld.tipdoc
     , ld.nombre_doc
     , ld.banco
     , ld.nombre_bco
     , count(*) as cant_tot
     , count(case
               when ld.f_vencto between add_months(:g_fecha_ini, 0) and last_day(add_months(:g_fecha_ini, 0))
                 then 1
               else null
             end)
  as cant_mes_0
     , count(case
               when ld.f_vencto between add_months(:g_fecha_ini, 1) and last_day(add_months(:g_fecha_ini, 1))
                 then 1
               else null
             end)
  as cant_mes_1
     , count(case
               when ld.f_vencto between add_months(:g_fecha_ini, 2) and last_day(add_months(:g_fecha_ini, 2))
                 then 1
               else null
             end)
  as cant_mes_2
     , count(case
               when ld.f_vencto between add_months(:g_fecha_ini, 3) and last_day(add_months(:g_fecha_ini, 3))
                 then 1
               else null
             end)
  as cant_mes_3
     , round(sum(ld.importe_dolar + ld.cancelacion_dolar), 2) as saldo_tot
     , round(
    sum(
        case
          when ld.f_vencto between add_months(:g_fecha_ini, 0) and last_day(add_months(:g_fecha_ini, 0))
            then
            ld.importe_dolar + ld.cancelacion_dolar
          else
            0
        end
    )
  , 2
       )
  as saldo_mes_0
     , round(
    sum(
        case
          when ld.f_vencto between add_months(:g_fecha_ini, 1) and last_day(add_months(:g_fecha_ini, 1))
            then
            ld.importe_dolar + ld.cancelacion_dolar
          else
            0
        end
    )
  , 2
       )
  as saldo_mes_1
     , round(
    sum(
        case
          when ld.f_vencto between add_months(:g_fecha_ini, 2) and last_day(add_months(:g_fecha_ini, 2))
            then
            ld.importe_dolar + ld.cancelacion_dolar
          else
            0
        end
    )
  , 2
       )
  as saldo_mes_2
     , round(
    sum(
        case
          when ld.f_vencto between add_months(:g_fecha_ini, 3) and last_day(add_months(:g_fecha_ini, 3))
            then
            ld.importe_dolar + ld.cancelacion_dolar
          else
            0
        end
    )
  , 2
       )
  as saldo_mes_3
     , 0 as porc_participacion
  from letras_descuento ld
 group by ld.tipdoc
        , ld.nombre_doc
        , ld.banco
        , ld.nombre_bco;
