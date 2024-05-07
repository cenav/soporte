select *
  from kardex_g g
       join kardex_d d
            on g.cod_alm = d.cod_alm and g.tp_transac = d.tp_transac and g.serie = d.serie and
               g.numero = d.numero
       join articul a on d.cod_art = a.cod_art
 where g.estado != '9'
   and extract(year from g.fch_transac) >= 2017
   and d.cod_art = '40065/16TG';

select *
  from articul a
 where a.cod_lin in (
                     '1000', '1001', '1002', '1003', '1004', '1005', '1006', '1007', '1008', '1009',
                     '1010', '1011', '1012', '1013', '1014', '1015', '1016', '1017', '1018', '1019',
                     '1020', '1021', '1022', '1023', '1024', '1025', '1026', '1027'
   )
   and not exists(
   select 1
     from kardex_g g
          join kardex_d d
               on g.cod_alm = d.cod_alm and g.tp_transac = d.tp_transac and g.serie = d.serie and
                  g.numero = d.numero
          join articul a on d.cod_art = a.cod_art
    where g.estado != '9'
      and extract(year from g.fch_transac) >= 2017
      and d.cod_art = a.cod_art
   );

-- codigos sin movimiento
select a.cod_art, a.descripcion, a.cod_lin
  from articul a
 where a.cod_lin in (
                     '1000', '1001', '1002', '1003', '1004', '1005', '1006', '1007', '1008', '1009',
                     '1010', '1011', '1012', '1013', '1014', '1015', '1016', '1017', '1018', '1019',
                     '1020', '1021', '1022', '1023', '1024', '1025', '1026', '1027'
   )
   and a.cod_art not in (
   select distinct d.cod_art
     from kardex_g g
          join kardex_d d
               on g.cod_alm = d.cod_alm and g.tp_transac = d.tp_transac and g.serie = d.serie and
                  g.numero = d.numero
          join articul a on d.cod_art = a.cod_art
    where g.estado != '9'
      and extract(year from g.fch_transac) >= 2017
   );
