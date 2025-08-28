select kd.cod_alm, kd.tp_transac, kd.serie, kd.numero, kd.fch_transac, kd.cod_art
     , kd.cantidad, kd.ing_sal
  from kardex_d kd
       join articul a on kd.cod_art = a.cod_art
 where kd.tp_transac = '18'
   and a.cod_lin in ('800', '801', '826')
   and extract(year from kd.fch_transac) >= 2024
   and kd.estado != '9';

select *
  from orden_de_compra
 where num_ped = 86942;

select * from orden_de_compra_estado;