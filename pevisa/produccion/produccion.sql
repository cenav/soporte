select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero in (
  494434
   );

select *
  from pr_ot
 where nuot_tipoot_codigo = 'VA'
   and numero in (
   9759
   );

select *
  from kardex_g
 where cod_alm = '18'
   and tp_transac = '18'
   and serie = 2
   and numero = 516713;

select *
  from kardex_d
 where cod_alm = '03'
   and tp_transac = '18'
   and serie = 2
   and numero = 518046;

select *
  from proveed
 where cod_proveed = '';

select *
  from cliente_grupo
 where grupo = 'B003';

select * from grupo_cliente;

select cod_cliente, nombre
  from clientes
 where cod_cliente in (
                       '20273061526', '20455719390', '20600574907', '20600637372', '20600711335',
                       '20600898214', '20601014956', '20601041163', '20608545591', '20602035906'
   )
 minus
select cod_cliente, nombre
  from clientes
 where grupo = 'B018';

select *
  from clientes
 where grupo = 'B018'
   and cod_cliente in (
                       '20273061526', '20455719390', '20600574907', '20600637372', '20600711335',
                       '20600898214', '20601014956', '20601041163', '20608545591', '20602035906'
   );

select cod_cliente, nombre
  from clientes
 where grupo = 'B018'
   and cod_cliente in (
                       '20273061526', '20455719390', '20600574907', '20600637372', '20600711335',
                       '20600898214', '20601014956', '20601041163', '20608545591', '20602035906'
   );

select *
  from planilla10.personal
 where c_codigo = 'E42889';

select *
  from planilla10.t_cargo
 where c_cargo = 'TMMT';

select *
  from planilla10.t_sector
 where c_sector = '40';

select * from locales;

select *
  from pr_ot_impresion
 where nuot_tipoot_codigo = 'AR'
   and numero in (704793);