/*
KARDEX_L.OT_TIPO   = PR_OT_DET.OT_NUOT_TIPOOT_CODIGO AND
KARDEX_L.OT_SERIE  = PR_OT_DET.OT_NUOT_SERIE AND
KARDEX_L.NRO_SER_LOTE = PR_OT_DET.OT_NUMERO AND
KARDEX_L.COD_ART   = PR_OT_DET.ART_COD_ART
*/

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and nuot_serie = 8
   and numero = 629959;

select *
  from kardex_l
 where ot_tipo = 'PR'
   and ot_serie = 8
   and nro_ser_lote = 629959
   and ing_sal = 'I'
   and estado < '8'
--    and cod_art = 629959;
