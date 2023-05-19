select *
  from kardex_g
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 91
   and numero = 298;

select *
  from kardex_d
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 91
   and numero = 298;


select *
  from pedido_flujo
 where numero_kardex is not null;

select *
  from pedido_flujo
 where serie_kardex = 91
   and numero_kardex = 298;