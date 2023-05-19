-- if imp_igv => null then imp_igv => 0
-- luego anular por modulo ventas -> anula facturas con motivo
select *
  from docuvent
 where tipodoc = '01'
   and serie = 'F054'
   and numero = 1;