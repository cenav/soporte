select t.abreviada, t.codigo
  from pr_tip_ot t
 where t.codigo in (
   select c.ot_tipo
     from tipo_cambio_ot c
    where c.id_tipo = :global.tipo
   );

select * from tipo_cambio_ot;