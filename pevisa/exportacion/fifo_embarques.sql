-- escoge packing
select k.pk_numero
     , k.fecha
     , k.cod_cliente
     , c.nombre
     , 0 as guias
  from pk_gnumero k
     , exclientes c
 where c.cod_cliente = k.cod_cliente
   and nvl(k.estado, '0') = 'G'
 order by 5 desc
        , 1;


-- pedido a trabajar
select p.pk_numero
     , k.cod_eqi
     , k.cod_art
     , d.preuni
     , d.nro
  from pk_gnumero p
     , pk_detal k
     , expedido_d d
 where p.pk_numero = 64303
   and k.pk_numero = p.pk_numero
   and d.numero = k.numero
   and d.cod_eqi = k.cod_eqi
   and d.cod_art = k.cod_art
   and d.nro = k.nro_ped
--    and d.preuni = 0
 order by d.partida
        , k.cod_eqi
        , k.cod_art;


select *
  from pk_gnumero
 where pk_numero = 62912;


select *
  from pk_detal
 where pk_numero = 62912;


select *
  from pk_detal
 where extract(year from fecha) = 2025
   and extract(month from fecha) = 12;
