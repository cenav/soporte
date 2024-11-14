create package api_exproformas_param as

  function get_one return exproformas_param%rowtype;

end api_exproformas_param;


create package body api_exproformas_param as

  function get_one return exproformas_param%rowtype is
    l_param exproformas_param%rowtype;
  begin
    select * into l_param from exproformas_param;

    return l_param;
  end;

end api_exproformas_param;


alter table clientes_corporacion
  add flg_retail number(1) default 0 not null;

alter table clientes_corporacion
  add constraint chk_cliente_corporacion_retail
    check ( flg_retail in (0, 1) );

alter table exclientes
  add dias_despacho number(4);

alter table exclientes
  add dias_llegada number(4);
