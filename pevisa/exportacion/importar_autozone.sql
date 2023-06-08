-- detalle pedidos
select p.numero, to_char(p.fecha, 'dd/mm/yyyy') as fecha, d.cod_eqi, d.cod_art, d.canti
     , d.preuni, d.canti * preuni as importe
  from expedidos p
       join expedido_d d on p.numero = d.numero
 where p.cod_cliente in (996057, 990937)
   and p.fecha >= to_date('01/01/2022', 'dd/mm/yyyy')
 order by p.fecha, p.numero;

delete from tmp_articul_costos_pais;

select * from tmp_articul_costos_pais where usuario = user;

insert into tmp_articul_costos_pais ( usuario, cod_art, pais, cantidad, vta01, vta02, vta03, ventas
                                    , costo)
select user, cod_art, pais, 1, vta01, vta02, vta03
     , f_estadistica_lista_borrar(pais, cod_art), get_costos(cod_art, '32')
  from exfactores_vta
 where exists(
   select d.cod_art, sum(d.canti) as cantidad
     from expedidos p
          join expedido_d d on p.numero = d.numero
    where p.cod_cliente in (996057, 990937)
      and d.cod_art = exfactores_vta.cod_art
      and p.fecha >= to_date('01/01/2022', 'dd/mm/yyyy')
    group by d.cod_art
   );

begin
  delete tmp_ventas
   where usuario = user;

  begin
    insert into tmp_ventas
    select user, a.cod_art, 1, 0
      from tmp_articul_costos_pais a
     where usuario = user
     group by user, a.cod_art;
  exception
    when others then null;
  end;
  commit;
  pr_explosion_para_costear_1niv();
end;

-- importar autozone
  with pedidos as (
    select d.cod_art, sum(d.canti) as cantidad
      from expedidos p
           join expedido_d d on p.numero = d.numero
     where p.cod_cliente in (996057, 990937)
       and p.fecha >= to_date('01/01/2022', 'dd/mm/yyyy')
     group by d.cod_art
    )
     , lista_unica as (
    select p.cod_art, p.cantidad, f.vta03
         , row_number() over (partition by p.cod_art order by f.pais) as lista
      from pedidos p
           left join exfactores_vta f on p.cod_art = f.cod_art
    )
     , formulas as (
    select p.cod_art, p.cantidad, f.vta03 as aaa
         , get_costos(p.cod_art, '35') as costo_total
         , f_costo_explosion(p.cod_art, 'IMPORTADO') as costo_importado
         , f_costo_explosion(p.cod_art, 'NACIONAL') as costo_nacional
      from pedidos p
           left join lista_unica f on p.cod_art = f.cod_art and f.lista = 1
    )
select f.cod_art, f.cantidad, f.aaa, f.costo_total, f.costo_importado
     , f.costo_nacional + (f.costo_total - (f.costo_importado + f.costo_nacional)) as costo_nacional
     , round(f.costo_importado / f.costo_total * 100) as porc_costo_importado
  from formulas f
--  where f.cod_art = 'KIT AUT SS 450.741-12'
 order by porc_costo_importado desc, cantidad desc;


select *
  from pcart_precios
 where cod_art = 'KIT AUT SS 450.678-24'
 order by costo;

select *
  from pcart_precios
 where cod_art = 'KIT AUT SS 450.678-24'
   and cod_costo in ('56', '35')
 order by costo;

select *
  from pctab_costos
 where cod_costo = '56';

select vta03 as aaa
  from exfactores_vta
 where cod_art = 'KIT AUT SS 450.678-24';

select *
  from exfactores_vta
 where cod_art = 'KIT AUT SS 450.741-12';

select *
  from expedido_d
 where cod_art = 'KIT AUT SS 450.741-12';

select *
  from expedidos
 where numero = 15600;