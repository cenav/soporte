create or replace package enum_cuenta_asiento_auto as
  subtype t_cuenta is binary_integer range 1..8;

  facturas constant t_cuenta := 1;
  honorarios constant t_cuenta := 2;
  interes_prestamo constant t_cuenta := 3;
  otra_carga_financiera constant t_cuenta := 4;
  interes_terceros constant t_cuenta := 5;
  interes_bancos constant t_cuenta := 6;
  dif_cambio_prov_mas constant t_cuenta := 7;
  dif_cambio_prov_menos constant t_cuenta := 8;
end enum_cuenta_asiento_auto;
