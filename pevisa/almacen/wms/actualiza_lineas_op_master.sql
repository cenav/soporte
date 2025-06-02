select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 602870;

merge into pr_ot_det d
using articul a
on (d.art_cod_art = a.cod_art)
when matched then
  update
     set d.cod_lin = a.cod_lin
   where d.ot_nuot_tipoot_codigo = 'PR'
     and d.ot_numero in (602866, 606824, 606829, 606826, 606825);


-- rows 22085 dev / 34630 prod
select i.ot_nuot_tipoot_codigo, i.ot_nuot_serie, i.ot_numero, a.cod_lin
  from pr_ot o
       join pr_ot_det i
            on o.nuot_tipoot_codigo = i.ot_nuot_tipoot_codigo
              and o.nuot_serie = i.ot_nuot_serie
              and o.numero = i.ot_numero
       join articul a on i.art_cod_art = a.cod_art
 where o.nuot_tipoot_codigo = 'PR'
   and o.estado = '1';

-- actualiza por numero de op
merge into pr_ot_det d
using (
  select i.ot_nuot_tipoot_codigo, i.ot_nuot_serie, i.ot_numero, i.art_cod_art, a.cod_lin
    from pr_ot o
         join pr_ot_det i
              on o.nuot_tipoot_codigo = i.ot_nuot_tipoot_codigo
                and o.nuot_serie = i.ot_nuot_serie
                and o.numero = i.ot_numero
         join articul a on i.art_cod_art = a.cod_art
   where o.nuot_tipoot_codigo = 'PR'
     and o.numero in (595553, 599461, 602572, 602569)
  ) s
on (d.ot_nuot_tipoot_codigo = s.ot_nuot_tipoot_codigo
  and d.ot_nuot_serie = s.ot_nuot_serie
  and d.ot_numero = s.ot_numero
  and d.art_cod_art = s.art_cod_art)
when matched then
  update
     set d.cod_lin = s.cod_lin;


-- actualiza por fecha
merge into pr_ot_det d
using (
  select i.ot_nuot_tipoot_codigo, i.ot_nuot_serie, i.ot_numero, i.art_cod_art, a.cod_lin
    from pr_ot o
         join pr_ot_det i
              on o.nuot_tipoot_codigo = i.ot_nuot_tipoot_codigo
                and o.nuot_serie = i.ot_nuot_serie
                and o.numero = i.ot_numero
         join articul a on i.art_cod_art = a.cod_art
   where o.nuot_tipoot_codigo = 'PR'
     and o.estado = '1'
     and o.fecha >= to_date('19/05/2025', 'dd/mm/yyyy')
  ) s
on (d.ot_nuot_tipoot_codigo = s.ot_nuot_tipoot_codigo
  and d.ot_nuot_serie = s.ot_nuot_serie
  and d.ot_numero = s.ot_numero
  and d.art_cod_art = s.art_cod_art)
when matched then
  update
     set d.cod_lin = s.cod_lin;


select *
  from pr_for_ins
 where formu_art_cod_art = 'BH 0.23-177';


select *
  from pr_for_ins
 where formu_art_cod_art = 'BO 1.8FS-177';


select *
  from articul
 where cod_art = 'BH 0.23-177';
