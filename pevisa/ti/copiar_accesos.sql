-- copia accesos entre usuarios
select username, account_status, created, lock_date, expiry_date
  from dba_users
 where username like 'LUZ_LOPEZ';

select *
  from usuarios
 where usuario = 'YDOMINGUEZ';

declare
  k_newusr varchar2(30) := 'PAPEL';
begin
  delete from seccrus where co_usrusr = k_newusr;

  delete from tab_menu where usuario = k_newusr;

  delete from usuario_modulo where usuario = k_newusr;

  delete from usuario_modulo_alterno where id_usuario = k_newusr;

  delete from usuario_modulo_alterno where id_alterno = k_newusr;

  delete from usuarios_almacenes where usuario = k_newusr;

  delete from usuarios_almacenes_perfil where usuario = k_newusr;

  delete from pr_usualma where usuario = k_newusr;
end;

------------------------------------------------
------------------------------------------------
------------------------------------------------
declare
  k_oldusr varchar2(30) := 'AMANTENIMIENTO';
  k_newusr varchar2(30) := 'JHUARI';
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

  insert into usuarios_almacenes
  select k_newusr, cod_alm, estado
    from usuarios_almacenes
   where usuario = k_oldusr;

  insert into usuarios_almacenes_perfil
  select k_newusr, cod_alm, tp_transac, insertar_registros, consulta, estado
    from usuarios_almacenes_perfil
   where usuario = k_oldusr;

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

end;

------------------------------------------------
------------------------------------------------
------------------------------------------------

select co_usrusr, co_ctrctr, co_clave, nombres
  from seccrus s
 where co_usrusr = 'JACUNA'
   and not exists (
   select *
     from seccrus s2
    where s2.co_ctrctr = s.co_ctrctr
      and s2.co_usrusr = 'FSANCHEZ'
   );

select *
  from seccrus
 where co_usrusr = 'OMAR_TORRES';

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
 where usuario = 'ARODRIGUEZ';

select usuario, cod_alm, tp_transac, insertar_registros, consulta, estado
  from usuarios_almacenes_perfil
 where usuario = 'KMONTESINOS';

select cod_alm
  from pr_usualma
 where usuario = 'JHUARI';

select cod_alm
  from pr_usualma
 where usuario = 'DRODRIGUEZS';

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
  from seccrus
 where co_usrusr in ('EINFANTE', 'JENNY_LEON');

select *
  from aut_rol_usuario
 where usuario = 'DRODRIGUEZS';

select *
  from usuarios_libros
 where usuario = 'YDOMINGUEZ';

select *
  from usuarios_tipos
 where usuario = 'YDOMINGUEZ';