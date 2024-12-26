select c.serie
     , c.numero
     , c.fecha
     , c.fondo_asignado
     , (
  select sum(importe)
    from caja_chica_d
   where serie = c.serie
     and numero = c.numero
  )
  as total_importe
     , (c.fondo_asignado
  - (
          select sum(importe)
            from caja_chica_d
           where serie = c.serie
             and numero = c.numero
          ))
  as saldo
     , d.item
     , d.codigo_motivo
     , (
  select descripcion
    from caja_chica_motivos
   where codigo_motivo = d.codigo_motivo
  )
  as desc_motivo
     , d.detalle
     , d.fecha_registro
     , d.ruta
     , d.codigo_relacion
     , (
  select nombres || ' ' || apellido_paterno || ' ' || apellido_materno
    from planilla10.personal
   where c_codigo = d.codigo_relacion
  )
  as nombre
     , d.tipo_referencia
     , d.serie_referencia
     , d.nro_referencia
     , d.fecha_referencia
     , d.importe
     , d.importe_d
     , d.afecto
     , d.inafecto
     , d.igv
  from caja_chica c
     , caja_chica_d d
 where c.serie = d.serie
   and c.numero = d.numero
   and d.fecha_registro >= :p_fecha_del
   and d.fecha_registro <= :p_fecha_al
   and (d.codigo_motivo = 'M1'
   or c.caja_de_movilidad = 'S')
 order by c.numero
        , d.item;

select *
  from caja_chica
 where serie = 4
   and numero = 230029;

select *
  from caja_chica_d
 where serie = 4
   and numero = 230029
   and codigo_relacion = 'E1044';

select *
  from caja_chica_d
 where serie = 7
   and numero = 22264
   and codigo_relacion = 'E1122';

select *
  from movfigl
 where ano = 2023
   and mes = 3
   and tipo = '2'
   and voucher = 32051;

create or replace view vw_caja_chica_sunat as
  with importe_cjca as (
    select serie, numero, sum(importe) as importe_total
      from caja_chica_d
     group by serie, numero
    )
select c.serie, c.numero, c.fecha, c.fondo_asignado, d.moneda
     , i.importe_total, c.fondo_asignado - i.importe_total as saldo
     , d.item, d.codigo_motivo, m.descripcion as dsc_motivo, d.detalle
     , d.fecha_registro, d.ruta, d.codigo_relacion
     , p.nombres || ' ' || p.apellido_paterno || ' ' || p.apellido_materno as nombre
     , d.tipo_referencia, d.serie_referencia, d.nro_referencia, d.fecha_referencia
     , d.importe, d.importe_d, d.afecto, d.inafecto, d.igv, m.cuenta_contable
     , f.ano as ano_caja, f.mes as mes_caja, f.tipo as tipo_caja, f.voucher as voucher_caja
     , f.fecha as fch_caja
     , g.ano as ano_cont, g.mes as mes_cont, g.libro as libro_cont, g.voucher as voucher_cont
     , g.fecha as fch_cont
  from caja_chica c
       join caja_chica_d d
            on c.serie = d.serie
              and c.numero = d.numero
       join importe_cjca i
            on c.serie = i.serie
              and c.numero = i.numero
       left join caja_chica_motivos m
                 on d.codigo_motivo = m.codigo_motivo
       left join planilla10.personal p
                 on d.codigo_relacion = p.c_codigo
       left join movfigl f
                 on d.ano = f.ano
                   and d.mes = f.mes
                   and d.libro_caja = f.tipo
                   and d.voucher_caja = f.voucher
       left join movglos g
                 on f.ano = g.ano
                   and f.mes = g.mes
                   and g.libro = '10'
                   and f.nro_voucher = g.voucher
 where (d.codigo_motivo = 'M1' or c.caja_de_movilidad = 'S')
 order by c.numero, d.item;

select codigo_relacion, nombre, fecha, detalle, ruta, serie, numero, moneda, importe
     , cuenta_contable, fch_cont, ano_cont, mes_cont, libro_cont, voucher_cont
  from vw_caja_chica_sunat
 where fecha between :p_fecha_del and :p_fecha_al
   and serie = 4
   and numero = 230029
   and codigo_relacion = 'E1044';