select * from grupo_negocio;

select * from unidades_negocio;

select * from tipos_pedido_master;

select * from grupo_unidad_tipopedido;

select a.cod_art, a.descripcion, a.tp_c_stck, a.unidad, m.stock, a.tp_art, a.cod_fam, a.cod_lin
  from almacen m
     , articul a
 where m.cod_alm = 'M1'
   and m.cod_art = a.cod_art
   and a.estado <> '9'
   and a.cod_lin not in ('ZZ', '1980')
 order by a.descripcion;

select *
  from articul
 where (cod_lin between '1300' and '1379'
   or cod_lin between '2500' and '2599')
   and length(cod_lin) = 4;

select *
  from tablas_auxiliares
 where tipo = 33
   and codigo = 'M1';

select *
  from almacen
 where cod_art = 'MAT2 67001CS-1 CORTE';

select *
  from kardex_g
 where cod_alm = 'T1'
   and tp_transac = '27'
   and serie = 1
   and numero = 1371033;

select *
  from kardex_d
 where cod_alm = 'T1'
   and tp_transac = '27'
   and serie = 1
   and numero = 1371033;


insert into pevisa.kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d
                            , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado, cuenta69
                            , origen, ing_sal, lote, conos, tara, flag, autonum, orden, pr_proveedor
                            , pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
                            , pr_canthabi, pr_tipot, pr_numot, pr_numped)
values ( 'TA', '10', 29, 9696, 'CAR 485', 40.0000, 0.000000, 0.000000, date '2023-03-03', 0.00, 0.00
       , 0.000, '6', null, '*', 'I', null, null, 0.00, null, null, null, null, null, null, null
       , null, null, 40.0000, null, null, null);


select *
  from cambdol
 where fecha = to_date('21/09/2023', 'dd/mm/yyyy');

select *
  from kardex_g
 where cod_alm = 'A4'
   and tp_transac = '21'
   and serie = 1
   and numero = 34773;

select *
  from kardex_d
 where cod_alm = 'A4'
   and tp_transac = '21'
   and serie = 1
   and numero = 34773;
