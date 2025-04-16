grant select on requisitos to privilegios_lectura_pvs;

grant insert on requisitos to privilegios_inserta_pvs;

grant delete on requisitos to privilegios_elimina_pvs;

grant update on requisitos to privilegios_actualiza_pvs;

-- grant execute on p_correo_noaprueba_pedido_pev to privilegios_lectura_pvs;

-- grant alter any procedure to privilegios_actualiza_pvs;

-- grant create any procedure to privilegios_actualiza_pvs;

-- revoke alter any procedure from nyabar;
create or replace public synonym requisitos for pla_control;

select *
  from dba_objects
 where object_name = 'PLA_CONTROL';

select * from activo_fijo;