select *
  from edi_h
 where po = 52194663;

select *
  from edi_d
 where po = 52194663;

select *
  from edi_f
 where po = 52194663;

select numero, to_char(fecha, 'DD/MM/YYYY') as fecha, nombre, paclis as packing
  from exfacturas f
 where f.estado != '9'
   and not exists(
   select 1
     from edi_pesos_d p
    where p.num_fact = f.numero
   )
 order by f.fecha desc, f.numero desc;

select *
  from edi_pesos
 where codigo = 706;

select *
  from edi_pesos_d
 where num_fact = 55017459;

select *
  from asn_h
 where po = 52194663;

select *
  from asn_d
 where po = 52194663;
