select *
  from kardex_g
 where estado <= 7
   and tp_transac = '10'
   and ing_sal = 'I'
   and cod_relacion = '20100084768' and nro_sucur in ('04', '05', '06', '11', '03', '07', '08')
   and cod_alm in
       (
         select cod_alm_transito
           from almacenes
          where cod_alm_transito is not null
            and cod_alm_transito = kardex_g.cod_alm
         )
   and cod_alm not in ('M1', 'M2', 'M3', 'M4')
   and serie = 118
   and numero = 553;

select vw.*, (
  select max(fch_transac) as ult_fch_ingreso
    from kardex_d
   where cod_alm = vw.almacen and kardex_d.cod_art = vw.cod_art and estado <> '9'
     and ing_sal = 'I'
  )
  from vw_stock_almacenes_transito vw
 order by vw.almacen, vw.stock desc;
