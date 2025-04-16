select *
  from embarques_d
 where num_importa = 'PVC24114';

select *
  from lg_dua
 where num;

select *
  from tab_lineas
 order by lpad(linea, 4, '0') desc;
