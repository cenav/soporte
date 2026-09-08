select d.cod_cliente, d.partida, d.preuni, k.cod_art, k.cod_eqi, k.numero, k.nro_ped
     , d.cod_art as cod_art_ped, d.cod_eqi as cod_eqi_ped
  from pk_detal k
     , expedido_d d
 where k.pk_numero = 67842
   and k.numero = d.numero
   and k.nro_ped = d.nro
   and nvl(d.id, ' ') <> 'AN'
   and (k.cod_art <> d.cod_art
   or k.cod_eqi <> d.cod_eqi
   );

select *
  from pk_detal
 where pk_numero = 67842
   and numero = 17064
   and nro_ped = 142;

-- FS 80128 GR
-- CHP 95023 GR
-- CHP 80074 GR