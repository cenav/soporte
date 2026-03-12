begin
  for r in (
-- revisa stock
      with almacenes_vulcano as (
        select al.cod_alm, a.descripcion, al.cod_local
          from almacen_local al
               join almacenes a on al.cod_alm = a.cod_alm
         where al.cod_local = 'VUL'
        )
         , stock_kardex as (
        select d.cod_alm, d.cod_art
             , nvl((sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad))), 0) as stock_kdx
          from kardex_d d
               join almacen_local al on d.cod_alm = al.cod_alm
         where d.estado <> '9'
         group by d.cod_alm, d.cod_art
        )
    select a.cod_art, a.cod_alm, nvl(a.stock, 0) as stock_alm, nvl(s.stock_kdx, 0) as stock_kdx
      from almacen a
           join almacenes_vulcano v
                on a.cod_alm = v.cod_alm
           left join stock_kardex s
                     on a.cod_alm = s.cod_alm
                       and a.cod_art = s.cod_art
     where a.stock <> s.stock_kdx
--        and s.stock_kdx >= 0
    )
  loop
    update almacen
       set stock = r.stock_kdx
     where cod_alm = r.cod_alm
       and cod_art = r.cod_art;
  end loop;
end;