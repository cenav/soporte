-- bono mensual por puestos de alto riesgo
select *
  from planilla10.t_cargo
 where descripcion in (
                       'OPERADOR DE FERROFLEX', 'OPERADOR DE PLANCHADO', 'OPERADOR DE REMACHADO',
                       'OPERADOR DE SERIGRAFIA', 'OPERADOR DE SOLDADO', 'OPERADOR LASER',
                       'OPERARIO DE PINTADO', 'PESADOR DE MATERIALES', 'REGULADOR DE EQUIPO'
   )
   and perfil = 'SI';

select *
  from planilla10.personal
 where c_cargo = '610G';

select * from responsabilidad_cargo;

select r.id_cargo, c.descripcion, r.bono
  from responsabilidad_cargo r
       join planilla10.t_cargo c on r.id_cargo = c.c_cargo;

select *
  from planilla10.t_cargo
 where descripcion like '%MONTA%';

-- calculo responsabilidad al cargo
select r.id_cargo, p.desc_cargo, p.desc_encargado, p.nombre, r.bono
  from vw_personal p
       join responsabilidad_cargo r on p.c_cargo = r.id_cargo
 where p.situacion not in (
   select codigo
     from planilla10.t_situacion_cesado
   )
 order by desc_cargo, desc_encargado, nombre
