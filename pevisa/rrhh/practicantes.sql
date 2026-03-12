select * from vw_boleta_pagos_email;


select pl.num_pla, pl.c_codigo
     , pe.apellido_paterno || ' ' || pe.apellido_materno || ', ' || pe.nombres as nombres
     , pl.tot_neto, ph.email_p, pa.ano, pa.mes, pa.f_inicio, pa.f_final, ph.pago_mes
  from planilla10.planilla pl
       join planilla10.parampla pa on pl.num_pla = pa.num_pla
       join planilla10.personal pe on pl.c_codigo = pe.c_codigo
       left join planilla10.hr_personal ph on pe.c_codigo = ph.c_codigo;


select planilla.c_codigo
  from planilla10.planilla
 where num_pla = 1023
 order by regexp_substr(c_codigo, '^[A-Z]+'), to_number(regexp_substr(c_codigo, '[0-9]+'));


select *
  from planilla10.parampla
 where num_pla = 1024;