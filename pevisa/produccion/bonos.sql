select * from responsabilidad_cargo;

select * from proceso_rsc;

select * from estado_otm order by id_estado;

select *
  from comision_ingeniero
 where cod_personal in ('E41916', 'E4526', 'E1202', 'E1201');

select *
  from comision_ingeniero_asigna
 where cod_personal in ('E1202', 'E1201');

select *
  from planilla10.personal
 where c_codigo in (
                    'E41916', 'E4526'
   );
