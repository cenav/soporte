select p.id_programa, p.descripcion
  from pr_programas_compras p
     , planeamiento_compras c
 where p.id_programa = c.programa
   and c.codigo = 'IMPORTADO'
   and p.cierre_cuando is null
 group by p.id_programa, p.descripcion
 order by id_programa desc;

select *
  from pr_programas_compras
 where id_programa = 'PVC220912';

--REC230401

select *
  from pr_programas_compras
 where id_programa like 'REC%'
 order by id_programa;

select * from planeamiento_compras;

select *
  from vendedores
 where cod_vendedor = '38';

select * from orden_de_compra;

select *
  from lg_dua
 where numero_embarque = 4175;


select *
  from pr_ot_cambios_piezas
 where numero = 914943;


select *
  from lg_pedjam
 where num_importa = 'PR23046';

select *
  from lg_itemjam
 where num_importa = 'PR23046';


select *
  from lg_pedjam
 where num_importa = 'PVC23062';

select *
  from lg_condpag
 where cond_pag = '12I';


select m.ano, m.mes, m.tipo, m.voucher, m.cuenta, m.etipor, m.ecodigo as codigo_relacion
     , m.etipo, m.eserie, m.enumero, m.fecha, m.detalle, m.cargo_s, m.abono_s, m.cargo_d, m.abono_d
     , m.estado
  from movfide m
     , movfigl g
 where m.enumero like 'PVC22160'
   and m.etipo = 'A1'
   and nvl(m.estado, '0') < '9'
   and m.ano = g.ano
   and m.mes = g.mes
   and m.tipo = g.tipo
   and m.voucher = g.voucher
 order by m.enumero, m.ano, m.mes, m.fecha, m.tipo, m.voucher;


select *
  from movfide
 where etipo = 'A1'
   and enumero like 'PVC%'
   and ano = 2023;


-- esta en embarque
select *
  from lg_factura_comercial f
       join packing_g d on f.numero = d.factura_comercial_numero
 where num_importa = 'PVC22160';


select *
  from lg_itemjam
 where num_importa = 'PVM23025'
   and cod_art = 'BLAF 0.5-400GZ';

select *
  from embarques_g
 where numero_embarque = 4330;

select *
  from lg_factura_comercial
 where numero_embarque = 4687;

select *
  from lg_factura_comercial
 where numero_embarque = 4687
   and numero in (
                  'F3542', 'F3543', 'F3544'
   );

select * from embarques_d;

select *
  from hallazgo_importacion
 where id_hallazgo = 422;

select *
  from exarticul_tg_int
 where cod_art = 'COD_ART';

select *
  from itemord
 where serie = 1
   and num_ped = 83969;

select *
  from pcarticul
 where cod_art in (
                   'MOLDE 380.1001-2-1L', 'MOLDE 380.234-2', 'MOLDE 380.753-2',
                   'MOLDE 380.768-2-1L', 'MOLDE 380.930SIL-2-1L', 'MOLDE 380.994-2',
                   'MOLDE 380.995-2', 'MOLDE 400.2259', 'MOLDE 400.2795', 'MOLDE 400.3265',
                   'MOLDE 400.3309SIL'
   );

select *
  from articul
 where cod_art in (
                   'MOLDE 380.1001-2-1L', 'MOLDE 380.234-2', 'MOLDE 380.753-2',
                   'MOLDE 380.768-2-1L', 'MOLDE 380.930SIL-2-1L', 'MOLDE 380.994-2',
                   'MOLDE 380.995-2', 'MOLDE 400.2259', 'MOLDE 400.2795', 'MOLDE 400.3265',
                   'MOLDE 400.3309SIL'
   );

select *
  from lg_itemjam
 where cod_art in (
                   'MOLDE 380.1001-2-1L', 'MOLDE 380.234-2', 'MOLDE 380.753-2',
                   'MOLDE 380.768-2-1L', 'MOLDE 380.930SIL-2-1L', 'MOLDE 380.994-2',
                   'MOLDE 380.995-2', 'MOLDE 400.2259', 'MOLDE 400.2795', 'MOLDE 400.3265',
                   'MOLDE 400.3309SIL'
   );

select *
  from lg_pedjam
 where num_importa in (
                       'PM23062', 'PM24001'
   );

select *
  from lg_itemjam
 where num_importa in (
                       'PM23062', 'PM24001'
   );

select *
  from embarques_d
 where num_importa = 'PM24001';

select * from lg_factura_comercial;

select *
  from docuvent_cierre
 where ano_cierre = 2024
   and mes_cierre = 5;

select * from paramin;

create or replace function pevisa.sf_cant_req_vendida_simulacion(
  p_codigo varchar2
)
  return number is
  l_cantidad number;
begin
  select sum(total)
    into l_cantidad
    from (
           select sum(nvl(total, 0)) as total
             from pr_consd prd
                , pr_consg g
                , pr_ot o
            where g.tipo_orden = o.nuot_tipoot_codigo
              and g.serie_orden = o.nuot_serie
              and g.num_orden = o.numero
              and g.tipo = prd.tipo
              and g.serie = prd.serie
              and g.numero = prd.numero
              and prd.cod_art = p_codigo
              and abre02 like 'SIMULACION%'
            group by prd.cod_art, abre02
           );

  return l_cantidad;
exception
  when others then
    return 0;
end;


create or replace public synonym sf_cant_req_vendida_simulacion for pevisa.sf_cant_req_vendida_simulacion;



create or replace function pevisa.sf_cant_req_vendida_st(
  p_codigo varchar2
)
  return number is
  l_cantidad number;
begin
  select sum(total)
    into l_cantidad
    from (
           select sum(nvl(total, 0)) as total
             from pr_consd prd
                , pr_consg g
                , pr_ot o
            where g.tipo_orden = o.nuot_tipoot_codigo
              and g.serie_orden = o.nuot_serie
              and g.num_orden = o.numero
              and g.tipo = prd.tipo
              and g.serie = prd.serie
              and g.numero = prd.numero
              and prd.cod_art = p_codigo
              and abre02 like 'ST%'
            group by prd.cod_art, abre02
           );

  return l_cantidad;
exception
  when others then
    return 0;
end;


create or replace public synonym sf_cant_req_vendida_st for pevisa.sf_cant_req_vendida_st;
