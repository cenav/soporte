-- cuadre facturacion
select vta.tipodoc
     , sum(decode(vta.moneda, 'S', total_doc_sol, 0)) total_doc_mn
     , sum(decode(vta.moneda, 'S', importe_sol, 0)) importe_mn
     , sum(decode(vta.moneda, 'D', total_doc_sol, 0)) total_doc_me
     , sum(decode(vta.moneda, 'D', importe_sol, 0)) importe_me
     , sum(decode(vta.moneda, 'E', total_doc_sol, 0)) total_doc_ex
     , sum(decode(vta.moneda, 'E', importe_sol, 0)) importe_ex
  from (
         select tipodoc
              , moneda
              , count(*) total_doc_sol
              , sum(precio_vta) importe_sol
           from docuvent
          where moneda = 'S'
            and to_char(fecha, 'yyyymm') = to_char(:P_FECHA1, 'yyyymm')
            and estado <> '9'
          group by tipodoc, moneda
          union
         select tipodoc
              , moneda
              , count(*) total_doc_sol
              , sum(precio_vta) importe_sol
           from docuvent
          where moneda = 'D'
            and to_char(fecha, 'yyyymm') = to_char(:P_FECHA1, 'yyyymm')
            and estado <> '9'
            and not cod_cliente like '000009%'
          group by tipodoc, moneda
          union
         select tipodoc
              , 'E' moneda
              , count(*) total_doc_sol
              , sum(precio_vta) importe_sol
           from docuvent
          where moneda = 'D'
            and to_char(fecha, 'yyyymm') = to_char(:P_FECHA1, 'yyyymm')
            and estado <> '9'
            and cod_cliente like '000009%'
          group by tipodoc, moneda
         ) vta
 where vta.tipodoc in ('01', '03', '07', '08')
 group by vta.tipodoc
 order by 1;

-- cuadre contabilidad
select x.tipdoc
     , sum(decode(x.moneda, 'S', total_doc_sol, 0)) total_doc_mn
     , sum(decode(x.moneda, 'S', importe_sol, 0)) importe_mn
     , sum(decode(x.moneda, 'D', total_doc_sol, 0)) total_doc_me
     , sum(decode(x.moneda, 'D', importe_sol, 0)) importe_me
     , sum(decode(x.moneda, 'E', total_doc_sol, 0)) total_doc_ex
     , sum(decode(x.moneda, 'E', importe_sol, 0)) importe_ex
  from (
         select tipdoc
              , moneda
              , count(*) total_doc_sol
              , sum(importe) importe_sol
           from factcob
          where moneda = 'S'
            and to_char(fecha, 'yyyymm') = to_char(:P_FECHA1, 'yyyymm')
          group by tipdoc, moneda
          union
         select tipdoc
              , moneda
              , count(*) total_doc_sol
              , sum(importe) importe_sol
           from factcob
          where moneda = 'D'
            and to_char(fecha, 'yyyymm') = to_char(:P_FECHA1, 'yyyymm')
            and not cod_cliente like '000009%'
          group by tipdoc, moneda
          union
         select tipdoc
              , 'E' moneda
              , count(*) total_doc_sol
              , sum(importe) importe_sol
           from factcob
          where moneda = 'D'
            and to_char(fecha, 'yyyymm') = to_char(:P_FECHA1, 'yyyymm')
            and cod_cliente like '000009%'
          group by tipdoc, moneda
         ) x
 where x.tipdoc in ('01', '03', '07', '08')
 group by x.tipdoc
 order by 1;

select 2071600.42 - 2063708.72 as dif
  from dual;