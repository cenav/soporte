-- 351212
-- 348293
-- 347670
-- 353308
-- 349720
-- 352436
-- 351136
-- 351148
-- 348690

-- PARA LIBERAR LETRAS WALTER ---- PARTE 1 - INICIO
---- SE BUSCA UNA DE LAS LETRAS DE PLANILLA PARA PODER VISUALIZAR :
----  (1) BANCO, (2) CONDICION DE LA LETRA L_CONDLE , (3) FECHA_PAGO  Y  (4) ESTADO  y/o FECHA_ENVIO

-- PARA LIBERAR LETRAS WALTER ---- PARTE 3 - FINAL --
-- SE ACTUALIZA  SOLO 2 DATOS EN BASE A LA SIGUIENTE SITUACION
-- SITUACCION (1) : Si el campo ESTADO es igual a 2 solo se actualiza el campo L_CONDLE
--                   si dice CC a EC   ó si dioe CD a ED.
-- SITUACCION (2) : Si el campo ESTADO es igual a 3 se actualiza campo L_CONDLE
--                  si dice CC a EC   ó si dioe CD a ED. y el cammpo ESTADO se pone a 2.
select a.*
  from letras_envio a
--UPDATE LETRAS_ENVIO
--SET L_REFBCO = NULL
--SET L_CONDLE = 'EC', ESTADO =EC 2
 where numero in (
                  '371357', '377159', '376789', '374820', '374819', '376788', '376338', '374088',
                  '376317', '375365', '374861', '377089', '376018', '377639', '376259', '376718',
                  '375842', '374459', '376639', '374457', '373231', '375527', '375283', '377311',
                  '373454', '375328', '375693'
   )
   and estado = '3';

select a.*
  from letras_envio a
--UPDATE LETRAS_ENVIO
--SET L_REFBCO = NULL
--SET L_CONDLE = 'EC', ESTADO =EC 2
 where numero in (
                  '369844', '371330'
   )
   and estado = '3';

select a.*
  from letras_envio a
--UPDATE LETRAS_ENVIO
--SET L_REFBCO = NULL
--SET L_CONDLE = 'EC', ESTADO =EC 2
 where numero in (
                  '364200', '368416', '366585', '367420', '366288', '366389', '362945', '362915',
                  '363873', '366443', '363880', '359454', '362893', '362941', '368467', '361452',
                  '363853', '363850', '367554', '367158', '368409', '365331', '365086', '366334',
                  '343673', '365903', '367329'
   )
   and estado = '3'
   and l_condle = 'CC';

-- PARA LIBERAR LETRAS WALTER ---- PARTE 2
-- SE BUSCA TODA LA PLANILLA PARA PODER VER SI ESTAN TODAS LAS LETRAS DE LA PLANILLA BUSCADA---
-- EN BASE A LOS DATGOS OBTENIDOS  EN LA PARTE 1 --
select a.*
  from letras_envio a
 where banco = '14'
   and l_condle = 'CC'
   and estado = 3
----AND NRO_ENVIO = 1743
--AND FECHA_ENVIO = '18/OCT/2022'
--    and fecha_recepcion = to_date('17/07/2023', 'dd/mm/yyyy')
   and fecha_pago = to_date('27/11/2023', 'dd/mm/yyyy');


--- PARA LIBERAR LETRAS WALTER ---- PARTE 3 - FINAL --
--- SE ACTUALIZA  SOLO 2 DATOS EN BASE A LA SIGUIENTE SITUACION
--- SITUACCION (1) :  Si el campo ESTADO es igual a 2 solo se actualiza el campo L_CONDLE   si dice CC a EC   ó si dioe CD a ED.
--- SITUACCION (2) : Si el campo ESTADO es igual a 3 se actualiza campo L_CONDLE   si dice CC a EC   ó si dioe CD a ED. y el cammpo ESTADO se pone a 2.
update letras_envio
--SET L_REFBCO = NULL, ESTADO = 1
   set l_condle = 'EC'
     , estado   = 1
 where banco = '14'
   and l_condle = 'CC'
   and estado = 3
   and fecha_pago = to_date('27/11/2023', 'dd/mm/yyyy');
