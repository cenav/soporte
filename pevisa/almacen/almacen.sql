select *
  from kardex_g
 where cod_alm = 'D4'
   and tp_transac = '29'
   and serie = 1
   and numero = 1535940;

select *
  from kardex_d
 where cod_alm = 'D4'
   and tp_transac = '29'
   and serie = 1
   and numero = 1535940;

select *
  from kardex_d
 where cod_alm = '17'
   and tp_transac = '10'
   and serie = 1
   and numero = 27;

-- descarga almacen de transito
select *
  from kardex_g
 where cod_alm = 'D3'
   and tp_transac = '35'
   and serie = 39
   and numero = 2323
   and estado <= 7
   and tp_transac = '10'
   and ing_sal = 'I'
--    and cod_relacion = '20100084768' and nro_sucur in ('04', '05', '06', '11', '03')
   and cod_alm in (
   select cod_alm_transito
     from almacenes
    where cod_alm_transito is not null
      and cod_alm_transito = kardex_g.cod_alm
   );

select *
  from kardex_d
 where cod_alm = 'D2'
   and tp_transac = '18'
   and serie = 2
   and numero = 532531;

select *
  from kardex_g_movglos
 where cod_alm = 'SS'
   and tp_transac = '11'
   and serie = 1
   and numero = 29807;

select *
  from almacenes
 where cod_alm = 'D3';


select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero = 178279;

select *
  from instrumento_asigna
 where id_instrumento = 16;

select *
  from movglos
 where ano = 2022
   and mes = 11
   and libro = '39'
   and voucher = 11004;

-- 2022 11 39 110004
-- 2022 12 39 120004

select cod_art
     , sum(case ing_sal when 'I' then cantidad when 'S' then cantidad * -1 else 0 end) as total
  from kardex_d
 where cod_art = 'SLIM380.1092SIL'
 group by cod_art;

select *
  from pr_for_ins
 where formu_art_cod_art = '95037/22TG';

select *
  from solimat_g
 where numero = 181100;

select *
  from solimat_d
 where numero = 181100;

select *
  from kardex_g
 where num_importa = 'SM 1 179926';

select *
  from kardex_d d
 where exists(
   select *
     from kardex_g g
    where d.cod_alm = g.cod_alm
      and d.tp_transac = g.tp_transac
      and d.serie = g.serie
      and d.numero = g.numero
      and g.num_importa = 'SM 1 179922'
   );

select *
  from kardex_g
 where cod_alm = 'D2'
   and tp_transac = '18'
   and serie = 2
   and numero = 525055;

select *
  from kardex_d
 where cod_alm = 'D2'
   and tp_transac = '18'
   and serie = 2
   and numero = 525055;

select *
  from transacciones_almacen
 where tp_transac = '22';

select *
  from pr_usualma
 where usuario = 'MGUIELAC'
 order by cod_alm;

select *
  from usuarios_almacenes_perfil
 where usuario = 'MGUIELAC'
   and cod_alm = '30';

-- 58 -> 30

select *
  from kardex_g
 where cod_alm = '62'
   and extract(year from fch_transac) = 2023
   and extract(month from fch_transac) = 7
 order by fch_transac desc;

select *
  from solimat_g
 where cod_alm01 = '62'
 order by fecha desc;

select *
  from kardex_g
 where cod_alm = '62'
   and nro_doc_ref = 183217;

select *
  from kardex_g
 where cod_alm = '62'
   and tp_transac = '22'
   and serie = 1
   and numero = 256952;

select *
  from view_salidas_pre_guias
 where cod_alm = '62'
   and tp_transac = '22'
   and serie = 1
   and numero = 256952;

select g.tp_transac, x.descripcion, g.serie, g.numero
  from kardex_g g
     , tablas_auxiliares x
 where g.estado not in ('6', '9')
   and g.ing_sal = 'S'
   and g.tp_transac > 20
   and x.tipo = 32
   and x.codigo = g.tp_transac
   and g.tp_transac = '30'
   and g.serie = 45
   and g.numero = 7
 order by g.tp_transac, g.serie, g.numero;


select *
  from kardex_g
 where estado <> '9'
   and tp_transac in ('21', '30')
--    and tp_transac = '30'
   and serie = 45
   and numero = 7
   and cod_alm in (
   select codigo
     from tablas_auxiliares
    where tipo = 33
      and indicador1 = 'T'
   )
   and to_number(to_char(fch_transac, 'YYYYMM')) > to_number(2023 || lpad(4, 2, 0));


select *
  from icierre
 where tp_art = 'T';

select *
  from kardex_g
 where serie = 1
   and numero = 8157
   and fch_transac = to_date('14/07/2023', 'dd/mm/yyyy');

select *
  from kardex_g
 where tip_doc_ref = 'P2'
   and ser_doc_ref = '21'
   and nro_doc_ref = '474';

select * from tmp_carga_data;

insert into pevisa.kardex_g ( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref
                            , ser_doc_ref, nro_doc_ref, glosa, tp_relacion, cod_relacion, nro_sucur
                            , cond_pag, nro_lista, moneda, cod_vende, cliente_afecto, por_desc1
                            , por_desc2, motivo, estado, origen, ing_sal, flg_impr, ubicacion
                            , cod_transp, domicilio, ruc_transp, nombre, direccion, ruc, tara_co
                            , tara_bo, tara_ca, placa_transp, le_transp, cant_item, num_importa
                            , tipo_pguia, serie_pguia, numero_pguia, pr_procedencia, pr_numped)
values ( 'TA', '10', 29, 9237, date '2023-06-30', '35', 29, 9237, null, 'C', '20100084768', '05'
       , null, 1, 'D', '17', null, 0.00, 0.00, '6', '3', '*', 'I', '0', null, null, null, null
       , 'PEVISA AUTO PARTS S.A.C.', null, null, null, null, null, null, null, 0, '6', null, null
       , null, null, null);

insert into pevisa.kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d
                            , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado, cuenta69
                            , origen, ing_sal, lote, conos, tara, flag, autonum, orden, pr_proveedor
                            , pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
                            , pr_canthabi, pr_tipot, pr_numot, pr_numped)
values ( 'TA', '10', 29, 9237, 'SOL 830', 586.4400, 0.000000, 0.000000, date '2023-06-30', 0.00
       , 0.00, 0.000, '6', null, '*', 'I', null, null, null, null, null, null, null, null, null
       , null, null, null, null, null, null, null);

-- Luis Arias 21/07/2023
select *
  from kardex_g
 where cod_alm = 'TA'
   and tp_transac = '10'
   and serie = 29
   and numero = 9696;

select *
  from kardex_d
 where cod_alm = 'TA'
   and tp_transac = '10'
   and serie = 29
   and numero = 9021
   and cod_art = 'CAR 485';


insert into pevisa.kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d
                            , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado, cuenta69
                            , origen, ing_sal, lote, conos, tara, flag, autonum, orden, pr_proveedor
                            , pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
                            , pr_canthabi, pr_tipot, pr_numot, pr_numped)
values ( '17', '10', 1, 27, 'CAR 485', 20.0000, 0.000000, 0.000000, date '2023-03-22', 0.00, 0.00
       , 0.000, '6', null, '*', 'I', null, null, null, null, null, null, null, null, null, null
       , null, null, null, null, null, null);


insert into pevisa.kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d
                            , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado, cuenta69
                            , origen, ing_sal, lote, conos, tara, flag, autonum, orden, pr_proveedor
                            , pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
                            , pr_canthabi, pr_tipot, pr_numot, pr_numped)
values ( 'TA', '35', 29, 25, 'CAR 485', 40.0000, 0.000000, 0.000000, date '2023-03-03', 0.00, 0.00
       , 0.000, '6', null, '*', 'S', null, null, null, null, null, null, null, null, null, null
       , null, null, null, null, null, null);


insert into pevisa.kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d
                            , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado, cuenta69
                            , origen, ing_sal, lote, conos, tara, flag, autonum, orden, pr_proveedor
                            , pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
                            , pr_canthabi, pr_tipot, pr_numot, pr_numped)
values ( 'TA', '10', 29, 9696, 'CAR 485', 40.0000, 0.000000, 0.000000, date '2023-03-03', 0.00, 0.00
       , 0.000, '6', null, '*', 'I', null, null, 0.00, null, null, null, null, null, null, null
       , null, null, 40.0000, null, null, null);


insert into pevisa.kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d
                            , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado, cuenta69
                            , origen, ing_sal, lote, conos, tara, flag, autonum, orden, pr_proveedor
                            , pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
                            , pr_canthabi, pr_tipot, pr_numot, pr_numped)
values ( 'TA', '35', 29, 28, 'CAR 485', 20.0000, 0.000000, 0.000000, date '2023-03-22', 0.00, 0.00
       , 0.000, '6', null, '*', 'S', null, null, null, null, null, null, null, null, null, null
       , null, null, null, null, null, null);


insert into pevisa.kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d
                            , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado, cuenta69
                            , origen, ing_sal, lote, conos, tara, flag, autonum, orden, pr_proveedor
                            , pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
                            , pr_canthabi, pr_tipot, pr_numot, pr_numped)
values ( 'TA', '10', 29, 9021, 'CAR 485', 20.0000, 0.000000, 0.000000, date '2023-03-22', 0.00, 0.00
       , 0.000, '6', null, '*', 'I', null, null, 0.00, null, null, null, null, null, null, null
       , null, null, 20.0000, null, null, null);


select *
  from solimat_g
 where numero in (
                  184128, 184129, 184132
   );
