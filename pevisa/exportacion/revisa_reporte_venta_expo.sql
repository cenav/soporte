-- reporte facturas neto
-- REC.IMP_NETO + NVL(REC.IMP_GASTOS,0) + NVL(REC.IMP_DESCTO, 0) + NVL(REC.IMP_FLETES, 0) + NVL(REC.IMP_SEGUROS, 0)
-- 1863375.56
select d.tipodoc, d.serie, d.numero, d.cond_pag, d.fecha, t.obs as pais, d.nombre, d.imp_neto
     , d.imp_igv, d.precio_vta, d.imp_fletes, d.imp_seguros, d.imp_gastos, d.imp_descto, f_vencto
     , imp_neto + nvl(imp_gastos, 0) + nvl(imp_descto, 0) + nvl(imp_fletes, 0) + nvl(imp_seguros, 0) as total
  from docuvent d
     , clientes c
     , tablas_auxiliares t
 where d.cod_cliente = c.cod_cliente
   and c.pais (+) = t.codigo
   and t.tipo = 25 and d.estado <> 9
--    and d.tipodoc = '01'
   and nvl(d.origen, '0') = 'EXPO'
   and d.fecha between :FECHA1 and :FECHA2
   and c.cod_cliente like :CLIENTE
   and c.pais like :PAIS
 order by 5, 6, 7;

-- reporte facturas mensuales
select nvl(t.abreviada, 'OFICINA') as p_vende, nvl(e.cod_vende, '00') as vende
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
--    and e.tipodoc = '01'
   and e.origen = 'EXPO'
   and c.cod_cliente = e.cod_cliente
   and t.tipo = '13'
   and t.lista_pre(+) = nvl(e.cod_vende, '00')
 group by nvl(t.abreviada, 'OFICINA'), nvl(e.cod_vende, '00')
 order by 1;


select nvl(t.abreviada, 'OFICINA') as p_vende, nvl(e.zona, '00') as vende
     , sum(decode(to_char(e.fecha, 'MM'), '01', pr_tmerca(e.numero), 0)) as ene
     , sum(decode(to_char(e.fecha, 'MM'), '02', pr_tmerca(e.numero), 0)) as feb
     , sum(decode(to_char(e.fecha, 'MM'), '03', pr_tmerca(e.numero), 0)) as mar
     , sum(decode(to_char(e.fecha, 'MM'), '04', pr_tmerca(e.numero), 0)) as abr
     , sum(decode(to_char(e.fecha, 'MM'), '05', pr_tmerca(e.numero), 0)) as may
     , sum(decode(to_char(e.fecha, 'MM'), '06', pr_tmerca(e.numero), 0)) as jun
     , sum(decode(to_char(e.fecha, 'MM'), '07', pr_tmerca(e.numero), 0)) as jul
     , sum(decode(to_char(e.fecha, 'MM'), '08', pr_tmerca(e.numero), 0)) as ago
     , sum(decode(to_char(e.fecha, 'MM'), '09', pr_tmerca(e.numero), 0)) as sep
     , sum(decode(to_char(e.fecha, 'MM'), '10', pr_tmerca(e.numero), 0)) as oct
     , sum(decode(to_char(e.fecha, 'MM'), '11', pr_tmerca(e.numero), 0)) as nov
     , sum(decode(to_char(e.fecha, 'MM'), '12', pr_tmerca(e.numero), 0)) as dic
  from exfacturas e
     , exclientes c
     , extablas_expo t
 where to_char(e.fecha, 'YYYY') = :P_ANO
   and nvl(e.estado, '0') <> '9'
   and c.cod_cliente = e.cod_cliente
   and t.tipo = '13'
   and e.fecemb is not null
   and t.codigo(+) = nvl(e.zona, '00')
 group by nvl(t.abreviada, 'OFICINA'), nvl(e.zona, '00');
