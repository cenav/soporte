-- acceso MGVENTAS
select *
  from seccrus
 where co_usrusr = 'PEVISA'
   and co_ctrctr = 'M_GVENTAS';

select *
  from transporte
 where cod_transp = '20603099088';

select nombre, cod_transp, domicilio, ruc_transp
  from transporte
 where nvl(indicador1, '0') = '1'
   and cod_transp = '20603099088'
 order by nombre;

select *
  from cotizacion
 where num_ped = 207389;

select *
  from itemcot
 where num_ped = 207389;

select *
  from itemped
 where num_ped = 229335;

select *
  from pedido
 where num_ped = 229389;

select *
  from cotizacion
 where refe_pedido = 206310
   and estado = '2'
   and cod_vende in (
   select cod_vendedor
     from vendedores
    where supervisor like '42'
   );

select *
  from vendedores
 where cod_vendedor = '77';

select *
  from pedido
 where num_ped = 206310;

select cond_pag, descripcion, dias_libres, letras, v01, v02, v03, v04, v05, v06
  from condpag;

select cod_cliente, ruc, c.nombre as nom_cliente, c.grupo, g.nombre as nom_grupo
  from clientes c
       left join cliente_grupo g on c.grupo = g.grupo;

select *
  from docuvent
 where tipodoc = '08'
   and serie = 'F050'
   and numero = 16541;

select *
  from factcob
 where tipdoc = '08'
   and serie_num = 'F050'
   and numero = 16541;


select *
  from cotizacion
 where num_ped = 208933;

select *
  from itemcot
 where num_ped = 207389;

select *
  from pedido
 where num_ped = 230874;

select *
  from itemped
 where num_ped = 230874;

select *
  from pedido
 where num_ped = 230873;

select *
  from itemped
 where num_ped = 230873;

select *
  from pedido_flujo
 where num_ped = 230874
 order by item;


select per.c_codigo
     , per.apellido_paterno || ' ' || per.apellido_materno || ', ' || per.nombres as nombre
  from planilla10.personal per
     , planilla10.tar_encarga enc
 where per.c_codigo = enc.c_codigo
   and per.situacion not in ('8', '9')
   and (upper(enc.usuario) = (
   select usuario
     from usuario_modulo
    where usuario = user and modulo = 'EVALUACION'
    union
   select id_usuario
     from usuario_modulo_alterno
    where id_alterno = user and id_modulo = 'EVALUACION'
   ) or user in (
   select usuario from usuario_modulo where modulo = 'EVALUACION' and maestro = 'SI'
   ))
 order by per.apellido_paterno;

select per.c_codigo
     , per.apellido_paterno || ' ' || per.apellido_materno || ', ' || per.nombres as nombre
  from planilla10.personal per
     , planilla10.tar_encarga enc
 where per.c_codigo = enc.c_codigo
   and per.situacion not in ('8', '9')
   and (upper(enc.usuario) = (
   select usuario
     from usuario_modulo
    where usuario = :user and modulo = 'EVALUACION'
    union
   select id_usuario
     from usuario_modulo_alterno
    where id_alterno = :user and id_modulo = 'EVALUACION'
   ) or :user in (
   select usuario from usuario_modulo where modulo = 'EVALUACION' and maestro = 'SI'
   ))
 order by per.apellido_paterno;

select *
  from usuario_modulo
 where usuario = 'OOSTOLAZA';


select *
  from usuarios_cotizacion
 where usuario = 'ASEGAMA';

select *
  from usuarios_cotizacion
 where usuario = 'JZANABRIA';

select *
  from cotizacion
 where refe_pedido = 231903;

select *
  from pedido
 where num_ped = 231903;

select *
  from transporte
 where cod_transp = '20100084768';

select *
  from transporte
 where nombre like '%CHAVIN%';

select *
  from vendedores
 where nombre like '%ALBUJAR%';

select *
  from vendedores
 where estado = '1'
   and indicador1 is null
 order by cod_vendedor;

select * from vendedores;

declare
  l_desde    date   := to_date('01/09/2023', 'dd/mm/yyyy');
  l_hasta    date   := to_date('31/12/2023', 'dd/mm/yyyy');
  l_concepto cominac_concepto%rowtype;
  l_venta    number := 0;
begin
  l_concepto := api_cominac_concepto.onerow(397);
  l_venta := pkg_cominac_qry.venta_total('61', l_desde, l_hasta, 'D', l_concepto);
  dbms_output.put_line(l_venta);
end;

  with tabla as (
    select '61' as vendedor, '397' as concepto
      from dual
     union all
    select '61' as vendedor, '397' as concepto
      from dual
    )
select *
  from tabla;

select *
  from pk_gnumero
 where pk_numero = 55637;

select *
  from exfacturas
 where numero = '55016209';