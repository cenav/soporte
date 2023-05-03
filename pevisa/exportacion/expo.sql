select *
  from exbooking_d
 where numero_booking = '63539397';

select *
  from exfacturas
 where numero in (
                  55012554, 55012636, 55013284, 55013298, 55013302, 55013367, 55013378, 55013381,
                  55013539, 55013546, 55013556, 55013572, 55013573, 55013657, 55013664, 55013698,
                  55012985, 55013176, 55013277, 55013301, 55013307, 55013321, 55013401, 55013460,
                  55013571, 55013677, 55012634, 55013017, 55013443, 55013642, 55013831, 55013416,
                  55013602, 55012853, 55013399, 55013400, 55013405, 55013466, 55013467, 55013481,
                  55013603, 55013604, 55013605, 55013702, 55013783, 55013856, 55013860, 55013862,
                  55013906, 55013919, 55013924
   );


select p.secuencia, o.prioridad, d.numero, d.nro, f.fecha, f.cod_cliente, f.nombre, d.cod_eqi
     , d.cod_art, d.canti, d.preuni, o.numero numero_ot, o.cant_prog
     , o.cant_prog * d.preuni valor_art, o.nuot_tipoot_codigo tipo_ot, o.estado estado_ot
     , 'T' temporal
  from pr_prioridad_htmp_30 p, pr_ot o, expedidos f, expedido_d d
---WHERE P.ANO = :P_ANO     ---- 07/01/09
---  AND P.MES <= :P_MES
 where o.prioridad = p.prioridad
   and o.estado < '3'
   and o.abre01 = f.numero
   and o.abre01 = d.numero
   and nvl(d.id, '0') = '0'
   and d.cod_art = o.formu_art_cod_art
   and nvl(f.zona, '0') <> '99'
   and o.per_env = d.nro ---- 26/04/2008
   and f.estado not in ('8', '9')
 union
select p.secuencia, o.prioridad, d.numero, d.nro, f.fecha, f.cod_cliente
     , f.nombre || ' ' || f.referencia nombre, d.cod_eqi, d.cod_art, d.canti, d.preuni
     , o.numero numero_ot, o.cant_prog, o.cant_prog * d.preuni valor_art
     , o.nuot_tipoot_codigo tipo_ot, o.estado estado_ot, 'N' temporal
  from pr_prioridad_htmp_30 p, pr_ot o, vexpednac f, vexpednac_d d
---WHERE P.ANO <= :P_ANO   --- 07/01/09
---  AND P.MES <= :P_MES
 where o.prioridad = p.prioridad
   and o.estado < '3'
   and o.abre01 = f.numero
   and o.abre01 = d.numero
   and o.per_env = d.nro ------26/04/2008
   and f.estado not in ('8', '9')
   and d.cod_art = o.formu_art_cod_art
 order by 1, 2, 3, 4;

select * from pr_prioridad_htmp_30;

select *
  from pr_prioridad
 where ano = 2023;

select *
  from exbooking
 where numero_booking = 'AER-113';

select *
  from exbooking_d
 where numero_booking = 'AER-113';