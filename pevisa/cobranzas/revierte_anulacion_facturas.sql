-- ██████╗ ███████╗██╗   ██╗██╗███████╗██████╗ ████████╗███████╗
-- ██╔══██╗██╔════╝██║   ██║██║██╔════╝██╔══██╗╚══██╔══╝██╔════╝
-- ██████╔╝█████╗  ██║   ██║██║█████╗  ██████╔╝   ██║   █████╗
-- ██╔══██╗██╔══╝  ╚██╗ ██╔╝██║██╔══╝  ██╔══██╗   ██║   ██╔══╝
-- ██║  ██║███████╗ ╚████╔╝ ██║███████╗██║  ██║   ██║   ███████╗
-- ╚═╝  ╚═╝╚══════╝  ╚═══╝  ╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝
--
--  █████╗ ███╗   ██╗██╗   ██╗██╗      █████╗  ██████╗██╗ ██████╗ ███╗   ██╗
-- ██╔══██╗████╗  ██║██║   ██║██║     ██╔══██╗██╔════╝██║██╔═══██╗████╗  ██║
-- ███████║██╔██╗ ██║██║   ██║██║     ███████║██║     ██║██║   ██║██╔██╗ ██║
-- ██╔══██║██║╚██╗██║██║   ██║██║     ██╔══██║██║     ██║██║   ██║██║╚██╗██║
-- ██║  ██║██║ ╚████║╚██████╔╝███████╗██║  ██║╚██████╗██║╚██████╔╝██║ ╚████║
-- ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝
--
-- ███████╗ █████╗  ██████╗████████╗██╗   ██╗██████╗  █████╗ ███████╗
-- ██╔════╝██╔══██╗██╔════╝╚══██╔══╝██║   ██║██╔══██╗██╔══██╗██╔════╝
-- █████╗  ███████║██║        ██║   ██║   ██║██████╔╝███████║███████╗
-- ██╔══╝  ██╔══██║██║        ██║   ██║   ██║██╔══██╗██╔══██║╚════██║
-- ██║     ██║  ██║╚██████╗   ██║   ╚██████╔╝██║  ██║██║  ██║███████║
-- ╚═╝     ╚═╝  ╚═╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝


-- Registro de Ventas
-- cambia estado a 0
-- habilita trigger PASECC
select *
  from docuvent
 where tipodoc = '01'
   and numero in (188545, 188546);

-- valida que los documentos pasen al estado de cuenta
select *
  from factcob
 where tipdoc = '01'
   and numero in ('188545', '188546');

-- cambiar guia a estado 6
select *
  from kardex_g
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (9990, 9991);

select *
  from kardex_d
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (9990, 9991);

-- cambia estado de 9 a 0
select *
  from relacion
 where serie = '25'
   and numero in (9990, 9991);

-- si necesitan en kardex_g_guia_remision volver a generar el txt guia electronica
select *
  from kardex_g_guia_remision
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (9990, 9991);

-- vista del módulo que genera txt guia electrónica
select *
  from view_salidas_pre_guias_nac
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (9990, 9991);