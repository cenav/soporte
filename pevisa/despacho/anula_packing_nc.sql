select distinct pk_tipo, pk_serie, pk_numero, g.cod_cliente, c.nombre, g.estado, scod_alm, sguia_tp
              , sguia_serie, sguia_numero, sguia_fecha, transporte_medio
  from pk_glosa g
     , exclientes c
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

select *
  from pk_glosa
 where pk_numero = 56015;

select *
  from pk_gnumero
 where pk_numero = 56015;

select *
  from usuarios_cotizacion
 where usuario = 'JFIGUEROA';


select * from vendedores;

select *
  from letras_envio
 where numero in (
                  '361914', '361570', '360858', '362096', '362071', '361727', '361265', '363943',
                  '363246', '361123', '358752', '359306', '362032', '356974', '359162', '361724'
   );

select *
  from pk_gnumero
 where pk_numero in (
                     41517, 56022, 56023, 56024, 56025, 56026, 56027, 56028, 56029, 56030, 56031,
                     56032, 56033, 56034, 56035, 56036, 56039, 56040, 56041, 56042, 56043, 56044,
                     56045, 56046, 56047, 56048, 56051, 56052, 56054, 56055, 56056, 56057, 56058,
                     56059, 56060, 56061, 56062, 56063, 56069, 56070, 56072, 56076, 56078, 56079,
                     56080, 56081, 56082, 56085, 56090, 56091, 56097, 56098, 56101, 56102, 56103,
                     56104, 56107, 56120, 56121, 56122, 56123, 56124, 56125, 56126, 56131, 56132,
                     56133, 56134, 56135, 56136, 56137, 56138, 56139, 56140, 56141, 56142, 56150,
                     56159
   );