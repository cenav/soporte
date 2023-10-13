-- pevisa pagos
select m.ecodigo, f_cliente_nombre(m.ecodigo) as nombre_cliente, m.etipo, m.eserie, m.enumero
     , f.cond_pag, get_cond_pago(f.cond_pag) as descri_condpago, f.vended, f.fecha, f.f_vencto
     , g.fecha as fecha_pago, m.cargo_d, m.abono_d, trunc(g.fecha - f.f_vencto) as dias
  from movfide m
     , factcob f
     , movfigl g
 where m.ano = 2023
   and m.mes between 7 and 8
   and m.estado <> 9
   and m.ecodigo = f.cod_cliente
   and m.etipo = f.tipdoc
   and m.eserie = f.serie_num
   and m.enumero = f.numero
   and m.ano = g.ano
   and m.mes = g.mes
   and m.tipo = g.tipo
   and m.voucher = g.voucher;

select p.fecha_envio
  from pedido_flujo p
     , relacion r
 where p.serie = r.serie
   and p.num_ped = r.numero
   and r.tipo = 'P'
   and r.tipo_rel in ('A', 'F')
   and r.tipodoc_rel = '01'
   and r.serie_rel = 'F050'
   and r.numero_rel = 181485
   and p.codigo_area = '10';

select *
  from relacion
 where serie = 20
   and numero = 226461
   and tipo = 'P' and tipo_rel in ('A', 'F');

-- relacion.serie=pedido.serie and
-- relacion.numero=pedido.num_ped