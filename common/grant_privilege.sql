-- VW_RESUMEN_EJECUTIVO_DESARRO
-- VW_PRIORIDAD_PIEZAS_DESA_COLOR

grant select on campana_registro_final to privilegios_lectura_pvs;

grant insert on tmp_carga_efact to privilegios_inserta_pvs;

grant delete on tmp_carga_efact to privilegios_elimina_pvs;

grant update on tmp_carga_efact to privilegios_actualiza_pvs;

grant delete on tmp_carga_efact to csuarez;

grant update on tmp_carga_efact to csuarez;

-- grant execute on evaluacion_personal to privilegios_lectura_pvs;

-- grant alter any procedure to privilegios_actualiza_pvs;

-- grant create any procedure to privilegios_actualiza_pvs;

-- revoke alter any procedure from nyabar;

-- create or replace public synonym TMP_PEDIDO_SUGERIDO for pla_control;
