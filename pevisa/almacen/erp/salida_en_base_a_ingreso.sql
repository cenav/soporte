declare
  cursor cr_ingresos is
    select cod_art, sum(cantidad) as cant
      from kardex_d
     where cod_alm = '08'
       and tp_transac = '16'
       and serie = 1
       and numero in (204221)
     group by cod_art;
begin
  for r in cr_ingresos loop
    insert into pevisa.kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d
                                , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado
                                , cuenta69, origen, ing_sal, lote, conos, tara, flag, autonum, orden
                                , pr_proveedor, pr_referencia, pr_ordcomp, pr_codpza, pr_valvta
                                , pr_cosfob, pr_canthabi, pr_tipot, pr_numot, pr_numped)
    values ( '02', '27', 1, 1544585, r.cod_art, r.cant, 0.000000, 0.000000, date '2024-08-12'
           , 0.00, 0.00, 0.000, '0', null, 'P', 'S', null, null, null, null, null, null, null, null
           , null, null, null, null, null, null, null, null);
  end loop;
end;

select sum(cantidad)
     , count(*)
  from kardex_d
 where cod_alm = '91'
   and tp_transac = '11'
   and serie = 2
   and numero in (8282, 8283, 8284, 8285);

insert into kardex_g( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref, ser_doc_ref
                    , nro_doc_ref, glosa, tp_relacion, cod_relacion, nro_sucur, cond_pag, nro_lista
                    , moneda, cod_vende, cliente_afecto, por_desc1, por_desc2, motivo, estado
                    , origen, ing_sal, flg_impr, ubicacion, cod_transp, domicilio, ruc_transp
                    , nombre, direccion, ruc, tara_co, tara_bo, tara_ca, placa_transp, le_transp
                    , cant_item, num_importa, tipo_pguia, serie_pguia, numero_pguia, pr_procedencia
                    , pr_numped)
select cod_alm, tp_transac, serie, 678, to_date('03/05/2024', 'dd/mm/yyyy'), tip_doc_ref
     , ser_doc_ref, nro_doc_ref, glosa
     , tp_relacion, cod_relacion, nro_sucur, cond_pag, nro_lista, moneda, cod_vende, cliente_afecto
     , por_desc1, por_desc2, motivo, estado, origen, ing_sal, flg_impr, ubicacion, cod_transp
     , domicilio, ruc_transp, nombre, direccion, ruc, tara_co, tara_bo, tara_ca, placa_transp
     , le_transp, cant_item, 'ADS24031', tipo_pguia, serie_pguia, numero_pguia, pr_procedencia
     , pr_numped
  from kardex_g
 where cod_alm = '91'
   and tp_transac = '34'
   and serie = 1
   and numero = 677;

select *
  from kardex_g
 where cod_alm = '91'
   and tp_transac = '34'
   and serie = 1
   and numero = 678;


select *
  from kardex_d
 where cod_alm = '91'
   and tp_transac = '34'
   and serie = 1
   and numero = 678;

select sum(cantidad)
     , count(*)
  from kardex_d
 where cod_alm = '91'
   and tp_transac = '34'
   and serie = 1
   and numero = 678;

-- salida por despiece
select *
  from transacciones_almacen
 where tp_transac = '34';

select *
  from numdoc
 where tp_transac = '27'
   and serie = 1;

-- 02	27	1	1542698
select *
  from kardex_g
 where cod_alm = '02'
   and tp_transac = '27'
   and serie = 1
   and numero = 1542698;

-- 02	27	1	1542698
select *
  from kardex_d
 where cod_alm = '02'
   and tp_transac = '27'
   and serie = 1
   and numero = 1542698
   and cod_art = 'BOLSA B-2';


select *
  from kardex_g
 where cod_alm = '08'
   and tp_transac = '16'
   and serie = 1
   and numero = 204221;

select *
  from kardex_d
 where cod_alm = '08'
   and tp_transac = '16'
   and serie = 1
   and numero = 204221
   and cod_art = 'ETIQ E-02 PEV';

insert into pevisa.kardex_g ( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref
                            , ser_doc_ref, nro_doc_ref, glosa, tp_relacion, cod_relacion, nro_sucur
                            , cond_pag, nro_lista, moneda, cod_vende, cliente_afecto, por_desc1
                            , por_desc2, motivo, estado, origen, ing_sal, flg_impr, ubicacion
                            , cod_transp, domicilio, ruc_transp, nombre, direccion, ruc, tara_co
                            , tara_bo, tara_ca, placa_transp, le_transp, cant_item, num_importa
                            , tipo_pguia, serie_pguia, numero_pguia, pr_procedencia, pr_numped
                            , nombre_archivo, nombre_archivo_ingreso, texto_1, texto_2, numero_1
                            , numero_2)
values ( '02', '27', 1, 1544585, date '2024-08-12', 'P2', 1, 195640, 'ARMADO', 'C', null, null, null
       , 1, null, null, null, 0.00, 0.00, '1', '0', 'P', 'S', '0', null, null, null, null, null
       , null, null, null, null, null, null, null, null, 'SM :1 195640', null, null, null, 'SOLIMAT'
       , null, null, null, null, null, null, null);

select *
  from kardex_g
 where tp_transac = '27'
   and serie = 1
 order by numero desc;

select *
  from kardex_d
 where cod_alm = '02'
   and tp_transac = '27'
   and serie = 1
   and numero = 1544585;