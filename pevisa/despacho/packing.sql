/*

 ██████╗ █████╗ ███╗   ███╗██████╗ ██╗ █████╗ ██████╗
██╔════╝██╔══██╗████╗ ████║██╔══██╗██║██╔══██╗██╔══██╗
██║     ███████║██╔████╔██║██████╔╝██║███████║██████╔╝
██║     ██╔══██║██║╚██╔╝██║██╔══██╗██║██╔══██║██╔══██╗
╚██████╗██║  ██║██║ ╚═╝ ██║██████╔╝██║██║  ██║██║  ██║
 ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═════╝ ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝

 ██████╗  █████╗  ██████╗██╗  ██╗██╗███╗   ██╗ ██████╗
 ██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██║████╗  ██║██╔════╝
 ██████╔╝███████║██║     █████╔╝ ██║██╔██╗ ██║██║  ███╗
 ██╔═══╝ ██╔══██║██║     ██╔═██╗ ██║██║╚██╗██║██║   ██║
 ██║     ██║  ██║╚██████╗██║  ██╗██║██║ ╚████║╚██████╔╝
 ╚═╝     ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝

██████╗ ██╗      █████╗ ███╗   ██╗██╗███████╗██╗ ██████╗ █████╗ ██████╗  ██████╗
██╔══██╗██║     ██╔══██╗████╗  ██║██║██╔════╝██║██╔════╝██╔══██╗██╔══██╗██╔═══██╗
██████╔╝██║     ███████║██╔██╗ ██║██║█████╗  ██║██║     ███████║██║  ██║██║   ██║
██╔═══╝ ██║     ██╔══██║██║╚██╗██║██║██╔══╝  ██║██║     ██╔══██║██║  ██║██║   ██║
██║     ███████╗██║  ██║██║ ╚████║██║██║     ██║╚██████╗██║  ██║██████╔╝╚██████╔╝
╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝     ╚═╝ ╚═════╝╚═╝  ╚═╝╚═════╝  ╚═════╝

 */

--::::::::::::::::::::::::::::::::::::--
--             estado = 0             --
--::::::::::::::::::::::::::::::::::::--

-- packing por pedido
select *
  from pk_gnumero
 where pk_numero in (
   59965
   );

--::::::::::::::::::::::::::::::::::::--
--             estado = G             --
--::::::::::::::::::::::::::::::::::::--

-- para generar pre-factura estado G
select *
  from pk_gnumero
 where pk_numero in (
   59965
   );

--::::::::::::::::::::::::::::::::::::--
--          consulta packing          --
--::::::::::::::::::::::::::::::::::::--

-- packing por pedido
select *
  from pk_glosa
 where pk_numero = 59965
   and packlis = 164888;

-- cartones (cajas)
select *
  from pk_pesos
 where pk_numero = 59965
   and packlis = 164888;

-- productos en caja
select *
  from pk_detal
 where pk_numero = 59965
   and packlis = 164888
   and caja = 'AQ5';


select *
  from pk_glosa
 where pk_numero = 59965
   and packlis = 164888;


select count(*)
  from pk_pesos
 where packlis = 161400
   and caja = 'AA8'
   and pk_numero = 59682;


select sum(canti)
  from pk_pesos
 where pk_numero = 59965;

select sum(canti)
  from pk_detal
 where pk_numero = 59965;

select packlis, caja, pk_numero, count(*)
  from pk_pesos
 where packlis = 161400
   and pk_numero = 59682
 group by packlis, caja, pk_numero;

select *
  from pk_pesos
 where packlis = '161400'
   and pk_numero = 59682
 order by packlis, caja, pk_numero;

select *
  from produccion_armado_cajas_his
 where cod_caja = 278107;

select te.descripcion
  from extablas_expo te
     , expedidos p
 where te.tipo = 13
   and te.codigo = p.zona
   and p.numero = 15528;

-- cambio vendedor
select *
  from expedidos
 where numero in (
                  15528, 15532, 15316, 15078, 15546, 15567, 15315
   );

select *
  from kardex_g
 where cod_alm = '01'
   and tp_transac = '25'
   and serie = 118
   and numero in (209, 210);

select *
  from clientes
 where cod_cliente = '992073';

select *
  from clientes
 where cod_cliente like '%CNPJ 60.860.681/0014-04%';


-- revisar guia expo no llega correo
-- 21859
-- 21794

select *
  from kardex_g
 where numero in (
                  21859, 21794
   );

select *
  from kardex_g_guia_remision
 where numero in (
                  21859, 21794
   );

select numero
  from kardex_g
 where tipo_pguia = 'PK'
--    and serie_pguia =
   and numero_pguia = 59006;

select *
  from kardex_g
 where tp_transac = '26'
   and numero = 23160;

select *
  from kardex_dpk
 where cod_alm = '01'
   and tp_transac = '26'
   and serie = 19
   and numero = 23160;

select *
  from kardex_g
 where cod_alm = '01'
   and tp_transac = '26'
   and serie = 19
   and numero = 23160;

select *
  from kardex_g
 where cod_alm = '01'
   and tp_transac = '26'
   and serie = 19
   and numero = 23160;

select *
  from kardex_g_historia
 where cod_alm = '01'
   and tp_transac = '26'
   and serie = 19
   and numero = 23160;

-- COMERC AUTOREP UNIVERSAL LUBAMAQUI CIA.LTDA

select *
  from kardex_dpk
 where cod_alm = '01'
   and tp_transac = '26'
   and serie = 19
   and numero = 23176;

select *
  from kardex_pking
 where cod_alm = '01'
   and tp_transac = '26'
   and serie = 19
   and numero in (23176, 23287, 22830, 23559, 22909, 23460, 23431, 22936, 23349);



select *
  from kardex_dpk
 where cod_alm = '01'
   and tp_transac = '26'
   and serie = 19
   and numero in (23530);

select *
  from kardex_g
 where cod_alm = '01'
   and tp_transac = '26'
   and serie = 19
   and numero in (23711);

insert into kardex_pking
select cod_alm, tp_transac, serie, 23717, fch_transac, marcas, container, precintoad, precintopv
     , peso_bruto, marca1, marca2, marca3, marca4, precintolinea
  from kardex_pking
 where cod_alm = '01'
   and tp_transac = '26'
   and serie = 19
   and numero in (23708);

-- and numero in (23708, 23708, 23710, 23711, 23712, 23713, 23714, 23715, 23716, 23717);

select *
  from kardex_pking
 where cod_alm = '01'
   and tp_transac = '26'
   and serie = 19
   and numero in (23708, 23709, 23710, 23711, 23712, 23713, 23714, 23715, 23716, 23717)
 order by numero;

select k.pk_numero, k.fecha, k.cod_cliente, c.nombre, 0 as guias
  from pk_gnumero k
     , exclientes c
 where c.cod_cliente = k.cod_cliente
   and nvl(k.estado, '0') = 'G'
 order by 5 desc, 1;

select *
  from pk_glosa
 where pk_serie = 1
   and pk_numero = 59682
 order by packlis;

select *
  from pk_glosa
 where pk_numero = 59682
   and packlis = 161401;

select *
  from pk_pesos
 where packlis = 161400
   and pk_numero = 59682
   and caja in (
                'C8', 'X8', 'Y8'
   )
 order by pk_numero, packlis, caja;

select *
  from pk_detal
 where pk_serie = 1
   and pk_numero = 59682
   and numero_paleta = 8
   and numero = 16135
   and packlis = 161400;

select nvl(sum(pneto), 0)
  from pk_pesos
 where packlis = 161400
   and pk_numero = 59682;

select *
  from pk_pesos
 where pk_detal.pk_numero = pk_pesos.pk_numero and pk_detal.pk_tipo = pk_pesos.pk_tipo
   and pk_detal.pk_serie = pk_pesos.pk_serie and pk_detal.packlis = pk_pesos.packlis
   and pk_detal.caja = pk_pesos.caja and pk_detal.embala = pk_pesos.embala;

select pk_tipo, pk_serie, pk_numero, packlis, numero, cod_cliente, pais, fecha, embala, tcanti
     , tbruto, tneto, tseguro, tcajas, conten, marca1, marca2, marca3, marca4, estado, paleta, tipo
     , altura, volumen, usuario, origen, flag_guia, flag_factura, flag_caja, numero_paleta
     , peso_paleta, scod_alm, sguia_tp, sguia_serie, sguia_numero, numero_fac, sguia_fecha
     , transporte_medio
  from pk_glosa
 where pk_numero = :P_NUMERO
   and pk_serie = :P_SERIE
 order by numero_paleta;

select f.numero, f.cod_cliente, f.nombre, f.direcc, f.direc2, c.ciudad, p.nombre as nombre_pais
     , p.pais, f.referencia, f.cond_pago, decode(nvl(c.idioma_factura, 'E'), 'E', g.nombre,
                                                 g.nombre2) as forma_pago
     , f.transporte, f.fecha
     , f.paclis, k.marca1, k.marca2, k.marca3, k.marca4, k.tcanti, k.tcajas, k.embala, k.tneto
     , k.tbruto, f.tbruto as total_bruto, f.tcambio, f.tgasto, f.tdescto, f.fob, f.tflete, f.fflete
     , f.tseguro, f.cif, f.tacta, f.total, c.estado, pk.total_cantidad as pk_total_cantidad
     , pr_peso_real_pk(f.paclis) as pk_real
     , pr_peso_neto_pk(f.paclis) as pk_peso_neto
     , pk.total_paletas as pk_total_paletas
     , nvl(pk.marca1, ' ') as pk_marca1
     , nvl(pk.marca2, ' ') as pk_marca2
     , nvl(pk.marca3, ' ') as pk_marca3
     , nvl(pk.marca4, ' ') as pk_marca4
     , decode(nvl(c.idioma_factura, 'E'), 'I', 'PALLET', 'PALETA') as pk_embale
     , pk.total_paletas || ' ' ||
       decode(nvl(c.idioma_factura, 'E'), 'I', 'PALLET', 'PALETA') as pk_embalaje
     , f.incoterms, f.destino, f.fob_titulo_despacho, nvl(c.idioma_factura, 'E') as idioma_impresion
  from ex_prefacturas f
     , exclientes c
     , expaises p
     , excondpago g
     , expacking k
     , pk_gnumero pk
 where f.numero = :P_NUMERO
   and c.cod_cliente = f.cod_cliente
   and p.pais(+) = f.pais
   and g.cond_pago(+) = f.cond_pago
   and k.packlis(+) = rtrim(f.paclis)
   and f.paclis = pk.pk_numero;
