select user as usuario, a.tipo, a.serie, a.numero, a.estado, a.estado_old
     , to_char(a.fecha, 'DD/MM/YYYY HH24:MI:SS') as fecha, a.t4 as fecha_fin_de_mes
     , a.usuario as usuario_armado, a.t1, b.abre01 as pedido, b.abre02 as cliente
     , c.totlin as importe, b.cant_prog as cantidad, b.formu_art_cod_art, (
  select distinct 'IMPRESO'
    from vw_ot_impresos_planeamiento_20 i
   where i.numero = b.numero
   union
  select distinct 'IMPRESO'
    from pr_trasab_estado pte
   where pte.numero = b.numero
     and estado in ('2', '3', '4', '5', '6', '7')
  ) as impreso, (
  select max(pk_numero)
    from pk_detal
   where ot_numero = a.numero
     and ot_serie = a.serie
     and ot_tipo = a.tipo
     and estado < '9'
  ) as numero_packing, (
  select count(distinct pk_numero)
    from pk_detal
   where ot_numero = a.numero
     and ot_serie = a.serie
     and ot_tipo = a.tipo
     and estado < '9'
  ) as contador_packing, (
  select numero || '  ' || to_char(fecha, 'DD/MM/YYYY')
    from exfacturas
   where paclis =
         (
           select max(pk_numero)
             from pk_detal
            where ot_numero = a.numero
              and ot_serie = a.serie
              and ot_tipo = a.tipo
              and estado < '9'
           )
     and estado < '9'
  ) as numero_y_fecha_factura, (
  select fch_impresion
    from vw_ot_impresos_planeamiento_20
   where numero = a.numero
  ) as fch_impresion_ot, (
  select min(fecha)
    from pr_trasab_estado
   where numero = a.numero
     and tipo = a.tipo
     and serie = a.serie
  ) as fch_impresion_estado
  from pr_trasab_estado a
     , pr_ot b
     , vw_ot_total_planeamiento_25 c
 where a.tipo = 'AR'
   and a.serie = 3
--    and trunc(a.fecha) >= to_date('01/01/2023', 'dd/mm/yyyy')
   and trunc(a.fecha) >= to_date('29/04/2025', 'dd/mm/yyyy')
   and a.numero = b.numero
   and a.serie = b.nuot_serie
   and a.tipo = b.nuot_tipoot_codigo
   and b.abre01 = c.numero
   and b.destino = c.destino
   and b.per_env = c.nro
   --and  b.estado < '7'
   --and  b.estado not in('9')
   and b.abre02 not like 'PC1%'
   and b.cod_lin not in ('1970', '1971', '1972');

select *
  from tmp_planeamiento_estados
 where usuario = 'PEVISA';