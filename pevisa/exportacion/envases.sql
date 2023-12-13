-- envase segun master
select distinct t.cod_art
              , listagg(cod_for, ' | ') within group (order by cod_for)
                        over (partition by t.cod_art) as envase
  from articul t
       join vcos_formulas vfs on t.cod_art = vfs.cod_art
 where vfs.linea between '800' and '899'
   and length(vfs.linea) = 3
   and vfs.linea not in ('840', '855', '871', '875', '880', '896')
   and exists (
   select 1
     from exfacturas f
          join exfactura_d d on f.numero = d.numero
    where extract(year from f.fecha) between 2010 and 2023
      and nvl(estado, '0') != '9'
      and d.cod_art = t.cod_art
      and d.id is null
      and not exists(
      select 1
        from exfacturas_his
       where numero = f.numero
         and accion = '92'
      )
   )
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
  from planilla10.tar_encarga
 where nombre like '%FIGUEROA%';

select * from locales;