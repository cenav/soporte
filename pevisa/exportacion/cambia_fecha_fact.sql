select rowid, s.*
  from exfacturas s
 where trunc(fecha) >= to_date('01/05/2023', 'dd/mm/yyyy')
 order by numero desc;
--    tomar nota de una factura

-- ejecutar:
begin
  p_yanina_cambia_fechas_expo();
end;
--
--
-- validar el cambio

select rowid, s.*
  from exfacturas s
 where numero = 55015273;

select *
  from exfacturas
 where serie = 'F056';

select *
  from factcob
 where serie_num = 'F056'
   and numero = 3645;

--                    ahora debe tener fecha  30 abril
select rowid, s.*
  from exfacturas s
 where trunc(fecha) >= to_date('01/05/2023', 'dd/mm/yyyy')
 order by numero desc;
--    tomar nota de una factura
--
--
-- ejecutar:
--
begin
  p_yanina_cambia_fechas_expo();
end;
--
--
-- validar el cambio

select rowid, s.*
  from exfacturas s
 where numero = 55014718;

--                    ahora debe tener fecha  30 abril
select rowid, s.*
  from exfacturas s
 where trunc(fecha) >= to_date('01/05/2023', 'dd/mm/yyyy')
 order by numero desc;
--    tomar nota de una factura
--
--
-- ejecutar:
--
-- exec P_YANINA_CAMBIA_FECHAS_EXPO
--
--
-- validar el cambio
--
select rowid, s.*
  from exfacturas s
 where numero = 55014718;

--                    ahora debe tener fecha  30 abril
select rowid, s.*
  from exfacturas s
 where trunc(fecha) >= to_date('01/05/2023', 'dd/mm/yyyy')
 order by numero desc;
--    tomar nota de una factura
--
--
-- ejecutar:
--
-- exec P_YANINA_CAMBIA_FECHAS_EXPO
--
--
-- validar el cambio
--
select rowid, s.*
  from exfacturas s
 where numero = 55014718;

--                    ahora debe tener fecha  30 abril

select *
  from exfacturas
 where serie = 'F056';

select *
  from docuvent
 where serie = 'F056'
   and numero in (
                  3645, 3646, 3647, 3648, 3649, 3650
   );

select *
  from letras
 where nrolet = 354270;