select *
  from lispreg
 order by nro_lista;

select *
  from lispred
 where cod_art = '66450-OSRAM';

select *
  from lispred
 where cod_art in ('S4 70D-25-B', '0092S47028');

select *
  from tab_lineas
 where linea = '203';

select cod_art, importe_igv
  from tmp_carga_data
 where importe_igv is null;

select t.cod_art, t.importe_igv
  from tmp_carga_data t
       left join articul a on t.cod_art = a.cod_art
 where a.cod_art is null;

select *
  from lispred
 where nro_lista = '95';

select * from tab_descuento_gpolin;

select *
  from tab_descuento_gpolin
 where cod_grupo = '39';

select * from tab_grupo_venta;

select a.cod_art, a.descripcion, a.unidad, n.stock, a.u_eqv, l.cod_linea as linea, g.moneda
     , l.cod_grupo as grupo, v.importe as precio, pr_medpza as cod_ing, t.grupo_venta
  from articul a
     , tab_descuento_gpolin l
     , lispred v
     , lispreg g
     , tab_lineas t
     , almacen n
 where a.tp_art in ('T', 'S')
   and l.cod_linea = a.cod_lin
   and l.cod_grupo is not null
   and g.nro_lista = 1
   and l.moneda = g.moneda
   and v.cod_art = a.cod_art
   and v.nro_lista = g.nro_lista
   and t.linea = l.cod_linea
   and n.cod_art(+) = a.cod_art
   and n.cod_alm(+) = 'F0'
   and a.cod_art = 'GC4252'
 order by l.cod_grupo, a.cod_art;

select *
  from tab_lineas
 where linea = '01';

select *
  from tab_grupos
 where grupo = '39';

select *
  from pedido
 where num_ped = 222285;

select *
  from itemped
 where num_ped = 219792;

select * from categoria;

select * from clientes_categoria;

select * from tab_lineas where linea = '253';

select * from lpred_fam where cod_lin = '114';
select * from lpred_fam where cod_lin = '253';
select cod_lin from articul where cod_lin = '253';
select * from tab_lineas where linea = '253';
select * from tab_lineas where descripcion like '%BOSCH%' order by linea;
select * from lpred_fam;
select * from lista_de_precios;

-- reporte lista de precios comercial
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
  from articul
 where cod_art = '1016-BD';

select *
  from tab_lineas
 where linea = '272';

select *
  from lispreg
 order by lpad(nro_lista, 3, '000');

select *
  from lispred
 where cod_art = 'RM-45 L1-N';

select *
  from articul
 where cod_lin in ('272', '273', '276');


/*
insert into lispred
select 3, cod_art, importe, desc1, desc2, desc3, estado
  from lispred
 where cod_art in (
                   '2118-BD', '1532-BD', '2112-BD', '2117-BD', '3002-BD', '5060-BD',
                   '3520-BD', '3335-BD', '3312-BD', '75605-D-BD', '5712-12E-BD', '5713-W-BD',
                   '6018-BD', '3119-BD', '8118-BD', '45050-BD', '22120-BD', '22121-BD', '22100-BD',
                   '22101-BD', '22110-BD', '22111-BD', '22150-BD', '22151-BD', '35000-BD',
                   '35001-BD', '61100-BD', '57100-BD', '57095-BD', '24610-BD', '24611-BD',
                   '22610-BD', '22613-BD', '75110-BD', '75120-BD', '75580-BD', '75590-BD'
   )
   and nro_lista = 1;
*/

select *
  from lispred
 where cod_art in (
   'RM-45 L1-N'
   )
   and nro_lista = 6;

select a.cod_art, a.descripcion, a.unidad, n.stock, a.u_eqv, l.linea, l.grupo, v.importe as precio
     , pr_medpza as cod_ing, l.grupo_venta
  from articul a
     , tab_lineas l
     , lispred v
     , almacen n
 where a.tp_art in ('T', 'S')
   and l.linea = a.cod_lin
   and l.grupo is not null
   and v.cod_art = a.cod_art
   and v.nro_lista = :nro_lista
   and l.grupo_venta = :unidad_negocio
   and n.cod_art(+) = a.cod_art
   and n.cod_alm(+) = 'F0'
   and l.grupo not in (41)
   and a.cod_art = 'RM-45 L1-N'
 order by a.cod_art;

select *
  from tab_lineas
 where linea = '271';

select *
  from articul
 where cod_art = 'RM-45 L1-N';
