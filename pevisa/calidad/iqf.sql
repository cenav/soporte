select *
  from articul
 where cod_art in (
                   'SOL 806', 'SOL 805', 'SOL 831', 'SOL 815', 'SOL 814', 'SOL 1001', 'VUL 161'
   );

select *
  from tab_lineas
 where linea in (
                 '2141', '2141', '2141', '2148', '2141', '2150', '2127'
   );


select *
  from kardex_g_movglos
 where cod_alm = '02'
   and tp_transac = '11'
   and serie = 1
   and numero = 31368;

select *
  from orden_de_compra
 where serie = 1
   and num_ped = 85554;

select *
  from itemord
 where serie = 1
   and num_ped = 85554;

select *
  from articul
 where cod_art = 'DISOLVENTE TINTA TRAZABILIDAD';

select *
  from articul
 where cod_art in (
                   'DISOLVENTE TINTA TRAZABILIDAD', 'SOL 805', 'SOL 831', 'SOL 815', 'SOL 814',
                   'SOL 806', 'SOL 1001', 'VUL 161'
   );

select *
  from tab_lineas
 where linea in (
                 '2152', '2148', '2141', '2150', '2127'
   );

select * from articul_iqf;

select *
  from articul_iqf
 where cod_art in (
                   'DISOLVENTE TINTA TRAZABILIDAD', 'SOL 805', 'SOL 831', 'SOL 815', 'SOL 814',
                   'SOL 806', 'SOL 1001', 'VUL 161'
   );

select *
  from oc_registro_facturas
 where serie_oc = 1
   and numero_oc = 85554;

select *
  from oc_registro_facturas
 where cod_alm = '02'
   and tp_transac = '11'
   and serie = 1
   and numero = 31368;

select *
  from kardex_g_movglos
 where cod_alm = '02'
   and tp_transac = '11'
   and serie = 1
   and numero = 31368;

select *
  from itemord i
 where i.serie = 1
   and i.num_ped = 85554
   and exists(
   select 1
     from articul_iqf a
    where a.cod_art = i.cod_art
   );

begin
  if iqbf.existe('VUL 161') then
    dbms_output.put_line('si');
  else
    dbms_output.put_line('no');
  end if;
end;