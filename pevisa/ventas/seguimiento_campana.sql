declare
  l_desde    date   := to_date('01/09/2023', 'dd/mm/yyyy');
  l_hasta    date   := to_date('31/12/2023', 'dd/mm/yyyy');
  l_concepto cominac_concepto%rowtype;
  l_venta    number := 0;
begin
  l_concepto := api_cominac_concepto.onerow(397);
  l_venta := pkg_cominac_qry.venta_total('61', l_desde, l_hasta, 'D', l_concepto);
  dbms_output.put_line(l_venta);
end;

  with tabla as (
    select '61' as vendedor, '397' as concepto
      from dual
     union all
    select '62' as vendedor, '398' as concepto
      from dual
     union all
    select '67' as vendedor, '399' as concepto
      from dual
    )
     , concepto as (
    select *
      from cominac_concepto c
           join tabla t on c.cod_concepto = t.concepto
    )
select *
  from concepto;

select *
  from cominac_concepto_rango
 where cod_concepto = 58
 order by cod_rango;

select *
  from usuarios_cotizacion
 where usuario = 'PEVISA';

select *
  from vendedores
 where cod_vendedor in ('06', '27');

-- venta_cuatrimestral
  with detalle as (
    select cod_vende, tipodoc, serie, numero, fecha, cod_grupo, cod_lin, cod_art, total_dolares
      from vw_venta_detalle
     where fecha between to_date('01/09/2023', 'dd/mm/yyyy') and to_date('31/12/2023', 'dd/mm/yyyy')
       and ((cod_vende in ('06', '27', '23', '05', '20', '11', '10', '15') and
             cod_grupo not in (1, 2, 3, 4, 5, 6, 7, 11, 12, 13, 21, 26, 28, 37) and
             cod_lin not in ('227', '237', '247')) or
            cod_vende in ('61', '67', '62', '64', '65', '22'))
    )
select *
  from detalle
 order by fecha, tipodoc, numero;


select cod_vende, tipodoc, serie, numero, fecha, total_dolares, cod_grupo
  from vw_venta_detalle
 where fecha between to_date('01/09/2023', 'dd/mm/yyyy') and to_date('31/12/2023', 'dd/mm/yyyy')
   and cod_vende = '06'
   and (cod_vende in ('06') and cod_grupo not in (1));
