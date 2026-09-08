select distinct d.cod_art
  from expedidos p
       join expedido_d d on p.numero = d.numero
 where p.estado != '9'
   and d.id is null
   and extract(year from p.fecha) >= 2024
   and p.cod_cliente in ('990655')
order by d.cod_art;


select *
  from exclientes
 where nombre like '%EMPAQUE%';
