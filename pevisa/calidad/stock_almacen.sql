-- stock almacen 48
select cod_art, stock, (
  select max(fch_transac)
    from kardex_d
   where tp_transac = '11'
     and cod_art = a.cod_art
     and estado <> '9'
  ) as fecha_ultima_compra, (
  select max(fch_transac)
    from kardex_d
   where ing_sal = 'I'
     and cod_art = a.cod_art
     and estado <> '9'
  ) as fecha_ultimo_ingreso, (
  select d.cod_alm || '-' || d.tp_transac || '-' || d.serie || '-' || d.numero || '    ' ||
         d.pr_referencia
    from kardex_d d
   where d.ing_sal = 'I'
     and d.cod_art = a.cod_art
     and d.tp_transac = '11'
     and d.estado <> '9'
     and d.fch_transac = (
     select max(z.fch_transac)
       from kardex_d z
      where z.tp_transac = d.tp_transac
        and z.cod_art = d.cod_art
        and z.estado <> '9'
     )
     and rownum = 1
  ) as ultimo_pedido, (
  select count(1)
    from kardex_d d
   where d.ing_sal = 'I'
     and d.cod_art = a.cod_art
     and d.tp_transac = '11'
     and d.estado <> '9'
     and d.fch_transac = (
     select max(z.fch_transac)
       from kardex_d z
      where z.tp_transac = d.tp_transac
        and z.cod_art = d.cod_art
        and z.estado <> '9'
     )
  ) as numero_ingresos_compra
  from almacen a
 where cod_alm = '48'
   and stock > 0;


-- stock valorizado a fecha de hoy
  with detalle as (
    select d.cod_alm, d.cod_art, c.costo as costo_32
         , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
      from kardex_d d
           join pcart_precios c on d.cod_art = c.cod_art and cod_costo = '32'
     where d.estado != '9'
       and d.cod_alm = '62'
    having sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) > 0
     group by d.cod_alm, d.cod_art, c.costo
    )
select cod_alm, cod_art, costo_32, stock, round(stock * costo_32, 2) as valor
  from detalle;
