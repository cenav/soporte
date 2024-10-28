select *
  from kardex_g
 where cod_alm = '01'
   and tp_transac = '26'
   and serie = 19
   and numero = 23159;

select *
  from kardex_d
 where cod_alm = '01'
   and tp_transac = '26'
   and serie = 19
   and numero = 23159
   and cod_art = 'KIT AUT VK 50250 R';

-- 1060181

select *
  from kardex_dpk
 where cod_alm = '01'
   and tp_transac = '26'
   and serie = 19
   and numero = 23159
 order by cod_art;

select *
  from proveed
 where cod_proveed = '20100039207';

select *
  from kardex_g
 where numero_pguia = 16360;

select *
  from relacion
 where tipodoc_rel = '26'
   and serie_rel = 19
   and numero_rel = 23160;

insert into kardex_g
select cod_alm, tp_transac, serie, 23160, fch_transac, tip_doc_ref, ser_doc_ref, nro_doc_ref, glosa
     , tp_relacion, cod_relacion, nro_sucur, cond_pag, nro_lista, moneda, cod_vende, cliente_afecto
     , por_desc1, por_desc2, motivo, estado, origen, ing_sal, flg_impr, ubicacion, cod_transp
     , domicilio, ruc_transp, nombre, direccion, ruc, tara_co, tara_bo, tara_ca, placa_transp
     , le_transp, cant_item, num_importa, tipo_pguia, serie_pguia, numero_pguia, pr_procedencia
     , pr_numped, nombre_archivo, nombre_archivo_ingreso, texto_1, texto_2, numero_1, numero_2
  from kardex_g
 where cod_alm = '01'
   and tp_transac = '26'
   and serie = 19
   and numero = 23159;

insert into kardex_d( cod_alm, tp_transac, serie, numero, cod_art, cantidad, fch_transac, estado
                    , ing_sal, origen, pr_referencia, pr_proveedor, pr_tipot, pr_numot, pr_numped
                    , costo_s, costo_d, por_desc1, por_desc2, imp_vvb)
select cod_alm, tp_transac, serie, numero, cod_art, sum(cantidad), fecha, estado, ing_sal, origen
     , pr_referencia, pr_proveedor, pr_tipot, min(pr_numot), pr_numped
     , 0, 0, 0, 0, 0
  from kardex_dpk
 where cod_alm = '01'
   and tp_transac = '26'
   and serie = 19
   and numero = 23160
 group by cod_alm, tp_transac, serie, numero, cod_art, fecha, estado, ing_sal, origen
        , pr_referencia, pr_proveedor, pr_tipot, pr_numped, 0, 0, 0, 0, 0;

select *
  from kardex_g
 where cod_alm = '01'
   and tp_transac = '26'
   and serie = 19
   and numero = 23160;

select *
  from kardex_d
 where cod_alm = '01'
   and tp_transac = '26'
   and serie = 19
   and numero = 23160;
