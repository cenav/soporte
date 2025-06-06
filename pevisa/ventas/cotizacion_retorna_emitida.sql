begin
  for r in (
    select c.serie, c.num_ped as num_cot, c.refe_pedido as num_ped, c.fecha, c.estado
      from cotizacion c
     where ((c.num_ped = :p_cotizacion or :p_cotizacion is null) and
            (c.refe_pedido = :p_pedido or :p_pedido is null))
    )
  loop
    update pedido
       set estado = '9'
     where serie = r.serie
       and num_ped = r.num_ped;

    update itemped
       set estado = '9'
         , saldo  = 0
     where serie = r.serie
       and num_ped = r.num_ped;

    update cotizacion
       set estado      = '0'
         , refe_pedido = null
     where serie = r.serie
       and num_ped = r.num_cot;

    update itemcot
       set estado = '0'
     where serie = r.serie
       and num_ped = r.num_cot;
  end loop;
end;



select c.serie, c.num_ped as num_cot, c.refe_pedido as num_ped, c.fecha, c.estado
  from cotizacion c
 where ((:p_doc = 'C' and c.serie = :p_serie and c.num_ped = :p_numero) or
        (:p_doc = 'P' and c.serie = :p_serie and c.refe_pedido = :p_numero));

select *
  from cotizacion
 where num_ped = 242621
 order by fecha desc;

select *
  from pedido
 where num_ped = 263206;

-- cot 242621
-- ped 263206

-- 243601 copia a nueva cotizacion

select distinct s.id_subgrupo, s.dsc_subgrupo, p.nombre
  from prod_subgrupo s
       join prod_grupo_subgrupo_rel r on s.id_subgrupo = r.id_subgrupo
       left join vw_personal p on s.id_encargado = p.c_codigo
 where (r.id_grupo = :id_grupo or :id_grupo is null)
   and (r.id_megagrupo = :id_megagrupo or :id_megagrupo is null);
