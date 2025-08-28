begin
  grupoprod.resumen_fechas(
      p_usuario => user
    , p_transac => '18'
    , p_fch_del => to_date('07/07/2025', 'dd/mm/yyyy')
    , p_fch_al => to_date('11/07/2025', 'dd/mm/yyyy')
    , p_megagrupo => 'M001'
    , p_grupo => null
    , p_subgrupo => null
  );
end;


begin
  grupoprod.detalle_fechas(
      p_usuario => user
    , p_transac => '18'
    , p_fch_del => to_date('07/07/2025', 'dd/mm/yyyy')
    , p_fch_al => to_date('11/07/2025', 'dd/mm/yyyy')
    , p_megagrupo => 'M001'
    , p_grupo => null
    , p_subgrupo => null
  );
end;

select *
  from pr_resumen_fechas
 where usuario = user;

select *
  from pr_detalle_fechas
 where usuario = user;

select * from kardex_d_otros;

select g.cod_alm, g.tp_transac, g.serie, g.numero, g.num_importa, d.cod_art, d.cantidad, d.pr_numot
  from pevisa.kardex_g g
     , pevisa.kardex_d d
 where g.cod_alm = d.cod_alm
   and g.tp_transac = d.tp_transac
   and g.serie = d.serie
   and g.numero = d.numero;

select d.cod_alm, d.tp_transac, d.serie, d.numero, k.num_importa, d.cod_art, d.cantidad, d.pr_numot
  from pr_detalle_fechas d
     , kardex_g k
 where d.cod_alm = k.cod_alm
   and d.tp_transac = k.tp_transac
   and d.serie = k.serie
   and d.numero = k.numero
   and d.usuario = user;


select d.cod_alm, d.tp_transac, d.serie, d.numero, k.num_importa, d.cod_art, d.cantidad, d.pr_numot
  from pr_detalle_fechas d
     , kardex_g k
 where d.cod_alm = k.cod_alm
   and d.tp_transac = k.tp_transac
   and d.serie = k.serie
   and d.numero = k.numero
   and d.usuario = user
   and trunc(d.fch_transac) = to_date('07/07/2025', 'dd/mm/yyyy');


select *
  from pr_detalle_fechas
 where usuario = user
   and fch_transac = to_date('07/07/2025', 'dd/mm/yyyy');

select *
  from kardex_d
 where cod_alm = 'D3'
   and tp_transac = '18'
   and serie = 2
   and numero = 620476;

select *
  from kardex_d_otros
 where cod_alm = 'D3'
   and tp_transac = '18'
   and serie = 2
   and numero = 620476;

-- 1010	"EMPAQUE DE CULATA S/ANILLOS ""GR"""	01	CULATAS
select *
  from articul
 where cod_art = '87830GR';

select *
  from prod_subgrupo_linea_rel
 where id_linea = '1010';