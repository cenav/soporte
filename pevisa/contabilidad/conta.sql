-- contabilidad maestro
select *
  from movglos
 where ano = 2023
   and mes = 6
   and libro = '11'
   and voucher = 60065;

select *
  from movdeta
 where ano = 2023
   and mes = 6
   and libro = '11'
   and voucher = 60065;

select *
  from factpag
 where numero = '0470850'
   and cod_proveedor = '20467534026';

select *
  from gastos_de_viaje
 where id_vendedor = '20'
   and numero = 215;

select *
  from movglos_historia
 where ano = 2023
   and mes = 1
   and libro = '08'
   and voucher in (
   11865
   )
 order by creacion_cuando;

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
  from movdeta
 where detalle = 'CEL996437769R1';

select *
  from movfigl
 where ano = 2023
   and mes = 6
   and tipo = '2'
   and voucher in (
   63316
   );

select *
  from movfide
 where ano = 2023
   and mes = 6
   and tipo = '2'
   and voucher in (
   63316
   );

select *
  from movglos_historia
 where ano = 2023
   and mes = 0
   and libro = '5'
   and voucher = 1;

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
 where cod_proveedor = '10254971133'
   and tipdoc = '02'
   and serie_num = 'E001'
   and numero in (
   '010042'
   );

select *
  from vw_pagoimp_noemb
 where emb_ano = 2022;

  with costo as (
    select tip_doc
         , ser_doc
         , nro_doc
         , sum(canti * costo_d) as costo_total
         , sum(canti * costo) as costo_total_s
      from tmp_moviart_dos
     group by tip_doc, ser_doc, nro_doc
    )
     , facturas as (
    select pn.tipo
         , pn.serie
         , pn.numero
         , e.numero as nro_expo
         , e.cod_cliente
         , e.nombre
         , e.fecha as fch_factura
         , pn.total
         , pn.saldo
         , e.fecemb as fch_embarque
         , pn.fch_pago
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
select f.tipo
     , f.serie
     , f.numero
     , f.nro_expo
     , f.cod_cliente
     , f.nombre
     , f.fch_factura
     , f.total
     , f.saldo
     , f.fch_embarque
     , f.fch_pago
     , f.emb_ano
     , f.emb_mes
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
 where cod_alm = 'A3'
   and tp_transac = '11'
   and serie = 1
   and numero = 30533;

select *
  from itemord
 where serie = 30
   and num_ped = 520;

select *
  from kardex_d
 where cod_alm = 'A3'
   and tp_transac = '11'
   and serie = 1
   and numero = 30533;

select *
  from caja_chica_d
 where codigo_relacion = '20523621212'
   and tipo_referencia = '01'
   and serie_referencia = 'F051'
   and nro_referencia = '2036356';

select * from caja_chica_serie;

select *
  from activo_fijo
 where cod_activo_fijo = 'MQ1ACAB-037';

select *
  from pr_tabmaq
 where codigo = 'MQ1ACAB-037';

select *
  from orden_de_compra
 where id_maquina = 'MQ1ACAB-037';

select *
  from itemord
 where cod_art = '04LAPT46';

select *
  from orden_de_compra
 where serie = 2
   and num_ped = 523;

select *
  from kardex_d
 where cod_art = '04LAPT46';

select c_codigo, nombre
  from vw_personal
 where ((situacion not in ('8', '9') and :activo = 1) or situacion in ('8', '9') and :activo = 0)
 order by nombre;

select cod_activo_fijo, descripcion
  from activo_fijo
 order by cod_activo_fijo;

select *
  from prevencionista;

select *
  from prevencionista;

select *
  from activo_fijo
 where cod_activo_fijo in (
                           '02ESCR14', '02ESCR13', '01ARCH59', '01ARCH58'
   );

select *
  from activo_fijo
 where cod_activo_fijo = 'CEL996437769R1';

select *
  from activo_fijo_asiento
 where cod_activo_fijo = 'CEL996437769R1';

select *
  from kardex_d
 where cod_art in (
   '02LAPT17'
   )
 order by fch_transac;

select *
  from factcob
 where tipdoc = '07'
   and serie_num = 'F055'
   and numero in (
   97
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
  from activo_fijo_estado;

select centro_costo, nombre
  from planilla10.centro_de_costos;

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


select *
  from serie_caja
 order by id_serie;

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

select *
  from paramaf;

select *
  from gastos_de_viaje
 where id_vendedor = '38'
   and numero = 117;

select *
  from kardex_g_movglos
 where tipdoc_cp = '01'
   and serie_cp = 'FFF1'
   and numero_cp = '0007326';

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
  from caja_chica
 where serie = 4
   and numero = 230068;

select *
  from caja_chica_d
 where serie = 4
   and numero = 230068;

select *
  from vendedores
 where cod_vendedor = 'M1';

select *
  from transacciones_almacen;

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
  from pevisa.gastos_de_viaje_habilitado_m
 where id_vendedor = '20'
   and numero = 220;

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
  from caja_chica
 where serie = 4
   and numero = 23016;

select *
  from caja_chica_d
 where serie = 4
   and numero = 23016;

select *
  from movdeta
 where nro_referencia = '1285173'
   and relacion = '24022';

select *
  from logger_logs
 order by id desc;

select descripcion, codigo
  from tablas_auxiliares
 where tipo = 2
   and codigo <> '....'
   and codigo in ('01', '02', '03', '99')
 order by codigo;

declare
  l_caja caja%rowtype;
  l_param
         caja_asiento.t_paramc;
begin
  l_caja
    := api_caja.onerow(1, 10);
  l_param.fecha
    := to_date('01/08/2022', 'dd/mm/yyyy');
  l_param.glosa
    := 'GTS REPRESENTACIION JHONY FIGUEROA';
  caja_asiento.contabilidad
    (l_caja, l_param);
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

select *
  from estado_caja
 order by id_estado;

select *
  from caja_chica
 where serie = 1
   and numero = 20236;

select sysdate
  from dual;

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

select *
  from estado_caja
 order by id_estado;

select *
  from ruta_docvirtual;

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
                   71578, 71579, 71580, 70231, 70232, 70233, 70234, 70235, 70236, 70237, 70238,
                   70239, 70240,
                   70241, 70242, 70243, 70244, 70245, 70246, 70247, 70248, 70249, 70250, 70251,
                   70252, 70253,
                   70254, 70255, 70256, 70257, 70258, 70259, 70260, 70261, 70262, 70263, 70264,
                   70265, 70266,
                   70267, 70268, 70269, 70270, 70271, 70272, 70273, 70274, 70275, 70276, 70277,
                   70278, 70279,
                   70280, 70281, 70282, 70283, 70284, 70285, 70286, 70287, 70288, 70289, 70290,
                   70291, 70292,
                   70293, 70294, 70295, 70296, 70297, 70298, 70299, 70300, 70301, 70302, 70303,
                   70304, 70305,
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
   and serie_num = 'FFF1'
   and numero = '007326';

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

select costo_sol, cod_art
  from tmp_carga_data;

select replace(trim(cod_art), '14-', '')
  from tmp_carga_data;

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

select cod_relacion as cod_proveedor
     , tipdoc_cp as tipdoc
     , serie_cp as serie_num
     , numero_cp as numerodoc
     , cod_art
     , ano
     , mes
     , libro
     , voucher
  from view_kardex_reg_compras
 where ano = 2022
   and mes = 7
--        and libro = '10'
   and voucher is null
--        and voucher like '2%'
 group by cod_relacion, tipdoc_cp, serie_cp, numero_cp, ano, mes, voucher, cod_art, libro;


select *
  from saldosc_tmp
 where fecha_dif = to_date('31/08/2022', 'dd/mm/yyyy')
   and ctactble = '131302';

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
   and id_serie = 2
   and id_numero in (549, 524);

select *
  from itemord
 where serie = 6
   and num_ped = 2274;

select *
  from gastos_de_viaje_d
 where id_vendedor = 'Z2'
   and numero = 127;

select *
  from ot_mantto
 where id_tipo = 'PY'
   and id_serie = 2
   and id_numero = 521;

select *
  from caja_chica_d
 where otm_tipo = 'PY'
   and otm_serie = 2
   and otm_numero = 530;

select *
  from itemord
 where otm_tipo = 'PY'
   and otm_serie = 2
   and otm_numero = 2259;

select *
  from kardex_d_otm
 where otm_tipo = 'PY'
   and otm_serie = 2
   and otm_numero = 298;

select *
  from kardex_d_otm
 where otm_tipo = 'PY'
   and otm_serie = 2
   and otm_numero = 298
   and cod_art = 'CAJA METALICA TIPO II';



select *
  from itemord
 where serie = 6
   and num_ped in (1909);

select *
  from activo_fijo
 where cod_activo_fijo = 'MAQ4GEN-002';

select *
  from activo_fijo_asiento
 where cod_activo_fijo = 'MAQ4GEN-002';

select *
  from gastos_de_viaje_habilitado
 where id_vendedor = '05'
   and numero = 229;

select *
  from gastos_de_viaje_m
 where id_vendedor = '05'
   and numero = 229;

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
 where d.cod_art = '04LAPT46';

select *
  from almacen
 where cod_art = '04LAPT46';

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
 where cod_activo_fijo = 'CEL996437769R1';

select *
  from activo_fijo_asiento
 where cod_activo_fijo = 'CEL996437769R1';

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

select *
  from ot_mantto
 where id_tipo = 'PY'
   and id_serie = 2
   and id_numero = 520;

select *
  from caja_chica;

select *
  from sistabgen
 where sistabcod = '137';

select *
  from grupo_edificacion
 order by cod_grupo;

select cod_art, detalle, ubicacion
  from tmp_carga_data;

select *
  from activo_fijo
 where cod_activo_fijo like 'LOCAL DESCARTES OFICINA%';

select *
  from cabfpag
 where ano = 2022
   and mes = 12
   and libro = '39'
   and voucher = 120004;

select *
  from kardex_g_movglos
 where cod_alm = '15'
   and tp_transac = '11'
   and serie = 2
   and numero = 7088;

select *
  from kardex_d
 where cod_alm = '15'
   and tp_transac = '11'
   and serie = 2
   and numero = 7088;

select *
  from activo_fijo
 where cod_activo_fijo like '%LOCAL DESCARTES PLANTA%'
 order by cod_activo_fijo;

-- pkg_activo_fijo.nuevo_codigo

select *
  from nroafijo;

--990216

-- declare
--   l_nro number;
-- begin
--   l_nro := api_nroafijo.next_key('LICENCIA WIND03', 'MAN');
--   dbms_output.put_line(l_nro);
-- end;

select *
  from caja_chica
 where serie = 1
   and numero = 23315;

select *
  from grupo_edificacion
 order by cod_grupo;

insert into grupo_edificacion(cod_grupo, descripcion, estado, cod_local)
select 20 + row_number() as over (order by centro_costo) as id
     , nombre
     , '1'
     , 'DES'
  from centro_de_costos
 where centro_costo in (
                        '1001', '1002', '1003', '2002', '2003', '2005', '2006', '2007', '3050',
                        '3060', '3090', '4001', '4002', '4003', '4004', '4005', '4006', '4007',
                        '4008', '4009', '4010', '4012', '5001', '5002', '8906', '8907', '8908',
                        '8909', '8993', '8997', '9801', '9996', '7301'
   )
 order by centro_costo;

select *
  from proceso_cominac;

select *
  from proceso_cominac_concepto;

select *
  from proceso_cominac_venta_det;

select *
  from movfide_situacion_banco
 where p_ano = 2023
   and p_mes = 1
   and cta_cte_banco = '000-9957936'
   and voucher is null;

select *
  from vw_analpla_personal_total
 where c_area = '010';

select *
  from planilla10.tar_secc
 where c_area = '010';

select *
  from planilla10.t_area;

select distinct sector
  from planilla10.personal
 where seccion = '05';

select *
  from planilla10.personal
 where seccion = '05'
   and situacion not in ('8', '9');

select c_codigo
     , nombre
     , sexo
     , c_cargo
     , desc_cargo
     , f_ingreso
     , fnatal
     , desc_doc
     , num_doc
     , email
     , email_p
     , edad
     , anos_empresa
     , anos_aniversario
     , desc_seccion
     , c_area
     , dsc_area
     , c_encargado
     , desc_encargado
     , usuario_encargado
     , email_encargado
     , desc_local
     , f_cese
     , sector
     , desc_sector
     , situacion
     , horario
     , desc_horario
     , turno
  from vw_personal
 where flg_planta = 1
   and situacion not in ('8', '9')
   and sector in ('10', '20', '40', '80', '30')
   and c_area = '010';

select *
  from planilla10.t_sector
 where c_sector in ('30', '60');

select *
  from activo_fijo_depreciacion
 where cod_activo_fijo = 'MQ2SPAPL-003'
   and fecha >= to_date('30/09/2022', 'dd/mm/yyyy');

select *
  from activo_fijo
 where cod_activo_fijo in ('MQ1PMET-001', 'MQ2FERR-004');

select *
  from activo_fijo_estado;

select *
  from planilla10.tar_encarga
 order by codigo;

select *
  from planilla10.personal
 where apellido_paterno = 'MANAYAY';

select *
  from movdeta
 where ano = 2022
   and mes = 11
   and relacion is not null
   and tipo_relacion is null;

declare
  l_ano simple_integer := 2022;
  l_mes
        simple_integer := 11;
begin
  utilconta.asiento_sin_detalle
    (l_ano, l_mes);
  utilconta.completa_cero
    (l_ano, l_mes);
  utilconta.elimina_relacion
    (l_ano, l_mes);
  utilconta.agrega_relacion
    (l_ano, l_mes);
end;


select a.cod_activo_fijo
     , a.descripcion
     , a.cod_clase
     , a.cod_estado
     , e.descripcion as desc_estado
     , a.cuenta_contable
     , a.cuenta_depreciacion
     , a.cuenta_gasto_depreciacion
     , a.fecha_adquisicion
     , a.fecha_activacion
     , a.fecha_baja
     , a.centro_costo
     , a.cod_tipo_adquisicion
  --, DECODE( :p_moneda,  'S', a.valor_adquisicion_s,  'D', a.valor_adquisicion_d) AS valor_adquisicion
     , pkg_activo_fijo_qry.valor_adquisicion(a.cod_activo_fijo, :p_moneda,
                                             :p_fecha) as valor_adquisicion
     , d.porcentaje
     , d.depreciacion
     , pkg_activo_fijo_qry.depre_acum_anual(a.cod_activo_fijo, :p_tipo_depreciacion, :p_moneda,
                                            :p_fecha) as depre_acum_anual
     , sf_depreciacion_acumulada(a.cod_activo_fijo, :p_tipo_depreciacion, :p_moneda,
                                 :p_fecha) as depreciacion_acumulada
     , sf_costo_neto(a.cod_activo_fijo, :p_tipo_depreciacion, :p_moneda, :p_fecha) as costo_neto
--             , NVL(d.depreciacion_acumulada, sf_depreciacion_acumulada_hist(a.cod_activo_fijo, :p_tipo_depreciacion, :p_moneda, :p_fecha)) AS depreciacion_acumulada
--             , NVL(d.costo_neto, sf_costo_neto_hist(a.cod_activo_fijo, :p_tipo_depreciacion, :p_moneda, :p_fecha)) AS costo_neto
     , decode(last_day(a.fecha_adquisicion), :p_fecha,
              decode(:p_moneda, 'S', a.valor_adquisicion_s, 'D', a.valor_adquisicion_d),
              0) as valor_compra
  --, DECODE(TO_NUMBER(TO_CHAR(a.fecha_adquisicion, 'YYYY')), :p_periodo_ano, DECODE( :p_moneda, 'S', a.valor_adquisicion_s,  'D', a.valor_adquisicion_d), 0) AS valor_compra_anual
     , pkg_activo_fijo_qry.valor_compra_anual(a.cod_activo_fijo, :p_moneda,
                                              :p_fecha) as valor_compra_anual
     , decode(last_day(a.fecha_baja), :p_fecha,
              sf_costo_neto_hist(a.cod_activo_fijo, :p_tipo_depreciacion, :p_moneda, a.fecha_baja),
              0) as valor_venta
     , decode(to_number(to_char(a.fecha_baja, 'YYYY')), :p_periodo_ano,
              sf_costo_neto_hist(a.cod_activo_fijo, :p_tipo_depreciacion, :p_moneda, a.fecha_baja),
              0) as valor_venta_anual
     , decode(a.inoperativo, 'S', 'SI', 'N', 'NO', 'NO') as inoperativo
  from activo_fijo a
     , activo_fijo_depreciacion d
     , activo_fijo_estado e
 where a.cod_activo_fijo = d.cod_activo_fijo(+)
--    and d.cod_tipo_depreciacion(+) = :p_tipo_depreciacion
--    and d.moneda(+) = :p_moneda
   and a.cod_estado = e.cod_estado
   and to_number(to_char(d.fecha(+), 'YYYY')) = :p_periodo_ano
   and to_number(to_char(d.fecha(+), 'MM')) = :p_periodo_mes
--    and a.cod_tipo_adquisicion like :p_tipo_adquisicion
--    and a.cod_clase like :p_clase
   and a.cod_estado != '9'
   and a.depreciable = 'S'
   and a.cod_activo_fijo in ('LOCAL DESCARTES OFICINA MAN2')
   --AND    NVL(a.fecha_baja, TO_DATE('01/01/9999', 'DD/MM/YYYY')) >= :p_fecha
   and (a.fecha_activacion is null
   or (a.fecha_activacion is not null
     and trunc(a.fecha_activacion) between :p_fecha_adq_del and :p_fecha_adq_al));


select cod_activo_fijo, fecha_adquisicion, fecha_activacion
  from activo_fijo
 where cod_activo_fijo = 'LOCAL DESCARTES OFICINA MAN2';

update activo_fijo
   set fecha_adquisicion = trunc(fecha_adquisicion)
 where cod_activo_fijo = 'LOCAL DESCARTES OFICINA MAN2';

select *
  from activo_fijo_depreciacion
 where cod_activo_fijo = 'LOCAL DESCARTES OFICINA MAN2';

select *
  from ctabnco_parametros
 where usuario = 'MDIAZ';

select *
  from activo_fijo_depreciacion
 where cod_activo_fijo in ('MQ1PJEB-018-INST1')
   and fecha = to_date('31/12/2022', 'dd/mm/yyyy');

select *
  from activo_fijo
 where cod_activo_fijo = 'MQ1PJEB-018-INST1';

select count(*)
  from saldosc_tmp
 where fecha_dif = to_date('31/01/2023', 'dd/mm/yyyy')
   and ctactble = '123106';

select *
  from saldosc_tmp
 where fecha_dif = to_date('31/01/2023', 'dd/mm/yyyy')
   and voucher = '10011';

select *
  from saldosc_tmp
 where ano = 2023
   and mes = 1
   and libro = '38'
   and voucher = 10011;

select f.cod_cliente
     , f.tipdoc
     , f.serie_num
     , f.numero
     , f.ctactble
     , nvl(p.col_compras, 0) as col_compras
     , decode(p.auto_mas, null, 'N', 'O') as genera
     , (
    round((f.importe + nvl(sum(decode(c.moneda, 'D', c.importe, c.importe_x)), 0)) * f.tcam_sal,
          2) -
    round((f.importe + nvl(sum(decode(c.moneda, 'D', c.importe, c.importe_x)), 0)) *
          :icambio, 2)) as saldo
     , f.tcam_sal
  from factcob f
     , cabfcob c
     , plancta p
 where f.moneda = 'D'
   and f.ctactble = :p_cuenta
   and
------  f.tipdoc = :selecciona.tipdoc and
-----    f.fecha <= :selecciona.fecha   and
   ((f.mes is null and f.fecha <= :fecha)
     or (f.mes is not null and
         f.ano || lpad(f.mes, 2, '0') <= to_char(:fecha, 'YYYY') || to_char(:fecha, 'MM')))
--    and f.tcam_sal <> :icambio
   and c.tipdoc(+) = f.tipdoc
   and c.serie_num(+) = f.serie_num
   and c.numero(+) = f.numero
   and c.fecha(+) <= :fecha
   and p.cuenta = f.ctactble
having f.importe + nvl(sum(decode(c.moneda, 'D', c.importe, c.importe_x)), 0) <> 0
 group by f.cod_cliente, f.tipdoc, f.serie_num, f.numero, f.ctactble, p.col_compras
        , decode(p.auto_mas, null, 'N', 'O'), f.importe, f.moneda, f.tcam_sal;

select cod_cliente
     , tipdoc
     , serie_num
     , numero
     , ctactble
     , col_compras
     , generado
     , saldo as saldox
  from saldosc_tmp
 where saldo < 0
   and fecha_dif = to_date('31/01/2023', 'dd/mm/yyyy')
   and ctactble = '123106';

select *
  from saldosc_tmp
 where ctactble = '123106'
   and fecha_dif = to_date('31/01/2023', 'dd/mm/yyyy');

select estado
  from movglos
 where ano = 2023
   and mes = 1
   and libro = '38'
   and voucher = 10011;

select *
  from movglos
 where ano = 2023
   and mes = 1
   and libro = '38'
   and voucher = 10011;

select *
  from ubigeo
 where cod_ubc = '150135';

select *
  from movglos
 where ano = 2023
   and mes = 1
   and libro = '38'
   and voucher = 10011;

select *
  from movdeta
 where ano = 2023
   and mes = 1
   and libro = '38'
   and voucher = 10011;

select *
  from activo_fijo_depreciacion
 where cod_activo_fijo = '04LAPT41';

select *
  from activo_fijo_depreciacion
 where cod_activo_fijo = '04LAPT41'
   and cod_tipo_depreciacion = 'NIF'
   and moneda = 'S'
 order by fecha;

select *
  from orden_de_compra_calificacion;

select cod_proveed, nombre, email
  from proveed
 where email is not null;

select *
  from caja_chica
 where serie = 7
   and numero = 22184;

select *
  from caja_chica_d
 where serie = 7
   and numero = 22184;

select *
  from factcob
 where serie_num = '6'
   and numero = 251188;

select n.tipodoc, t.descripcion, n.serie, n.ctaconts, n.ctacontd, automatico
  from nrodoc n
     , tablas_auxiliares t
 where t.tipo = '40'
   and n.tipodoc = t.codigo
 order by n.tipodoc, n.serie;

select *
  from factcob
 where cod_cliente = '08124314'
   and tipdoc = 'L1'
   and serie_num = 6
   and f_incobrable is not null;

select *
  from plancta
 where cuenta in ('10410209', '10410208');

select *
  from nrodoc
 where tipodoc = 'L1';

select n.tipodoc, decode('S', 'S', n.ctaconts, n.ctacontd)
  from tablas_auxiliares t
     , nrodoc n
 where tipo = '2'
   and codigo = 'L1'
   and n.tipodoc = t.obs
   and n.serie = 6;

select *
  from nrodoc
 where tipodoc = 'IL';

select n.tipodoc, decode('S', 'S', n.ctaconts, n.ctacontd)
  from tablas_auxiliares t
     , nrodoc n
 where tipo = '2'
   and codigo = 'L1'
   and n.tipodoc = t.obs
   and n.serie = 6;

select *
  from movdeta
 where cuenta = '129301010';

select *
  from comiacc_contrato;

select *
  from analisis_consumo
 where ano = 2023
   and mes = 2;

-- PT

select *
  from cotizacion
 where num_ped = 193963;

select *
  from pedido
 where cod_cliente = '10411454083'
 order by fecha desc;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and numero = 915135;

select *
  from pr_trasab_estado
 where tipo = 'AR'
   and numero = 915135;

select *
  from expedido_d
 where numero = 12121
   and nro = 81;

select *
  from pr_ot
 where numero = 335
   and nuot_tipoot_codigo = 'FC';

select *
  from prestamo_banco
 where cod_prestamo = '62128AFB';

select *
  from kardex_d
 where cod_alm = 'D3'
   and tp_transac = '18'
   and serie = 2
   and numero = 525737;

select *
  from kardex_d
 where cod_alm = '03'
   and tp_transac = '10'
   and serie = 1
   and numero = 4093;


select *
  from kardex_d
 where cod_alm = '63'
   and tp_transac = '35'
   and serie = 39
   and numero = 2234;

select *
  from kardex_d
 where cod_alm = '63'
   and tp_transac = '10'
   and serie = 39
   and numero = 2674;

select *
  from kardex_d
 where cod_alm = 'D3'
   and tp_transac = '35'
   and serie = 39
   and numero = 2674;

select *
  from ubigeo
 where nom_dpt = 'PUNO'
   and nom_pvc = 'SAN ROMAN';

select * from transacciones_almacen;

select * from canjedoc_cpag;

select *
  from factcob
 where tipdoc = 'LV'
   and numero = '21527';

select *
  from canjedoc
 where tpodoc = 'LV'
   and nrodoc = 20660;

select *
  from movdeta
 where ano = 2023
   and mes = 2
   and relacion is not null
   and tipo_relacion is null
   and nvl(estado, '0') <> '9';

select *
  from movdeta
 where ano = 2023
   and mes = 2
   and libro = '05'
   and voucher = 20072
   and relacion = '20610114041';

select *
  from proveed
 where cod_proveed = '20610114041';

select *
  from clientes
 where cod_cliente = '20610114041';

select distinct k.cod_relacion as cod_proveed, p.nombre
  from kardex_g k
     , proveed p
 where k.cod_relacion = p.cod_proveed
   and k.tp_transac = '11'
   and nvl(k.estado, 0) < 8
   and exists (
   select 1
     from kardex_g_movglos
    where cod_alm = k.cod_alm
      and tp_transac = k.tp_transac
      and serie = k.serie
      and numero = k.numero
      and nvl(voucher, 0) = 0
      and serie_oc in (
      30
      )
   )
 order by p.nombre;

select *
  from kardex_g_movglos
 where cod_proveedor = '20467534026'
   and tp_transac = '11'
   and nvl(estado, 0) < 8
   and nvl(voucher, 0) = 0
   and exists (
   select 1
     from kardex_g x
    where x.cod_alm = kardex_g_movglos.cod_alm
      and x.tp_transac = kardex_g_movglos.tp_transac
      and x.serie = kardex_g_movglos.serie
      and x.numero = kardex_g_movglos.numero
      and nvl(x.estado, 0) < 9
   )
   and serie_oc in (30);

select *
  from kardex_d
 where cod_alm = 'A3'
   and tp_transac = '11'
   and serie = 1
   and numero = 30399;

select *
  from kardex_g_movglos
 where cod_alm = 'A3'
   and tp_transac = '11'
   and serie = 1
   and numero = 30399;

select *
  from kardex_d
 where cod_art = '04LAPT45';

select *
  from kardex_g_movglos
 where cod_alm = 'A3'
   and tp_transac = '11'
   and serie = 1
   and numero = 29402;

select *
  from activo_fijo_compra
 where cod_activo_fijo = 'PIST12';

select *
  from activo_fijo_compra
 where cod_activo_fijo = '04LAPT45';

select *
  from kardex_g_movglos
 where ano = 2023
   and mes = 5
--    and libro = '08'
   and voucher = 51124;

select *
  from proveed
 where nombre like '%REPLICA%';

select *
  from orden_de_compra
 where cod_proveed = '20251505111'
 order by fecha desc;

select *
  from kardex_g_movglos
 where ano = 2023
   and mes = 5
--    and libro = '08'
   and voucher = 50099;

select *
  from activo_fijo
 where cod_activo_fijo = 'MQ1ACAB-064';

select *
  from pr_tabmaq
 where codigo = 'MQ1ACAB-064';

select *
  from gastos_de_viaje_habilitado
 where id_vendedor = '78'
   and numero = 195;

select *
  from gastos_de_viaje
 where id_vendedor = '78'
   and numero = 195;

select *
  from gastos_de_viaje_m
 where id_vendedor = '78'
   and numero = 195;

select *
  from gastos_de_viaje_habilitado
 where id_vendedor = '78'
   and numero = 195;

select *
  from cambdol
 where fecha = to_date('10/07/2023', 'dd/mm/yyyy');

select *
  from kardex_g_movglos
 where cod_proveedor = '20108026104'
   and numero_oc = '502';

select *
  from orden_de_compra
 where serie = 30
   and num_ped = 502;

select *
  from itemord
 where cod_art = 'EQ DIV404';

select distinct o.serie, o.num_ped
  from orden_de_compra o
       join itemord i
            on o.serie = i.serie
              and o.num_ped = i.num_ped
 where i.cod_art = 'EQ DIV404'
   and o.estado != '9';


select fecha_cp
  from kardex_g_movglos
 where serie_oc = 30
   and numero_oc = to_char(498);


select *
  from caja_chica
 where serie = 7
   and numero = 22218;

select * from nroafijo;

select * from paramaf;

select * from activo_fijo_subclase;

select cod_transp, nombre, domicilio, ruc_transp
  from transporte
 where estado is null
 order by nombre;

select *
  from transporte
 where estado != '9';

select distinct estado
  from transporte
 where estado != '9';

select *
  from transporte
 where cod_transp = '20100084768';

select *
  from caja_chica
 where serie = 5
   and numero = 20444;

select *
  from canjedoc
 where tpodoc = 'LV'
   and nrodoc = 21527;

select *
  from factcob_canje
 where doccanje = 'J1'
   and nrocanje = 87928;

select *
  from movglos
 where ano = 2023
   and mes = 6
   and libro = '05'
 order by voucher desc;

select *
  from activo_fijo_asigna
 where cod_empleado = 'E861'
 order by fecha_entrega desc;

select direccion, nro_sucur, cod_cliente
  from sucursales
 where cod_cliente = '20100084768';

begin
  select s.nro_sucur, s.direccion, u.cod_ubc, u.nom_dpt, u.nom_pvc, u.nom_dtt
       , u.nom_dtt || ' ' || u.nom_pvc || ' ' || u.nom_dpt as nombre
       , nvl(s.codigo_establecimiento_sunat, '0000') as codigo_establecimiento_sunat
    from ubigeo u
       , sucursales s
   where s.cod_cliente = '20100084768'
     and u.nacional_internacional = 'N'
     and s.cod_ubc = u.cod_ubc
------and s.nro_sucur <> '04'
   order by u.nom_dtt;
exception
  when no_data_found then null;
end;

select *
  from solimat_g
 where numero = 183988;

select *
  from kardex_g
 where nro_doc_ref = '183988'
   and tip_doc_ref = 'P2';

select *
  from activo_fijo
 where cod_activo_fijo in ('MQ1ACAB-037', 'EQ MEDIC42');

select * from grupo_edificacion;


select *
  from nrolibr
 where ano = 2023
   and mes = 2;

select * from activo_fijo where cod_activo_fijo like '35976710240%';

select *
  from almacen
 where cod_art = '359767102408201';

select *
  from kardex_d
 where cod_art = '359767102408201';

select *
  from vw_almacen_activo_fijo
 where cod_art in (
                   '02LAPT10', '02LAPT9', '04COMP0151', '04LAPT25'
   );

select *
  from vw_almacen_activo_fijo l
       join activo_fijo a on l.cod_art = a.cod_activo_fijo
 where cod_alm = 'A3'
   and a.cod_subclase in ('EQL')
   and not exists(
   select * from almacen n where l.cod_alm = n.cod_alm and l.cod_art = n.cod_art
   );

insert into almacen(cod_art, cod_alm, stock, ubic, inv_fis, fch_inve)
select cod_art, cod_alm, stock, null, 0, null
  from vw_almacen_activo_fijo l
       join activo_fijo a on l.cod_art = a.cod_activo_fijo
 where cod_alm = 'A3'
   and a.cod_subclase in ('CEL')
   and not exists(
   select * from almacen n where l.cod_alm = n.cod_alm and l.cod_art = n.cod_art
   );

select *
  from almacen
 where cod_art in (
                   '04LAPT25', '02LAPT9', '02LAPT10', '04COMP0151'
   )
   and cod_alm = 'A3';

select *
  from activo_fijo
 where cod_activo_fijo = '04COMP0151';

select *
  from produccion_armado
 where id_linea_prod = '03'
   and estado <> 5
   and nvl((
             select estado
               from pr_ot
              where numero = produccion_armado.numero_oa
                and nuot_tipoot_codigo = 'AR'
             ), 0) = 4;

select count(*)
  from activo_fijo_asiento a
       join movglos m
            on a.ano = m.ano and a.mes = m.mes and a.libro = m.libro and a.voucher = m.voucher
 where a.cod_activo_fijo = 'AC2GEN-002'
   and a.cod_tipo = 'GASTO'
   and m.estado != '9';

select *
  from activo_fijo_asigna
 where cod_activo_fijo = 'CEL913333838';

select *
  from kardex_d
 where cod_art = 'CEL913333838';

select * from almacen_activo_fijo;

select *
  from tablas_auxiliares
 where tipo = 33
 order by codigo;

select *
  from pr_usualma
 where usuario = 'PEVISA'
   and cod_alm like 'A%';

select *
  from pr_usualma
 where usuario = 'JJUAREZ';
