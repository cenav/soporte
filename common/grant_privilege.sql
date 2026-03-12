-- VW_RESUMEN_EJECUTIVO_DESARRO
-- VW_PRIORIDAD_PIEZAS_DESA_COLOR

grant select on vw_pr_proceso_limite to privilegios_lectura_pvs;

grant insert on vw_pr_proceso_limite to privilegios_inserta_pvs;

grant delete on vw_pr_proceso_limite to privilegios_elimina_pvs;

grant update on vw_pr_proceso_limite to privilegios_actualiza_pvs;

-- grant execute on evaluacion_personal to privilegios_lectura_pvs;

-- grant alter any procedure to privilegios_actualiza_pvs;

-- grant create any procedure to privilegios_actualiza_pvs;

-- revoke alter any procedure from nyabar;

-- create or replace public synonym TMP_PEDIDO_SUGERIDO for pla_control;
