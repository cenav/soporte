select *
  from proceso_puntualidad
 order by fecha desc;

select *
  from proceso_puntualidad_pers
 where id_personal = 'E43229';

select * from pcarticul;

select *
  from pcarticul
 where division is not null;

select *
  from pcarticul
 where sub_clase is not null;

select *
  from vw_bono_rsc
 where id_proceso = 5
 order by id_proceso;

select id_proceso, sum(bono_bruto) as bono_bruto, sum(bono_neto) as bono_neto
     , sum(case id_turno when 1 then bono_neto else 0 end) as neto_dia
     , sum(case id_turno when 2 then bono_neto else 0 end) as neto_tarde
     , sum(case id_turno when 3 then bono_neto else 0 end) as neto_noche
  from proceso_rsc_d
 group by id_proceso;

select id_proceso, id_empleado, nom_empleado, id_cargo, dsc_cargo, id_encargado, nom_encargado
     , id_turno, dsc_turno, bono_bruto, bono_neto
  from proceso_rsc_d
 where id_proceso = 5;
