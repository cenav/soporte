----- kardex  oracle -----
-- FECHA INV. 05/12/2024 .....
-- 15  AJUSTE    I  ..
--28  AJUSTE     S ...

select
---ROWID, A.*
sum(decode(ing_sal, 'I', cantidad, -cantidad))
  from kardex_d a
 where cod_alm = 'D5' --- D2 ----
   and cod_art like 'BOLSA P0950'
---AND FCH_TRANSAC > :PFECHA1                    --- 05/12/2024 ......
--AND FCH_TRANSAC <=:PFECHA
   and estado <> '9'
 order by fch_transac;

---  revision tabla almacen ----
select rowid, a.*
  from almacen a
 where cod_alm = 'D5'
---AND COD_aRT = 'CL-O 70068USCS-3'
   and cod_art = 'BOLSA P0950';


---- diferencia WMS ERP ---

select x.cod_alm, x.cod_art, sum(decode(x.id, 'A', x.stock, 0)) as stock_wms
     , sum(decode(x.id, 'B', x.stock, 0)) as stock_erp, sum(decode(x.id, 'A', x.stock, 0)) -
                                                        sum(decode(x.id, 'B', x.stock, 0)) as difer
  from (
         select
--*
           'A' as id, cod_alm, cod_art, sum(cantidad) as stock
           from wms_alm_ubicacion
          where cod_alm = 'D5'
--AND REFERENCIA = '128'
--AND COD_aRT = 'RC 122'
            and estado <> '9'
          group by cod_alm, cod_art
         having sum(cantidad) <> 0
          union
         select 'B' as id, cod_alm, cod_art, stock
           from almacen
          where cod_alm = 'D5'
--AND COD_aRT = 'RC 122'
            and stock <> 0
         ) x
 group by x.cod_alm, x.cod_art
having (sum(decode(x.id, 'A', x.stock, 0)) - sum(decode(x.id, 'B', x.stock, 0))) <> 0
 order by 1, 2

