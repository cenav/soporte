select *
  from articul
 where cod_art in (
                   'SOL 806', 'SOL 805', 'SOL 831', 'SOL 815', 'SOL 814', 'SOL 1001', 'VUL 161'
   );

select *
  from tab_lineas
 where linea in (
                 '2141', '2141', '2141', '2148', '2141', '2150', '2127'
   );


select *
  from kardex_g_movglos
 where cod_alm = '02'
   and tp_transac = '11'
   and serie = 1
   and numero = 31368;

select *
  from orden_de_compra
 where serie = 1
   and num_ped = 85554;

select *
  from itemord
 where serie = 1
   and num_ped = 85554;

select *
  from articul
 where cod_art = 'DISOLVENTE TINTA TRAZABILIDAD';

select *
  from articul
 where cod_art in (
                   'DISOLVENTE TINTA TRAZABILIDAD', 'SOL 805', 'SOL 831', 'SOL 815', 'SOL 814',
                   'SOL 806', 'SOL 1001', 'VUL 161'
   );

select *
  from tab_lineas
 where linea in (
                 '2152', '2148', '2141', '2150', '2127'
   );

select * from articul_iqf;

select *
  from articul_iqf
 where cod_art in (
                   'DISOLVENTE TINTA TRAZABILIDAD', 'SOL 805', 'SOL 831', 'SOL 815', 'SOL 814',
                   'SOL 806', 'SOL 1001', 'VUL 161'
   );

select *
  from oc_registro_facturas
 where serie_oc = 1
   and numero_oc = 85554;

select *
  from oc_registro_facturas
 where cod_alm = '02'
   and tp_transac = '11'
   and serie = 1
   and numero = 31368;

select *
  from kardex_g_movglos
 where cod_alm = '02'
   and tp_transac = '11'
   and serie = 1
   and numero = 31368;

select *
  from itemord i
 where i.serie = 1
   and i.num_ped = 85554
   and exists(
   select 1
     from articul_iqf a
    where a.cod_art = i.cod_art
   );

select *
  from kardex_d d
 where extract(year from d.fch_transac) >= 2023
   and exists(
   select 1
     from articul_iqf a
    where a.cod_art = d.cod_art
   );

begin
  if iqbf.existe('VUL 161') then
    dbms_output.put_line('si');
  else
    dbms_output.put_line('no');
  end if;
end;

-- Con tabla relación para unir a subgrupo
select sl.id_linea, gs.id_subgrupo, s.id_subgrupo, g.id_grupo, g.dsc_grupo, m.id_megagrupo
     , m.dsc_megagrupo
  from prod_subgrupo_linea_rel sl
       join prod_grupo_subgrupo_rel gs on sl.id_subgrupo = gs.id_subgrupo
       join prod_megagrupo_grupo_rel mg
            on gs.id_megagrupo = mg.id_megagrupo
              and gs.id_grupo = mg.id_grupo
       join prod_subgrupo s on gs.id_subgrupo = s.id_subgrupo
       join prod_grupo g on mg.id_grupo = g.id_grupo
       join prod_megagrupo m on mg.id_megagrupo = m.id_megagrupo
 where m.id_megagrupo = 'M010'
   and g.id_grupo in ('G035', 'G035')
 order by id_megagrupo, id_grupo, s.id_subgrupo, id_linea;

select *
  from articul
 where cod_lin = '2128';

select *
  from articul_iqf
 where cod_art = 'VUL 104';

select sl.id_linea
  from articul a
       join prod_subgrupo_linea_rel sl on a.cod_lin = sl.id_linea
       join prod_grupo_subgrupo_rel gs on sl.id_subgrupo = gs.id_subgrupo
       join prod_megagrupo_grupo_rel mg
            on gs.id_megagrupo = mg.id_megagrupo
              and gs.id_grupo = mg.id_grupo
       join prod_subgrupo s on gs.id_subgrupo = s.id_subgrupo
       join prod_grupo g on mg.id_grupo = g.id_grupo
       join prod_megagrupo m on mg.id_megagrupo = m.id_megagrupo
 where m.id_megagrupo = 'M010'
   and g.id_grupo in ('G034', 'G035')
   and a.cod_art = 'SOL 805'
   and not exists(
   select 1
     from articul_iqf a2
    where a2.cod_art = a.cod_art
   );


select count(sl.id_linea)
  from articul a
       join prod_subgrupo_linea_rel sl on a.cod_lin = sl.id_linea
       join prod_grupo_subgrupo_rel gs on sl.id_subgrupo = gs.id_subgrupo
       join prod_megagrupo_grupo_rel mg
            on gs.id_megagrupo = mg.id_megagrupo
              and gs.id_grupo = mg.id_grupo
       join prod_subgrupo s on gs.id_subgrupo = s.id_subgrupo
       join prod_grupo g on mg.id_grupo = g.id_grupo
       join prod_megagrupo m on mg.id_megagrupo = m.id_megagrupo
 where m.id_megagrupo = 'M010'
   and g.id_grupo in ('G034', 'G035') --> productos quimicos
   and a.cod_art = 'VUL 104'
   and not exists(
   select 1
     from articul_iqf ai
    where ai.cod_art = a.cod_art
   );
