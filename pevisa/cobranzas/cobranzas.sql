select *
  from movfigl
 where ano = 2023
   and mes = 11
   and tipo = '2'
   and voucher = 113124;

select *
  from movfide
 where ano = 2023
   and mes = 12
   and tipo = '1'
   and voucher = 120105
   and enumero = '367504';

select *
  from factcob
 where tipdoc = 'LC'
   and serie_num = '1'
   and numero = '367504';

select *
  from cabfcob
 where tipdoc = 'LC'
   and serie_num = '1'
   and numero = '367504';

-- RECIBO COBRANZAS
select *
  from planilla_cobranzas_h
 where numero_planilla = 5004205;

select *
  from planilla_cobranzas_d
 where numero_planilla = 5004205;

select *
  from planilla_cobranzas_i
 where numero_planilla = 5004205;

-- COBRADORES
select *
  from tablas_auxiliares
 where tipo = '26'
 order by codigo;

select *
  from articul
 where cod_art in ('S4 70D-25-B', '0092S47028');
