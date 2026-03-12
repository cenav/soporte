create or replace trigger pevisa.tib_kardex_g_wms
  before insert
  on pevisa.kardex_g
  referencing
    old as old
    new as new
  for each row
  when ( new.cod_alm in ('D5', '30')
    and new.tp_transac not in ('11', '27') )
declare
  x_tip_doc_ref varchar2(4);
begin
  x_tip_doc_ref := :new.tip_doc_ref;
  if nvl(x_tip_doc_ref, '0') <> 'TK' then
    raise_application_error(-20001, :new.cod_alm
      || ' NO SE PUEDE INGRESAR EN ESTE ALMACEN SOLO POR WMS');
  end if;
end;


create or replace trigger pevisa.tib_kardex_d_wms_lin
  before insert
  on pevisa.kardex_d
  for each row
declare
  l_cod_alm     pevisa.kardex_g.cod_alm%type;
  l_tp_transac  pevisa.kardex_g.tp_transac%type;
  l_tip_doc_ref pevisa.kardex_g.tip_doc_ref%type;
begin
  /* Traer datos de cabecera */
  select g.cod_alm, g.tp_transac, g.tip_doc_ref
    into l_cod_alm, l_tp_transac, l_tip_doc_ref
    from pevisa.kardex_g g
   where g.cod_alm = :new.cod_alm
     and g.tp_transac = :new.tp_transac
     and g.serie = :new.serie
     and g.numero = :new.numero;

  /* Aplicar regla WMS equivalente a la de kardex_g */
  if l_cod_alm in ('D5', '30')
    and l_tp_transac not in ('11')
    and nvl(l_tip_doc_ref, '0') <> 'TK'
  then
    /* Validar cod_lin: debe ser numérico y estar entre 800 y 899 */
    if :new.cod_lin is null then
      raise_application_error(
          -20001,
          l_cod_alm || ' NO SE PUEDE INGRESAR: COD_LIN ES OBLIGATORIO (SOLO 800-899)'
      );
    end if;

    if length(:new.cod_lin) = 3 and :new.cod_lin not between 800 and 899 then
      raise_application_error(
          -20001,
          l_cod_alm || ' NO SE PUEDE INGRESAR: SOLO LINEAS 800-899 EN KARDEX_D'
      );
    end if;
  end if;

exception
  when no_data_found then
    raise_application_error(
        -20001,
        'NO EXISTE CABECERA EN KARDEX_G PARA EL DETALLE EN KARDEX_D (NO SE PUEDE VALIDAR)'
    );
end;