-- ordenes caucho no impresas
select o.nuot_tipoot_codigo as tipo, o.numero, trunc(o.fecha) as fecha, o.estado
     , o.formu_art_cod_art as codigo, o.cod_lin, o.cant_prog
  from pr_ot o
 where o.nuot_tipoot_codigo = 'PR'
   and extract(year from o.fecha) = 2024
   and extract(month from o.fecha) <= 4
   and o.estado = '1'
   and (o.cod_lin between '1800' and '1820' and length(o.cod_lin) = 4)
   and not exists(
   select 1
     from pr_ot_impresion i
    where o.nuot_tipoot_codigo = i.nuot_tipoot_codigo
      and o.nuot_serie = i.nuot_serie
      and o.numero = i.numero
   );