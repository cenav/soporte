-- formula
select a.cod_art, a.cod_lin, f.art_cod_art, f.cod_lin, f.cantidad, f.tipo, f.almacen
     , a.pr_observacion
  from articul a
       join pr_for_ins f on a.cod_art = f.formu_art_cod_art
 where length(a.cod_lin) = 4 and a.cod_lin between '1000' and '1872'
 order by a.cod_art;

-- procesos
select a.cod_art, a.cod_lin, f.secuencia, f.codigo_proceso, p.descripcion as proceso, f.pzas
     , f.tiempo, f.codigo_maquina, f.codigo_matriz, a.pr_observacion
  from articul a
       join pr_forsec f on a.cod_art = f.cod_art
       left join pr_proceso p on f.codigo_proceso = p.codigo
 where length(a.cod_lin) = 4 and a.cod_lin between '1000' and '1872'
 order by a.cod_art, f.secuencia;
