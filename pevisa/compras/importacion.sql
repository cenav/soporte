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

select *
  from proveed
 where cod_proveed = '20600612922';

select importada
     , nacional
     , f_stock_almacen_total(nacional) as stock_nacional
     , nacional_a_importada
     , f_stock_almacen_total(nacional_a_importada) as stock_nacional_importada
  from pieza_nacional_importada;

select *
  from pieza_importada_nacional;

select *
  from lg_pedjam
 where num_importa = 'MU24056';

select *
  from articul
 where cod_art = '180.866NY';

/*
select distinct numero_embarque, tipo tipo_pedido, cod_proveed, nombre, ncomercial
        , fecha_recepcion_almacen
from (select e.numero_embarque, l.num_importa, p.kardex_fecha_ingreso, i.cod_art
       , fecha_recepcion_almacen, l.tipo, e.cod_proveed, nombre, l.ncomercial
    from embarques_g e, packing_g p, lg_pedjam l, lg_itemjam i, lg_itemjam_otros o
       , proveed pr
   where e.numero_embarque = p.numero_embarque
     and p.num_importa = l.num_importa
     and l.num_importa = i.num_importa
     and i.num_importa = o.num_importa
     and i.cod_art = o.cod_art
     and l.cod_proveed = pr.cod_proveed
     and fecha_recepcion_almacen is not null
     and (sysdate - fecha_recepcion_almacen) >= 1
     and nvl(l.estado, 0) > 0
     and nvl(l.estado, 0) < 8
     and l.TIPO <> ''MU''
     and not exists
           (select 1
              from kardex_g
             where nro_doc_ref = e.numero_embarque
               and cod_relacion = e.cod_proveed));
*/

select distinct grupo, numero_embarque, tipo as tipo_pedido, cod_proveed, nombre
              , ncomercial, fecha_recepcion_almacen
  from (
         select e.numero_embarque, l.num_importa, p.kardex_fecha_ingreso, i.cod_art
              , fecha_recepcion_almacen, l.tipo, e.cod_proveed, nombre, l.ncomercial
              , gn.descripcion as grupo
           from embarques_g e
              , packing_g p
              , lg_pedjam l
              , lg_itemjam i
              , lg_itemjam_otros o
              , proveed pr
              , pr_programas_compras pg
              , grupo_negocio gn
          where e.numero_embarque = p.numero_embarque
            and p.num_importa = l.num_importa
            and l.num_importa = i.num_importa
            and i.num_importa = o.num_importa
            and i.cod_art = o.cod_art
            and l.cod_proveed = pr.cod_proveed
            and l.programa = pg.id_programa
            and pg.codigo_grupo = gn.codigo_grupo
            and fecha_recepcion_almacen is not null
            and (sysdate - fecha_recepcion_almacen) >= 1
            and nvl(l.estado, 0) > 0
            and nvl(l.estado, 0) < 8
            and l.tipo <> 'MU'
            and not exists (
            select 1
              from kardex_g
             where nro_doc_ref = e.numero_embarque
               and cod_relacion = e.cod_proveed
            )
         );

select *
  from lg_tipo_pedido
 where tipo_pedido in (
                       'AP', 'AP', 'BT', 'PM', 'AP'
   );

select *
  from pr_programas_compras
 where id_programa = 'PGI24375';

select * from grupo_negocio;

select * from lg_pedjam;

begin
  notif_matriceria_calidad.envia_correo_embarques();
end;

select *
  from embarques_liberacion
 where numero_embarque = '5010'
   and cod_art = 'BL450.502SP';

select * from estados_liberacion_producto;