select *
  from pr_ot
 where nuot_tipoot_codigo = 'FC'
   and numero = 366;

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'FC'
   and ot_numero = 360;

select *
  from kardex_g
 where cod_alm = '01'
   and tp_transac = '17'
   and serie = 1
   and numero in (712541);

select *
  from kardex_d
 where cod_alm = 'F0'
   and tp_transac = '17'
   and serie = 1
   and numero in (712541);


select *
  from almacen
 where cod_art in (
   'RP 150-4D1000-N'
   )
   and cod_alm = 'F0';

-- mueve stock tabla almacen
begin
  for r in (
    select cod_art, cod_alm, stock, ubic, inv_fis, fch_inve
      from almacen
     where cod_art in (
       'RP 150-4D1000-N'
       )
       and cod_alm = '01'
    )
  loop
    update almacen
       set stock = stock + r.stock
     where cod_art = r.cod_art
       and cod_alm = 'F0';

    update almacen
       set stock = 0
     where cod_art = r.cod_art
       and cod_alm = '01';
  end loop;
end;

