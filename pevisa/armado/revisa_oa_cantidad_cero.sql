select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and numero = 1160030;


select *
  from pr_ot_historia
 where nuot_tipoot_codigo = 'AR'
   and numero = 1160030;


select *
  from log_auditoria
 where tabla = 'PR_OT'
   and cod_id_pk in ('AR-1160030', 'AR-1178395', 'AR-1187028', 'AR-1189939');


create or replace trigger tbiu_pr_ot_cant_prog
  before insert or update of cant_prog
  on pr_ot
  for each row
begin
  if :new.cant_prog = 0 and :new.nuot_tipoot_codigo = 'AR' then
    raise_application_error(
        -20001,
        'La cantidad programada no puede ser cero.' || :new.formu_art_cod_art || '|' ||
        :new.abre01 || '-' || :new.per_env
    );
  end if;
end;

-- factura debe emitirse en el mes
-- anticipos fuera del mes


