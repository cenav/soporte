select *
  from ot_mantto
 where id_tipo = 'MQ'
   and id_serie = 2
   and id_numero in (2993, 2997);

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

select * from ot_mantto_justifica;

select *
  from ot_mantto
 where id_tipo = 'VH'
   and id_serie = 4
   and id_numero = 42;

select *
  from activo_fijo
 where cod_activo_fijo = 'VH-VV-BTN639';


select * from marca_maquina;


select * from ot_mantto_justifica;


select lpad(a.id_serie, 3, '0') as id_serie, lpad(a.id_numero, 6, '0') as id_numero
     , c.descripcion as tipo, a.fecha_solicitud, a.estado, b.descripcion
     , trunc(sysdate - a.fecha_solicitud) as dias
     , trunc(months_between(sysdate, a.fecha_solicitud)) as meses, a.desc_solicitud
  from ot_mantto a
     , estado_otm b
     , ot_mantto_tipo c
 where a.estado = b.id_estado
   and trunc(months_between(sysdate, a.fecha_solicitud)) >= 4
   and a.fecha_cierre_mantto is null
   and a.estado not in (4, 8, 9)
   and a.id_tipo = c.id_tipo
   and not exists (
   select 1
     from ot_mantto_justifica j
    where j.id_tipo = a.id_tipo
      and j.id_serie = a.id_serie
      and j.id_numero = a.id_numero
   )
 order by 3;


select lpad(a.id_serie, 3, '0') as id_serie, lpad(a.id_numero, 6, '0') as id_numero
     , c.descripcion as tipo, a.fecha_solicitud, a.estado, b.descripcion
     , trunc(sysdate - a.fecha_solicitud) as dias
     , trunc(months_between(sysdate, a.fecha_solicitud)) as meses, a.desc_solicitud
     , case when j.id_numero is not null then 'SI' else 'NO' end as justificacion
  from ot_mantto a
       join estado_otm b on a.estado = b.id_estado
       join ot_mantto_tipo c on a.id_tipo = c.id_tipo
       left join ot_mantto_justifica j
                 on a.id_tipo = j.id_tipo
                   and a.id_serie = j.id_serie
                   and a.id_numero = j.id_numero
 where trunc(months_between(sysdate, a.fecha_solicitud)) >= 4
   and a.fecha_cierre_mantto is null
   and a.estado not in (4, 8, 9)
 order by 3;

select lpad(a.id_serie, 3, '0') as id_serie, lpad(a.id_numero, 6, '0') as id_numero
     , c.descripcion as tipo, a.fecha_solicitud, a.estado, b.descripcion
     , trunc(sysdate - a.fecha_solicitud) as dias
     , trunc(months_between(sysdate, a.fecha_solicitud)) as meses, a.desc_solicitud
     , case when j.id_numero is not null then 'SI' else 'NO' end as justificacion
  from ot_mantto a
       join estado_otm b on a.estado = b.id_estado
       join ot_mantto_tipo c on a.id_tipo = c.id_tipo
       left join ot_mantto_justifica j
                 on a.id_tipo = j.id_tipo
                   and a.id_serie = j.id_serie
                   and a.id_numero = j.id_numero
 where trunc(months_between(sysdate, a.fecha_solicitud)) >= 4
   and a.fecha_cierre_mantto is null
   and a.estado not in (4, 8, 9)
 order by 3;

begin
  pkg_notificaciones.notificar_cierre_otm();
end;

select *
  from personal_mantto
 where admin = 'S';

select *
  from activo_fijo
 where cod_activo_fijo = 'MQ1PJEB-058';

select *
  from ot_mantto
 where id_activo_fijo = 'MQ1PJEB-058';

select *
  from pr_tabmaq
 where codigo = 'MQ1PJEB-044';

select * from pr_ot;

select * from pr_ot_det;

select * from pr_ot_detalles;

select * from pr_ot_det_consumo;

select * from kardex_d;

select * from pr_grupos;

select *
  from pr_grupos_lineas
 where id_grupo = '01';

select * from prod_subgrupo_linea_rel;

select * from tab_lineas;