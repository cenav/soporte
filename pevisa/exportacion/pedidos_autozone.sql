-- pedidos autozone
select p.numero, to_char(p.fecha, 'dd/mm/yyyy') as fecha, d.cod_eqi, d.cod_art, d.canti
     , d.preuni, d.canti * preuni as importe
  from expedidos p
       join expedido_d d on p.numero = d.numero
 where p.cod_cliente in (996057, 990937)
   and nvl(p.estado, '0') != '9'
   and p.fecha >= to_date('01/01/2022', 'dd/mm/yyyy')
   and d.id is null
 order by p.fecha, p.numero;

select * from expedidos;