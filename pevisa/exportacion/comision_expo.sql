-- resumen comision expo
select r.ano, r.mes, r.vendedor, t.descripcion as nombre, r.tipo, r.descripcion, r.fecha_registro
     , r.importe, r.moneda_comision, r.comision, r.incentivo
  from excomision_resumen r
       join extablas_expo t on r.vendedor = t.codigo and t.tipo = '13'
 where r.ano = 2025
 order by r.ano, r.mes, r.vendedor;

-- resumen comision planilla
select c.ano, c.mes, c.cod_personal, c.cod_vendedor, v.nombre, c.importe_comision, c.fecha_registro
     , c.moneda, c.importe_incentivo, c.origen
  from comisiones_planilla c
       join vendedores v on c.cod_vendedor = v.cod_vendedor
 where c.ano = 2025
   and c.origen = 'EXPO'
 order by c.ano, c.mes, c.cod_personal;

select *
  from extablas_expo
 where tipo = 13;

select *
  from v_docuvent_ano
 where ano = 2025;

select *
  from exfacturas
 where numero = 55022092;

select *
  from v_docuvent
 where tipodoc = '07'
   and serie = 'F056'
   and numero = '6983';

select 1
  from factcob x
 where x.tipdoc = '07'
   and x.serie_num = 'F056'
   and x.numero = '6983';

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
select sum(detalle.total_expo)
  from detalle
 where ano = 2025
   and mes = 2;

select r.ano, r.mes, v.cod_personal, v.cod_vendedor
     , sum(decode(nvl(r.incentivo, 'N'), 'N', r.comision, 'S', 0)) as comision
     , sum(decode(nvl(r.incentivo, 'N'), 'S', r.comision, 'N', 0)) as incentivo
     , sysdate, :p_moneda, 'EXPO'
  from excomision_resumen r
     , extablas_expo t
     , vendedores v
 where r.vendedor = t.codigo
   and t.lista_pre = v.cod_vendedor
   and t.tipo = '13'
   and t.codigo <> '....'
   and r.ano = :ano
   and r.mes = :mes
 group by r.ano, r.mes, v.cod_personal, v.cod_vendedor, sysdate, :p_moneda, 'EXPO';


select *
  from excomision_resumen
 where ano = 2026
   and mes = 6
   and vendedor = '02'
   and incentivo = 'N';

select *
  from comisiones_planilla
 where ano = 2026
   and mes = 6
   and origen = 'EXPO';

select numero, fecha, nombre, tbruto, cod_cliente, zona as vendedor, packing_agrupar
  from exproformas
 where estado not in ('8', '9')
   and numero = 20642
 order by numero desc;