select * from campana_cliente;

select *
  from planilla10.personal
 where encargado = '056'
 order by apellido_paterno;

select *
  from campana
 where cod_campana in (
                       'E2022-1', 'E2022-2', 'E2022-3', 'E2022-4'
   );

select *
  from proceso_comiacc
 where cod_proceso = '00268';