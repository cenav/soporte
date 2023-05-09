select *
  from exbooking_d
 where numero_booking = '63539397';

select *
  from exfacturas
 where numero in (
                  55012554, 55012636, 55013284, 55013298, 55013302, 55013367, 55013378, 55013381,
                  55013539, 55013546, 55013556, 55013572, 55013573, 55013657, 55013664, 55013698,
                  55012985, 55013176, 55013277, 55013301, 55013307, 55013321, 55013401, 55013460,
                  55013571, 55013677, 55012634, 55013017, 55013443, 55013642, 55013831, 55013416,
                  55013602, 55012853, 55013399, 55013400, 55013405, 55013466, 55013467, 55013481,
                  55013603, 55013604, 55013605, 55013702, 55013783, 55013856, 55013860, 55013862,
                  55013906, 55013919, 55013924
   );


select * from pr_prioridad_htmp_30;

select *
  from pr_prioridad
 where ano = 2023;

select *
  from exbooking
 where numero_booking = '69890254';

select *
  from exbooking_d
 where numero_booking = '69890254';

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
                  55014940, 55015020, 55015065, 55015168
   );

select *
  from pk_gnumero
 where pk_numero in (
                     53610, 53675, 53837, 53943
   );