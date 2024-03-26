select * from grupo_negocio;

select * from unidades_negocio;

select * from tipos_pedido_master;

select * from grupo_unidad_tipopedido;

select a.cod_art, a.descripcion, a.tp_c_stck, a.unidad, m.stock, a.tp_art, a.cod_fam, a.cod_lin
  from almacen m
     , articul a
 where m.cod_alm = 'M1'
   and m.cod_art = a.cod_art
   and a.estado <> '9'
   and a.cod_lin not in ('ZZ', '1980')
 order by a.descripcion;

select *
  from articul
 where (cod_lin between '1300' and '1379'
   or cod_lin between '2500' and '2599')
   and length(cod_lin) = 4;

select *
  from tablas_auxiliares
 where tipo = 33
   and codigo = 'M1';

select *
  from almacen
 where cod_art = 'MAT2 67001CS-1 CORTE';

select *
  from kardex_g
 where cod_alm = 'T1'
   and tp_transac = '27'
   and serie = 1
   and numero = 1371033;

select *
  from kardex_d
 where cod_alm = 'T1'
   and tp_transac = '27'
   and serie = 1
   and numero = 1371033;


select *
  from cambdol
 where fecha = to_date('21/09/2023', 'dd/mm/yyyy');

select *
  from kardex_g
 where cod_alm = 'A4'
   and tp_transac = '21'
   and serie = 1
   and numero = 34773;

select *
  from kardex_d
 where cod_alm = 'A4'
   and tp_transac = '21'
   and serie = 1
   and numero = 34773;

select *
  from cambdol;

select *
  from kardex_d
 where cod_art = '01ANDA10';

select *
  from transacciones_almacen
 where descripcion like '%VENTA%';

select *
  from transacciones_almacen
 order by lpad(tp_transac, 3, '0');

select *
  from numdoc
 where tp_transac = '21';

select *
  from numdoc
 order by serie;

select *
  from cambdol
 where fecha = to_date('19/03/2024', 'dd/mm/yyyy');

select *
  from cotizacion
 where serie = 20
   and num_ped = 196349;


select *
  from pedido
 where serie = 20
   and num_ped = 220016;


select *
  from pedido
 where (flag_cancel is not null
   or flag_nota_abono is not null
   or flag_impre is not null
   or flag_fact is not null
   or flag_despacha_saldo is not null
   or flag_impuesto is not null)
   and extract(year from fecha) = 2023;

select *
  from cambdol
 where fecha = to_date('24/03/2024', 'dd/mm/yyyy');


select *
  from cotizacion
 where num_ped = 196362;