-- copia accesos entre usuarios
select username, account_status, created, lock_date, expiry_date
  from dba_users
 where username like '%OVELARDE%';

select *
  from usuarios
 where usuario like '%PEREZ%';

select *
  from usuarios
 where usuario in ('RTARRILLO');

declare
  k_newusr varchar2(30) := 'ALMACEN';
begin

  delete from seccrus where co_usrusr = k_newusr;

  delete from tab_menu where usuario = k_newusr;

  delete from usuario_modulo_alterno where id_usuario = k_newusr;

  delete from usuario_modulo_alterno where id_alterno = k_newusr;

  delete from usuario_modulo where usuario = k_newusr;

  delete from usuarios_almacenes where usuario = k_newusr;

  delete from usuarios_almacenes_perfil where usuario = k_newusr;

  delete from pr_usualma where usuario = k_newusr;

  delete from aut_rol_usuario where usuario = k_newusr;

  delete from usuarios_libros where usuario = k_newusr;

  delete from usuarios_tipos where usuario = k_newusr;

  delete from usuarios_caja_chica where usuario = k_newusr;

  delete from usuarios_cotizacion where usuario = k_newusr;

  delete from solicitud_pedido_comprador where comprador_asignado = k_newusr;
end;

------------------------------------------------
------------------------------------------------
------------------------------------------------
declare
  k_oldusr varchar2(30) := 'RTARRILLO';
  k_newusr varchar2(30) := 'DBAZAN';
begin

  insert into seccrus
  select k_newusr, co_ctrctr, co_clave, nombres
    from seccrus s
   where co_usrusr = k_oldusr
     and not exists (
     select *
       from seccrus s2
      where s2.co_ctrctr = s.co_ctrctr
        and s2.co_usrusr = k_newusr
     );

  insert into tab_menu
  select cod_menu, descripcion, menus, titulo, nivel, k_newusr, estado, sistema, id_programa
    from tab_menu t
   where usuario = k_oldusr
     and not exists (
     select *
       from tab_menu t2
      where t2.cod_menu = t.cod_menu
        and t2.usuario = k_newusr
     );

  insert into usuario_modulo
  select k_newusr, modulo, maestro, supermaestro
    from usuario_modulo u
   where usuario = k_oldusr
     and not exists (
     select *
       from usuario_modulo u2
      where u2.modulo = u.modulo
        and u2.usuario = k_newusr
     );

  insert into usuario_modulo_alterno
  select k_newusr, id_modulo, id_alterno
    from usuario_modulo_alterno
   where id_usuario = k_oldusr;

  insert into usuario_modulo_alterno
  select id_usuario, id_modulo, k_newusr
    from usuario_modulo_alterno
   where id_alterno = k_oldusr;

  insert into usuarios_almacenes(usuario, cod_alm, estado)
  select k_newusr, ua.cod_alm, ua.estado
    from usuarios_almacenes ua
   where ua.usuario = k_oldusr
     and not exists (
     select *
       from usuarios_almacenes ua2
      where ua2.cod_alm = ua.cod_alm
        and ua2.usuario = k_newusr
     );

  insert into usuarios_almacenes_perfil
  select k_newusr, ua.cod_alm, ua.tp_transac, ua.insertar_registros, ua.consulta, ua.estado
    from usuarios_almacenes_perfil ua
   where ua.usuario = k_oldusr
     and not exists (
     select *
       from usuarios_almacenes_perfil ua2
      where ua2.cod_alm = ua.cod_alm
        and ua2.tp_transac = ua.tp_transac
        and ua2.usuario = k_newusr
     );

  insert into pr_usualma(cod_alm, usuario, nombre)
  select ua.cod_alm, k_newusr, k_newusr
    from pr_usualma ua
   where usuario = k_oldusr
     and not exists (
     select *
       from pr_usualma ua2
      where ua2.cod_alm = ua.cod_alm
        and ua2.usuario = k_newusr
     );

  insert into aut_rol_usuario(id_rol, usuario)
  select ru.id_rol, k_newusr
    from aut_rol_usuario ru
   where ru.usuario = k_oldusr
     and not exists (
     select *
       from aut_rol_usuario ru2
      where ru2.usuario = ru.usuario
        and ru2.usuario = k_newusr
     );

  insert into usuarios_libros(usuario, libro, mes_predeterminado)
  select k_newusr, ul.libro, ul.mes_predeterminado
    from usuarios_libros ul
   where ul.usuario = k_oldusr
     and not exists (
     select *
       from usuarios_libros ul2
      where ul2.usuario = ul.usuario
        and ul2.usuario = k_newusr
     );

  insert into usuarios_tipos(usuario, tipo, mes_predeterminado)
  select k_newusr, ut.tipo, ut.mes_predeterminado
    from usuarios_tipos ut
   where ut.usuario = k_oldusr
     and not exists (
     select *
       from usuarios_tipos ut2
      where ut2.usuario = ut.usuario
        and ut2.usuario = k_newusr
     );

  insert into usuarios_caja_chica(usuario, serie, estado)
  select k_newusr, u.serie, u.estado
    from usuarios_caja_chica u
   where u.usuario = k_oldusr
     and not exists (
     select *
       from usuarios_caja_chica u2
      where u2.usuario = u.usuario
        and u2.serie = u.serie
        and u2.usuario = k_newusr
     );


  insert into usuarios_cotizacion( usuario, indicador1, indicador2, indicador3, minimo
                                 , aprobacion_netos, cod_supervisor)
  select k_newusr, u.indicador1, u.indicador2, u.indicador3, u.minimo
       , u.aprobacion_netos, u.cod_supervisor
    from usuarios_cotizacion u
   where u.usuario = k_oldusr
     and not exists (
     select *
       from usuarios_cotizacion u2
      where u2.usuario = u.usuario
        and u2.usuario = k_newusr
     );


  insert into solicitud_pedido_comprador
  select k_newusr, maestro, supermaestro, u.estado
    from solicitud_pedido_comprador u
   where u.comprador_asignado = k_oldusr
     and not exists (
     select *
       from solicitud_pedido_comprador u2
      where u2.comprador_asignado = k_newusr
     );
end;

-- para usario de RH habilitar en planilla
select * from planilla10.plcontrol;
------------------------------------------------
------------------------------------------------
------------------------------------------------

select *
  from usuarios_cotizacion
 where usuario in ('OVELARDE');

select *
  from seccrus
 where co_usrusr in ('DBAZAN');

select distinct sistema
  from tab_menu
 where usuario = 'EBELTRAN';

select *
  from tab_menu
 where usuario = 'AMORAN';

select *
  from tab_lineas
 where linea in ('144', '233', '271');

select *
  from tab_menu t
 where usuario = 'CVASQUEZ'
   and not exists (
   select *
     from tab_menu t2
    where t2.cod_menu = t.cod_menu
      and t2.usuario = 'RGRANADOS'
   );

select *
  from usuario_modulo u
 where usuario = 'JACUNA'
   and not exists (
   select *
     from usuario_modulo u2
    where u2.modulo = u.modulo
      and u2.usuario = 'FSANCHEZ'
   );

select id_usuario, id_modulo, id_alterno
  from usuario_modulo_alterno
 where id_usuario = 'KMONTESINOS';


select id_usuario, id_modulo, id_alterno
  from usuario_modulo_alterno
 where id_alterno = 'KMONTESINOS';

select *
  from usuario_modulo
 where usuario = 'AMALDONADO';

select usuario, cod_alm, tp_transac, insertar_registros, consulta, estado
  from usuarios_almacenes_perfil
 where usuario = 'KMONTESINOS';

select cod_alm
  from pr_usualma
 where usuario = 'ACOLLAZOS';

select cod_alm
  from pr_usualma
 where usuario = 'MMILLONES';

select *
  from pr_usualma ua
 where usuario = 'KMONTESINOS'
   and not exists (
   select *
     from pr_usualma ua2
    where ua2.cod_alm = ua.cod_alm
      and ua2.usuario = 'FSANCHEZ'
   );

select *
  from tab_menu
 where usuario = 'JMEDINA'
   and sistema = 'M_CALIDAD_M';

select *
  from seccrus
 where co_usrusr in ('GATANACIO');

select *
  from seccrus
 where co_ctrctr like '%LPACCO%';

select *
  from aut_rol_usuario
 where usuario = 'DRODRIGUEZS';

select *
  from usuarios_libros
 where usuario = 'RVASQUEZ';

select *
  from usuarios_tipos
 where usuario = 'YDOMINGUEZ';

select *
  from usuario_modulo
 where usuario = 'MARONES';

select *
  from usuario_modulo
 where usuario = 'JVILLAR';

select * from otm_serie_usuario;

select * from tmp_selecciona_cliente;

select *
  from almacenes
 where cod_alm in ('RV', 'RD', 'RS')
 order by cod_alm;

select *
  from usuarios_almacenes
 where usuario in ('GSORIANO', 'JMEJIA', 'CNAVARRO')
   and cod_alm = 'RV';


select ta.cod_alm_destino, a.descripcion
  from traslados_almacenes ta
     , almacenes a
 where ta.cod_alm_destino = a.cod_alm
   and ta.cod_alm_origen = 'RV'
 order by 1;

select *
  from traslados_almacenes
 where cod_alm_origen = 'RV';

select t.codigo, t.descripcion, t.indicador1
  from tablas_auxiliares t
 where t.tipo = 33
   and t.codigo in (
   select cod_alm
     from pr_usualma
    where cod_alm = t.codigo
      and usuario = 'GSORIANO'
   )
   and t.codigo in (
   select distinct cod_alm_origen
     from traslados_almacenes
   );

select *
  from pr_usualma
 where cod_alm = 'RV';

select t.codigo, t.descripcion, t.indicador1
  from tablas_auxiliares t
 where t.tipo = 33
   and t.codigo in (
   select cod_alm
     from pr_usualma
    where cod_alm = t.codigo
      and usuario = user
   )
   and t.codigo in (
   select distinct cod_alm_origen
     from traslados_almacenes
   );

select n.serie, n.automatico
  from numdoc n
     , almacen_trasaccion_serie t
 where n.tp_transac = '35'
   and n.tp_transac = t.tp_transac
   and t.cod_alm = 'RV'
   and n.serie = t.serie
 order by 1;

select * from almacen_trasaccion_serie;


select m.cod_art, a.descripcion, m.stock, a.tp_c_stck, f.cuenta69, a.tp_art, a.unidad, a.cod_lin
  from almacen m
     , articul a
     , tfamlin f
 where m.cod_alm = :KARDEX_G.cod_alm
   and a.cod_art = m.cod_art
   and f.tp_art = a.tp_art
   and f.cod_fam = a.cod_fam
   and f.cod_lin = a.cod_lin
   and m.stock > 0;


select *
  from pr_ot
 where nuot_tipoot_codigo = 'VA'
   and numero = 12330;

select *
  from usuario_modulo
 where modulo = 'NOMBRE_CLIENTE'
   and usuario = 'CNAVARRO';

select *
  from usuarios_libros
 where usuario = 'AMORAN';

select * from transacciones_almacen;

select ta.cod_alm_destino, a.descripcion
  from traslados_almacenes ta
     , almacenes a
 where ta.cod_alm_destino = a.cod_alm
   and ta.cod_alm_origen = '31'
 order by 1;

select *
  from traslados_almacenes
 where cod_alm_origen = '31';

select *
  from cotizacion
 where serie = 20
   and num_ped = 269915;

select *
  from itemcot
 where cod_art = 'SC20HR11'
 order by num_ped desc;

select *
  from almacenes
 where cod_alm = '31';

select *
  from caja_chica_serie
 where id_serie = 7;

select *
  from usuarios_caja_chica
 where usuario = 'MREQUIS';

select sysdate from dual;