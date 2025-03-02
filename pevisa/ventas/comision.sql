begin
  --   pkg_cominac.genera_contrato(2024, 2, 'S', 44, 'SI');
  pkg_cominac.genera_periodo(2024, 4, 'S');
  -- pkg_cominac.elimina_periodo(2023, 2);
-- pkg_cominac.elimina_proceso(2087);
end;

-- Elimina comision en un intervalo de numeros de proceso
begin
  for i in -2601 .. -2555 loop
    sys.dbms_output.put_line(abs(i));
    pkg_cominac.elimina_proceso(abs(i));
  end loop;
end;

-- Elimia comisiones de un vendedor
begin
  for i in -2601 .. -2555 loop
    sys.dbms_output.put_line(abs(i));
    pkg_cominac.elimina_proceso(abs(i));
  end loop;
end;


-- Corre comision una a una en un intervalo de fechas
declare
  cursor cr_anomes is
      with periodo as (
         select trunc(to_date('31/05/2022', 'DD/MM/YYYY') + 1 - rownum) as fecha
           from dual
        connect by rownum < 180
         )
    select to_number(to_char(fecha, 'YYYY')) as ano
         , to_number(to_char(fecha, 'MM')) as mes
      from periodo
     group by to_number(to_char(fecha, 'YYYY'))
            , to_number(to_char(fecha, 'MM'))
     order by 1, 2;
begin
  for r in cr_anomes loop
    sys.dbms_output.put_line(r.ano || ' ' || r.mes);
    pkg_cominac.genera_contrato(r.ano, r.mes, 'S', 17067, 'SI');
  end loop;
end;


-- Actualiza el archivo para planilla
declare
  cursor cr_comision is
    select *
      from vw_cominac_consulta
     where ano = 2019
       and mes = 7
       and cod_vendedor in ('02', '05', '20', '44');
begin
  for r in cr_comision loop
    update comisiones_planilla
       set importe_comision  = r.total_comision
         , importe_incentivo = r.total_bonos
     where ano = r.ano
       and mes = r.mes
       and cod_vendedor = r.cod_vendedor;
  end loop;
end;

-- Elimina procesos de un vendedor
declare
  cursor cr_procesos is
    select *
      from vw_cominac_consulta
     where ano >= 2021
       and cod_vendedor in ('N1')
     order by ano desc, mes desc;
begin
  for r in cr_procesos loop
    pkg_cominac.elimina_proceso(r.cod_proceso);
  end loop;
end;


declare
  cursor cr_procesos is
    select *
      from cominac_contrato
     where cod_vendedor in ('44', '34', '45', '41', '25', '35', '26', '70', '79', '22')
       and estado = '0';
begin
  for r in cr_procesos loop
    pkg_cominac.genera_contrato(2020, 7, 'S', r.cod_contrato, 'SI');
  end loop;
end;


-- Actualiza el archivo de comision para planilla
merge into comisiones_planilla p
using vw_cominac_consulta c
on (c.ano = p.ano and
    c.mes = p.mes and
    c.cod_vendedor = p.cod_vendedor and
    c.ano = 2019 and
    c.mes = 7)
when matched then
  update
     set p.importe_comision  = c.total_comision
       , p.importe_incentivo = c.total_bonos;

-- Anula comision exportacion
declare
  c_ano constant pls_integer := 2021;
  c_mes constant pls_integer := 12;
begin
  delete from excomision_resumen where ano = c_ano and mes = c_mes;
  delete from comisiones_planilla where ano = c_ano and mes = c_mes and origen = 'EXPO';
end;


-- Revisa si tiene todas las lineas que vendio
select distinct i.cod_lin
  from docuvent d
       join itemdocu i on d.tipodoc = i.tipodoc and d.serie = i.serie and d.numero = i.numero
 where d.cod_vende = '15'
   and d.fecha between to_date('21/06/2020', 'DD/MM/YYYY') and to_date('20/07/2020', 'DD/MM/YYYY')
   and d.estado != '9'
 minus
select cod_linea
  from cominac_concepto_linea
 where cod_concepto in (11, 12);


select case :p_moneda when 'D' then nvl(sum(total_soles), 0) else nvl(sum(total_dolares), 0) end
  from vw_venta_detalle
 where cod_vende = '02'
   and fecha between to_date('21/07/2019', 'DD/MM/YYYY') and to_date('20/08/2019', 'DD/MM/YYYY')
   and cod_lin in (
   select l.linea
     from cominac_concepto_grupo g
          join tab_lineas l on g.cod_grupo = l.grupo
    where g.cod_concepto = 4
   );


select distinct g.grupo, g.descripcion
  from vw_venta_detalle v
       join tab_lineas l on v.cod_lin = l.linea
       join tab_grupos g on l.grupo = g.grupo
 where v.cod_vende = '02'
   and v.fecha between to_date('21/07/2019', 'DD/MM/YYYY') and to_date('20/08/2019', 'DD/MM/YYYY')
   and v.cod_lin in (
   select l.linea
     from cominac_concepto_grupo g
          join tab_lineas l on g.cod_grupo = l.grupo
    where g.cod_concepto = 4
   );


select *
  from vw_venta_detalle v
       join tab_lineas l on v.cod_lin = l.linea
       join tab_grupos g on l.grupo = g.grupo
 where v.cod_vende = '02'
   and v.fecha between to_date('21/07/2019', 'DD/MM/YYYY') and to_date('20/08/2019', 'DD/MM/YYYY')
   and g.ind_vta1 = '2000';


select distinct g.grupo
  from vw_venta_detalle v
       join tab_lineas l on v.cod_lin = l.linea
       join tab_grupos g on l.grupo = g.grupo
 where v.cod_vende = '02'
   and v.fecha between to_date('21/07/2019', 'DD/MM/YYYY') and to_date('20/08/2019', 'DD/MM/YYYY');



select cod_vendedor, count(*)
  from cominac_contrato
 where estado = '0'
having count(*) > 1
 group by cod_vendedor;


-- INSERT INTO cominac_concepto_grupo
select 8, g.grupo
  from tab_lineas l
       join tab_grupos g on l.grupo = g.grupo
 group by g.grupo, g.descripcion
 order by g.grupo;


-- Por grupo
select g.grupo, g.descripcion, g.id_mega_grupo, m.descripcion
  from tab_lineas l
       join tab_grupos g on l.grupo = g.grupo
       join tab_mega_grupos m on g.id_mega_grupo = m.id
 where g.id_mega_grupo = 1
 group by g.grupo, g.descripcion, g.id_mega_grupo, m.descripcion
 order by g.grupo;


-- Por linea
select l.linea, g.grupo, g.descripcion, g.id_mega_grupo, m.descripcion
  from tab_lineas l
       join tab_grupos g on l.grupo = g.grupo
       join tab_mega_grupos m on g.id_mega_grupo = m.id
 where g.id_mega_grupo = 1
--AND length(l.grupo) >= 3
 order by g.grupo;


-- Por grupo Ronald
select g.grupo, g.descripcion, g.id_mega_grupo, m.descripcion
  from tab_lineas l
       join tab_grupos g on l.grupo = g.grupo
       join tab_mega_grupos m on g.id_mega_grupo = m.id
 where g.id_mega_grupo = 1
   and length(l.grupo) >= 3
   and l.grupo not in (100, 102)
 group by g.grupo, g.descripcion, g.id_mega_grupo, m.descripcion
 order by g.grupo;



select ano, mes, cod_vendedor, total_bonos
  from vw_cominac_consulta
 where ano = 2020
   and mes in (4, 5, 6, 7)
   and cod_vendedor in ('44', '34', '45', '41', '25', '35', '26', '70', '79', '22')
 order by mes, cod_vendedor;


select *
  from cominac_concepto
 where cod_concepto between 303 and 311;

select *
  from cominac_concepto
 where descripcion like '%BUJ%';

select *
  from comisiones_planilla
 where ano = 2021
   and mes = 9
   and cod_personal = 'E762';

select * from comision_ingeniero_asigna;

select * from comision_ingeniero_tab;

select *
  from comisiones_planilla
 where cod_vendedor = 'B3'
   and ano = 2022
   and mes = 1;


select *
  from comisiones_planilla
 where ano = 2022
   and mes = 1;

begin
  if api_proceso_cominac.row_exists(2023, 2) then
    dbms_output.put_line('true');
  else
    dbms_output.put_line('false');
  end if;
end;

select *
  from comisiones_planilla
 where ano = 2023
   and mes = 3;

begin
  pkg_bono_obreros.elimina(84);
end;

select * from param_bono_obrero;

select * from cabfpag;

select *
  from comisiones_planilla
 where ano = 2024
   and mes = 12
   and origen = 'PROD';

select *
  from sistabgen
 where sisdatdes like '%VENTAS POR VENDEDOR%';

select * from view_vendedor_grupo;

select *
  from cambdol
 where fecha = trunc(sysdate);

select *
  from cambdol
 where fecha = to_date('29/02/2024', 'dd/mm/yyyy');

select *
  from error_log
 order by id_log desc;

select * from cominac_calculo;

select * from cominac_tipo_cuota;

select *
  from proceso_bono_obrero
 where id_proceso = 99;

select * from estado_proceso;

select * from cominac_concepto_rango;

select *
  from cominac_concepto_venta_grupal
 where cod_concepto = 458;

select *
  from comisiones_planilla
 where ano = 2024
   and mes = 12
   and origen = 'PROD';

select * from comision_ingeniero;

select *
  from proceso_bono_oa
 order by periodo_ini desc, codigo desc;

select *
  from proceso_bono_oa
 where extract(year from periodo_ini) = 2024;