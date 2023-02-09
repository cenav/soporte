-- contabilidad maestro
select *
  from movglos
 where ano = 2022
   and mes = 8
   and libro = '39'
   and voucher in (
   2205
   );

select *
  from movdeta
 where ano = 2023
   and mes = 1
   and libro = '08'
   and voucher in (
   10056
   );

select m.*
--      , round(m.cargo_d * 3.838, 2) as cargo_corregido
     , round(m.abono_d * 3.838, 2) as abonos_corregido
  from movdeta m
 where m.ano = 2022
   and m.mes = 8
   and m.libro = '14'
   and m.voucher in (
                     80187, 80188, 80203, 80204, 80205, 80238, 80239, 80241, 80242, 80243, 80244
   )
   and m.cuenta in (
   '759502'
   );

update movdeta m
   set m.cargo_s = round(m.cargo_d * 3.838, 2)
     , m.abono_s = round(m.abono_d * 3.838, 2)
     , m.cambio  = 3.838
 where m.ano = 2022
   and m.mes = 8
   and m.libro = '14'
   and m.voucher in (
                     80187, 80188, 80203, 80204, 80205, 80238, 80239, 80241, 80242, 80243, 80244
   )
   and m.cuenta in (
   '759502'
   );



select *
  from movfigl
 where ano = 2022
   and mes = 9
   and tipo = '2'
   and voucher in (
   93448
   );

select *
  from movfide
 where ano = 2022
   and mes = 9
   and tipo = '2'
   and voucher in (
   93448
   );

select *
  from movfigl_historia
 where ano = 2022
   and mes = 8
   and tipo = '3'
   and voucher = 80063;

select *
  from relacion
 where tipodoc = 'PR'
   and numero = 465638;

select *
  from movglos_anexos
 where ano = 2022
   and mes = 8
   and libro = '08'
   and voucher in (
   80299
   );

select *
  from movglos_historia;

select *
  from movfigl
 where ano = 2022
   and mes = 8
   and tipo = '5'
   and voucher in (
   82278
   );


select *
  from movfide
 where ano = 2022
   and mes = 8
   and tipo = '5'
   and voucher in (
   82278
   );


select *
  from factpag
 where cod_proveedor = '20251505111'
   and tipdoc = '01'
   and serie_num = 'F001'
   and numero in (
   '0021859'
   );


select *
  from vw_pagoimp_noemb
 where emb_ano = 2022;


  with costo as (
    select tip_doc, ser_doc, nro_doc
         , sum(canti * costo_d) as costo_total
         , sum(canti * costo) as costo_total_s
      from tmp_moviart_dos
     group by tip_doc, ser_doc, nro_doc
    )
     , facturas as (
    select pn.tipo, pn.serie, pn.numero, e.numero as nro_expo, e.cod_cliente, e.nombre, e.fecha as fch_factura
         , pn.total, pn.saldo, e.fecemb as fch_embarque, pn.fch_pago
         , extract(year from e.fecemb) as emb_ano
         , extract(month from e.fecemb) as emb_mes
      from pagoimp_noemb pn
           left join exfacturas e
                     on pn.tipo = e.tipodoc
                       and pn.serie = e.serie
                       and 55000000 + pn.numero = + e.numero
           left join docuvent d
                     on pn.tipo = d.tipodoc
                       and pn.serie = d.serie
                       and pn.numero = d.numero
    )
select f.tipo, f.serie, f.numero, f.nro_expo, f.cod_cliente, f.nombre, f.fch_factura, f.total, f.saldo
     , f.fch_embarque, f.fch_pago, f.emb_ano, f.emb_mes
  from facturas f
       left join costo c
                 on f.tipo = c.tip_doc
                   and f.serie = c.ser_doc
                   and to_char(f.nro_expo) = c.nro_doc
 where f.emb_ano = 2022;


select *
  from lg_factura_comercial
 where numero_embarque = 3901;

select *
  from lg_detalle_gastos
 where numero_embarque = 3864;

select *
  from lg_dua
 where numero_embarque = 3778;

select *
  from cambdol
 order by fecha desc;

select *
  from kardex_g_movglos
 where cod_alm = '30'
   and tp_transac = '11'
   and serie = 1
   and numero = 29163;

select *
  from caja_chica_d
 where codigo_relacion = '20523621212'
   and tipo_referencia = '01'
   and serie_referencia = 'F051'
   and nro_referencia = '2036356';

select *
  from activo_fijo_asigna
 where cod_activo_fijo = 'CPUC61';


select c_codigo, nombre
  from vw_personal
 where ((situacion not in ('8', '9') and :activo = 1) or situacion in ('8', '9') and :activo = 0)
 order by nombre;

select cod_activo_fijo, descripcion from activo_fijo order by cod_activo_fijo;

select *
  from prevencionista;

select * from prevencionista;

select *
  from activo_fijo
 where cod_activo_fijo in (
   'CPUC61-MONI'
   );


select *
  from activo_fijo
 where cod_activo_fijo = 'MAQ4GEN-001';

select *
  from activo_fijo_asiento
 where cod_activo_fijo = 'MAQ4GEN-001';

select *
  from kardex_d
 where cod_art in (
   '02LAPT17'
   )
 order by fch_transac;

select *
  from factcob
 where tipdoc = 'LV'
   and numero in (
   18428
   );

select *
  from cabfpag
 where cod_proveedor = '20538575748'
   and numero = 'MIA2208';

select *
  from letras
 where nrolet = '334378';

select *
  from activo_fijo_asiento
 where cod_activo_fijo = 'MQ2GEN-011';

select *
  from activo_fijo
 where cod_activo_fijo = 'MQ2GEN-011';

select * from activo_fijo_estado;

select *
  from ot_mantto
 where id_activo_fijo = 'MQ2GEN-011';

select *
  from activo_fijo
 where cod_activo_fijo = 'CEL985319973';

select *
  from activo_fijo
 where cod_activo_fijo = 'CEL996809126';

select * from activo_fijo_estado;

select centro_costo, nombre from planilla10.centro_de_costos;

select *
  from instrumento_asigna
 where id_instrumento = 18;

select cod_alm, tp_transac, serie, numero, cod_art, cantidad, fch_transac
  from kardex_d
 where cod_art in (
                   'MQ1LAB-018', 'MQ1LAB-019', 'MQ1LAB-020'
   )
   and tp_transac = '22';

select *
  from activo_fijo
 where cod_activo_fijo in (
                           'CEL944916015R1', 'CEL945071292R1', 'CEL951743667R1', 'CEL953294430R1',
                           'CEL956172744R1', 'CEL956750123R1', 'CEL956929601R1', 'CEL980318167R1',
                           'CEL981827234R1', 'CEL981855404R1', 'CEL985494952R1', 'CEL986770199R1',
                           'CEL988085231R1', 'CEL988467559R1', 'CEL990276313R1', 'CEL994544240R1',
                           'CEL996055321R1', 'CEL996370201R1', 'CEL996376384R1', 'CEL996410408R2',
                           'CEL996437569R1', 'CEL996493083R1', 'CEL996809126R1'
   );

select *
  from movfide_situacion_banco
 where voucher = '81041'
   and p_ano = 2022
   and p_mes = 8;

select *
  from movfide_situacion_banco
 where p_ano = 2022
   and p_mes = 8
   and monto like '%-40%';

select *
  from movfide_situacion_banco
 where p_ano = 2022
   and p_mes = 8
--    and voucher is null
   and monto = '-40.00';


select *
  from movfide_situacion_banco
 where p_ano = 2022
   and p_mes = 8
   and cta_cte_banco = '011-0910-01-00004183';

select *
  from movfide_situacion_banco
 where voucher = '84079'
   and p_ano = 2022
   and p_mes = 8;

select *
  from activo_fijo
 where cod_activo_fijo = '05RELO1';

select *
  from kardex_d
 where cod_art = '05RELO1';

select *
  from nrolibr
 where ano = 2022
   and mes = 6
   and libro = '05';


select * from serie_caja order by id_serie;

select *
  from planilla10.personal
 where c_codigo = 'E935';

select *
  from activo_fijo_depreciacion
 where extract(year from fecha) = 2022
   and extract(month from fecha) = 12;

select *
  from activo_fijo
 where cod_activo_fijo = '05RELO1';

select *
  from activo_fijo_asiento
 where cod_activo_fijo = '05RELO1';

-- call depreciacion.elimina(2022, 5);

select count(*)
  from vw_almacen_activo_fijo v
 where v.cod_art = '05RELO1';

select *
  from ot_mantto
 where id_tipo = 'MQ'
   and id_serie = 7
   and id_numero = 5150;

select *
  from kardex_g
 where cod_alm = 'A3'
   and tp_transac = '27'
   and serie = 1
   and numero = 1237655;

select * from paramaf;

select *
  from gastos_de_viaje
 where id_vendedor = '38'
   and numero = 117;

select *
  from kardex_g_movglos
 where cod_proveedor = '20549453024'
   and tipdoc_cp = '01'
   and serie_cp = 'FFF1'
   and numero_cp = '3015';

select *
  from view_kardex_reg_compras
 where cod_relacion = '20601026741'
   and tipdoc_cp = '01'
   and serie_cp = 'E001'
   and numero_cp = '960';

select *
  from activo_fijo
 where cod_activo_fijo = 'MQ1COR-004';

select *
  from cambdol
 where fecha = to_date('22/07/2022', 'dd/mm/yyyy');

select *
  from activo_fijo
 where cod_activo_fijo = 'RACK SELECT12';

select *
  from pcarticul
 where cod_art = 'RACK SELECT12';

select *
  from articul
 where cod_art = 'RACK SELECT11';


select *
  from caja_chica_d
 where serie = 7
   and numero = 22039;

select * from vendedores where cod_vendedor = 'M1';

select * from transacciones_almacen;

select *
  from kardex_g
 where cod_alm = '63'
   and tp_transac = '10'
   and serie = 39
   and numero = 778;

select *
  from kardex_d
 where cod_alm = '63'
   and tp_transac = '10'
   and serie = 39
   and numero = 778;

select *
  from activo_fijo_depreciacion
 where cod_activo_fijo = '05BALA1 MAN1'
   and moneda = 'D'
 order by fecha desc;

select *
  from activo_fijo_depreciacion
 where cod_activo_fijo = 'EQ MEDIC9'
   and cod_tipo_depreciacion = 'NIF'
   and moneda = 'D';

select *
  from tablas_auxiliares
 where codigo = '....'
 order by tipo;

select *
  from tablas_auxiliares
 where tipo = '2'
 order by codigo;

select *
  from pevisa.gastos_de_viaje
 where id_vendedor = 'Z2'
   and numero = 123;

select *
  from docuvent
 where tipodoc = '01'
   and serie = 'F050'
   and numero in (
                  156189, 156190, 156191
   );

select *
  from gastos_de_viaje_d
 where tipo_documento = '99'
   and extract(year from fecha_documento) >= 2022;

select *
  from caja_chica_d
 where tipo_referencia = '99'
   and serie != 7
   and fecha_referencia > to_date('01/01/2022', 'dd/mm/yyyy');

select *
  from caja_chica_d
 where serie = 1
   and numero = 20199;

select *
  from movdeta
 where nro_referencia = '1285173'
   and relacion = '24022';

select * from logger_logs order by id desc;

select descripcion, codigo
  from tablas_auxiliares
 where tipo = 2
   and codigo <> '....'
   and codigo in ('01', '02', '03', '99')
 order by codigo;

declare
  l_caja  caja%rowtype;
  l_param caja_asiento.t_paramc;
begin
  l_caja := api_caja.onerow(1, 10);
  l_param.fecha := to_date('01/08/2022', 'dd/mm/yyyy');
  l_param.glosa := 'GTS REPRESENTACIION JHONY FIGUEROA';
  caja_asiento.contabilidad(l_caja, l_param);
end;


select *
  from movglos
 where ano = 2022
   and mes = 1
   and libro = '05'
   and voucher = 10073;

select *
  from movdeta
 where ano = 2022
   and mes = 1
   and libro = '08'
   and voucher = 10802;

select *
  from view_kardex_reg_compras
 where ano = 2022
   and mes = 1
   and tipdoc_cp = '02'
   and serie_cp = 'E001'
   and numero_cp = 88
   and cod_art = 'SLIM380.651';

select *
  from view_kardex_reg_compras
 where ano = 2022
   and mes = 1
   and voucher = '20015';

  with vouchers as (
    select ano, mes, libro, voucher, fecha
         , case libro
             when '08' then 1
             when '05' then 2
             when '40' then 3
             else 99
           end as orden
      from movdeta
     where relacion = '20543236978'
       and tipo_referencia = '01'
       and serie = 'E001'
       and nro_referencia = lpad('40', 7, '0')
       and libro not in ('10')
       and ano = 2022
       and mes = 1
     order by orden
    )
select v.ano, v.mes, v.libro, v.voucher, v.fecha
  from vouchers v
 where rownum = 1;

select *
  from kardex_g_movglos
 where ano = 2022
--    and mes = 1
   and tipdoc_cp = '01'
   and serie_cp = 'E001'
--    and numero_cp = '0000040'
   and cod_proveedor = '20543236978';

select *
  from kardex_g_movglos
 where ano = 2022
--    and mes = 1
   and voucher = '20207';

select *
  from caja_chica_d
 where ano = 2022
   and voucher = '20207';

select *
  from caja_chica_d
 where codigo_relacion = '20543236978';

select *
  from caja_chica_d
 where nro_referencia = '40';

select *
  from caja
 where id_serie = 1
   and id_numero = 28;

select * from estado_caja order by id_estado;

select *
  from caja_chica
 where serie = 1
   and numero = 20236;

select sysdate from dual;

select *
  from ctabnco
 where n_cta_cte is not null
 order by codigo;

select *
  from caja
 where id_serie = 1
   and id_numero = 22;

select *
  from caja_d
 where id_serie = 1
   and id_numero = 22;

select * from estado_caja order by id_estado;

select * from ruta_docvirtual;

  with kx as (
    select costo_s, costo_d
      from kardex_d
     where cod_alm = 'A3'
       and tp_transac in ('11', '16')
       and cod_art = '02LAPT17'
       and costo_s != 0
       and costo_d != 0
     order by fch_transac desc
    )
select *
  from kx
 where rownum = 1;

select *
  from caja
 where id_serie = 1;

select p.c_codigo, p.nombre
  from vw_personal p
 where p.situacion not in (
   select codigo
     from planilla10.t_situacion_cesado
   )
 order by nombre;


declare
  l_caja  caja%rowtype;
  l_param caja_asiento.t_paramc;
begin
  l_caja := api_caja.onerow(1, 10);
  l_param.fecha := to_date('31/08/2022', 'dd/mm/yyyy');
  l_param.glosa := 'GTS REPRESENTACION JHONY FIGUEROA';
--   caja_asiento.contabilidad(l_caja, l_param);
end;

select *
  from movdeta
 where libro = '46'
   and nro_referencia = '1285173';

select *
  from movglos
 where ano = 2018
   and mes = 6
   and libro = '46'
   and voucher = 60040;


select *
  from movdeta
 where ano = 2022
   and mes = 7
   and libro = '14'
   and voucher in (
                   71578, 71579, 71580, 70231, 70232, 70233, 70234, 70235, 70236, 70237, 70238, 70239, 70240,
                   70241, 70242, 70243, 70244, 70245, 70246, 70247, 70248, 70249, 70250, 70251, 70252, 70253,
                   70254, 70255, 70256, 70257, 70258, 70259, 70260, 70261, 70262, 70263, 70264, 70265, 70266,
                   70267, 70268, 70269, 70270, 70271, 70272, 70273, 70274, 70275, 70276, 70277, 70278, 70279,
                   70280, 70281, 70282, 70283, 70284, 70285, 70286, 70287, 70288, 70289, 70290, 70291, 70292,
                   70293, 70294, 70295, 70296, 70297, 70298, 70299, 70300, 70301, 70302, 70303, 70304, 70305,
                   70306, 70307, 70308, 70309, 70310, 70311, 70312, 70313, 70314, 70315
   );

select *
  from movglos
 where ano = 2022
   and mes = 7
   and libro = '14'
   and voucher = 70306;

select *
  from movdeta
 where ano = 2022
   and mes = 7
   and libro = '38'
   and voucher = 70002;

select *
  from movdeta
 where ano = 2022
   and mes = 7
   and libro = '14'
   and voucher = 70231;

select *
  from factcob
 where tipdoc = '01'
   and serie_num = 'F055'
   and numero = '13162';

select *
  from cabfcob
 where tipdoc = '01'
   and serie_num = 'F055'
   and numero = '13162';


select *
  from movdeta
 where ano = 2022
   and mes = 7
   and voucher = 70002
   and libro = '38'
   and tipo_referencia = '01'
   and serie = 'F055'
   and nro_referencia = '13207';

select costo_sol, cod_art from tmp_carga_data;

select replace(trim(cod_art), '14-', '') from tmp_carga_data;

-- actualiza tipo cambio
declare
  l_asiento movdeta%rowtype;
begin
  for r in (select costo_sol, cod_art from tmp_carga_data)
  loop
    select *
      into l_asiento
      from movdeta
     where ano = 2022
       and mes = 7
       and libro = '14'
       and voucher = r.cod_art
       and tipo_relacion = 'C';

    update movdeta
       set abono_s = r.costo_sol
         , cargo_s = 0
     where ano = 2022
       and mes = 7
       and voucher = 70002
       and libro = '38'
       and tipo_referencia = l_asiento.tipo_referencia
       and serie = l_asiento.serie
       and nro_referencia = l_asiento.nro_referencia;
  end loop;
end;


select *
  from cambdol_historia
 where trunc(fecha) = to_date('31/08/2022', 'dd/mm/yyyy');

select cod_relacion as cod_proveedor, tipdoc_cp as tipdoc, serie_cp as serie_num, numero_cp as numerodoc
     , cod_art, ano, mes, libro, voucher
  from view_kardex_reg_compras
 where ano = 2022
   and mes = 7
--        and libro = '10'
   and voucher is null
--        and voucher like '2%'
 group by cod_relacion, tipdoc_cp, serie_cp, numero_cp, ano, mes, voucher, cod_art, libro;


select *
  from saldosc_tmp
 where fecha_dif = to_date('31/08/2022', 'dd/mm/yyyy') and ctactble = '131302';

select *
  from activo_fijo
 where cod_activo_fijo in (
                           'MQ1METP-120', 'MQ1METP-121', 'MQ1METP-122', 'MQ1METP-123'
   );

select *
  from pcarticul
 where cod_art in (
                   'MQ1METP-120', 'MQ1METP-121', 'MQ1METP-122', 'MQ1METP-123'
   );

select *
  from ot_mantto
 where id_tipo = 'PY'
   and id_serie = 1
   and id_numero = 5;

select *
  from itemord
 where serie = 6
   and num_ped = 1677;

select *
  from gastos_de_viaje_d
 where id_vendedor = 'Z2'
   and numero = 127;

declare
  type t_rec is record (
    num number
  );
  l_rec t_rec;
begin
  l_rec.num := least(l_rec.num, 8);
  dbms_output.put_line(l_rec.num);
end;

select ano, mes, libro, voucher
     , case libro
         when '08' then 1
         when '05' then 2
         when '40' then 3
         else 99
       end as orden
  from movdeta
 where relacion = '10070983791'
   and tipo_referencia = '02'
   and serie = 'E001'
--    and nro_referencia = lpad(r.numerodoc, 7, '0')
   and libro not in ('10')
   and ano = 2022
--    and mes = 8
 order by orden;

select *
  from ot_mantto
 where id_tipo = 'PY'
   and id_serie = 2
   and id_numero = 530;

select *
  from caja_chica_d
 where otm_tipo = 'PY'
   and otm_serie = 2
   and otm_numero = 530;

select *
  from itemord
 where otm_tipo = 'PY'
   and otm_serie = 2
   and otm_numero = 2298;

select *
  from kardex_d_otm
 where otm_tipo = 'PY'
   and otm_serie = 2
   and otm_numero = 549;

select *
  from itemord
 where serie = 6
   and num_ped in (2298);

select *
  from activo_fijo
 where cod_activo_fijo = 'MAQ4GEN-002';

select *
  from activo_fijo_asiento
 where cod_activo_fijo = 'MAQ4GEN-002';

select *
  from gastos_de_viaje_habilitado
 where id_vendedor = '20'
   and numero = 216;

select *
  from transacciones_almacen
 where tp_transac = '22';

select *
  from kardex_d d
 where d.cod_alm = '62'
   and d.tp_transac = '22'
   and d.serie = 1
   and d.numero = 217839;

select *
  from kardex_g g
 where g.cod_alm = 'A3'
   and g.tp_transac = '11'
   and g.serie = 1
   and g.numero = 28456;

select *
  from kardex_d d
 where d.cod_alm = 'A3'
   and d.tp_transac = '11'
   and d.serie = 1
   and d.numero = 28456;


select *
  from kardex_d d
 where d.cod_art = 'CEL996437769R1';

select *
  from almacen
 where cod_art = 'CEL996437769R1';

select *
  from movdeta
 where ano = 2023
   and cuenta = '2821'
   and generado = 'O';

select *
  from transacciones_almacen
 where tp_transac = '22';

select *
  from activo_fijo
 where cod_activo_fijo = 'ACC4 AREN-001';

select *
  from kardex_d_otm
 where cod_alm = '62'
   and tp_transac = '22'
   and serie = 1
   and numero = 217839;

select *
  from kardex_d_otm
 where cod_alm = '62'
   and tp_transac = '22'
   and serie = 1
   and numero = 217841;

