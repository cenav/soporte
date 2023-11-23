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
 where numero_embarque = 4330;

select * from embarques_d;