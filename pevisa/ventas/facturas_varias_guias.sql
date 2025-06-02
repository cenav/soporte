select *
  from kardex_g
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (
   44714
   );

select *
  from kardex_d
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (
   44714
   );

select *
  from kardex_g_guia_remision
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (
   44714
   );

select *
  from kardex_g_guia_remision
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and extract(year from fecha_traslado) = 2025
   and extract(month from fecha_traslado) = 4;

select *
  from pedido
 where num_ped = 266389;

select *
  from itemped
 where num_ped = 266389;