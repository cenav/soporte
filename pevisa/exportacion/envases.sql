-- envase segun master 1 nivel
select distinct t.cod_art
              , listagg(cod_for, ' | ') within group (order by cod_for)
                        over (partition by t.cod_art) as envase
  from articul t
       join vcos_formulas vfs on t.cod_art = vfs.cod_art
 where vfs.linea between '800' and '899'
   and length(vfs.linea) = 3
--    and vfs.linea not in ('840', '855', '871', '875', '880', '896')
--    and exists (
--    select 1
--      from exfacturas f
--           join exfactura_d d on f.numero = d.numero
--     where extract(year from f.fecha) between 2010 and 2024
--       and nvl(estado, '0') != '9'
--       and d.cod_art = t.cod_art
--       and d.id is null
--       and not exists(
--       select 1
--         from exfacturas_his
--        where numero = f.numero
--          and accion = '92'
--       )
--    )
   and t.cod_art = 'AUTUS M 200.3029'
 group by vfs.cod_art, cod_for, t.cod_art
 order by cod_art;

select *
  from exfacturas f
       join exfactura_d d on f.numero = d.numero
 where extract(year from f.fecha) between 2020 and 2023
   and nvl(estado, '0') != '9'
   and not exists(
   select 1
     from exfacturas_his
    where numero = f.numero
      and accion = '92'
   );

select cod_art from tmp_carga_data;

select *
  from pcformulas
 where cod_art = '200.3029';

-- limpia tabla tmp_ventas para explosion
select *
  from tmp_ventas
 where usuario = 'PEVISA';

-- carga data desde archivo
select cod_art, sum(cantidad) as cantidad
  from tmp_carga_data
 group by cod_art
 order by cantidad desc;

-- corrige los espacios en blanco
update tmp_carga_data
   set cod_art = trim(cod_art);

-- carga en tabla para la explosion
insert into tmp_ventas(usuario, cod_art, cantidad, importe)
select user, cod_art, sum(cantidad) as cantidad, 0
  from tmp_carga_data
 group by cod_art
 order by cantidad desc;

select *
  from tmp_ventas
 where usuario = 'PEVISA'
 order by cantidad desc;

begin
  sp_explosion();
end;

select *
  from tmp_explosion_articulo;

-- envase segun master n niveles
select distinct t.cod_art
              , listagg(art_cod_art, ' | ') within group (order by art_cod_art)
                        over (partition by t.cod_art) as envase
  from articul t
       join tmp_explosion_articulo e on t.cod_art = e.formula
 where e.cod_lin between '800' and '899'
   and length(e.cod_lin) = 3
   and e.cod_lin not in ('840', '855', '871', '875', '880', '896')
   and t.cod_art = 'AUTUS M 200.3029'
 group by e.formula, e.art_cod_art, t.cod_art
 order by cod_art;

select *
  from tmp_explosion_articulo
 where formula = 'AUTUS CH 1037 MLS';

-- insert into tmp_carga_data(cod_art, cantidad)
select cod_art, 1
  from exfacturas f
       join exfactura_d d on f.numero = d.numero
 where extract(year from f.fecha) between 2010 and 2024
   and nvl(estado, '0') != '9'
   and d.id is null
   and not exists(
   select 1
     from exfacturas_his
    where numero = f.numero
      and accion = '92'
   )
   and d.cod_art = 'AUTUS M 200.3029'
 group by cod_art, 1;

-- insert into tmp_carga_data(cod_art, cantidad)
select cod_art, 1
  from exequivalentes
 where tipo = '58'
 group by cod_art;

select *
  from tmp_ventas
 where cod_art = 'AUTUS M 200.3029';

select *
  from articul
 where cod_art = 'AUTUS M 200.3029';


select *
  from exequivalentes
 where cod_art = 'AUTUS M 200.3029'
   and tipo = '58';

select cod_art, 1
  from exequivalentes
 where tipo = '58'
 group by cod_art;
