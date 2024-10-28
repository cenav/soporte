-- planilla de anticipos / OC
select *
  from orden_de_compra
 where trunc(fecha_aprobacion + f_condicion_pago_dias(cond_pag)) >= :del
   and trunc(fecha_aprobacion + f_condicion_pago_dias(cond_pag)) <= :al
   and estado >= '2' and estado < '7'
   and moneda = :moneda
   and tot_orden <> nvl(total_facturado, 0)
   and fecha > (sysdate - 1365)
   and forma_de_pago = :forma_de_pago
   and length(cod_proveed) in (8, 11)
   and serie <> 20
   and serie = 4
   and num_ped = 62356
   and codigo_grupo_compra in (
   select lg.codigo_grupo_compra
     from lg_grupos_compras lg
    where lg.codigo_grupo_compra = orden_de_compra.codigo_grupo_compra
      and lg.pago_desde_la_orden = 1
   )
   and nvl(tot_orden, 0) > nvl(
     (
       select sum(i.importe_cancelacion)
         from pagos_h h
            , pagos_i i
        where h.serie_planilla = i.serie_planilla
          and h.numero_planilla = i.numero_planilla
          and i.serie_planilla in (11, 12)
          and h.estado <> '9'
          and i.cod_proveedor = orden_de_compra.cod_proveed
          and i.tipdoc = orden_de_compra.tipo_docto
          and i.serie_num = orden_de_compra.serie
          and i.numero = orden_de_compra.num_ped
       ), 0);

select *
  from pagos_i
 where serie_num = '20'
   and numero = '63054';

select *
  from pagos_i
 where numero = '63054';

select *
  from pagos_i
 where serie_num = '4'
   and numero = '63130';


select *
  from pagos_i
 where cod_proveedor = '';
