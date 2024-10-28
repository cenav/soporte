select i.*
  from lg_pedjam p
       join lg_itemjam i on p.num_importa = i.num_importa
       join articul a on i.cod_art = a.cod_art
 where i.estado != '9'
   and extract(year from p.fecha) in (2023, 2024);

