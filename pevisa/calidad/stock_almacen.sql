-- stock almacen 48
select cod_art, stock, (
  select max(fch_transac)
    from kardex_d
   where tp_transac = '11'
     and cod_art = a.cod_art
     and estado <> '9'
  ) fecha_ultima_compra, (
  select max(fch_transac)
    from kardex_d
   where ing_sal = 'I'
     and cod_art = a.cod_art
     and estado <> '9'
  ) fecha_ultimo_ingreso, (
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
  ) ultimo_pedido, (
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
  ) numero_ingresos_compra
  from almacen a
 where cod_alm = '48'
   and stock > 0;
