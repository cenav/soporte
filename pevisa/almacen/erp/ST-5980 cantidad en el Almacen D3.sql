select *
  from kardex_d
 where cod_alm = 'D3'
   and cod_art = '1535-IMLS'
 order by fch_transac desc;

select sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
 where d.cod_art = '1535-IMLS'
   and d.cod_alm = 'D3'
 order by d.fch_transac desc;

select *
  from almacen
 where cod_art = '1535-IMLS'
   and cod_alm = 'D3';

select sum(stock)
  from almacen
 where cod_art = '1535-IMLS';

select cod_alm, d.cod_art, d.tp_transac, d.serie, d.numero, t.descripcion, d.ing_sal
     , d.fch_transac, d.cod_art, d.cantidad, d.pr_referencia
  from kardex_d d
       join transacciones_almacen t on d.tp_transac = t.tp_transac
 where d.cod_art = '1535-IMLS'
   and d.cod_alm = 'D3'
 order by d.fch_transac desc;
