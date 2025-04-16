create or replace trigger pevisa.tbd_articul
  before delete
  on pevisa.articul
  for each row
declare
  x_item number;
begin
  begin
    select distinct -1
      into x_item
      from kardex_d
     where cod_art = :old.cod_art;
  exception
    when others then x_item := 0;
  end;
  if x_item = 0 then
    begin
      select distinct -2
        into x_item
        from pr_ot_det
       where art_cod_art = :old.cod_art;
    exception
      when others then x_item := 0;
    end;
  end if;
  if x_item = 0 then
    begin
      select distinct -3
        into x_item
        from expedido_d
       where cod_art = :old.cod_art;
    exception
      when others then x_item := 0;
    end;
  end if;
  if x_item = 0 then
    begin
      select distinct -4
        into x_item
        from lg_itemjam
       where cod_art = :old.cod_art
         and nvl(estado, '0') != '9';--le falta el estado para que pueda eliminar
    exception
      when others then x_item := 0;
    end;
  end if;
  if x_item = 0 then
    begin
      select distinct -5
        into x_item
        from itemord
       where cod_art = :old.cod_art
         and nvl(estado, '0') != '9';
    exception
      when others then x_item := 0;
    end;
  end if;
  if x_item <> 0 then
    if x_item = -1 then
      raise_application_error(-20001, :old.cod_art || '  Codigo tiene movimientos en el almacen');
    end if;
    if x_item = -2 then
      raise_application_error(-20001, :old.cod_art || '  Codigo tiene ordenes');
    end if;
    if x_item = -3 then
      raise_application_error(-20001, :old.cod_art || '  Codigo tiene pedidos');
    end if;
    if x_item = -4 then
      raise_application_error(-20001, :old.cod_art || '  Codigo tiene pedidos de importacion');
    end if;
    if x_item = -5 then
      raise_application_error(-20001, :old.cod_art || '  Codigo tiene ordenes de compra');
    end if;
  end if;
end;
