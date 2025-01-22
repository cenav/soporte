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
