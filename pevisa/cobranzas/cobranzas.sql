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
  from movdeta
 where nro_referencia = '377315';

select *
  from factcob
 where tipdoc = 'L1'
   and serie_num = '1'
   and numero = '377254';

select *
  from cabfcob
 where tipdoc = 'L1'
   and serie_num = '1'
   and numero = '377254';

select *
  from nrotipo
 where ano = 2024
   and mes = 3
   and tipo = '5';

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

-- CAMBIA FECHA LETRAS
select *
  from letras
 where nrolet = 376705;

select *
  from factcob
 where tipdoc = 'L1'
   and numero = 376705;

-----------------------

select *
  from articul
 where cod_art in ('S4 70D-25-B', '0092S47028');

select *
  from cotizacion
 where cod_tda is not null;

select *
  from pedido
 where cod_tda is not null;

select to_char(l.nrolet) as to_char_l_nrolet_to_char_l_se1
     , decode(l.docref, '01', 'FA', '03', 'BV', '07', 'NC', '08', 'ND', '51', 'PE', '52', 'CD',
              '60', 'LT') as doc
     , decode(c.dociden, null, ruc, c.dociden) as nruc, l.nroref, l.emision, l.vencimiento
     , l.importe, c.nombre, l.cod_cliente, c.telefono, c.direccion || '-' || c.distrito, l.estado
     , l.moneda, u.nom_dtt as distrito, r.nombre as nombre_aval, r.direccion as direccion_aval
     , r.localidad as localidad_aval, r.dociden as dociden_aval, r.telefono as telefono_aval
     , l.cod_vende
  from letras l
     , clientes c
     , ubigeo u
     , cliente_resp r
 where l.nrolet between :P_NUMEROI and :P_NUMEROF
   and l.serlet = :P_SERIE
   and l.cod_cliente = c.cod_cliente
   and r.cod_cliente(+) = c.cod_cliente
   and r.cod_respo(+) = '20'
   and c.cod_ubc = u.cod_ubc
 order by l.nrolet;

select *
  from recprov
 where numero = 17100;

select *
  from itemrec
 where numero = 17100;

select *
  from letras
 where nrolet = 376705;

select *
  from factcob
 where tipdoc = 'L1'
   and numero = 376705;

select *
  from itemrec
 where tipodoc = 'RP'
   and numero = 17146;