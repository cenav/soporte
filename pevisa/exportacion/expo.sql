select *
  from exbooking_d
 where numero_booking = 'AER-113';

select *
  from exfacturas
 where numero in (
   15049
   );

select *
  from exbooking
 where numero_booking = 'COU-76';

select *
  from exbooking_d
 where numero_booking = 'COU-76';

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
 where codigo = 174
   and numero_factura not in (
                              55014660, 55014928, 55015016, 55015018, 55015379, 55015386, 55015410,
                              55015411, 55015414, 55015551, 55015588, 55015614, 55015623, 55015636,
                              55015719, 55014525, 55015166, 55015326, 55015327, 55015366, 55015367,
                              55015543, 55015581, 55015582, 55015735, 55014131, 55014475, 55014645,
                              55014753, 55014884, 55015012, 55015771, 55015817, 55015823, 55015824,
                              55015825, 55015877, 55015880, 55015927, 55015928
   );

-- fecha de proceso de comision dejar en nulo
select *
  from exfacturas
 where numero in (
                  55014478, 55015072, 55015082, 55015257, 55015285, 55015400, 55015513, 55015695,
                  55015736, 55015820, 55015989, 55016056, 55016108, 55016233
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
 where numero = 15526;

select * from packing_agrupar;