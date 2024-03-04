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

select *
  from cambdol;

select *
  from kardex_d
 where cod_art = '01ANDA10';

select *
  from transacciones_almacen
 where descripcion like '%VENTA%';

select *
  from transacciones_almacen
 order by lpad(tp_transac, 3, '0');

select *
  from tablas_auxiliares
 where tipo = 32
   and codigo != '....'
 order by codigo;

select *
  from numdoc
 where tp_transac = '21';

select *
  from numdoc
 order by serie;

insert into pevisa.numdoc ( tp_transac, serie, numero, automatico, tp_mov, tp_relacion, tipo_cambio
                          , ing_costo, lineas)
values ('73', 171, 0, 'S', 'S', null, 'V', 'N', 0);


select *
  from numdoc
 where tp_transac = '73'
   and serie = 171;

select *
  from kardex_g
 where tp_transac = '73';


select *
  from kardex_d
 where tp_transac = '73';


select *
  from view_salidas_pre_guias
 where cod_transp is not null;


select *
  from view_salidas_pre_guias
 where cod_alm = 'A2';


select *
  from view_salidas_pre_guias
 where not exists (
   select 1
     from kardex_g_guia_remision r
    where cod_alm = view_salidas_pre_guias.cod_alm
      and tp_transac = view_salidas_pre_guias.tp_transac and serie = view_salidas_pre_guias.serie
      and numero = view_salidas_pre_guias.numero
   )
   and cod_alm = 'A2';


-- modelo faucett
select *
  from kardex_g_guia_remision
 where guia_serie = 'T001'
   and guia_numero = 12380;

select *
  from kardex_g
 where cod_alm = 'A2'
   and tp_transac = '73';


select *
  from cambdol
 where fecha = trunc(sysdate);

select *
  from kardex_g
 where cod_alm = 'A1'
   and tp_transac = '73'
   and serie = 171
   and numero = 2;

select *
  from kardex_g_guia_remision
 where guia_serie = 'T171'
   and guia_numero = 2;