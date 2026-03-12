create or replace trigger tbiu_transferencia_iqbf
  before insert or update
  on kardex_d
  for each row
begin
  if not iqbf.es_almacen_controlado(:new.cod_alm) and iqbf.existe(:new.cod_art) then
    raise_application_error(-20001, 'IQBF no se puede transferir a otros almacenes');
  end if;
end;


create or replace trigger tbiu_kardex_d_bloqueo_p1
  before insert or update
  on kardex_d
  for each row
begin
  -- Bloquea cualquier movimiento hacia el almacén P1 si no es el usuario BMUNOZ
  if upper(:new.cod_alm) = 'P1' and user != 'BETY' then
    raise_application_error(
        -20002,
        'No autorizado: solo BMUNOZ puede registrar movimientos en el almacén P1.'
    );
  end if;
end;

alter trigger tbiu_kardex_d_bloqueo_p1 enable;