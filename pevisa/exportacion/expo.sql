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
 where cod_alm = '62'
   and tp_transac = '11'
   and serie = 1
   and numero = 30852;

select *
  from docuvent
 where tipodoc = '01'
   and numero = 15887;

select *
  from factcob
 where tipdoc = 'LV'
   and numero = '21527';

select *
  from excomision_repre_fact
 where codigo = 170
   and numero_factura in (
                              55012855, 55013440, 55013497, 55013606, 55012969, 55013072, 55013127,
                              55013420, 55013659, 55013884, 55012854, 55013612, 55013534, 55013713,
                              55013793, 55013855, 55013858, 55013921, 55013958, 55014032, 55014034,
                              55014052, 55014078, 55014214, 55014241, 55014341, 55014354, 55014416,
                              55014462, 55014463, 55013116, 55013297, 55013334, 55013425, 55013681,
                              55013959, 55013966, 55013970, 55013976, 55013977, 55013989, 55014021,
                              55014033, 55014039, 55014040, 55014045, 55014070, 55014071, 55014072,
                              55014147, 55014154, 55014216, 55014236, 55014270, 55014327, 55014364,
                              55014365, 55014366, 55014377, 55014414, 55014427, 55012633, 55013026,
                              55013451, 55013957
   );

select *
  from exfacturas
 where numero in (
                  55012459, 55013011, 55013205, 55013426, 55013507, 55013609, 55014054, 55014113,
                  55014131, 55014213, 55014230, 55014336, 55014426, 55014472, 55014474, 55014475,
                  55014476, 55014477, 55014478, 55014525, 55014538, 55014565, 55014566, 55014570,
                  55014571, 55014576, 55014598, 55014633, 55014636, 55014638, 55014645, 55014646,
                  55014647, 55014658, 55014659, 55014660, 55014733, 55014735, 55014736, 55014753,
                  55014787, 55014788, 55014802, 55014803, 55014813, 55014814, 55014816, 55014835,
                  55014841, 55014863, 55014864, 55014881, 55014884, 55014927, 55014928, 55014934,
                  55014958, 55014965, 55014999, 55015012, 55015016, 55015018, 55015025, 55015066,
                  55015078, 55015080, 55015115, 55015129, 55015140, 55015166, 55015280, 55015326,
                  55015327, 55015366, 55015367, 55015379, 55015386, 55015410, 55015411, 55015414,
                  55015543, 55015551, 55015581, 55015582, 55015588, 55015614, 55015623, 55015636,
                  55015719, 55015735, 55015771, 55015817, 55015823, 55015824, 55015825, 55015877,
                  55015880, 55015927, 55015928
   );