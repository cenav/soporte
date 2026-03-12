select a.cod_alm, a.cod_art, a.indicador, a.descripcion, a.unidad, a.cod_lin, l.stock
     , a.f_ulc_prov, a.pr_fec_ingreso, a.tp_art, a.pr_stk_minimo
--      , f_stock_almacen(a.cod_art, :cod_alm_2) as alm2
--      , f_stock_almacen(a.cod_art, :cod_alm_3) as alm3
--      , f_stock_almacen(a.cod_art, :cod_alm_4) as alm4
--      , f_stock_almacen(a.cod_art, :cod_alm_5) as alm5
  from articul a
     , almacen l
 where a.cod_art = l.cod_art
   and l.cod_alm = :cod_alm_1
   and cod_lin between :lindes and :linhas
   and l.stock >= 0
--AND A.COD_ALM = L.COD_ALM
 order by l.cod_alm
        , a.cod_lin
        , a.cod_art;