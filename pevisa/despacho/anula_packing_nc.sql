select distinct pk_tipo, pk_serie, pk_numero, g.cod_cliente, c.nombre, g.estado, scod_alm, sguia_tp
              , sguia_serie, sguia_numero, sguia_fecha, transporte_medio
  from pk_glosa g, exclientes c
 where g.cod_cliente = c.cod_cliente
   and g.estado = '7'
   and scod_alm is not null
   and sguia_tp is not null
   and sguia_serie is not null
   and sguia_numero is not null
   and pk_tipo = 'PK'
   and pk_serie = '1'
   and pk_numero = 53529;

select *
  from pk_glosa
 where pk_numero = 53529;

select *
  from kardex_g
 where cod_alm = '01'
   and tp_transac = '26'
   and serie = 19
   and numero = 19468;

select *
  from lg_detalle_gastos
 where numero_embarque = 4123
   and nro_referencia = '13002';