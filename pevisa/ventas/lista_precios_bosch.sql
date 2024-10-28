select a.grupo, get_desgrupo(a.grupo) as descri_grupo, a.cod_lin
     , get_deslinea(a.cod_lin) as descri_linea, l.cod_art, a.descripcion, a.indicador
     , f_lista_precio(l.cod_art, 1) as lista_1_dolar, f_lista_precio(l.cod_art, 6) as lista_6_soles
     , f_lista_precio(l.cod_art, 3) as lista_3_dolar_renusa
     , f_lista_precio(l.cod_art, 8) as lista_8_soles_renusa
     , f_lista_precio(l.cod_art, 80) as lista_80_dolar_oferta
     , f_lista_precio(l.cod_art, 90) as lista_90_soles_oferta
     , f_lista_precio(l.cod_art, 70) as lista_70_soles_sodimac
  from lispred l
     , articul a
 where l.cod_art = a.cod_art (+)
   and f_lista_precio(l.cod_art, 1) > 0
   and nro_lista in (1)
   and a.grupo like :P_GRUPO
   and a.cod_lin like :P_LINEA
   and l.cod_art like :P_ART
   and a.grupo <> '30'
   and a.cod_lin <> 'ZZ'
   and f_lista_precio(l.cod_art, 3) > 0
 order by a.grupo, a.cod_lin, l.cod_art;

select *
  from lispred
 where cod_art = '1987949437';

select *
  from articul
 where grupo = '42';

-- insert into lispred
select 3, cod_art, importe, desc1, desc2, desc3, estado
  from lispred
 where nro_lista = 1
   and exists(
   select *
     from articul
    where cod_art = lispred.cod_art
      and grupo = '42'
   );

select *
  from lispreg
 order by lpad(nro_lista, 3, '000');

select *
  from vendedores
 where abreviada = 'PEVISA';
