create or replace package pevisa.api_clientes_categoria is
  type aat is table of clientes_categoria%rowtype index by pls_integer;
  type ntt is table of clientes_categoria%rowtype;

  procedure ins(
    rec in clientes_categoria%rowtype
  );

  procedure ins(
    coll aat
  );

  procedure upd(
    rec in clientes_categoria%rowtype
  );

  procedure upd(
    coll aat
  );

  procedure del(
    cod_cliente in clientes_categoria.cod_cliente%type
  , cod_tipo in    clientes_categoria.cod_tipo%type
  );

  function onerow(
    cod_cliente in clientes_categoria.cod_cliente%type
  , cod_tipo in    clientes_categoria.cod_tipo%type
  ) return clientes_categoria%rowtype;

  function allrows return aat;

  function exist(
    cod_cliente in clientes_categoria.cod_cliente%type
  , cod_tipo in    clientes_categoria.cod_tipo%type
  ) return boolean;

  function descripcion(
    cod_cliente in clientes_categoria.cod_cliente%type
  , cod_tipo in    clientes_categoria.cod_tipo%type
  ) return categoria%rowtype;

end api_clientes_categoria;


create or replace package body pevisa.api_clientes_categoria is
  forall_err exception;
  pragma exception_init (forall_err, -24381);

  procedure ins(
    rec in clientes_categoria%rowtype
  ) is
  begin
    insert into clientes_categoria
    values rec;
  end;

  procedure ins(
    coll in aat
  ) is
  begin
    forall i in 1 .. coll.count save exceptions
      insert into clientes_categoria values coll(i);
  exception
    when forall_err then
      for i in 1 .. sql%bulk_exceptions.COUNT loop
        logger.log('PK: ' || coll(sql%bulk_exceptions(i).error_index).cod_cliente ||
                   ' ^ ' || coll(sql%bulk_exceptions(i).error_index).cod_tipo ||
                   ' Err: ' || sqlerrm(sql%bulk_exceptions(i).error_code * -1));
      end loop;
      raise;
  end;

  procedure upd(
    rec in clientes_categoria%rowtype
  ) is
  begin
    update clientes_categoria t
       set row = rec
     where t.cod_cliente = rec.cod_cliente
       and t.cod_tipo = rec.cod_tipo;
  end;

  procedure upd(
    coll in aat
  ) is
  begin
    forall i in 1 .. coll.count save exceptions
      update clientes_categoria
         set row = coll(i)
       where cod_cliente = coll(i).cod_cliente
         and cod_tipo = coll(i).cod_tipo;
  exception
    when forall_err then
      for i in 1 .. sql%bulk_exceptions.COUNT loop
        logger.log('PK: ' || coll(sql%bulk_exceptions(i).error_index).cod_cliente ||
                   ' ^ ' || coll(sql%bulk_exceptions(i).error_index).cod_tipo ||
                   ' Err: ' || sqlerrm(sql%bulk_exceptions(i).error_code * -1));
      end loop;
      raise;
  end;

  procedure del(
    cod_cliente in clientes_categoria.cod_cliente%type
  , cod_tipo in    clientes_categoria.cod_tipo%type
  ) is
  begin
    delete
      from clientes_categoria t
     where t.cod_cliente = del.cod_cliente
       and t.cod_tipo = del.cod_tipo;
  end;

  function onerow(
    cod_cliente in clientes_categoria.cod_cliente%type
  , cod_tipo in    clientes_categoria.cod_tipo%type
  ) return clientes_categoria%rowtype is
    rec clientes_categoria%rowtype;
  begin
    select *
      into rec
      from clientes_categoria t
     where t.cod_cliente = onerow.cod_cliente
       and t.cod_tipo = onerow.cod_tipo;

    return rec;
  exception
    when no_data_found then
      return null;
    when too_many_rows then
      raise;
  end;

  function allrows return aat is
    coll aat;
  begin
    select * bulk collect
      into coll
      from clientes_categoria;

    return coll;
  end;

  function exist(
    cod_cliente in clientes_categoria.cod_cliente%type
  , cod_tipo in    clientes_categoria.cod_tipo%type
  ) return boolean is
    dummy pls_integer;
  begin
    select 1
      into dummy
      from clientes_categoria t
     where t.cod_cliente = exist.cod_cliente
       and t.cod_tipo = exist.cod_tipo;

    return true;
  exception
    when no_data_found then
      return false;
    when too_many_rows then
      return true;
  end;

  function descripcion(
    cod_cliente in clientes_categoria.cod_cliente%type
  , cod_tipo in    clientes_categoria.cod_tipo%type
  ) return categoria%rowtype is
    rec categoria%rowtype;
  begin
    select c.*
      into rec
      from clientes_categoria t
           join categoria c on t.cod_tipo = c.cod_tipo and t.cod_categoria = c.cod_categoria
     where t.cod_cliente = descripcion.cod_cliente
       and t.cod_tipo = descripcion.cod_tipo;

    return rec;
  exception
    when no_data_found then
      return null;
    when too_many_rows then
      raise;
  end;

end api_clientes_categoria;
/
