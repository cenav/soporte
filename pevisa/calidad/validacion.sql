select *
  from pr_ot
 where nuot_tipoot_codigo = 'VA'
   and numero in (
   652174
   );


select nuot_tipoot_codigo as tipo, numero, fecha, estado, cant_prog, formu_art_cod_art as formula
     , cod_lin as linea, observacion
  from pr_ot
 where nuot_tipoot_codigo = 'VA'
   and estado = '1'
   and extract(year from fecha) = 2026
 order by fecha;
