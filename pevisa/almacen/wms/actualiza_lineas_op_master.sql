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
     and o.numero in (611808)
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
--      and o.estado = '1'
     and trunc(o.fecha) >= to_date('01/07/2025', 'dd/mm/yyyy')
  ) s
on (d.ot_nuot_tipoot_codigo = s.ot_nuot_tipoot_codigo
  and d.ot_nuot_serie = s.ot_nuot_serie
  and d.ot_numero = s.ot_numero
  and d.art_cod_art = s.art_cod_art)
when matched then
  update
     set d.cod_lin = s.cod_lin;

-- actualiza linea cabecera por numero de op
merge into pr_ot g
using (
  select o.nuot_tipoot_codigo, o.nuot_serie, o.numero, o.formu_art_cod_art, a.cod_lin
    from pr_ot o
         join articul a on o.formu_art_cod_art = a.cod_art
   where o.nuot_tipoot_codigo = 'PR'
     and o.numero in (611808)
  ) s
on (g.nuot_tipoot_codigo = s.nuot_tipoot_codigo
  and g.nuot_serie = s.nuot_serie
  and g.numero = s.numero)
when matched then
  update
     set g.cod_lin = s.cod_lin;

-- actualiza linea cabecera por fecha
merge into pr_ot g
using (
  select o.nuot_tipoot_codigo, o.nuot_serie, o.numero, o.formu_art_cod_art, a.cod_lin
    from pr_ot o
         join articul a on o.formu_art_cod_art = a.cod_art
   where o.nuot_tipoot_codigo = 'PR'
     and trunc(o.fecha) >= to_date('01/07/2025', 'dd/mm/yyyy')
  ) s
on (g.nuot_tipoot_codigo = s.nuot_tipoot_codigo
  and g.nuot_serie = s.nuot_serie
  and g.numero = s.numero)
when matched then
  update
     set g.cod_lin = s.cod_lin;

select *
  from pr_ot_lin
 where nuot_tipoot_codigo = 'PR'
   and nuot_serie = 8
   and numero = 611808;

select *
  from pr_for_ins
 where formu_art_cod_art = 'BH 0.23-177';


select *
  from pr_for_ins
 where formu_art_cod_art = 'BO 1.8FS-177';


select *
  from articul
 where cod_art = 'BH 0.23-177';
