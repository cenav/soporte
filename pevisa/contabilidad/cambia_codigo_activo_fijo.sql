select *
  from activo_fijo
 where cod_activo_fijo like 'MQ1PJEB-052%';

select *
  from activo_fijo
 where cod_activo_fijo like 'MQ1PJEB-040 3%'
    or cod_activo_fijo like 'MQ1PJEB-041 4%'
    or cod_activo_fijo like 'MQ1PJEB-042 5%'
    or cod_activo_fijo like 'MQ1PJEB-050 6%'
    or cod_activo_fijo like 'MQ1PJEB-051 7%'
    or cod_activo_fijo like 'MQ1PJEB-052 8%'
 order by cod_activo_fijo;

-- update tmp_carga_data
--    set detalle = replace(detalle, ' ', '-');

alter table activo_fijo
  disable constraint uq_afijo_abreviatura;

alter table activo_fijo
  disable constraint uq_activofijo_codple;

declare
  cursor afijo_cr is
    select cod_activo_fijo, detalle
      from tmp_carga_data;
begin
  for r in afijo_cr loop
    begin
      insert into activo_fijo( cod_activo_fijo, descripcion, cod_estado, cod_clase
                             , fecha_adquisicion, fecha_recepcion, fecha_activacion, centro_costo
                             , cod_ubicacion, tangible_intangible, cod_tipo_adquisicion, cod_banco
                             , cod_prestamo, valor_adquisicion_s, valor_adquisicion_d
                             , tipo_cambio_adquisicion, moneda_adquisicion, vida_util
                             , cuenta_contable, forma_pago, porcentaje_precios
                             , porcentaje_tributario, porcentaje_nif, ref_proveedor, ref_tipo
                             , ref_serie, ref_numero, oc_serie, oc_numero, cod_motivo_baja
                             , fecha_baja, descripcion_baja, valor_residual_s, valor_residual_d
                             , cod_metodo_deprec, cuenta_depreciacion, cuenta_gasto_depreciacion
                             , cod_adicion, cod_tipo_adicion, num_importa, ref_libre, leasing_banco
                             , leasing_numero, ano_baja, mes_baja, libro_baja, voucher_baja
                             , cod_subclase, activacion_almacen, activacion_tp_transac
                             , activacion_serie, activacion_numero, depreciable, otm_tipo, otm_serie
                             , otm_numero, origen, imagen_path_1, imagen_path_2, imagen_path_3
                             , imagen_path_4, cuenta_gasto_mantto, cuenta_gasto_baja, inoperativo
                             , abreviatura, cod_ple, tipo_doc_baja, serie_doc_baja, numero_doc_baja
                             , fecha_doc_baja, numero_denuncia_baja, fecha_denuncia_baja
                             , cod_motivo_baja_tipo, responsable, cta_reclasif_activo
                             , cta_reclasif_depreciacion, flag_otm)
      select r.detalle, descripcion, cod_estado, cod_clase, fecha_adquisicion, fecha_recepcion
           , fecha_activacion, centro_costo, cod_ubicacion, tangible_intangible
           , cod_tipo_adquisicion, cod_banco, cod_prestamo, valor_adquisicion_s, valor_adquisicion_d
           , tipo_cambio_adquisicion, moneda_adquisicion, vida_util, cuenta_contable, forma_pago
           , porcentaje_precios, porcentaje_tributario, porcentaje_nif, ref_proveedor, ref_tipo
           , ref_serie, ref_numero, oc_serie, oc_numero, cod_motivo_baja, fecha_baja
           , descripcion_baja, valor_residual_s, valor_residual_d, cod_metodo_deprec
           , cuenta_depreciacion, cuenta_gasto_depreciacion, cod_adicion, cod_tipo_adicion
           , num_importa, ref_libre, leasing_banco, leasing_numero, ano_baja, mes_baja, libro_baja
           , voucher_baja, cod_subclase, activacion_almacen, activacion_tp_transac, activacion_serie
           , activacion_numero, depreciable, otm_tipo, otm_serie, otm_numero, origen, imagen_path_1
           , imagen_path_2, imagen_path_3, imagen_path_4, cuenta_gasto_mantto, cuenta_gasto_baja
           , inoperativo, abreviatura, cod_ple, tipo_doc_baja, serie_doc_baja, numero_doc_baja
           , fecha_doc_baja, numero_denuncia_baja, fecha_denuncia_baja, cod_motivo_baja_tipo
           , responsable, cta_reclasif_activo, cta_reclasif_depreciacion, flag_otm
        from activo_fijo
       where cod_activo_fijo = r.cod_activo_fijo;

      update itemord
         set cod_art  = r.detalle
           , cod_orig = r.detalle
       where cod_art = r.cod_activo_fijo;

      insert into activo_fijo_asigna
      select r.detalle, fecha_entrega, cod_empleado, entrega_alm, entrega_tpo, entrega_ser
           , entrega_nro, fecha_retorno, retorno_alm, retorno_tpo, retorno_ser, retorno_nro, otros
           , cargo_entrega, cargo_retorno, cod_proveedor, cargo_baja, baja
        from activo_fijo_asigna
       where cod_activo_fijo = r.cod_activo_fijo;

      update kardex_d
         set cod_art = r.detalle
       where cod_art = r.cod_activo_fijo;

      delete from activo_fijo where cod_activo_fijo = r.cod_activo_fijo;
      delete from activo_fijo_asigna where cod_activo_fijo = r.cod_activo_fijo;
      delete from pcarticul where cod_art = r.cod_activo_fijo;
    exception
      when others then
        rollback;
        raise_application_error(-20001, r.cod_activo_fijo || ' ' || sqlerrm);
    end;
  end loop;
end;