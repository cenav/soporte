select * from produccion_armado;

select * from produccion_armado_his;

select *
  from produccion_armado_cajas
 where cod_caja = '413829';

select *
  from produccion_armado_cajas_det
 where cod_caja = '413829';


/*
IF X_ESTADO = 1 THEN
		:PRODUCCION_ARMADO_CAJAS.X_ESTADO := 'ABIERTA';
SET_ITEM_PROPERTY('PRODUCCION_ARMADO_CAJAS.X_ESTADO', VISUAL_ATTRIBUTE, 'PRODUCCION');
ELSIF X_ESTADO = 2 THEN
		:PRODUCCION_ARMADO_CAJAS.X_ESTADO := 'CERRADA';
SET_ITEM_PROPERTY('PRODUCCION_ARMADO_CAJAS.X_ESTADO', VISUAL_ATTRIBUTE, 'TERMINADO');
ELSIF X_ESTADO = 3 THEN
		:PRODUCCION_ARMADO_CAJAS.X_ESTADO := 'OBSERVADA';
SET_ITEM_PROPERTY('PRODUCCION_ARMADO_CAJAS.X_ESTADO', VISUAL_ATTRIBUTE, 'OBSERVADO');
ELSIF X_ESTADO = 4 THEN
		:PRODUCCION_ARMADO_CAJAS.X_ESTADO := 'REVISADA';
SET_ITEM_PROPERTY('PRODUCCION_ARMADO_CAJAS.X_ESTADO', VISUAL_ATTRIBUTE, 'REVISADO');
ELSIF X_ESTADO = 5 THEN
		:PRODUCCION_ARMADO_CAJAS.X_ESTADO := 'PESADA';
SET_ITEM_PROPERTY('PRODUCCION_ARMADO_CAJAS.X_ESTADO', VISUAL_ATTRIBUTE, 'PESADO');
END IF;
*/

-- reporte cajas prioritarias
select c.cod_caja, c.estado, c.nvl_contenido
     , case c.estado
         when '1' then 'ABIERTA'
         when '2' then 'CERRADA'
         when '3' then 'OBSERVADA'
         when '4' then 'REVISADA'
         when '5' then 'PESADA'
         when '6' then 'TERMINADO'
       end as dsc_estado
     , case c.nvl_contenido
         when 'LL' then 'LLENO'
         when 'NLL' then 'NO LLENO'
       end as dsc_contenido
     , a.fecha_ini, a.fecha_fin
     , c.cantidad, c.tipo_caja, c.peso
     , d.numero_oa, d.num_ped, d.cod_art, c.cantidad
  from produccion_armado_cajas c
       join produccion_armado_cajas_det d on c.cod_caja = d.cod_caja
       join produccion_armado a on d.numero_oa = a.numero_oa
 where extract(year from a.fecha_ini) = 2025;

