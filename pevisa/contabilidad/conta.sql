-- contabilidad maestro
select *
  from movglos
 where ano = 2024
   and mes = 4
   and libro = '05'
   and voucher = 40003;

select *
  from movdeta
 where ano = 2024
   and mes = 2
   and libro = '33'
   and voucher = 20028;

select *
  from movdeta
 where ano = 2024
   and mes = 2
   and libro = '33'
   and voucher = 20028
   and cuenta in ('333101');

select *
  from factpag
 where numero = '0470850'
   and cod_proveedor = '20467534026';

select *
  from movglos_anexos
 where ano = 2024
   and mes = 3
   and libro = '08'
   and voucher = 30450;

select *
  from movglos_historia
 where ano = 2023
   and mes = 1
   and libro = '08'
   and voucher in (
   11865
   )
 order by creacion_cuando;

update movdeta m
   set m.cargo_s = round(m.cargo_d * 3.838, 2)
     , m.abono_s = round(m.abono_d * 3.838, 2)
     , m.cambio  = 3.838
 where m.ano = 2022
   and m.mes = 8
   and m.libro = '14'
   and m.voucher in (
                     80187, 80188, 80203, 80204, 80205, 80238, 80239, 80241, 80242, 80243, 80244
   )
   and m.cuenta in (
   '759502'
   );


select *
  from relacion
 where tipodoc = 'PR'
   and numero = 465638;

select *
  from factpag
 where cod_proveedor = '20100047218'
   and serie_num = '041'
   and numero in (
   '45858AFB'
   );

select *
  from movfide_situacion_banco
 where voucher = '81041'
   and p_ano = 2022
   and p_mes = 8;

select *
  from activo_fijo
 where cod_activo_fijo = '05RELO1';

select *
  from kardex_d
 where cod_art = '05RELO1';

select *
  from nrolibr
 where ano = 2022
   and mes = 6
   and libro = '05';

select *
  from serie_caja
 order by id_serie;
select *
  from nrolibr
 where ano = 2023
   and mes = 3
   and libro = '14';

select * from cierre_contabilidad;

select *
  from cambdol
 where fecha = to_date('24/03/2024', 'dd/mm/yyyy');

select *
  from caja_chica
 where numero = 240031;

select *
  from caja_chica_d
 where numero = 240031;

select *
  from kardex_g_movglos
 where numero_oc = '44585'
   and serie_oc = '003';

select *
  from orden_de_compra
 where num_ped = 44585
   and serie = 3;