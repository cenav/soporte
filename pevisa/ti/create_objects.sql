create function f_grabar_salida_1x1 (
  p_almacen           varchar2
, p_fecha             date
, p_ingreso_salida    varchar2
, p_transaccion       varchar2
, p_serie             number
, p_glosa             varchar2
, p_referencia        varchar2
, p_ruc_transportista varchar2
, p_proveedor         varchar2
, p_punto_partida     varchar2
) return boolean is

  x_numero             pr_ot.numero%type;
  x_nuot_serie         pr_ot.nuot_serie%type;
  x_nuot_tipoot_codigo pr_ot.nuot_tipoot_codigo%type;
  s_pedido             varchar2(20);
  i_registros_creados  number(4);
  tipo_transaccion     varchar2(1);
  numero_transaccion   number(8, 0);
  primera_transaccion  number(8, 0);
  ultima_transaccion   number(8, 0);
  fecha_transaccion    date;
  almacen_transaccion  varchar2(2);
  tiptra_transaccion   varchar2(2);
  serie_transaccion    number(3);
  x_error              number;

  cursor c1 is
    select user, d.art_cod_art, d.cant_formula, 0, 0, 0
      from pr_ot_det d
         , articul a
     where d.ot_numero = x_numero
       and d.ot_nuot_serie = x_nuot_serie
       and d.ot_nuot_tipoot_codigo = x_nuot_tipoot_codigo
       and d.art_cod_art = a.cod_art
       and d.estado <> '9'
       and a.cod_lin not in ('889')
  ;

  procedure p_graba_cabecera is
  begin
    -- OBTENEMOS EL NUMERADOR
    select numero + 1
      into numero_transaccion
      from numdoc
     where tp_transac = tiptra_transaccion
       and serie = serie_transaccion
       for update of numero;

    update numdoc
       set numero = numero_transaccion
     where tp_transac = tiptra_transaccion
       and serie = serie_transaccion;


    if i_registros_creados = 1
    then
      primera_transaccion := numero_transaccion;
    end if;
    ultima_transaccion := numero_transaccion;

    s_pedido := p_referencia;
    -- INSERTAMOS CABECERA DE KARDEX
    insert into kardex_g
      ( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref, ser_doc_ref, nro_doc_ref
      , num_importa, glosa, motivo, estado, por_desc1, por_desc2, origen, ing_sal, flg_impr
      , tipo_pguia, serie_pguia, numero_pguia, cod_transp, ruc_transp, tp_relacion, cod_relacion
      , nro_sucur)
    values
      ( almacen_transaccion, tiptra_transaccion, serie_transaccion, numero_transaccion
      , fecha_transaccion, x_nuot_tipoot_codigo, x_nuot_serie, x_numero, p_referencia, p_glosa, 0, 0
      , 0, 0, 'P', tipo_transaccion, 0, x_nuot_tipoot_codigo, x_nuot_serie, x_numero
      , p_ruc_transportista, p_ruc_transportista, 'P', p_proveedor, p_punto_partida);
    -- INSERTAMOS CABECERA DE KARDEX
    update pr_ot_orden_de_servicio
       set kardex_cod_alm    = almacen_transaccion
         , kardex_tp_transac = tiptra_transaccion
         , kardex_serie      = serie_transaccion
         , kardex_numero     = numero_transaccion
     where numero = x_numero
       and nuot_serie = x_nuot_serie
       and nuot_tipoot_codigo = x_nuot_tipoot_codigo;
    -- INSERTAMOS CABECERA DE KARDEX
    update pr_ot
       set estado = 3
     where numero = x_numero
       and nuot_serie = x_nuot_serie
       and nuot_tipoot_codigo = x_nuot_tipoot_codigo;
  exception
    when others
      then
        x_error := x_error + 1;
        mensaje('	kardex_g ' || ' ==> ' || (sqlcode || '–>' || sqlerrm));
  end;

  procedure p_graba_detalle is
  begin
    for rec in c1
    loop
      begin
        insert into kardex_d
          ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d, costo_s, fch_transac
          , estado, por_desc1, por_desc2, origen, imp_vvb, ing_sal, pr_tipot, pr_numot)
        values
          ( almacen_transaccion, tiptra_transaccion, serie_transaccion, numero_transaccion
          , rec.art_cod_art, rec.cant_formula, 0, 0, p_fecha, 0, 0, 0, 'P', 0, tipo_transaccion
          , x_nuot_tipoot_codigo, x_numero);
      exception
        when others then
          mensaje(rec.art_cod_art || ' ==> ' || (sqlerrm));
          x_error := x_error + 1;
      end;
    end loop;
  end;


  procedure p_graba_segun_pedido is
  begin
    x_numero := :VIEW_OC_Y_OP_SERVICIOS_PEND.numero;
    x_nuot_serie := :VIEW_OC_Y_OP_SERVICIOS_PEND.nuot_serie;
    x_nuot_tipoot_codigo := :VIEW_OC_Y_OP_SERVICIOS_PEND.nuot_tipoot_codigo;

    i_registros_creados := i_registros_creados + 1;
    mensaje(i_registros_creados || '    ' || x_numero);
    p_graba_cabecera;
    p_graba_detalle;
  end;


  -------------------------------------------------------------
--------------------- MAIN PROCEDURE ------------------------
-------------------------------------------------------------
begin
  x_error := 0;
  i_registros_creados := 0;
  almacen_transaccion := p_almacen;
  tiptra_transaccion := p_transaccion;
  serie_transaccion := p_serie;
  fecha_transaccion := p_fecha;
  tipo_transaccion := p_ingreso_salida;

  go_block('VIEW_OC_Y_OP_SERVICIOS_PEND');
  first_record;
  loop
    if (:VIEW_OC_Y_OP_SERVICIOS_PEND.procesa = 1)
    then
      p_graba_segun_pedido;
    end if;
    exit when name_in('SYSTEM.LAST_RECORD') = 'TRUE';
    next_record;
  end loop;

  if x_error > 0
  then
    return false;
  end if;
--999   commit;

  forms_variables.salida_generada :=
      ('SALIDA   Almacen: ' || almacen_transaccion || ' Transaccion: ' || tiptra_transaccion ||
       '  Numero: ' || primera_transaccion || ' al ' || ultima_transaccion);

  return true;
end;
