begin
  caja_mail.solicitud(2, 28);
end;

select *
  from caja
 where id_serie = 2
   and id_numero = 28;

select *
  from caja_d
 where id_serie = 2
   and id_numero = 19;

select *
  from caja_d
 where id_serie = 2
   and tpodoc = '99';

select *
  from caja_d
 where tpodoc = '99';

select distinct tpodoc from caja_d;
