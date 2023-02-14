insert into usuarios_tipos(usuario, tipo, mes_predeterminado)
select 'ECHINCHA', tipo, mes_predeterminado
  from usuarios_tipos
 where usuario = 'MDIAZ';

select *
  from usuarios_tipos
 where usuario = 'ECHINCHA';