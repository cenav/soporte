grant select on tmp_pedido_sugerido to privilegios_lectura_pvs;

grant insert on tmp_pedido_sugerido to privilegios_inserta_pvs;

grant delete on tmp_pedido_sugerido to privilegios_elimina_pvs;

grant update on tmp_pedido_sugerido to privilegios_actualiza_pvs;

-- grant execute on pkg_bono_oa_query to privilegios_lectura_pvs;

-- grant alter any procedure to privilegios_actualiza_pvs;

-- grant create any procedure to privilegios_actualiza_pvs;

-- revoke alter any procedure from nyabar;

-- create or replace public synonym TMP_PEDIDO_SUGERIDO for pla_control;


select *
  from req_cot_mes_historial
 where id_historial = 741;

alter table planeamiento_compras_historial
  modify id_historial number(6);