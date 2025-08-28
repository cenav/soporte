begin
  robot_corrida_produccion();
end;

begin
  p_corrida_armado();
end;

begin
  p_corrida_produccion();
end;

begin
  p_corrida_posterior_03();
end;

-- genera OA de un pedido
begin
  p_corrida_armado(); --> genera ordenes planeadas
  p_convierte_planeadas_armado(); --> si ya tiene ordenes planeadas genera oa
end;

select *
  from articul
 where cod_art = '90010SB'
   and s_act = pr_stk_separado;

select *
  from articul
 where s_act = pr_stk_separado
   and cod_art like 'ARO 66110';

select *
  from articul
 where s_act = pr_stk_separado;

select *
  from articul
 where s_act = pr_stk_separado;

-- update articul
--    set pr_stk_separado = 0
--  where s_act = pr_stk_separado;

select * from pr_embarques;

select * from pr_consul;

select *
  from pr_programa_embarques_id
 where ano = 2025
 order by mes;

select *
  from pr_consul
 where nvl(secuencia, 0) > 0
   and estado not in ('8', '9')
--                 AND   TIPO <> '3' ---                   PEDIDOS DE STOCK ---
   and tipo = 2
   and pedido = 16847
 order by secuencia;

select *
  from pr_consul
 where pedido = 16847;


select empaque, texto8, texto7
  from expedidos -- NPK, NKS, NOVA, ETC
 where numero = 16847;

-- 2017
select d.*, a.cod_lin, a.grupo
  from expedido_d d
     , articul a
 where d.numero = 16762
   and nvl(d.id, 0) = '0'
   and a.cod_art = d.cod_art
--    and d.canti - nvl(d.saldo_ot, 0) > 0
   and d.estado_pk not in ('8')
;

select d.*, a.cod_lin
  from expedido_d d
     , articul a
 where d.numero = 16762
   and nvl(d.id, 0) = '0'
   and a.cod_art = d.cod_art;

select d.*, a.cod_lin
  from expedido_d d
     , articul a
 where d.numero = 16762
   and nvl(d.id, 0) = '0'
   and a.cod_art = d.cod_art;

select *
  from expedido_d
 where numero = 16847
   and nro = 28;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and numero = 1110096;


select numero, fecha, estado, cant_prog, nuot_serie, nuot_tipoot_codigo as tipo
     , formu_art_cod_art, serie_ot_fab, numero_ot_fab, abre01, abre02, cod_eqi, pais, empaque
     , usuario, origen, prioridad, fecha_prioridad, destino
  from pr_ot
 where nuot_tipoot_codigo in ('AR', 'PA', 'SA') -- SOLO ARMADOS
--    and estado < 6
   and abre01 = '16847'
   and per_env = 28
 order by prioridad, numero;

select *
  from pr_consul
 where nvl(secuencia, 0) > 0
   and estado not in ('8', '9')
--                 AND   TIPO <> '3' ---                   PEDIDOS DE STOCK ---
   and pedido = 16847
 order by secuencia;

select * from pr_consd;
