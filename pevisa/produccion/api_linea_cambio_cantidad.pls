create or replace package pevisa.api_linea_cambio_cantidad is
  type aat is table of linea_cambio_cantidad%rowtype index by pls_integer;
  type ntt is table of linea_cambio_cantidad%rowtype;

  procedure ins(
    p_rec in linea_cambio_cantidad%rowtype
  );

  procedure ins(
    p_coll aat
  );

  procedure upd(
    p_rec in linea_cambio_cantidad%rowtype
  );

  procedure upd(
    p_coll aat
  );

  procedure del(
    p_cod_lin in linea_cambio_cantidad.cod_lin%type
  );

  function onerow(
    p_cod_lin in linea_cambio_cantidad.cod_lin%type
  ) return linea_cambio_cantidad%rowtype result_cache;

  function allrows return aat;

  function exist(
    p_cod_lin in linea_cambio_cantidad.cod_lin%type
  ) return boolean;

end api_linea_cambio_cantidad;


create or replace package body pevisa.api_linea_cambio_cantidad is
  forall_err exception;
  pragma exception_init (forall_err, -24381);

  procedure ins(
    p_rec in linea_cambio_cantidad%rowtype
  ) is
  begin
    insert into linea_cambio_cantidad
    values p_rec;
  end;

  procedure ins(
    p_coll in aat
  ) is
  begin
    forall i in 1 .. p_coll.count save exceptions
      insert into linea_cambio_cantidad values p_coll(i);
  exception
    when forall_err then
      for i in 1 .. sql%bulk_exceptions.COUNT loop
        logger.log('PK: ' || p_coll(sql%bulk_exceptions(i).error_index).cod_lin ||
                   ' Err: ' || sqlerrm(sql%bulk_exceptions(i).error_code * -1));
      end loop;
      raise;
  end;

  procedure upd(
    p_rec in linea_cambio_cantidad%rowtype
  ) is
  begin
    update linea_cambio_cantidad t
       set row = p_rec
     where t.cod_lin = p_rec.cod_lin;
  end;

  procedure upd(
    p_coll in aat
  ) is
  begin
    forall i in 1 .. p_coll.count save exceptions
      update linea_cambio_cantidad
         set row = p_coll(i)
       where cod_lin = p_coll(i).cod_lin;
  exception
    when forall_err then
      for i in 1 .. sql%bulk_exceptions.COUNT loop
        logger.log('PK: ' || p_coll(sql%bulk_exceptions(i).error_index).cod_lin ||
                   ' Err: ' || sqlerrm(sql%bulk_exceptions(i).error_code * -1));
      end loop;
      raise;
  end;

  procedure del(
    p_cod_lin in linea_cambio_cantidad.cod_lin%type
  ) is
  begin
    delete
      from linea_cambio_cantidad t
     where t.cod_lin = p_cod_lin;
  end;

  function onerow(
    p_cod_lin in linea_cambio_cantidad.cod_lin%type
  ) return linea_cambio_cantidad%rowtype result_cache is
    rec linea_cambio_cantidad%rowtype;
  begin
    select *
      into rec
      from linea_cambio_cantidad t
     where t.cod_lin = p_cod_lin;

    return rec;
  exception
    when no_data_found then
      return null;
    when too_many_rows then
      raise;
  end;

  function allrows return aat is
    p_coll aat;
  begin
    select * bulk collect
      into p_coll
      from linea_cambio_cantidad;

    return p_coll;
  end;

  function exist(
    p_cod_lin in linea_cambio_cantidad.cod_lin%type
  ) return boolean is
    dummy pls_integer;
  begin
    select 1
      into dummy
      from linea_cambio_cantidad t
     where t.cod_lin = p_cod_lin;

    return true;
  exception
    when no_data_found then
      return false;
    when too_many_rows then
      return true;
  end;

end api_linea_cambio_cantidad;
/

create or replace public synonym api_linea_cambio_cantidad for pevisa.api_linea_cambio_cantidad;
