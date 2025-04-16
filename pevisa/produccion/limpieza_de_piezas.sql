select * from ot_serv_usuarios;

select *
  from ruta_docvirtual
 where docvirtual = 'CONTABILIDAD';

select *
  from itemord
 where serie = 2
   and num_ped = 23335
   and saldo > 0;


select *
  from ot_serv_d
 where id_serv = 2
   and id_numero = 4;

select precio
  from lg_precios_servi_limp p
     , pr_ot_det pd
 where p.cod_servicio = pd.art_cod_art
   and ot_numero = 585992;

select *
  from lg_precios_servi_limp;

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero = 585992;
