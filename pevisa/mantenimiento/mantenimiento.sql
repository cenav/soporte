select *
  from ot_mantto
 where id_tipo = 'PY'
   and id_serie = 3
   and id_numero in (6);

select *
  from solimat_d
 where numero = 178557;

select *
  from kardex_d_otm
 where cod_alm = '30'
   and tp_transac = '22'
   and serie = 1
   and numero = 248083;

select *
  from articul
 where cod_art = '180.790S';

select numero + 1
  from numdoc
 where tp_transac = '16'
   and serie = 1;

select *
  from numdoc
 where tp_transac = '16'
   and serie = 1;

select max(numero)
  from kardex_g
 where tp_transac = '16'
   and serie = 1;

select *
  from kardex_g
 where tp_transac = '16'
   and serie = 1
   and numero = 193383;

select e.descripcion as estado, ot.id_serie, ot.id_numero, ot.id_activo_fijo
     , af.descripcion as activo_fijo, mo.descripcion as tipo_orden, tm.descripcion as tipo_mantto
     , afc.descripcion as clase, ot.centro_costo, ge.descripcion as grupo, l.descripcion as local
     , pm.descripcion as importancia, af.cod_adicion as area, ot.desc_solicitud
     , to_char(ot.fecha_solicitud, 'DD/MM/YYYY HH24:MI') as fecha
     , nvl(ot.fecha_cierre, sysdate) - ot.fecha_solicitud as tiempo, ota.id_item, ota.actividad
     , to_char(ota.fecha_ini, 'DD/MM/YYYY HH24:MI') as fecha_ini
     , to_char(ota.fecha_fin, 'DD/MM/YYYY HH24:MI') as fecha_fin, sum(serv.soles) as serv_soles
     , sum(serv.dolares) as serv_dolares, sum(rep.valor_dol) as rep_dolares
     , sum(rep.valor_sol) as rep_soles
  from ot_mantto ot
       left join estado_otm e on (ot.estado = e.id_estado)
       left join activo_fijo af on (ot.id_activo_fijo = af.cod_activo_fijo)
       left join modo_otm mo on (ot.id_modo = mo.id_modo)
       left join tipo_mantenimiento tm on (ot.id_tipo_mantto = tm.id_tipo_mantto)
       left join activo_fijo_clase afc on (af.cod_clase = afc.cod_clase)
       left join edificacion ed on (ot.id_activo_fijo = ed.cod_activo_fijo)
       left join grupo_edificacion ge on (ed.cod_grupo = ge.cod_grupo)
       left join locales l on (ge.cod_local = l.cod_local)
       left join prioridad_mantto pm on (ot.id_prioridad = pm.id_prioridad)
       left join ot_mantto_actividad ota
                 on ot.id_tipo = ota.id_tipo and ot.id_serie = ota.id_serie and
                    ot.id_numero = ota.id_numero
       left join vw_compra_otm serv
                 on (ot.id_tipo = serv.otm_tipo and ot.id_serie = serv.otm_serie and
                     ot.id_numero = serv.otm_numero)
       left join vw_repuesto_otm rep
                 on (ot.id_tipo = rep.otm_tipo and ot.id_serie = rep.otm_serie and
                     ot.id_numero = rep.otm_numero)
 where ot.id_tipo = :p_tipo
   and ot.id_serie = :p_serie
   and ot.id_modo = :p_modo
   and ot.id_numero = :p_numero
 group by e.descripcion, ot.id_serie, ot.id_numero, ot.id_activo_fijo, af.descripcion
        , mo.descripcion, tm.descripcion, afc.descripcion, ot.centro_costo, ge.descripcion
        , l.descripcion, pm.descripcion, af.cod_adicion, ot.desc_solicitud
        , nvl(ot.fecha_cierre, sysdate) - ot.fecha_solicitud
        , to_char(ot.fecha_solicitud, 'DD/MM/YYYY HH24:MI'), ota.id_item, ota.actividad
        , to_char(ota.fecha_ini, 'DD/MM/YYYY HH24:MI')
        , to_char(ota.fecha_fin, 'DD/MM/YYYY HH24:MI');

-- serie otm
select ots.id_tipo, ott.descripcion as dsc_tipo, id_serie, ots.descripcion, nombre
  from ot_mantto_serie ots
       join ot_mantto_tipo ott on ots.id_tipo = ott.id_tipo
 order by id_tipo, id_serie;

select * from ot_mantto_tipo;

select *
  from ot_mantto om
 where id_tipo = 'PY'
   and id_serie = 2
   and id_numero = 726;

select *
  from otm_estado_historia
 where id_tipo = 'PY'
   and id_serie = 2
   and id_numero = 726;

select *
  from otm_serie_usuario
 where id_tipo = 'PY'
   and id_serie = 2;

select *
  from proceso_bono_oa
 where codigo in (1324, 1329);

select *
  from kardex_g_historia
 where cod_alm = '62'
   and tp_transac = '22'
   and serie = 160
   and numero = 206;

select *
  from kardex_g_historia
 where cod_alm = '62'
   and tp_transac = '22'
   and serie = 160
   and numero = 206;

select *
  from ot_mantto_serie
 where id_tipo = 'VH'
 order by id_serie;

select *
  from planilla10.personal
 where apellido_paterno like '%NEYRA%';

select *
  from almacenes
 where cod_alm = 'PM';

select *
  from transacciones_almacen
 order by tp_transac;

select *
  from transacciones_almacen
 where descripcion like '%TRASLADO%';

select *
  from tablas_auxiliares
 where tipo = 32
   and descripcion like '%TRASLA%';

select *
  from tablas_auxiliares
 where tipo = 32
   and descripcion like '%TRASLA%';

select *
  from tablas_auxiliares
 where codigo = '....'
 order by tipo;

select * from ingresos_conciliacion;

select *
  from lg_itemjam_otros
 where observacion is not null;

select * from modulo;
-- 275204

select *
  from kardex_d_otm
 where cod_alm = '02'
   and tp_transac = '22'
   and serie = 1
   and numero = 275204;

select r.*
     , sf_ultimo_costo_kardex(r.cod_art, r.fch_transac, 'S') as costo
     , sf_ultimo_costo_kardex(r.cod_art, r.fch_transac, 'D') as costo
  from vw_repuesto_otm r
       join kardex_d_otm k
            on r.otm_tipo = k.otm_tipo and r.otm_serie = k.otm_serie
              and r.otm_numero = k.otm_numero and r.cod_art = k.cod_art
 where r.otm_tipo = 'MQ'
   and r.otm_serie = 2
   and r.otm_numero = 2827;

select *
  from usuarios
 where usuario = 'DNUNEZ';

select *
  from vw_personal
 where nombre like '%MELGAR%';

select *
  from otm_serie_usuario
 where id_tipo = 'MQ'
   and id_serie = 2;

select *
  from ot_mantto_serie
 where id_tipo = 'MQ'
 order by id_serie;
