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
select a.*
  from letras_envio a
---UPDATE LETRAS_ENVIO
--SET L_REFBCO = NULL
--SET L_CONDLE = 'EC', ESTADO =EC 2
 where numero in (
                  '364431', '366510', '363899', '364291', '365933', '362765', '366383', '359467',
                  '362722', '365415', '362915', '363856', '362926', '363848', '359442', '361452',
                  '362989'
   )
and estado = '2';

-- PARA LIBERAR LETRAS WALTER ---- PARTE 2
-- SE BUSCA TODA LA PLANILLA PARA PODER VER SI ESTAN TODAS LAS LETRAS DE LA PLANILLA BUSCADA---
-- EN BASE A LOS DATGOS OBTENIDOS  EN LA PARTE 1 --
select a.*
  from letras_envio a
 where banco = '14'
   and l_condle = 'CC'
   and estado = 2
----AND NRO_ENVIO = 1743
--AND FECHA_ENVIO = '18/OCT/2022'
   and fecha_recepcion = to_date('17/07/2023', 'dd/mm/yyyy')
   and fecha_pago = to_date('04/11/2023', 'dd/mm/yyyy');



--- PARA LIBERAR LETRAS WALTER ---- PARTE 3 - FINAL --
--- SE ACTUALIZA  SOLO 2 DATOS EN BASE A LA SIGUIENTE SITUACION
--- SITUACCION (1) :  Si el campo ESTADO es igual a 2 solo se actualiza el campo L_CONDLE   si dice CC a EC   ó si dioe CD a ED.
--- SITUACCION (2) : Si el campo ESTADO es igual a 3 se actualiza campo L_CONDLE   si dice CC a EC   ó si dioe CD a ED. y el cammpo ESTADO se pone a 2.
update letras_envio
--SET L_REFBCO = NULL, ESTADO = 1
   set l_condle = 'EC'
     , estado   = 1
 where banco = '17'
   and l_condle = 'EC'
   and estado = 2
   and fecha_recepcion = '21/OCT/2022'
--AND FECHA_ENVIO ='27/APR/2019'
   and fecha_pago = '21/OCT/2022';
