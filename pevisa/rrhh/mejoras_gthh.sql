select *
  from planilla10.personal
 where c_codigo = 'E43400'
   and confin is not null;

select *
  from vw_personal
 where c_codigo = 'E617';

select *
  from evaluacion
 where id_evaluado = 'E1010'
   and periodo_al = to_date('30/06/2025', 'dd/mm/yyyy')
 order by periodo_del desc;

select *
  from evaluacion
 where periodo_al = to_date('31/03/2025', 'dd/mm/yyyy')
 order by periodo_del desc;

select *
  from evaluacion
 where id_evaluacion = 10205;

select *
  from vw_evalrrhh_det
 where id_evaluacion = 10205;

declare
  c_person constant planilla10.personal.c_codigo%type := 'E617';
  l_pers            planilla10.personal%rowtype;
  l_ideval          evaluacion.id_evaluacion%type;
  l_eval            evaluacion%rowtype;
  l_encuesta        encuesta.id_encuesta%type;
  l_puntaje_act     number;
  l_puntaje_max     number;
  l_porc            number;
begin
  select *
    into l_pers
    from planilla10.personal
   where c_codigo = c_person;

  select max(id_evaluacion)
    into l_ideval
    from evaluacion
   where id_evaluado = c_person
     and periodo_al = l_pers.confin
     and id_estado != '9'
   order by periodo_del desc;

  begin
    select *
      into l_eval
      from evaluacion
     where id_evaluacion = l_ideval;
  exception
    when others then dbms_output.put_line('SIN EVALUACION');
  end;

  begin
    select total
      into l_puntaje_act
      from vw_evalrrhh_det
     where id_evaluacion = l_ideval;
  exception
    when others then l_puntaje_act := 0;
  end;

  begin
    select id_encuesta
      into l_encuesta
      from encuesta
     where activo = 'SI'
       and clase = l_pers.clase;
  exception
    when no_data_found then l_encuesta := null;
  end;

  select nvl(sum(c.puntaje), 0)
    into l_puntaje_max
    from encuesta_pregunta ep
       , pregunta p
       , calificacion c
   where ep.id_pregunta = p.id_pregunta
     and c.id_calificacion = 'MB'
     and p.id_tipo_entrada = 10
     and ep.id_encuesta = l_encuesta;

  begin
    l_porc := round(l_puntaje_act / l_puntaje_max * 100, 2);
  exception
    when zero_divide then l_porc := 0;
  end;

  -- 52 puntaje máximo O
  -- 56 puntaje máximo E
  dbms_output.put_line(l_eval.id_evaluacion);
  dbms_output.put_line(l_eval.meses_renovacion);
  dbms_output.put_line(l_puntaje_act);
  dbms_output.put_line(l_puntaje_max);
  dbms_output.put_line(l_porc);
end;


select h.c_codigo, h.apellido_paterno || ' ' || h.apellido_materno || ' ' || h.nombres as name
     , h.conini, h.confin, round(months_between(h.confin, h.conini)) as meses
     , s.nombre as seccion, a.dsc_act_especifica
  from personal h
     , tar_encarga e
     , personal h2
     , planilla10.tar_secc s
     , planilla10.hr_personal p
     , planilla10.t_actividad_especifica a
 where h.situacion < '8'
   and h.tipcon like :p_tipcon
   and h.confin = :p_confin
   and h.encargado = e.codigo(+)
   and h2.c_codigo = e.c_codigo
   and h.seccion = s.codigo
   and h.c_codigo = p.c_codigo(+)
   and p.id_cod_act = a.id_cod_act(+)
 order by 1;


select * from planilla10.t_actividad_especifica;

select * from planilla10.hr_personal;

select per.c_codigo
     , per.apellido_paterno || ' ' || per.apellido_materno || ', ' || per.nombres as nombre
     , per.conini
     , per.confin
     , per.clase
  from planilla10.personal per
     , planilla10.tar_encarga enc
 where per.encargado = enc.codigo
   and enc.c_codigo = :evaluacion.id_evaluador
   and per.situacion not in ('8', '9')
 order by per.apellido_paterno;


select id_encuesta, clase
  from encuesta
 where activo = 'SI'
   and clase = :xclase;

select *
  from encuesta_pregunta
 where id_encuesta = 1003;

select sum(c.puntaje)
  from encuesta_pregunta ep
     , pregunta p
     , calificacion c
 where ep.id_pregunta = p.id_pregunta
   and c.id_calificacion = 'MB'
   and ep.id_encuesta = 1003
   and p.id_tipo_entrada = 10;

select * from pregunta;

select * from tipo_entrada_dato;

select * from calificacion;

declare
  function puntaje_evaluacion(
    p_codpers planilla10.personal.c_codigo%type
  , p_confin  planilla10.personal.confin%type
  ) return number is
    l_ideval  evaluacion.id_evaluacion%type;
    l_puntaje number;
  begin
    select max(id_evaluacion)
      into l_ideval
      from evaluacion
     where id_evaluado = p_codpers
       and periodo_al = p_confin
       and id_estado != '9';

    begin
      select total
        into l_puntaje
        from vw_evalrrhh_det
       where id_evaluacion = l_ideval;
    exception
      when others then l_puntaje := null;
    end;

    return l_puntaje;
  end;
begin
  dbms_output.put_line(puntaje_evaluacion('E1207', to_date('31/03/2025', 'dd/mm/yyyy')));
end;