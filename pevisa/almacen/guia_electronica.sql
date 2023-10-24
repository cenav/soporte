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
 where serie = 160;

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
   and numero in (7066);


--::::::::::::::::::::::::::::--
--        tara_bo = 0         --
--::::::::::::::::::::::::::::--
select *
  from kardex_g
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (7066);

--:::::::::::::::::::::::::::::::::::::::::--
--    elimina de kardex_g_guia_remision    --
--:::::::::::::::::::::::::::::::::::::::::--
select *
  from kardex_g_guia_remision
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (7066);

select *
  from kardex_d
 where cod_alm = '01'
   and tp_transac = '11'
   and fch_transac > to_date('01/10/2023', 'dd/mm/yyyy');


select * from transporte;


select *
  from kardex_g
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (7033, 7041);

select *
  from kardex_d
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (7033, 7041);

select *
  from kardex_g_guia_remision
 where guia_serie = 'T001'
   and guia_numero = 6815;

select *
  from kardex_g_guia_remision
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (7033, 7041);
