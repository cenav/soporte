select *
  from pr_estados_sao
 order by estado;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'SA'
   and numero in (5772);

select *
  from pr_ot
 where nuot_tipoot_codigo = 'SA'
   and extract(year from fecha) = 2026
 order by fecha;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'SA'
   and formu_art_cod_art = 'TO450.403SIL';
