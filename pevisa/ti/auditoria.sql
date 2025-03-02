select *
  from sig_conexiones
 where usuario = 'CWONG'
   and trunc(creacion_cuando) >= to_date('10/08/2024', 'DD/MM/YYYY')
 order by creacion_cuando desc;


select cod_alm, tp_transac, serie, numero, fecha, usuario, glosa
  from kardex_g_historia
 where usuario = 'DCONTRERAS'
   and trunc(fecha) >= to_date('10/08/2024', 'DD/MM/YYYY')
 order by fecha desc;



select cod_alm, tab_aux(cod_alm, 33) as nombre_almacen, tp_transac
     , tab_aux(tp_transac, 32) as transaccion, serie, numero, fecha, usuario, glosa
  from kardex_g_historia
 where usuario = 'DCONTRERAS'
   and trunc(fecha) >= to_date('01/12/2024', 'DD/MM/YYYY')
   and trunc(fecha) <= to_date('31/12/2024', 'DD/MM/YYYY')
 order by fecha desc;



select h.ano, h.mes, h.libro, tab_aux(h.libro, 01) as descripcion_libro, h.voucher, h.glosa
     , h.tipo_evento, h.creacion_quien, h.creacion_cuando, h.creacion_donde
  from movglos_historia h
 where creacion_quien = 'KSIGUENAS'
   and trunc(creacion_cuando) >= to_date('01/12/2024', 'DD/MM/YYYY')
   and trunc(creacion_cuando) <= to_date('31/12/2024', 'DD/MM/YYYY')
 order by creacion_cuando;


select distinct tipo_evento
  from movglos_historia
 where creacion_quien = 'APASTRANA';


select *
  from movglos_historia
 where creacion_quien = 'APASTRANA';


select *
  from movglos_historia
 where ano = 2025
   and mes = 1
   and libro = '08'
   and voucher = 10001;

select id_log, accion, cod_id_pk, tabla, columna, old, new, fecha, usuario, ip, txt
  from log_auditoria
 where tabla = 'EXCLIENTES';

select distinct tabla from log_auditoria;

select *
  from exclientes
 where nombre like '%%';

-- trazabilidad de los accesos
select *
  from sig_conexiones
 where programa = 'ECLIENTE_2018'
 order by creacion_cuando desc;

select *
  from sig_conexiones
 where usuario = 'EVALIENTE'
 order by creacion_cuando desc;

select * from sig_conexiones
where programa = 'AF_LIBRO_ELECTRONICO_ARRENDAMIENTO_FINANCIERO';

select distinct c.usuario, nvl(u.nombres, c.usuario) as nombre
  from sig_conexiones c
       left join usuarios u on c.usuario = u.usuario
 order by c.usuario;

select distinct programa from sig_conexiones order by programa;

select os_username, /* nombre de usuario SO */
  username, /* nombre de usuario BD */
  terminal, decode(returncode, '0', 'Conectado',
                   '1005', 'Solo username, sin password',
                   '1017', 'Password incorrecto',
                   returncode) as estado
     , /* comprobacion de error */
  to_char(timestamp, 'DD-MON-YY HH24:MI:SS'), /* hora de entrada */
  to_char(logoff_time, 'DD-MON-YY HH24:MI:SS') /* hora de salida */
  from dba_audit_session
 where username in ('KSIGUENAS')
--AND returncode = '1017'
 order by timestamp desc;

