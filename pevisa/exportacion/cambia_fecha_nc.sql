select rowid, s.*
  from factcob s
 where trunc(fecha) >= to_date('01/05/2023', 'dd/mm/yyyy')
   and tipdoc = '07'
   and serie_num in ('F055', 'F056')
   and numero in (
   select to_char(numero)
     from docuvent s
    where tipodoc = '07'
      and serie_num in ('F055', 'F056')
      and trunc(fecha) >= to_date('30/04/2023', 'dd/mm/yyyy')
      and origen = 'EXPO'
   );

select *
  from factcob
 where tipdoc = '07'
   and serie_num = 'F056'
   and numero = 3645;

select *
  from docuvent
 where tipodoc = '07'
   and serie = 'F056'
   and numero = 3645;

update factcob s
   set fecha        = to_date('30/04/2023', 'DD/MM/YYYY'),
       f_vencto     = to_date('30/04/2023', 'DD/MM/YYYY'),
       fecha_origen = to_date('30/04/2023', 'DD/MM/YYYY'),
       ano          = 2023,
       mes          = 04
 where trunc(fecha) >= to_date('01/05/2023', 'dd/mm/yyyy')
   and tipdoc = '07'
   and serie_num in ('F055', 'F056')
   and numero in
       (
         select to_char(numero)
           from docuvent s
          where tipodoc = '07'
            and serie_num in ('F055', 'F056')
            and trunc(fecha) >= to_date('30/04/2023', 'dd/mm/yyyy')
            and origen = 'EXPO'
         );

select rowid, g.*
  from kardex_g g
 where cod_alm = '01'
   and tp_transac = '20'
   and serie = 1
   and numero in (
   select numero_kardex
     from docuvent s
    where tipodoc = '07'
      and serie in ('F055', 'F056')
      and trunc(fecha) >= to_date('01/05/2023', 'dd/mm/yyyy')
      and estado < 9
      and origen = 'EXPO'
   );


update kardex_g g
   set fch_transac = to_date('28/02/2023', 'DD/MM/YYYY')
 where cod_alm = '01'
   and tp_transac = '20'
   and serie = 1
   and numero in (
   select numero_kardex
     from docuvent s
    where tipodoc = '07'
      and serie in ('F055', 'F056')
      and trunc(fecha) >= to_date('01/03/2023', 'dd/mm/yyyy')
      and estado < 9
      and origen = 'EXPO'
   );

select rowid, s.*
  from docuvent s
 where tipodoc = '07'
   and serie in ('F055', 'F056')
   and trunc(fecha) >= to_date('01/05/2023', 'dd/mm/yyyy')
   and estado < 9
   and origen = 'EXPO'
 order by numero;

update docuvent g
   set fecha    = to_date('28/02/2023', 'DD/MM/YYYY'),
       f_vencto = to_date('28/02/2023', 'DD/MM/YYYY')
 where tipodoc = '07'
   and serie in ('F055', 'F056')
   and estado < 9
   and origen = 'EXPO'
   and trunc(fecha) >= to_date('01/03/2023', 'dd/mm/yyyy')
