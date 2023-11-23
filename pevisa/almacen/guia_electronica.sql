-- cod_alm in ('01')
-- and  exists (
--                select  1
--                from kardex_g_guia_remision r
--                where cod_alm    = VIEW_SALIDAS_PRE_GUIAS.cod_alm
--                and   tp_transac = VIEW_SALIDAS_PRE_GUIAS.tp_transac
--                and   serie      = VIEW_SALIDAS_PRE_GUIAS.serie
--                and   numero     = VIEW_SALIDAS_PRE_GUIAS.numero
--                and    GUIA_SERIE LIKE 'T%'
-- )

select *
  from kardex_g
 where cod_alm = '62'
   and tp_transac = '22'
   and serie = 1
   and numero = 256952
 union all
select *
  from kardex_g
 where cod_alm = '62'
   and tp_transac = '22'
   and serie = 1
   and numero = 256851;

select *
  from kardex_g
 where cod_alm = '62'
   and tp_transac = '22'
   and serie = 1
   and numero = 256952;

select *
  from solimat_g
 where serie = 1
   and numero = 183217;

select s.*
  from kardex_g k
       join solimat_g s
            on k.tip_doc_ref = 'P2' and k.ser_doc_ref = s.serie and k.nro_doc_ref = s.numero
 where k.cod_alm = '62'
   and k.tp_transac = '22'
   and k.serie = 1
   and k.numero = 256952;

begin
  api_solimat_g.onerow(1, 1).indicador_retorno;
end;

select * from sucursales;

select *
  from kardex_g
 where cod_alm = '62'
   and tp_transac = '22'
   and serie = 1
   and numero = 256852;

select *
  from kardex_d
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero = 5851;

select *
  from kardex_g_guia_remision
 where cod_alm = '62'
   and tp_transac = '22'
   and serie = 1
   and numero = 256952;

select *
  from numdoc
 where tp_transac = '22';

select *
  from numdoc
 where serie = 183;

select *
  from kardex_d
 where extract(year from fch_transac) = 2023
   and cantidad = 0;

select * from pr_num_ot;

select *
  from numdoc
 where tp_transac = 22;

select *
  from numdoc
 where fserie is not null;

select *
  from numdoc
 where serie = 160;

select *
  from numdoc
 where tp_transac = '22';

select * from view_salidas_pre_guias;

select *
  from kardex_g
 where cod_alm = '62'
   and serie = 160;

select *
  from kardex_d
 where cod_alm = '62'
   and serie = 160;

select *
  from kardex_g_guia_remision
 where cod_alm = '62'
   and serie = 160;


/*

██╗   ██╗██╗   ██╗███████╗██╗    ██╗   ██╗███████╗     █████╗
██║   ██║██║   ██║██╔════╝██║    ██║   ██║██╔════╝    ██╔══██╗
██║   ██║██║   ██║█████╗  ██║    ██║   ██║█████╗      ███████║
╚██╗ ██╔╝██║   ██║██╔══╝  ██║    ╚██╗ ██╔╝██╔══╝      ██╔══██║
 ╚████╔╝ ╚██████╔╝███████╗███████╗╚████╔╝ ███████╗    ██║  ██║
  ╚═══╝   ╚═════╝ ╚══════╝╚══════╝ ╚═══╝  ╚══════╝    ╚═╝  ╚═╝

 ██████╗ ███████╗███╗   ██╗███████╗██████╗  █████╗ ██████╗      ██████╗ ██╗   ██╗██╗ █████╗
██╔════╝ ██╔════╝████╗  ██║██╔════╝██╔══██╗██╔══██╗██╔══██╗    ██╔════╝ ██║   ██║██║██╔══██╗
██║  ███╗█████╗  ██╔██╗ ██║█████╗  ██████╔╝███████║██████╔╝    ██║  ███╗██║   ██║██║███████║
██║   ██║██╔══╝  ██║╚██╗██║██╔══╝  ██╔══██╗██╔══██║██╔══██╗    ██║   ██║██║   ██║██║██╔══██║
╚██████╔╝███████╗██║ ╚████║███████╗██║  ██║██║  ██║██║  ██║    ╚██████╔╝╚██████╔╝██║██║  ██║
 ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝     ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═╝

 */

--::::::::::::::::::::::::::::--
-- query pantalla principal   --
--::::::::::::::::::::::::::::--
select *
  from view_salidas_pre_guias_nac
 where cod_alm in ('F0') and enviada = 0
   and not exists (
   select 1
     from kardex_g_guia_remision r
    where cod_alm = view_salidas_pre_guias_nac.cod_alm
      and tp_transac = view_salidas_pre_guias_nac.tp_transac
      and serie = view_salidas_pre_guias_nac.serie
      and numero = view_salidas_pre_guias_nac.numero
      and guia_serie like 'T%'
   )
   and cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (7498);

--::::::::::::::::::::::::::::--
--        tara_bo = 0         --
--::::::::::::::::::::::::::::--
select *
  from kardex_g
 where cod_alm = '99'
   and tp_transac = 'T183'
   and serie = 999
   and numero in (13);


--:::::::::::::::::::::::::::::::::::::::::--
--    elimina de kardex_g_guia_remision    --
--:::::::::::::::::::::::::::::::::::::::::--
select *
  from kardex_g_guia_remision
 where cod_alm = '99'
   and tp_transac = 'T183'
   and serie = 999
   and numero in (13);

select *
  from kardex_g_guia_remision
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (7481);

select *
  from kardex_d
 where cod_alm = '01'
   and tp_transac = '11'
   and fch_transac > to_date('01/10/2023', 'dd/mm/yyyy');


select * from transporte;


select *
  from kardex_d
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (7371);


select *
  from kardex_g_guia_remision
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (7371);

INSERT INTO PEVISA.KARDEX_G_GUIA_REMISION (GUIA_SERIE, GUIA_NUMERO, FECHA_TRASLADO, UBIGEO_PARTIDA, UBIGEO_LLEGADA, DIRECCION_LLEGADA, RUC, COD_ALM, TP_TRANSAC, SERIE, NUMERO, MOTIVO_TRASLADO, TRANSPORTE_EMPRESA, TRANSPORTE_CHOFER, TRANSPORTE_UNIDAD, BULTOS, PESO, NRO_SUCURSAL_PARTIDA, NRO_SUCURSAL_LLEGADA, MODALIDAD_TRASLADO, DETALLE, CONTENEDOR, PRECINTO, NUMERO_DOCUMENTO_RELACIONADO, CODIGO_DOCUMENTO_RELACIONADO, DESCRI_DOCUMENTO_RELACIONADO, PESO_ITEMS, PK_SERIE, PK_NUMERO, PK_TIPO, RUC_LLEGADA, DESCRIPCION_MOTIVO_TRASLADO, CODIGO_ESTABLECIMIENTO_PARTIDA, CODIGO_ESTABLECIMIENTO_LLEGADA, FECHA_EMISION, PRECINTO_LINEA, CARRETA, MARCA_1, CARTONES, MARCA_2, MARCA_3) VALUES ('T001', 7030, DATE '2023-10-26', '070101', '150115', 'AV. IQUITOS NRO. 353', '20566560900', 'F0', '21', 25, 7371, '01', '20100084768', '01', '12', 3.00, 42.3000, '03', '00', '02', null, null, null, 'F050-00185857', '01', 'FACTURA', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);


select *
  from kardex_d
 where cod_alm = 'FR'
   and tp_transac = '71'
   and serie = 40
   and numero in (206);


select *
  from kardex_g_guia_remision
 where guia_serie = 'T183'
   and guia_numero = 13;

select *
  from clientes
 where cod_cliente = '20566560900';


select *
  from clientes
 where cod_cliente = '20516422018';

select *
  from kardex_g_guia_remision
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (7498);

-- 7447

select *
  from kardex_g_guia_remision
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (7447);

select *
  from kardex_g_guia_remision
 where guia_serie = 'T040'
   and numero in (206, 205, 197)
 order by fecha_traslado desc;


select *
  from kardex_g
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (7498);


select *
  from kardex_d
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (7498);

select *
  from kardex_g_guia_remision
 where guia_serie = 'T001'
 order by guia_numero desc;

select *
  from nrodoc
 where serie = 'T001';

select *
  from kardex_g
 where serie_pguia = 'F050'
   and numero_pguia = '00186080';

select * from view_salidas_pre_guias_nac;

-- -Mal diseño.
-- -Cambio muestra patrón.
-- -Cambio de numero de cavidades.
-- -Calado laser defectuoso.

select * from pr_proceso;

select prs.codigo_proceso, pr.descripcion
  from pr_ot_sec prs
     , pr_proceso pr
 where prs.ot_numero = 10338
   and prs.codigo_proceso = pr.codigo
 order by prs.secuencia;
