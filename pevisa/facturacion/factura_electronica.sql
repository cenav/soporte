-- elimina para volver a enviar factura electrónica
select *
  from exfacturas_enviados
 where serie = 'F050'
   and numero = 211580;

select *
  from articul
 where cod_art = '0242229782';

select *
  from pcarticul
 where cod_art = '0242229782';


select *
  from pcarticul
 where cod_art = '0242229782';

select *
  from itemdocu
 where numero = '211580';

select a.descri_cos
  from articul_pev a
 where a.cod_art = '0242229782';

select *
  from articul_pev a
 where a.cod_art = '0242229782';