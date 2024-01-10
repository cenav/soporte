--------------------------------------
-- cambia autozone estado a anulado --
--------------------------------------
select *
  from expedidos
 where numero in (
                  15439, 15440
   );

select *
  from expedido_d
 where numero = 16102;

update expedido_d
   set estado_pk = '9'
 where numero = 16102;

select *
  from pr_ot
 where abre01 = '16102'
   and destino = '1';
