select *
  from exbooking_d
 where numero_booking = 'AER-113';

select *
  from exfacturas
 where numero in (
   55017398
   );

select *
  from ex_prefacturas
 where numero in (
   9051660
   );

select *
  from exbooking
 where numero_booking = 'PEEXM230171';

select *
  from exbooking_d
 where numero_booking = 'COU-76';

select *
  from exproforma_d
 where numero = 18878
   and cod_art = 'MS 5739-2 A';

select * from view_cli_para_booking;

select *
  from exfacturas_his
 where numero in (
                  55014940, 55015020, 55015065, 55015168
   )
   and accion in ('70', '71', '72');

select *
  from vw_fac_para_booking
 where numero in (
                  55014940, 55015020, 55015065, 55015168
   )
   and fecha_despacho is null;

select *
  from exfacturas
 where numero in (
   15049
   );

select *
  from pk_gnumero
 where pk_numero in (
                     53610, 53675, 53837, 53943
   );

select *
  from docuvent
 where serie = 'F055'
   and numero in (14811, 14872, 15146, 14889);

select *
  from exfacturas
 where numero = 55014811;

select *
  from factcob_canje
 where numero = '15261';

select *
  from canjedoc
 where nrocanje = 87345;

select * from exproforma_libre;

select *
  from pr_embarques
 where ano_embarque = 2023
   and mes_embarque = 8
   and id_pedido = 15937;

select * from view_pedidos_pendientes_38;

select *
  from pr_programa_embarques_id
 where ano = 2023
   and mes = 12;

select *
  from nrodoc
 where tipodoc = '82'
   and serie = 3;

select *
  from nrodoc
 where tipodoc = '82'
   and serie = 3;

select numorde from paramlg;

select *
  from itemord
 where serie = 3
 order by num_ped desc;

select *
  from caja_chica_d
 where serie = 5
   and numero = 20445;

select *
  from kardex_d
 where cod_alm = '01'
   and tp_transac = '25'
   and serie = 118
   and numero = 88;

select *
  from docuvent
 where tipodoc = '01'
   and numero = 15887;

select *
  from factcob
 where tipdoc = 'LV'
   and numero = '21527';

-- eliminar las facturas que no deben aparacer en el listado
select *
  from excomision_repre_fact
 where codigo = 179
   and numero_factura not in (
                              55015072, 55015082, 55015257, 55015285, 55015400, 55015513, 55015695,
                              55015736, 55015820, 55015906, 55015948, 55015954, 55015981, 55015989,
                              55015996, 55016002, 55016003, 55016004, 55016038, 55016039, 55016056,
                              55016108, 55016174, 55016202, 55016203, 55016233, 55016240, 55016274,
                              55016292, 55016294, 55016303
;

-- fecha de proceso de comision dejar en nulo
select *
  from exfacturas
 where numero in (
                  55016333, 55016340, 55016362, 55016363, 55016374, 55016375, 55016391, 55016415,
                  55016425, 55016469, 55016470, 55016520, 55016554, 55016555, 55016573, 55016581,
                  55016591, 55016592, 55016596, 55016607, 55016622, 55016652, 55016683, 55016697,
                  55016720, 55016726, 55016790, 55016791, 55016792, 55016793
   );

select *
  from tab_lineas
 where descripcion like '%HANKOOK%';

select *
  from tab_lineas
 where linea = '116';

select *
  from tab_grupos
 where grupo = 18;

select *
  from grupo_venta
 where cod_grupo_venta = '4000';

select l.linea, l.descripcion as dsc_linea, g.grupo, g.descripcion as dsc_grupo
     , m.cod_grupo_venta as megagrupo, m.descripcion as dsc_megagrupo
  from tab_lineas l
       join tab_grupos g on l.grupo = g.grupo
       join grupo_venta m on g.ind_vta1 = m.cod_grupo_venta
 where linea = '132';

select * from pr_grupos;

select *
  from kardex_dpk
 where cod_alm = '01'
   and tp_transac = '25'
   and serie = 118
   and numero = 88;

select *
  from kardex_g
 where cod_alm = '01'
   and tp_transac = '25'
   and serie = 118
   and numero in (88, 89, 90);

select *
  from expedidos
 where numero in (
                  15078, 15161, 15315, 15316, 15318, 15528, 15532, 15546, 15567, 16119, 16156
   );

select * from packing_agrupar;

select cod_cliente, nombre, ruc, lista_precio, vendedor, cond_pag, dscto_1, dscto_2, cliente_afecto
     , dscto_max, nivel_cp, direccion
  from clientes
 where nvl(estado, '0') in ('0', '4')
   and zona = '900' and cod_cliente like '00000%'
   and cod_cliente = '00000990559'
 order by nombre;

select *
  from clientes
 where cod_cliente = '00000990559';

select *
  from pk_gnumero
 where pk_numero in (56366);


select *
  from solicita_emision
 where numero = 1228;

select *
  from solicita_emision_det
 where numero = 1228;

select *
  from tab_lineas
 where linea = '526';

select *
  from exproforma_d
 where numero = 18961
   and cod_art in (
                   'CH 95234 TG', 'CHP 88087 GR', 'MS 80104 E', 'MS 80020 A', 'MS 95233 MLS E',
                   'OS 88075 VM', 'FS 87796 MLS', 'MS 88087 A'
   )
 order by nro;

select *
  from exproforma_d
 where cantidad_libre is not null;


select *
  from tablas_auxiliares
 where codigo = '....';

select *
  from tablas_auxiliares
 where tipo = 2
 order by codigo;

select *
  from articul
 where cod_art in ('NC1', 'NC6');

select *
  from docuvent
 where tipodoc = '07'
   and serie = 'F055'
   and numero = '8008';

select *
  from itemdocu
 where tipodoc = '07'
   and serie = 'F055'
   and numero = '8008';

select * from pla_control;

select *
  from ex_prefacturas
 where numero = 9051657;


select *
  from exclientes
 where cod_cliente = 990249;

select * from exproforma_libre;

select *
  from caja_chica
 where serie = 7
   and numero = 22274;

select *
  from caja_chica_d
 where serie = 7
   and numero = 22274;

select *
  from caja_chica
 where serie = 7
   and numero = 24001;

select *
  from caja_chica_d
 where serie = 7
   and numero = 24001;
