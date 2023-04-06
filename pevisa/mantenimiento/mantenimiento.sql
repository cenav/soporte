select *
  from ot_mantto
 where id_tipo = 'MQ'
   and id_serie = 5
   and id_numero in (1139);

select *
  from solimat_d
 where numero = 178557;

select *
  from kardex_d_otm
 where cod_alm = '30'
   and tp_transac = '22'
   and serie = 1
   and numero = 248083;

select *
  from articul
 where cod_art = '180.790S';