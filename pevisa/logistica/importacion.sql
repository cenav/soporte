select p.id_programa, p.descripcion
  from pr_programas_compras p, planeamiento_compras c
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