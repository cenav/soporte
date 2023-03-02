declare
  cursor packing_cr is
    select *
      from pk_gnumero
     where pk_numero in (
                         53372, 53375, 53390, 53382, 53377, 53376, 53391, 53392, 53398, 53399,
                         53378, 53379, 53304, 53400
       );
begin
  for r in packing_cr loop
    update pk_paletas_cierre c
       set pk_tipo = 'P'
     where pk_numero = r.pk_numero
       and pk_tipo = 'PK';

    update pk_gnumero c
       set estado = '0'
     where pk_numero = r.pk_numero;
  end loop;

  commit;
end;