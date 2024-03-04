  with detalle as (
    select g.ano, g.mes, g.libro, g.voucher, m.item, lpad(m.item,4,'0') as item2, g.tipo_referencia, g.serie, g.nro_referencia
         , g.glosa, g.fecha as fecha_comprobante, m.abono_d, m.abono_s, m.ano as ano_g, m.cargo_d
         , m.cargo_s, m.columna, m.cuenta, substr(m.cuenta, 1, nivel1)
      || decode(substr(m.cuenta, nivel1 + 1, nivel2 - nivel1), null, ' ',
                '.' || substr(m.cuenta, nivel1 + 1, nivel2 - nivel1))
      || decode(substr(m.cuenta, nivel2 + 1, nivel3 - nivel2), null, ' ',
                '.' || substr(m.cuenta, nivel2 + 1, nivel3 - nivel2))
      || decode(substr(m.cuenta, nivel3 + 1, nivel4 - nivel3), null, ' ',
                '.' || substr(m.cuenta, nivel3 + 1, nivel4 - nivel3))
      || decode(substr(m.cuenta, nivel4 + 1, nivel5 - nivel4), null, ' ',
                '.' || substr(m.cuenta, nivel4 + 1, nivel5 - nivel4))
      as cuenta_fmt
         , p.descripcion, m.detalle, m.estado, m.fecha, m.tipo_cambio
         , m.tipo_referencia as tipo_referencia_d, m.serie as serie_referencia_d
         , m.nro_referencia as nro_referencia_d, m.tipo_relacion, m.relacion as codigo_relacion
         , decode(
        p.moneda, 'D', decode(m.cargo_d, 0, m.abono_d, m.cargo_d), null) as dol
         , p.moneda
         , m.libro as libro_mov, g.cod_proveed
      from movdeta_cua m
         , movglos g
         , plancta p
         , paramco
     where m.estado = 1
       and g.ano = :P_ANO
       and g.mes >= decode(:P_MES, 1, 0, :P_MES)
       and g.mes <= :P_MES
       and m.voucher between 1 and 9999999999
--AND M.LIBRO IN ('48')
--AND M.VOUCHER = 110081
       and m.ano = g.ano
       and m.mes = g.mes
       and m.libro = g.libro
       and m.voucher = g.voucher
       and m.cuenta = p.cuenta
       and (m.cargo_s + m.abono_s) > 0
--    and m.ano = 2023
--    and m.mes = 11
--    and m.libro = '09'
--    and m.voucher in (110005)
     order by m.item, m.ano, m.mes, m.libro, m.voucher, decode(m.generado, 'G', 'Z', 'A')
            , decode(m.abono_s, 0, 0, 1), m.cuenta, decode(m.cargo_s, 0, 0, 1), m.cuenta
    )
select *
  from detalle
 where ano = 2023
   and mes = 11
   and libro = '09'
   and voucher = 110005
 order by item;

  select *
    from movdeta_cua
   where ano = 2023
     and mes = 11
     and libro = '09'
     and voucher = 110005
   order by item;
