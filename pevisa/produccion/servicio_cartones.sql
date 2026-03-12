select *
  from orden_de_compra
 where cod_proveed = '20301734574'
   and num_ped = 23576;

  with servicios_cartones as (
    select os.numero, os.nuot_serie, os.nuot_tipoot_codigo, os.oc_numero, os.oc_serie
         , oc.fecha as fecha_oc, oc.cod_proveed, proveedor(oc.cod_proveed) as nombre
         , op.formu_art_cod_art
         , op.cant_prog, op.fecha as fecha_op, i.cod_art, i.cantidad
      from orden_de_compra oc
         , itemord i
         , pr_ot_orden_de_servicio os
         , articul_servicios arts
         , pr_ot op
     where i.num_ped = oc.num_ped
       and i.serie = oc.serie
       and oc.estado < '9'
       and i.num_ped = os.oc_numero
       and i.serie = os.oc_serie
       and i.cod_art = arts.cod_art
       and os.numero = op.numero
       and os.nuot_serie = op.nuot_serie
       and os.nuot_tipoot_codigo = op.nuot_tipoot_codigo
       and op.formu_art_cod_art = arts.cod_art_produccion
       and op.estado = 1
       and os.kardex_numero is null
    )
select *
  from servicios_cartones
 where cod_proveed = '20301734574'
   and numero = 23576;

select *
  from pr_ot_orden_de_servicio
 where oc_serie = 2
   and oc_numero = 23576;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and nuot_serie = 8
   and numero = 654672;


select s.oc_serie, s.oc_numero, s.numero as op_numero, trunc(o.fecha) as fecha
  from pr_ot_orden_de_servicio s
       join pr_ot o
            on s.numero = o.numero
              and s.nuot_serie = o.nuot_serie
              and s.nuot_tipoot_codigo = o.nuot_tipoot_codigo
 where s.kardex_numero is null
   and o.estado = '9'
   and o.fecha > to_date('01/01/2025', 'dd/mm/yyyy');

select *
  from almacenes
  where es_stock = 0
 order by cod_alm;

alter table almacenes
  add es_stock number(1) default 1 not null;

alter table almacenes
  add constraint chk_almacenes_es_stock
    check (es_stock in (0, 1)) enable;