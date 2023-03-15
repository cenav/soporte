select *
  from tmp_moviart_dos
 where ano = 2022
   and mes in (12)
   and id in ('S')
--    and motivo = '1'
--    AND ordtra IS NULL;
--    and (cta like '26%')
   and (cta like '23%' or cta like '24%' or cta like '26%' or cta like '20%' or cta like '25%' or
        cta like '21%')
--    and tp_transac in ('26%')
   and cod_ope in
       ('12', '14', '28', '86', '93', '95', '97', '39', '80', '81', '85', '36', '37', '48');
--    and docto like 'PK%';
-- AND ordtra IN ('VENTA NA');
-- AND ordtra IN ('598272', '590102', '590174', '590178', '592854', '597853', '595823', '590104', '590103')
--    AND cod_ope IN ('86');

update tmp_moviart_dos
   set nro_doc = docto
 where ano = 2022
   and mes in (12)
   and id in ('S')
--    and motivo = '1'
--    AND ordtra IS NULL;
--    and (cta like '26%')
   and (cta like '23%' or cta like '24%' or cta like '26%' or cta like '20%' or cta like '25%' or
        cta like '21%')
--    and tp_transac in ('26%')
   and cod_ope in
       ('12', '14', '28', '86', '93', '95', '97', '39', '80', '81', '85', '87', '36', '37', '48');

-- reporte
-- stock a la fecha
-- indicador MP
-- cuenta
-- todos los almacenes donde tenga stock

update tmp_moviart_dos
   set ordtra  = 'VENTA EX'
     , cod_ope = '80'
 where ano = 2022
   and mes in (12)
   and id = 'S'
--    and motivo = '1'
   and docto like 'PK%'
   and (cta like '26%');

select *
  from embarques_d
 where num_importa = 'PJ21040'
   and cod_art = '2825-OSRAM';

select *
  from tmp_moviart_dos
 where ano = 2023
   and mes in (1)
   and id = 'I'
   and (cta like '24%' or cta like '25%' or cta like '26%' or cta like '3%' or cta like '9%');

update tmp_moviart_dos
   set libro   = '05',
       voucher = '30148'
 where ano = 2022
   and mes in (3)
   and id = 'S'
   and cta like '25%'
   and cod_ope = '86';


select *
  from tmp_moviart_dos
 where ano = 2021
   and mes = 5
   and tp_transac = '11';


select *
  from tmp_moviart_dos
 where ano = 2022
   and mes in (7)
   and id = 'I'
   and motivo = '1'
   and (cta like '24%' or cta like '25%' or cta like '26%' or cta like '3%' or cta like '9%');

select *
  from tmp_moviart_dos
 where ano = 2022
   and mes = 10
   and docto = 'FCI22000117'
   and cta = '20120203';

select docto, replace(docto, ':', '')
  from tmp_moviart_dos
 where ano = 2022
   and mes in (6)
   and id in ('I', 'S');


update tmp_moviart_dos
   set docto = replace(docto, '/', '-')
 where ano = 2022
   and mes between 7 and 12
   and id in ('I', 'S');

-- copiar la columna docto a nrodoc
update tmp_moviart_dos
   set nro_doc = docto
 where ano = 2022
   and mes between 7 and 12
   and id = 'S'
   and (cta like '20%' or cta like '21%' or cta like '23%' or
        cta like '24%' or cta like '25%' or cta like '26%')
   and cod_ope in ('12', '14', '28', '86', '93', '95', '97', '39', '80', '81');

select *
  from linea_solicitud_material
 where tipo = 'REPUESTO';


select *
  from tab_lineas
 where linea in (
                 '2054', '2034', '2038', '2039', '2043', '2044', '2045', '2046', '2047', '2048',
                 '2400',
                 '2402',
                 '2404',
                 '2405', '2406', '2408', '2409', '2410'
   );


select docto, replace(docto, ':', '')
  from tmp_moviart_dos
 where ano = 2018
   and mes in (11, 12)
   and id = 'I'
   and docto like 'NRO:%';


select nro_doc, replace(nro_doc, ':', '')
  from tmp_moviart_dos
 where ano = 2018
   and mes in (10, 11, 12)
   and id = 'S'
   and nro_doc like 'SM :1%';


select *
  from analisis_consumo
 where ano = 2022
   and mes = 8;

select *
  from tmp_moviart_dos
 where ano = 2019
   and mes in (5)
   and (cta not like '20%');


select *
  from tmp_moviart_dos
 where ano = 2019
   and mes in (5)
   and (cta like '20%');


select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero in (382045, 382083);


-- Extrae los ultimos digitos del numero de factura
select distinct docto, regexp_substr(docto, '^F\d{3}-0*') as match
              , replace(docto, regexp_substr(docto, '^F\d{3}-0*'), null) as replace
  from tmp_moviart_dos
 where ano = 2019
   and mes in (1, 2, 3, 4, 5, 6)
   and id = 'I'
   and cod_ope in ('44')
   and docto in ('F055-0002395', 'F055-00002372', 'F056-28', 'F056-4', 'F056-101');


select *
  from tmp_moviart_dos
 where ano = 2019
   and mes in (7)
   and cta like '23%';


select *
  from tmp_moviart_dos
 where ano = 2019
   and mes in (7)
   and cta like '20%';


select *
  from tmp_moviart_dos
 where ano = 2022
   and mes in (12)
   and id = 'I'
   and cta like '25%'
   and cod_ope in ('86');


select *
  from tmp_moviart_dos
 where ano = 2022
   and mes in (12)
   and id = 'I'
   and motivo = '1'
   and (cta like '24%' or cta like '25%' or cta like '26%' or cta like '3%' or cta like '9%');

select *
  from tmp_moviart_dos
 where ano = 2019
   and mes in (7)
   and id = 'S'
   and motivo = '1'
   and (cta like '23%' or cta like '9%' or cta like '3%');



select *
  from tmp_moviart_dos
 where ano = 2019
   and mes in (7)
   and id = 'S'
   and motivo = '1'
   and (cta like '23%' or cta like '9%' or cta like '3%');



select *
  from tmp_moviart_dos
 where ano = 2019
   and mes in (8)
   and cta like '20%';


select *
  from tmp_moviart_dos
 where ano = 2019
   and mes in (8)
   and id = 'I'
   and motivo = '1'
   and (cta like '24%' or cta like '25%' or cta like '26%');


select *
  from caja_chica_d
 where cod_art = 'BOMBA MANUAL';


select *
  from caja_chica_d
 where serie = 5
   and numero = 19144;


select *
  from kardex_d
 where cod_art in ('ALICATE CORTE 4', 'BOMBA MANUAL')
   and tp_transac = '11';


select *
  from kardex_d
 where cod_art in ('CONECTOR ELECTRONICO', 'LLAVE ALLEN 1/4', 'RUEDAS SILLON S/M')
   and tp_transac = '11';


select *
  from itemord
 where serie = 5
   and num_ped = 1013;


select *
  from kardex_d
 where cod_art in
       ('CABLE MILLSTAR A660 T254', 'CABLE MILLSTAR A660 T506', 'CONTROLADOR SERVO MILSTAR A06B')
   and tp_transac = '11';


select *
  from kardex_d;

-- 147

select d.*
  from kardex_g g
       join kardex_d d
            on g.cod_alm = d.cod_alm and g.tp_transac = d.tp_transac and g.serie = d.serie and
               g.numero = d.numero
 where g.estado != '9'
   and g.cod_alm = '30'
   and g.tp_transac = '22'
   and g.serie = 1
   and g.numero = 154486;

select *
  from kardex_g g
 where g.cod_alm = '23'
   and g.tp_transac = '29'
   and g.serie = 1
   and g.numero = 1396728;


select *
  from tmp_moviart_dos
 where ano = 2019
   and mes = 8
   and cod_art = 'RT 158 PLUS'
   and numero_kardex in (153222, 153775);


select *
  from tmp_moviart_dos
 where ano = 2019
   and mes = 8
   and cod_art = 'RT 158 PLUS';


select g.cod_alm, g.tp_transac, g.serie, g.numero, d.cod_art, g.fch_transac, o.otm_tipo, o.otm_serie
     , o.otm_numero
  from kardex_d_otm o
       join kardex_d d
            on o.cod_alm = d.cod_alm
              and o.tp_transac = d.tp_transac
              and o.serie = d.serie
              and o.numero = d.numero
              and o.cod_art = d.cod_art
       join kardex_g g
            on d.cod_alm = g.cod_alm
              and d.tp_transac = g.tp_transac
              and d.serie = g.serie
              and d.numero = g.numero
 where to_number(to_char(g.fch_transac, 'YYYY')) = 2019
   and to_number(to_char(g.fch_transac, 'MM')) = 8;


select *
  from tmp_moviart_dos
 where ano = 2019
   and mes = 8
   and (ordtra like 'MQ-%' or ordtra like 'VH-%' or ordtra like 'PY-%');


-- BEGIN
--     sp_actualiza_otm_kardexdos(2019, 8);
-- END;


-- UPDATE tmp_moviart_dos
-- SET ordtra = NULL
--  WHERE ano = 2019
--    AND mes = 8
--    AND (ordtra LIKE 'MQ-%' OR ordtra LIKE 'VH-%' OR ordtra LIKE 'PY-%')

select *
  from orden_de_compra
 where serie = 1;


select *
  from tmp_moviart_dos
 where ano = 2019
   and mes in (9)
   and id = 'I'
   and motivo = '1'
   and (cta like '24%' or cta like '25%' or cta like '26%');


update tmp_moviart_dos
   set ordtra  = 'VENTA EX'
     , cod_ope = '80'
 where ano = 2019
   and mes in (9)
   and id = 'S'
   and motivo = '1'
   and cta like '26%';


select docto
  from tmp_moviart_dos
 where ano = 2019
   and mes in (7, 8, 9, 10, 11, 12);


select docto, replace(docto, '/', '-')
  from tmp_moviart_dos
 where ano = 2019
   and mes in (7, 8, 9, 10, 11, 12)
   and docto like '%/%';


select *
  from orden_de_compra
 where serie = 1
   and num_ped = 82167;


select *
  from itemord
 where serie = 1
   and num_ped = 82167;


select *
  from analisis_consumo
 where ano = 2020
   and mes = 8;


select *
  from analisis_consumo
 where ano = 2020
   and mes = 10;


select *
  from vw_cominac_consulta
 where cod_vendedor = '27'
 order by ano desc, mes desc;

-- 857

select numero_planilla
  from pagos_i
 where serie_planilla = 3
   and serie_num = '1'
   and numero = :xnum_pla
   and cod_proveedor = :c_codigo;


select *
  from tmp_moviart_dos
 where ano = 2021
   and mes = 1
   and fechav = '31012021';


select *
  from kardex_g
 where num_importa = 'BDI21008';


select *
  from kardex_d
 where cod_alm = '03'
   and tp_transac = '19'
   and serie = 1
   and numero in (16264, 16265, 16266);


select *
  from articul
 where cod_art like 'MET 400%';


select *
  from despacho_guias;


select *
  from analisis_consumo
 where ano = 2021
   and mes = 5;


select *
  from pr_ot_impresion
 where nuot_tipoot_codigo = 'PR'
   and numero between 436128 and 436206;

select *
  from cambdol
 where fecha = to_date('30/06/2021', 'DD/MM/YYYY');

select *
  from lg_factura_comercial
 where numero_embarque = 3333;


select *
  from kardex_d
 where cod_art = 'CUCHILLA K340 GUILLOT. RECTA'
   and tp_transac = '11'
   and fch_transac = to_date('25/06/2021', 'DD/MM/YYYY');


select *
  from kardex_g
 where num_importa = 'FCN2000259';


select *
  from kardex_d
 where cod_alm = 'F0'
   and tp_transac = '11'
   and serie = 10
   and numero = 6432;


select *
  from cambdol
 where fecha = to_date('09/08/2021', 'DD/MM/YYYY');

select kg.num_importa as documento, kd.cod_art, kd.costo_s as soles, kd.costo_d as dolares
  from kardex_g kg
       join kardex_d kd
            on kg.cod_alm = kd.cod_alm and kg.tp_transac = kd.tp_transac and kg.serie = kd.serie and
               kg.numero = kd.numero
 where kd.cod_alm = 'F0'
   and kd.tp_transac = '11'
   and kd.serie = 10
   and kd.numero in (6429);

declare
  cursor cr_archivo is
    select cod_art, cantidad
      from tmp_carga_data;
begin
  for r in cr_archivo loop
    update kardex_d
       set costo_d = r.cantidad
     where cod_alm = 'FI'
       and tp_transac = '11'
       and serie = 11
       and numero = 4095
       and cod_art = r.cod_art;
  end loop;
end;

select *
  from tmp_moviart_dos
 where docto = 'BS210902';

select *
  from kardex_g
 where num_importa = 'BS210902';

select *
  from kardex_d
 where cod_alm = '97'
   and tp_transac = '11'
   and serie = 1
   and numero = 26988
   and cod_art = 'UPUDAT30';

select *
  from kardex_g_movglos
 where cod_alm = '97'
   and tp_transac = '11'
   and serie = 1
   and numero = 26988;

select cod_art, costo_sol, costo_dol
  from tmp_carga_data;


declare
  l_update_count simple_integer := 0;

  cursor cr_carga is
    select cod_art, costo_sol, costo_dol
      from tmp_carga_data;
begin
  for r in cr_carga loop
    update kardex_d
       set costo_s = r.costo_sol
         , costo_d = r.costo_dol
     where cod_alm = '97'
       and tp_transac = '11'
       and serie = 1
       and numero = 26988
       and cod_art = r.cod_art;

    l_update_count := l_update_count + sql%rowcount;
  end loop;

  dbms_output.put_line(l_update_count);
end;

select *
  from tmp_moviart_dos
 where cod_art = 'LIGA'
   and docto = 'M22214';

select *
  from kardex_d
 where cod_alm = '02'
   and tp_transac = '11'
   and serie = 1
   and numero = 28326
   and cod_art = 'LIGA';

select * from caja_chica_d;

select *
  from exprovision_comision
 where ano = 2022
   and mes = 7
   and cod_repre = '51';


select *
  from view_kardex_reg_compras
 where ano = 2022
   and mes = 5
   and num_importa = 'BSERVL092-2205';

select *
  from movglos
 where cod_proveed = '10477955211'
   and tipo_referencia = '02'
   and serie = 'E001'
   and nro_referencia = lpad('41', 7, '0');

select *
  from movglos
 where ano = 2022
   and mes = 5
   and libro = '05'
   and voucher = 50006;

select *
  from movdeta
 where relacion = '20513118849'
   and tipo_referencia = '01'
   and serie = 'F012'
   and nro_referencia = lpad('13891', 7, '0')
   and ano = 2022
   and mes = 5;

select *
  from tmp_mastart_dos
 where codigo = 'HAF9020 0.6-MU';

select *
  from tmp_mastart_dos
 where codigo = 'HAF9020 0.8';

select *
  from tmp_moviart_dos
 where ano = 2023;

select * from planilla10.tar_encarga order by codigo;