-- Enlace de facturas de exportacion con cuentas por cobrar
select tipodoc, serie, numero, fecha, regexp_substr(numero, '^550+')
     , replace(numero, regexp_substr(numero, '^550+'), null) as num_factcob
  from exfacturas
 where fecha > to_date('01/07/2019', 'DD/MM/YYYY');


select e.tipodoc, e.serie, e.numero, e.fecha, f.numero
  from exfacturas e
       left join factcob f
                 on e.tipodoc = f.tipdoc
                   and e.serie = f.serie_num
                   and replace(e.numero, regexp_substr(e.numero, '^550+'), null) = f.numero
 where to_char(e.fecha, 'YYYYMM') = '201907'
   and e.estado != '9'
 order by e.numero;


select f.*
  from exfacturas e
       join factcob f
            on e.tipodoc = f.tipdoc
              and e.serie = f.serie_num
              and replace(e.numero, regexp_substr(e.numero, '^550+'), null) = f.numero
 where e.estado != '9'
   and e.numero = 55005260;


-- DECLARE
--     fact factcob%ROWTYPE;
-- BEGIN
--     fact := api_factcob.ONEROW(55002771);
--     sys.dbms_output.put_line(fact.tipdoc);
--     sys.dbms_output.put_line(fact.serie_num);
--     sys.dbms_output.put_line(fact.numero);
--     sys.dbms_output.put_line(fact.saldo);
-- END;

select *
  from vw_booking_facturas
 where fecha_despacho is not null
   and fecha_salida is not null
 order by fecha_salida desc, numero_booking;

-- revisar booking 102454 ==> fecha de salida diferente mismo booking

select *
  from vw_booking_facturas
 where fecha_bl is null
 order by fecha_salida desc, numero_booking;

select b.numero_booking, b.fecha, b.fecha_salida, b.nombre_nave, b.naviera, b.numero_factura, b.fecha_factura
     , b.cod_cliente
     , b.nombre_cliente, b.cond_pago
     , (
  select count(*)
    from vw_booking_facturas c
   where c.numero_booking = b.numero_booking
  ) as total_facturas
     , (
  select count(*)
    from vw_booking_facturas c
   where c.numero_booking = b.numero_booking
     and c.fecha_bl is null
  ) as facturas_sin_bl
  from vw_booking_facturas b
 order by b.fecha_salida desc, b.numero_booking;


select *
  from vw_booking_facturas
 where facturas_sin_bl > 0
 order by fecha_salida desc, numero_booking;


select *
  from vw_booking_facturas
 where saldo > 0
 order by fecha_salida desc, numero_booking;


select b.numero_booking, f.numero, f.estado, f.cond_pago, f.fecemb
  from exbooking_d b
       join exfacturas f on b.numero_factura = f.numero
 where numero_booking = '04221-0618';


select e.tipodoc, e.serie, e.numero, e.fecha, c.numero
  from exfacturas e
       left join factcob c
                 on e.tipodoc = c.tipdoc
                   and e.serie = c.serie_num
                   and replace(e.numero, regexp_substr(e.numero, '^550+'), null) = c.numero
 where to_char(e.fecha, 'YYYYMM') = '201907'
   and e.estado != '9'
 order by e.numero;


select *
  from factcob_canje
 where tipdoc = '01'
   and numero = '7736';

select *
  from factcob_canje
 where numero = 14373;

select *
  from canjedoc
 where doccanje = 'J1'
   and sercanje = '1'
   and nrocanje = '68856';

select * from ruta_docvirtual;

select *
  from caja
 where id_serie = 9
   and id_numero = 2;


-- 2020 8 60 81158

select *
  from letras
 where nrolet = 13110;


select *
  from canjedoc
 where nrodoc = 55014373;

select *
  from logger_logs
 order by id desc;


select numero_booking, fecha, fecha_salida, nombre_nave, naviera, numero_factura, fecha_factura, cod_cliente
     , nombre_cliente, cond_pago
     , fecha_bl, packing, fecha_despacho, total_facturas, facturas_sin_bl, saldo
  from vw_booking_facturas
 where saldo > 0
   and numero_booking = '102424'
 order by fecha_salida desc, numero_booking;


select to_date('28/08/2019', 'DD/MM/YYYY') + 90 + 2
  from dual;


select *
  from exfacturas
 where numero = '55005954';


select *
  from factcob
 where cod_cliente = '00000990411'
   and tipdoc = 'LV'
   and numero = '11803';


select *
  from factcob
 where cod_cliente = '00000990411'
   and tipdoc = '01'
   and numero = '5954';


select *
  from factcob
 where cod_cliente = '00000990411'
   and tipdoc = '01'
   and numero = '4403';


select *
  from movdeta
 where nro_referencia = '4403'
   and relacion = '00000990411'
   and libro = '60';


select *
  from exfacturas_his
 where numero = 55005891;

select *
  from exbooking
 where fecha_embarque is not null;


select *
  from exfacturas_his
 where to_char(fecha, 'YYYYMM') = '201906'
   and accion = '85';


select h.*
  from exfacturas f
       join exfacturas_his h on f.numero = h.numero and h.accion = '82'
 where to_char(f.fecha, 'YYYYMM') = '201906';


select *
  from exfacturas f
       join exfacturas_his h on f.numero = h.numero and h.accion = '82'
 where to_char(f.fecha, 'YYYYMM') = '201907';


select *
  from exfacturas f
 where to_char(f.fecha, 'YYYYMM') = '201907'
   and f.estado != - '9';


select descripcion
  from exenviodoc
 where cod_envio = 1;


select descripcion, cod_courier
  from courier;


select *
  from activo_fijo
 where cod_activo_fijo = 'MQ3COM-002';


select *
  from exfacturas_his
 where numero = 55006005;


select *
  from exfacturas
 where numero = 55006005;



select *
  from exbooking
 where fecha_embarque is not null;


select *
  from exbooking_d
 where numero_factura = 55005994;


select *
  from exbooking_d
 where numero_booking = 'PER 5779296 A';


select *
  from exfacturas_his
 where numero in (
                  55005679, 55005776, 55006011, 55006012, 55006013, 55006014
   )
   and accion in ('73', '74', '75', '76', '82', '83', '84', '85');


select numero_booking, fecha, fecha_salida, nombre_nave, naviera, numero_factura, fecha_factura, cod_cliente
     , nombre_cliente
     , cond_pago, fecha_bl, packing, fecha_despacho, total_facturas, facturas_sin_bl, saldo
  from vw_booking_facturas
 where numero_booking in
       ('ILS-000316', '1699A00804', '1699A00799', '0112-19', '06207-0919', '087LIM334548', 'ILS-000315',
        'ELL0002132/2019', 'PAMIT19041E')
 order by fecha_salida desc, numero_booking;


select *
  from exbooking_d
 where numero_booking = 'ILS-000311';

select *
  from exfacturas
 where numero = 55006009;

select *
  from factcob
 where cod_cliente = '00000996076'
   and numero = '6009';

-- pendiente 087LIM334548


select *
  from pk_gnumero
 where pk_numero = 40542;


select *
  from exfacturas_his
 where numero in
       (55006014, 55005776, 55006012, 55006011, 55006013, 55005679, 55005997, 55005994, 55005998, 55005999,
        55005996, 55005995)
   and accion = '94';


select numero_booking, fecha, fecha_salida, nombre_nave, naviera, numero_factura, fecha_factura, cod_cliente
     , nombre_cliente
     , cond_pago, fecha_bl, packing, fecha_despacho, total_facturas, facturas_sin_bl, saldo
  from vw_booking_facturas
 where numero_booking in ('MXMZN19044C')
       --AND fecha_despacho IS NULL
 order by fecha_salida desc, numero_booking;


select f.numero, c.nrodoc, e.numero as exnumero
  from canjedoc c
       join factcob_canje f on c.doccanje = f.doccanje and c.sercanje = f.sercanje and c.nrocanje = f.nrocanje
       left join exfacturas e on e.tipodoc = f.tipdoc
      and e.serie = f.serie_num
      and replace(e.numero, regexp_substr(e.numero, '^550+'), null) = f.numero
 where c.tpodoc = 'LV'
   and c.serdoc = '2'
   and c.nrodoc in (
                    '11818', '11819', '11820', '11821', '11822', '11823', '11824', '11825', '11826', '11827',
                    '11828', '11829', '11830',
                    '11831', '11832', '11833', '11834', '11835', '11836', '11837', '11838', '11839', '11840',
                    '11841', '11842', '11803',
                    '11804', '11805', '11806', '11807', '11808', '11809', '11810', '11811', '11812', '11813',
                    '11814', '11815', '11816',
                    '11817'
   );


declare
  exfact exfacturas%rowtype;

  cursor facturas is
    select f.numero, c.nrodoc as nrolv, e.numero as exnumero
      from canjedoc c
           join factcob_canje f
                on c.doccanje = f.doccanje and c.sercanje = f.sercanje and c.nrocanje = f.nrocanje
           left join exfacturas e on e.tipodoc = f.tipdoc
          and e.serie = f.serie_num
          and replace(e.numero, regexp_substr(e.numero, '^550+'), null) = f.numero
     where c.tpodoc = 'LV'
       and c.serdoc = '2'
       and c.nrodoc in (
                        '11818', '11819', '11820', '11821', '11822', '11823', '11824', '11825', '11826',
                        '11827', '11828', '11829',
                        '11830',
                        '11831', '11832', '11833', '11834', '11835', '11836', '11837', '11838', '11839',
                        '11840', '11841', '11842',
                        '11803',
                        '11804', '11805', '11806', '11807', '11808', '11809', '11810', '11811', '11812',
                        '11813', '11814', '11815',
                        '11816',
                        '11817'
       );
begin
  for r in facturas loop
    exfact := api_exfacturas.onerow(r.exnumero);
    update factcob
       set vended = case exfact.zona when '02' then '93' when '05' then '94' end
     where tipdoc = 'LV' and serie_num = '2' and numero = r.nrolv;
  end loop;
end;


select tipdoc, serie_num, numero, vended, voucher
  from factcob
 where tipdoc = 'LV'
   and serie_num = '2'
   and numero in (
                  '11818', '11819', '11820', '11821', '11822', '11823', '11824', '11825', '11826', '11827',
                  '11828', '11829', '11830',
                  '11831', '11832', '11833', '11834', '11835', '11836', '11837', '11838', '11839', '11840',
                  '11841', '11842', '11803',
                  '11804', '11805', '11806', '11807', '11808', '11809', '11810', '11811', '11812', '11813',
                  '11814', '11815', '11816',
                  '11817'
   );


select distinct relacion
  from movdeta
 where ano = 2019
   and voucher in
       (80983, 80987, 80987, 80988, 80989, 80990, 80991, 80992, 80993, 80994, 80995, 80996, 80997, 80998,
        80999,
        81001, 81002, 81003, 81004,
        81005, 81006, 81007, 81008, 81009, 81010, 81011, 81012, 81013, 81014, 81015, 81016, 81017, 81018,
        81019,
        81020, 81021, 81022, 81023,
        81024, 81025
         )
   and libro = '60';


select vendedor
  from clientes
 where cod_cliente in (
                       '00000990641', '00000990411', '00000991503', '00000990713', '00000990937',
                       '00000996057'
   );


select tipo_referencia, serie_ref, nro_referencia, vended
  from factcob
 where tipdoc = 'L1'
   and serie_num = '1'
   and numero = '11818';


select e.cod_vende, t.lista_pre
  from exclientes e
       join extablas_expo t on e.cod_vende = t.codigo and t.tipo = '13'
 where e.cod_cliente = substr('00000996057', 6);


select *
  from extablas_expo
 where tipo = 13;


select *
  from vw_booking_facturas
 where saldo > 0
 order by fecha_salida desc, numero_booking;


select *
  from vw_booking_facturas
 where numero_booking in ('COU-4')
 order by fecha_salida desc, numero_booking;


select *
  from vw_booking_facturas
 where saldo > 0
   and estado != '4'
   and facturas_despachadas = total_facturas
 order by fecha_salida desc, numero_booking;


select *
  from exbooking
 where numero_booking like 'PER 5827271 A';


select *
  from vw_booking_facturas
 where numero_booking in ('COU-1', 'COU-2');


select *
  from solimat_g
 where numero in (128663, 128671, 128680, 128662, 128669);


select *
  from solimat_d
 where numero in (128663, 128671, 128680, 128662, 128669);


-- ver fecha mirian
select *
  from exbooking
 where numero_booking = 'COU-9';


select *
  from exbooking_d
 where numero_booking = 'COU-9';

-- 2019-11-16 00:00:00

select numero_booking, fecha, fecha_salida, nombre_nave, naviera, numero_factura, fecha_factura, cod_cliente
     , nombre_cliente
     , cond_pago, fecha_bl, packing, fecha_despacho, total_facturas, facturas_sin_bl, saldo
     , facturas_despachadas
  from vw_booking_facturas
 where saldo > 0
   and estado != '4'
   and numero_booking = '54870152'
--    AND facturas_despachadas = total_facturas
 order by fecha_salida desc, numero_booking;


select numero_booking, fecha, fecha_salida, nombre_nave, naviera, numero_factura, fecha_factura, cod_cliente
     , nombre_cliente
     , cond_pago, fecha_bl, packing, fecha_despacho, total_facturas, facturas_sin_bl, saldo
  from vw_booking_facturas
 where saldo > 0
   and estado != '4'
   and facturas_despachadas = total_facturas
 order by fecha_salida desc, numero_booking;


select *
  from vw_booking_facturas
 where numero_booking = 'COU-9';


select numero_booking, fecha, fecha_salida, nombre_nave, naviera, numero_factura, fecha_factura, cod_cliente
     , nombre_cliente, cond_pago, fecha_bl, estado, facturas_despachadas
     , packing, fecha_despacho, total_facturas, facturas_sin_bl, saldo
  from vw_booking_facturas
 where numero_factura = 55007915
--  WHERE saldo > 0
--    AND estado != '4'
--    AND facturas_despachadas = total_facturas
 order by fecha_salida desc, numero_booking;

select *
  from exbooking_d
 where numero_factura = 55007625;


select *
  from error_log
 order by id_log desc;


begin
  pkg_canje_lv.genera_batch();
  commit;
end;


select *
  from exbooking_d
 where numero_booking = '104002';


-- 104002,55006726
-- 104002,55006818


select *
  from error_log
 order by id_log desc;


select *
  from logger_logs
 order by id desc;


select *
  from factcob_canje
 where numero in (
                  6958, 6725, 6702, 6859, 6768, 6674, 6766, 6773, 6904, 6916, 6889, 6782, 6864, 6871
   );

select *
  from factcob_canje
 where nrocanje = 67180;


select *
  from letras
 where docref = 'J1'
   and serref = 1
   and nroref = 67180;


select *
  from all_source
 where upper(text) like '%TABLA DE MESES Y LIBROS, NO HABILITADA%';


select nvl(numero, 0), incluye_mes, automatico
  from nrolibr
 where ano = 2020
   and mes = 3
   and libro = '60'
   and nvl(estado, 0) < 9;


select *
  from exfacturas
 where numero in (55006960, 55006726, 55006818);


select *
  from pk_gnumero
 where pk_numero in (41542, 41799, 42139);


select *
  from error_log
 order by id_log desc;


begin
  pkg_canje_lv.genera_batch();
end;

select * from error_log order by id_log desc;

select regexp_substr(55010550, '^550+')
     , replace(55010550, regexp_substr(55010550, '^550+'), null)
     , regexp_replace(55010550, '^550+', null, 1)
  from dual;

select distinct numero_booking
  from vw_booking_facturas
 where saldo > 0
   and estado != '4'
   and facturas_despachadas = total_facturas;

select numero_booking, fecha, fecha_salida, nombre_nave, naviera, numero_factura, fecha_factura, cod_cliente
     , nombre_cliente
     , cond_pago, fecha_bl, packing, fecha_despacho, total_facturas, facturas_sin_bl, saldo
  from vw_booking_facturas
 where saldo > 0
   and estado != '4'
   and facturas_despachadas = total_facturas
--    and numero_booking in ('107230')
 order by fecha_salida desc, numero_booking;


select distinct numero_booking
  from vw_booking_facturas
 where saldo > 0
   and estado != '4'
   and facturas_despachadas = total_facturas
   and numero_factura = 55014373;

select *
  from exbooking_d
 where numero_factura = 55014373;

select *
  from exbooking
 where numero_booking = 'CRPTC23001H';

select numero_booking, fecha, fecha_salida, nombre_nave, naviera, numero_factura, fecha_factura, cod_cliente
     , nombre_cliente, cond_pago, fecha_bl, packing, fecha_despacho, total_facturas, facturas_sin_bl, saldo
     , estado
  from vw_booking_facturas
 where numero_factura = '55011276'
--    and saldo > 0
--    and estado != '4'
   and facturas_despachadas = total_facturas
 order by fecha_salida desc, numero_booking;

select distinct numero_booking
  from vw_booking_facturas
 where saldo > 0
   and estado != '4'
   and facturas_despachadas = total_facturas;

select numero_booking, fecha, fecha_salida, nombre_nave, naviera, numero_factura, fecha_factura
     , cod_cliente, nombre_cliente
     , cond_pago, fecha_bl, packing, fecha_despacho, total_facturas, facturas_sin_bl, saldo
  from vw_booking_facturas
 where saldo > 0
   and estado != '4'
   and facturas_despachadas = total_facturas
   and numero_booking = '63807886'
   and numero_factura in ('55011644')
 order by fecha_salida desc, numero_booking;

select * from exbooking_d where numero_factura = '55011644';

select * from exbooking_d where numero_booking = '63807886';

select * from exbooking where numero_booking = '65098089';

select distinct numero_booking
  from vw_booking_facturas
 where saldo > 0
   and estado != '4'
   and facturas_despachadas = total_facturas;

select * from bono_obrero where estado = 1 order by id_bono_obrero;

select * from bono_obrero_rango order by id_bono_obrero, id_item;

select * from comision_ingeniero_grupo;

select * from tab_grupos where descripcion like '%OSRAM%';

select * from tab_lineas where descripcion like '%OSRAM%';

select * from clientes where cod_cliente = '10468893881';

select *
  from factcob_canje
 where tipdoc = '01'
   and numero = 14373;

select *
  from canjedoc
 where tpodoc = 'LV'
   and nrodoc = 19363;

select * from factcob;

select *
  from exfacturas
 where numero = 55014373;

select *
  from factcob_canje
 where nrocanje = '84320';

select *
  from factcob_canje
 where tipdoc = 'LV'
   and numero = '19363';

select distinct numero_booking
  from vw_booking_facturas
 where saldo > 0
   and estado != '4'
   and facturas_despachadas = total_facturas;

select *
  from solimat_g
 where numero = 177335;

select *
  from solimat_d
 where numero = 177335;

select *
  from kardex_g
 where num_importa = 'M22495';

select *
  from kardex_d
 where cod_alm = '02'
   and tp_transac = '11'
   and serie = 1
   and numero = 29622;