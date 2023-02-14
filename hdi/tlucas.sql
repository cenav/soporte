insert into usuarios_tipos(usuario, tipo, mes_predeterminado)
select 'ECHINCHA', tipo, mes_predeterminado
  from usuarios_tipos
 where usuario = 'MDIAZ';

select *
  from usuarios_tipos
 where usuario = 'ECHINCHA';

select *
  from orden_de_compra
 where serie = 13
   and num_ped = 7126;

select *
  from itemord
 where serie = 13
   and num_ped = 7126;

select * from paramlg;