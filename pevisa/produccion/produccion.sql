select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero in (
     730438
     );

select *
  from pr_ot
 where nuot_tipoot_codigo = 'VA'
   and numero in (
     9933
     );

select *
  from kardex_g
 where cod_alm = '18'
   and tp_transac = '18'
   and serie = 2
   and numero = 516713;

select *
  from kardex_d
 where cod_alm = 'D2'
   and tp_transac = '18'
   and serie = 2
   and numero = 525055;

select *
  from proveed
 where cod_proveed = '';

select *
  from cliente_grupo
 where grupo = 'B003';

select * from grupo_cliente;

select cod_cliente, nombre
  from clientes
 where cod_cliente in (
                       '20273061526', '20455719390', '20600574907', '20600637372', '20600711335',
                       '20600898214', '20601014956', '20601041163', '20608545591', '20602035906'
     )
 minus
select cod_cliente, nombre
  from clientes
 where grupo = 'B018';

select *
  from clientes
 where grupo = 'B018'
   and cod_cliente in (
                       '20273061526', '20455719390', '20600574907', '20600637372', '20600711335',
                       '20600898214', '20601014956', '20601041163', '20608545591', '20602035906'
     );

select cod_cliente, nombre
  from clientes
 where grupo = 'B018'
   and cod_cliente in (
                       '20273061526', '20455719390', '20600574907', '20600637372', '20600711335',
                       '20600898214', '20601014956', '20601041163', '20608545591', '20602035906'
     );

select *
  from planilla10.personal
 where c_codigo = 'E42889';

select *
  from planilla10.t_cargo
 where c_cargo = 'TMMT';

select *
  from planilla10.t_sector
 where c_sector = '40';

select * from locales;

select *
  from pr_ot_impresion
 where nuot_tipoot_codigo = 'AR'
   and numero in (704793);

select *
  from pr_ot_impresion
 where nuot_tipoot_codigo = 'PR'
   and numero between 505341 and 505419;

  with op_curso as (
      select cod_art
           , sum(saldo) as saldo_op
           , listagg(numero || '(' || estado || ',' || cant_prog || ')', ' | ')
                     within group ( order by estado, numero) as numero_op
        from vw_ordenes_curso
       where nuot_tipoot_codigo = 'PR'
       group by cod_art
      )
     , requerimiento as (
      select cod_art
           , sum(cant_requerida) as cant_requerida
           , sum(cant_separado) as cant_separado
           , sum(faltante) as cant_faltante
           , sum(stock) as stock_requerida
        from vw_requerimiento_articulo
       group by cod_art
      )
     , stock_art as (
      select cod_art, sum(stock) as stock
        from almacen
       group by cod_art
      )
select a.cod_art, a.descripcion, a.cod_lin, g.id_grupo, g.dsc_grupo
     , r.cant_requerida, r.cant_separado, r.cant_faltante
     , nvl(s.stock, 0) as stock, r.stock_requerida, o.numero_op, o.saldo_op
     , c.consumo_anual, c.consumo_mensual, c.frecuencia_meses
     , a.s_act - r.cant_separado as cant_disponible
  from articul a
       left join op_curso o on a.cod_art = o.cod_art
       left join requerimiento r on a.cod_art = r.cod_art
       left join stock_art s on a.cod_art = s.cod_art
       left join vw_articulo_consumo c on a.cod_art = c.cod_art
       left join vw_articulo_grupo g on a.cod_art = g.cod_art;

select cod_art
     , sum(saldo) as saldo_op
     , listagg(numero || '(' || estado || ',' || cant_prog || ')', ' | ')
               within group ( order by estado, numero) as numero_op
  from vw_ordenes_curso
 where nuot_tipoot_codigo = 'PR'
 group by cod_art;

select *
  from vw_articulo
 where cod_art = '1015TG';

select *
  from pr_consd
 where cod_art = '300.506SR';

declare
    orden pr_ot%rowtype;
begin
    emite.op('65000S', 1, false, orden);
end;

select *
  from error_log
 order by id_log desc;

select f.art_cod_art, f.cantidad, f.almacen, a.descripcion, a.c_pro
     , f.cod_lin, f.pr_secuencia
  from pr_for_ins f
     , articul a
 where formu_art_cod_art = '65000S'
   and formu_receta = 1
   and art_cod_art = cod_art
   and rtrim(a.flag_cal) is null;

select *
  from pr_formu f
 where f.vigencia = 1
   and f.art_cod_art = '65000S';

select *
  from planilla10.t_cargo
 where c_cargo = 'OIQ';

select *
  from planilla10.t_cargo
 where descripcion like '%IQ%';

select *
  from responsabilidad_cargo
 where id_cargo in ('MLS', 'OM', 'OP', 'OSL', 'OIQ');


select *
  from reparacion
 where numero = 4024;

select cod_art, cant_faltante, saldo_op, numero_op, stock, stock_requerida
  from vw_articulo
 where cod_art = '180.654FIB';

select *
  from pr_ot
 where abre01 = '15758'
   and nuot_tipoot_codigo = 'AR';

select pa.numero, pa.nuot_serie, pa.nuot_tipoot_codigo, pa.cant_prog, pa.receta
     , pa.formu_art_cod_art, pa.plazo, pa.fecha_plazo, pa.per_env, pa.abre01, pa.abre02, pa.destino
     , pa.cod_eqi, pa.empaque, pa.embalaje, pa.prioridad, pa.cod_lin, pa.pais
     , get_grupo_ventas_marcas(pa.formu_art_cod_art) marca
  from pr_ot pa, articul a, pr_formu f
 where pa.origen = 'PLANEADA'
   and pa.nuot_tipoot_codigo = 'PA'
   and pa.destino in ('1', '2')
   and pa.formu_art_cod_art = a.cod_art
   and f.art_cod_art = pa.formu_art_cod_art
   and f.receta = 1
   and pa.abre01 = '15758'
   and pa.nuot_tipoot_codigo = 'PA'
   and not exists
     (
         select distinct 1
           from pr_for_ins i, articul a
          where i.formu_art_cod_art = pa.formu_art_cod_art
            and i.art_cod_art = a.cod_art
            and a.cod_lin in
                (
                    select cod_lin
                      from pr_grupos_lineas_desarrollo
                     union
                    select '1980'
                      from dual
                     union
                    select 'ZZ'
                      from dual
                    )
         );

select *
  from pr_num_ot
 where tipoot_codigo = 'AR'
   and serie = 3;

select *
  from pr_ot
 where numero = 915811
   and nuot_tipoot_codigo = 'AR';

select max(numero)
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and nuot_serie = 3;