-- envase segun master
select distinct t.cod_art
              , listagg(cod_for, ' | ') within group (order by cod_for)
                        over (partition by t.cod_art) as envase
  from tmp_carga_data t
       join vcos_formulas vfs on t.cod_art = vfs.cod_art
 where vfs.linea between '800' and '899'
   and length(vfs.linea) = 3
   and vfs.linea not in ('840', '855', '871', '875', '880', '896')
--    and t.cod_art in (
--                      'AUT CH 10040 MLS', 'AUT F 200.026 NA', 'KIT AUT FS 1042 MLS'
--    )
 group by vfs.cod_art, cod_for, t.cod_art
 order by cod_art;

select cod_art from tmp_carga_data;

select *
  from planilla10.tar_encarga
 where nombre like '%FIGUEROA%';