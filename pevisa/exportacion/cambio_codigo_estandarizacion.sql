-- codigo antiguo -> CH 95237 TG
-- codigo reemplazo -> CHP 95237 GR
select *
  from expedido_d
 where cod_art = 'CH 95237 TG';


select *
  from pr_ot
 where formu_art_cod_art = 'CH 95237 TG'
   and estado = '1';

select *
  from pr_ot
 where abre01 = '17193'
   and per_env = '260';

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'AR'
   and ot_numero = 1172029;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and numero = 1172029;

-- 545	247
select *
  from expednac_d
 where numero = 545
   and nro = 247;

select *
  from pr_ot
 where abre01 = '17194'
   and per_env = '187';

select *
  from expedido_d
 where numero = 17194
   and nro = 187;


-- codigos pedidos que estan con oa en estado diferente a 1
select o.formu_art_cod_art, nuot_tipoot_codigo, o.numero, o.estado, o.fecha
     , o.abre01 as pedido, o.per_env as item, a.cod_adicion
  from pr_ot o
       left join tmp_carga_activo_fijo a on o.formu_art_cod_art = a.cod_activo_fijo
 where o.formu_art_cod_art in (
                               'CH 95237 TG', 'HS 95240 TG', 'FS 95237 TG', 'FS 95238 TG',
                               'FS 95239 TG', 'FS 95240 TG'
   )
   and o.estado not in ('1', '7', '8', '9')
   and extract(year from o.fecha) > 2015;

-- ordenes pedidos a cambiar
-- insert into tmp_carga_data(cod_art, tipo_pguia, numero_pguia, numero, nro_cuota, cod_activo_fijo)
select o.formu_art_cod_art, nuot_tipoot_codigo, o.numero
     , o.abre01 as pedido, o.per_env as item, a.cod_adicion
  from pr_ot o
       left join tmp_carga_activo_fijo a on o.formu_art_cod_art = a.cod_activo_fijo
 where o.formu_art_cod_art in (
                               'BCH 1022 TG', 'FS 1024 BR1-02 TG', 'CH 1037 TG', 'FS 1508 GR',
                               'CHP 1508 GR', 'HS 1524 US1 TG', 'FS 5721 MX GR', 'FS 5721 MX GR',
                               'CH 5739 TG', 'HS 5739 US TG', 'CH 5940 TG', 'CH 5941 TG',
                               'CHP 30048 GR', 'CH 30050 TG', 'FS 40045 GR', 'CHP 40045 GR',
                               'CH 80002 TG', 'FS 80002 TG', 'CH 80005 TG', 'FS 80013 GR',
                               'FS 80008 TG', 'FS 80023 TG', 'FS 80036 GR', 'FS 80040 TG',
                               'CH 80048 TG', 'CH 80049 TG', 'FS 80061 GR', 'FS 80192 GR',
                               'HS 80192 GR', 'CH 80073 TG', 'FS 80073 TG', 'CH 80074 TG',
                               'FS 80166 TG', 'FS 80074 TG', 'CH 80079 TG', 'CH 80082 TG',
                               'FS 80082 TG', 'CH 80090 TG', 'CH 80092 TG', 'FS 80092 TG',
                               'HS 80092 TG', 'FS 80132 MX GR', 'FS 80122 TG', 'FS 80125 TG',
                               'FS 80128 TG', 'FS 80180 GR', 'CH 80182 TG', 'FS 81020 GR',
                               'CHP 83001 GR', 'FS 83005 GR', 'FSP 86003 GR', 'FSP 86006 GR',
                               'CHP 86006 GR', 'CH 86070 TG', 'FS 88012 GR', 'FS 88076 GR',
                               'FS 88094 GR', 'CH 88171 TG', 'FS 88171 TG', 'FS 89022 TG',
                               'FS 92018 GR', 'FS 93009 TG', 'FS 93061 TG', 'BCH 93090 TG',
                               'FS 95001 GR', 'CH 95015 TG', 'FS 95015 TG', 'FS 95023 TG',
                               'FS 95024 TG', 'CH 95023 TG', 'FS 95030 TG', 'HS 95030 TG',
                               'CH 95030 TG', 'FS 95036 TG', 'CH 95036 TG', 'FS 95116 TG',
                               'CH 95116 TG', 'CH 95246 TG', 'FS 95098 TG', 'FS 95253 TG',
                               'CH 95266 TG', 'HS 95266 TG', 'FS 95266 TG', 'CH 95270 TG',
                               'FS 95275 GR', 'CH 50010/22 TG', 'CH 80002/22 TG', 'CH 80077/20 TG',
                               'FS 80077/20 TG', 'CH 80092/20 TG', 'CH 80102/20 TG',
                               'FS 80113/20 TG', 'CH 81000/22 TG', 'CH 81010/22 TG',
                               'CH 81126/20 TG', 'CH 83007/22 TG', 'CH 83070/22 TG',
                               'CH 86004/22 TG', 'FS 86020/20 EC GR', 'CHP 86020/20 GR',
                               'CH 86020/22 TG', 'CH 87739/20 TG', 'CH 88121 TG', 'FS 92009/20 TG',
                               'CH 70001/22 TG', 'CHP 93010/20 GR', 'CH 95036/20 TG',
                               'CH 95067/20 TG', 'CH 95097/20 TG', 'FS 95117 TG', 'CH 95200/22 TG',
                               'CH 83130/22 TG', 'CH 86003/22 TG', 'CH 88065/22 TG',
                               'CH 88100/22 TG', 'CHP 89019/20 GR', 'FS 89019/20 GR',
                               'FS 93006/20 GR', 'CHP 93006/20 GR', 'CH 95038/22 TG',
                               'CHP 95038/20 GR', 'FS 95038 GR', 'CH 95233/20 TG', 'CH 95237/20 TG'
   )
   and o.estado = '1'
   and not exists(
   select 1
     from pr_ot_impresion i
    where i.nuot_tipoot_codigo = o.nuot_tipoot_codigo
      and i.nuot_serie = o.nuot_serie
      and i.numero = o.numero
   );

select cod_art, tipo_pguia, numero_pguia, numero, nro_cuota, cod_activo_fijo
  from tmp_carga_data;

select cod_activo_fijo, cod_adicion from tmp_carga_activo_fijo;

declare
  l_total_pedido   number := 0;
  l_total_proforma number := 0;
  l_total_ordenes  number := 0;
  l_total_detalle  number := 0;
begin
  for r in (
    select cod_art, tipo_pguia, numero_pguia, numero, nro_cuota, cod_activo_fijo
      from tmp_carga_data
    )
  loop

    update expedido_d
       set cod_art  = r.cod_activo_fijo
         , saldo_ot = 0
     where numero = r.numero
       and nro = r.nro_cuota;

    l_total_pedido := l_total_pedido + sql%rowcount;

    for r2 in (
      select numero_proforma
        from exproformas_expedidos
       where numero_pedido = r.numero
      )
    loop
      update exproforma_d
         set cod_art = r.cod_activo_fijo
       where numero = r2.numero_proforma
         and cod_art = r.cod_art;

      l_total_proforma := l_total_proforma + sql%rowcount;
    end loop;

    update pr_ot
       set estado = '9'
     where nuot_tipoot_codigo = r.tipo_pguia
       and numero = r.numero_pguia;

    l_total_ordenes := l_total_ordenes + sql%rowcount;

    update pr_ot_det
       set estado = '9'
     where ot_nuot_tipoot_codigo = r.tipo_pguia
       and ot_numero = r.numero_pguia;

    l_total_detalle := l_total_detalle + sql%rowcount;
  end loop;

  dbms_output.put_line('pedido ' || l_total_pedido);
  dbms_output.put_line('pedido ' || l_total_proforma);
  dbms_output.put_line('ordenes ' || l_total_ordenes);
  dbms_output.put_line('detalle ' || l_total_detalle);
end;