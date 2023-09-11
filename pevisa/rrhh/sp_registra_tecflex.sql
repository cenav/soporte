create or replace procedure sp_registra_tecflex(
  p_serie       number
, p_numero      number
, p_desde       date
, p_hasta       date
, p_id_personal varchar2
, p_id_concepto varchar2
, p_hora_inicio number
, p_hora_fin    number
, p_descripcion varchar2
, p_citt        varchar2
, p_doctor      varchar2
) is
  l_fechaini    number;
  l_fechafin    number;
  l_fecha       date;
  l_idpersonal  number;
  l_idpermiso   number;
  l_idjustifica number;
  fmt           varchar2(10) := 'j';
begin
  l_fechaini := to_number(to_char(p_desde, fmt));
  l_fechafin := to_number(to_char(p_hasta, fmt));

  for cr_fecha in l_fechaini .. l_fechafin loop
    l_fecha := to_date(cr_fecha, fmt);

    -- Busca codigo de personal en Tecflex
    begin
      select idpersonal
        into l_idpersonal
        from asistencia.personal
       where cod_personal = p_id_personal;
    exception
      when others then
        raise_application_error(-20001, 'No existe codigo de presonal en el sistema de Tecflex');
    end;

    -- Busca codigo de concepto en Tecflex
    begin
      select id_tecflex
        into l_idpermiso
        from concepto_permiso
       where id_concepto = p_id_concepto;
    exception
      when others then
        raise_application_error(-20002, 'Revisar codigo de permiso');
    end;

       insert into asistencia.justificacion( idpersonal, fecha, idconcepto, hora_inicio
                                           , hora_fin, observacion, citt, doctor, idactividad
                                           , idsubactividad, idgrupo, estado, idgestionvacdet)
       values ( l_idpersonal, l_fecha, l_idpermiso, p_hora_inicio
              , p_hora_fin, p_descripcion, p_citt
              , p_doctor, '0'
              , '0', '0', '1', null)
    returning idjustificacion into l_idjustifica;

    -- Guarda la relacion entre los premisos de Oracle con los permisos de Tecflex
    insert into permiso_idtecflex(serie, numero, idjustificacion)
    values (p_serie, p_numero, l_idjustifica);
  end loop;
exception
  when others then
    rollback;
    raise_application_error(-20999, 'Error al registrar el permiso en Tecflex' || sqlerrm);
end;