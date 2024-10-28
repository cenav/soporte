select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and numero in (
                  1037709, 1057500
   );

select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and numero in (
                  1037763, 1055771, 1052697, 1057410
   );

select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and numero in (
                  1076367
   );

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'AR'
   and ot_numero in (
                     1037763, 1055771, 1052697, 1057410
   );

select * from pr_num_ot;

declare
  c_tpo constant pr_ot.nuot_tipoot_codigo%type := 'AR';
  c_ser constant pr_ot.nuot_serie%type         := '3';
  c_nro constant pr_ot.numero%type             := 1057410;
  c_fch constant date                          := sysdate;
  l_nuevo_nro    pr_ot.numero%type;
begin
  l_nuevo_nro := api_pr_num_ot.onerow(c_ser, c_tpo).numero + 1;
  insert into pr_ot( numero, fecha, estado, cant_prog, nuot_serie, nuot_tipoot_codigo, observacion
                   , lote, fecha_prog_ini, fecha_prog_fin, fecha_cierre, parcial, receta, referencia
                   , formu_art_cod_art, formu_receta, cdc_centro_costo, num_lote, cant_resul
                   , aprueba_gte, serie_ot_fab, numero_ot_fab, cant_ingresado, hora_fab, hora_env
                   , hora_enc, per_fab, per_env, per_enc, bolsal, bolfec, abre01, abre02, boling
                   , destino, plazo, fecha_plazo, cod_eqi, pais, empaque, usuario, origen, embalaje
                   , prioridad, cant_merma, fecha_prioridad, cod_lin, peso_pieza, saldo_pk
                   , categ_merma)
  select l_nuevo_nro, c_fch, '1', cant_prog, nuot_serie, nuot_tipoot_codigo, observacion, lote
       , fecha_prog_ini, fecha_prog_fin, null, parcial, receta, referencia
       , formu_art_cod_art, formu_receta, cdc_centro_costo, num_lote, 0, aprueba_gte
       , serie_ot_fab, numero_ot_fab, cant_ingresado, hora_fab, hora_env, hora_enc, per_fab, per_env
       , per_enc, bolsal, bolfec, abre01, abre02, boling, destino, plazo, fecha_plazo, cod_eqi, pais
       , empaque, usuario, origen, embalaje, prioridad, cant_merma, fecha_prioridad, cod_lin
       , peso_pieza, saldo_pk, categ_merma
    from pr_ot
   where nuot_tipoot_codigo = c_tpo
     and nuot_serie = c_ser
     and numero = c_nro;

  insert into pr_ot_det( cant_formula, cant_usada, cost_formula, cost_usada, almacen, ot_numero
                       , ot_nuot_serie, ot_nuot_tipoot_codigo, art_cod_art, cant_despachada
                       , rendimiento, cod_lin, pr_secuencia, flag_kardex, estado, prioridad
                       , fecha_prioridad, cant_surtida, saldo)
  select cant_formula, cant_usada, cost_formula, cost_usada, almacen, l_nuevo_nro, ot_nuot_serie
       , ot_nuot_tipoot_codigo, art_cod_art, cant_despachada, rendimiento, cod_lin, pr_secuencia
       , flag_kardex, estado, prioridad, fecha_prioridad, cant_surtida, 0
    from pr_ot_det
   where ot_nuot_tipoot_codigo = c_tpo
     and ot_nuot_serie = c_ser
     and ot_numero = c_nro;

  update pr_num_ot
     set numero = l_nuevo_nro
   where tipoot_codigo = c_tpo
     and serie = c_ser;

  dbms_output.put_line(l_nuevo_nro);
end;