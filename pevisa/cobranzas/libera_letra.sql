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
                  '378263', '378772', '371665', '375705', '373943', '374001', '375225', '374092',
                  '376341', '372836', '373236', '373237', '373235', '375829', '376374', '375330',
                  '375224', '376131'
   )
   and estado = '2';

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
