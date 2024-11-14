select *
  from movglos
 where ano = 2024
   and mes = 10
   and libro = '05'
   and voucher = 100001;

select *
  from movdeta
 where ano = 2024
   and mes = 10
   and libro = '05'
   and voucher = 100001;

select *
  from movfide
 where ano = 2024
   and mes = 10
   and tipo = '2'
   and voucher = 103026;

select *
  from factpag
 where cod_proveedor = '20601875200'
   and numero = '0000780';

select *
  from factpag
 where ano = 2024
   and mes = 10
   and libro = '05'
   and voucher = 10001;

select * from nrodoc
where tipodoc = '00';


select *
  from cabfpag
 where cod_proveedor = '20182246078'
   and numero = '0021845';

select *
  from cabfpag
 where ano = 2024
   and mes = 10
   and libro = '05'
   and voucher = 10001;

select * from activo_fijo_depreciacion;

select *
  from cambdol
 where fecha = to_date('21/03/2024', 'dd/mm/yyyy');

select *
  from plancta
 where cuenta = '31110201';

select *
  from movdeta
 where ano = 2022
   and mes = 12
   and cuenta = '31110201';

select sum(cantidad * precio * factor_uc) as total_item
  from itemord
 where serie = 3
   and num_ped = 671;

select *
  from movfide
 where ano = 2024
   and mes = 3
   and tipo = '2'
   and voucher = 33004;

select *
  from movfide
 where ano = 2024
   and mes = 3
   and tipo = '9'
   and voucher = 30004;

select *
  from prestamo_banco_cuota
 where cod_prestamo = '19012023';

select *
  from orden_de_compra
 where serie = 3
   and num_ped = 922;

select *
  from itemord
 where serie = 3
   and num_ped = 922;

select *
  from movdeta d
 where d.ano = 2023
   and d.mes = 2
   and d.libro like '40'
   and d.estado = 0;

select *
  from movglos
 where ano = 2023
   and mes = 2
   and libro = '40'
   and voucher = 20002;

select *
  from movdeta_cua d
 where d.ano = 2023
   and d.mes = 2
   and d.libro like '40';

select *
  from movfide_situacion_banco
 where p_ano = 2024
   and p_mes = 4
   and cta_cte_banco = '191-1402867-0-72';

select *
  from prestamo_banco_cuota
 where cod_prestamo = '3479350';

select *
  from caja_chica
 where serie = 1
   and numero = 189;

select *
  from plancta
 where cuenta = '442902';


select u.serie, s.nombres
  from usuarios_caja_chica u
     , caja_chica_serie s
 where u.usuario = user
   and u.estado = '1'
   and s.id_serie = u.serie
   and s.tipo_caja = 'CAJA CHICA'
   and not exists
   (
     select distinct ch.serie
       from caja_chica ch
      where ch.serie = u.serie and ch.estado = 1
     )
 order by 1;


select *
  from cambdol
 where fecha = to_date('03/11/2023', 'dd/mm/yyyy');

select codigo, descripcion
  from tablas_auxiliares
 where tipo = 77
 order by codigo;

select codigo, descripcion
  from tablas_auxiliares
 where tipo = 3
 order by codigo;

select *
  from view_registro_de_compras_cont
 where ano = 2024
   and voucher = 10022;

select o.num_ped, p.nombre, o.estado, o.cod_proveed, o.fecha, (o.fecha + o.plazo_entrega) as plazo
     , o.centro_costo, p.direccion || ' ' || p.ciudad || ' ' || p.distrito as direccion
     , decode(o.moneda, 'S', 'S/.', 'US$') as moneda, p.telefono as telef, p.fax as telefax
     , c.descripcion as cond, o.impsto, o.detalle, (i.precio * nvl(fact_des, 1)) as pre
     , ((i.precio * nvl(fact_des, 1)) * i.cantidad) as totpre, o.almacen
     , tab_aux(o.almacen, '72') as descripcion_lugar_entrega, l.descripcion as lugar, o.total_pedido
     , o.tot_valvta, tot_impu, o.tot_dscto, o.tot_orden, o.serie, o.cond_pag, i.item, i.cod_art
     , i.cantidad, a.unidad, a.descripcion, i.dscto1, i.precio, (precio * cantidad) as pre_tot
     , i.observacion, p.cod_ubc, d.abreviada, o.por_desc1, o.por_desc2, o.por_des3, o.por_des4
     , i.unidad_prv as umed, o.plazo_entrega, r.cta, p.telefono, p.ruc, o.c_resp
     , o.codigo_unidad_negocio, o.codigo_grupo_compra, o.observacion_gerencia
     , i.centro_costo as centro_costo_item, o.forma_de_pago, o.porcentaje_adelanto
     , o.moneda as codigo_moneda
  from orden_de_compra o
     , itemord i
     , articul a
     , proveed p
     , lg_condpag c
     , tablas_auxiliares t
     , tablas_auxiliares l
     , tablas_auxiliares d
     , pcarticul r
 where i.num_ped = o.num_ped
   and i.serie = o.serie
   and o.num_ped between :P_NUMERO1 and :P_NUMERO2
   and o.serie = :P_SERIE
   and a.cod_art = i.cod_art
   and p.cod_proveed = o.cod_proveed
   and c.cond_pag(+) = o.cond_pag
   and t.tipo(+) = 29
   and t.codigo(+) = o.cod_vende
   and l.tipo(+) = 72
   and l.codigo(+) = o.almacen
   and d.tipo(+) = 36
   and d.codigo(+) = a.mnd_fob--A.UNIDAD
   and r.cod_art(+) = a.cod_art
 order by o.num_ped, i.item;

select *
  from orden_de_compra
 where serie = 3
   and num_ped = 894;

select *
  from lg_condpag
 where cond_pag = '103';

select *
  from itemord
 where serie = 3
   and num_ped = 853;

select *
  from proveed
 where cod_proveed = '20100047218';

select * from movfide_situacion_banco;

select *
  from tab_semanas
 order by del;

select *
  from tablas_auxiliares
 where codigo = 'FN';


