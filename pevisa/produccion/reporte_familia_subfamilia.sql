select * from articul;

select undexp as familia, cta_venta_expo as sub_familia
  from pcarticul
 where cod_art = '38300VMI';

select tiempo
  from pcmasters
 where cod_art = '38300VMI';

select *
  from pcmasters
 where cod_art = '38300VMI';

-- familia subfamilia factor
  with factores as (
    select cod_art, max(tiempo) as factor
      from pcmasters
     group by cod_art
    )
select a.cod_art, a.cod_lin, c.undexp as familia, c.cta_venta_expo as sub_familia, f.factor
  from articul a
       left join pcarticul c on a.cod_art = c.cod_art
       left join factores f on a.cod_art = f.cod_art
--  where a.cod_art = '38300VMI';
 where a.cod_lin between '1380' and '1387'
   and length(a.cod_lin) = 4
 order by a.cod_lin;
