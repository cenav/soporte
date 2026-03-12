select cod_art, cantidad
  from tmp_carga_data
 group by cod_art, cantidad;

select t.cod_art, t.cantidad
  from tmp_carga_data t
       join articul a on t.cod_art = a.cod_art
 group by t.cod_art, t.cantidad;


-- actualiza cavidades al maestro de artículos
declare
  l_total number := 0;
begin
  for r in (
    select t.cod_art, t.cantidad
      from tmp_carga_data t
           join articul a on t.cod_art = a.cod_art
     group by t.cod_art, t.cantidad
    )
  loop
    update articul
       set pr_golpza = r.cantidad
     where cod_art = r.cod_art;

    l_total := l_total + sql%rowcount;
  end loop;

  dbms_output.put_line('Total de filas modificadas: ' || l_total);
end;

-- programa Antony embalajes hijas emitidas
select *
  from pr_programa_emision_ot p
 where id_grupo = 'G005' --EMBALAJES HIJAS
   and nuot_tipoot_codigo = 'PR'
   and nuot_serie = 8
   and numero in (
   select numero
     from pr_ot po
    where p.nuot_tipoot_codigo = po.nuot_tipoot_codigo
      and p.nuot_serie = po.nuot_serie
      and p.numero = po.numero
      and estado = 1 --ordenes pendientes
   )
 order by id_programa, fecha asc;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero = 655192;



select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 614464;

select *
  from tmp_carga_data
 where cod_art = 'DUR 115.190';

select *
  from articul
 where cod_art = 'DUR 115.190';

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero = 614464;

declare
  l_rows      pls_integer := 0;
  l_cant_prog pr_ot.cant_prog%type;
begin
  for r in (
-- programa Antony embalajes hijas emitidas
    select p.id_programa, p.id_grupo, p.cod_pza, p.nuot_tipoot_codigo, p.nuot_serie, p.numero
         , p.fecha, p.cantidad_a_producir, p.usuario, p.tipo_programa, p.faltante, p.promedio
         , p.fecha_registro, p.estado, p.mega_grupo, p.sub_grupo, p.mega_grupo_base, p.grupo_base
         , p.sub_grupo_base, p.cod_pza_base, a.pr_golpza as cavidades
      from pr_programa_emision_ot p
           join articul a on p.cod_pza = a.cod_art
     where id_grupo = 'G005' --EMBALAJES HIJAS
       and nuot_tipoot_codigo = 'PR'
       and nuot_serie = 8
       and a.pr_golpza > 0
       and mod(p.cantidad_a_producir, a.pr_golpza) <> 0
       and numero in (
       select numero
         from pr_ot po
        where p.nuot_tipoot_codigo = po.nuot_tipoot_codigo
          and p.nuot_serie = po.nuot_serie
          and p.numero = po.numero
          and estado = 1 --ordenes pendientes
       )
     order by id_programa, fecha asc
    )
  loop
    l_cant_prog := ceil(r.cantidad_a_producir / r.cavidades) * r.cavidades;

    update pr_ot
       set cant_prog = l_cant_prog
     where nuot_tipoot_codigo = r.nuot_tipoot_codigo
       and nuot_serie = r.nuot_serie
       and numero = r.numero;

    l_rows := l_rows + sql%rowcount;

    update pr_ot_det
       set cant_formula    = l_cant_prog * rendimiento
         , cant_despachada = l_cant_prog * rendimiento
     where ot_nuot_tipoot_codigo = r.nuot_tipoot_codigo
       and ot_nuot_serie = r.nuot_serie
       and ot_numero = r.numero;

  end loop;

  dbms_output.put_line(l_rows);
end;

select ceil(1750 / 3) * 3
  from dual;


select mod(1750, 3)
  from dual;

-- cant prog 1750
select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and nuot_serie = 8
   and numero = 655182;

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_nuot_serie = 8
   and ot_numero = 655182;