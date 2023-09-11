select numero_oa, formu_art_cod_art, estado, abrev_cli, abrev_ped, dato_agrupa
     , get_dato_agrupacion_ot(numero_oa) as xxx
  from produccion_armado
 where abrev_ped = (:NUMERO_PEDIDO);

select numero_oa, formu_art_cod_art, estado, abrev_cli, abrev_ped, dato_agrupa
  from produccion_armado
 where abrev_ped = :NUMERO_PEDIDO
   and dato_agrupa is null;

-- 2. Actualizamos la agrupación de cada orden.

update produccion_armado
   set dato_agrupa= get_dato_agrupacion_ot(numero_oa)
 where abrev_ped = :NUMERO_PEDIDO;

-- 15873
-- 15874
-- 15885
-- 15886

-- 15926
-- 15952
-- 15954

-- 15810
-- 15692
-- 15954
-- 15940
-- 15874
-- 15932

declare
  cursor pedidos_cr is
    select distinct abrev_ped
      from produccion_armado
     where abrev_ped in (
                         14750, 15149, 15320, 15321, 15443, 15500, 15501, 15513, 15617, 15692,
                         15699, 15745, 15756, 15767, 15773, 15774, 15810, 15817, 15818, 15819,
                         15865, 15871, 15873, 15874, 15885, 15886, 15901, 15910, 15911, 15914,
                         15915, 15924, 15926, 15932, 15939, 15940, 15941, 15942, 15943, 15946,
                         15947, 15952, 15954
       );
begin
  for r in pedidos_cr loop
    update produccion_armado p
       set p.dato_agrupa= get_dato_agrupacion_ot(p.numero_oa)
     where p.abrev_ped = r.abrev_ped;
  end loop;
end;