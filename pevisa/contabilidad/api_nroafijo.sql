create or replace package pevisa.api_nroafijo is
  type aat is table of nroafijo%rowtype index by pls_integer;
  type ntt is table of nroafijo%rowtype;

  procedure ins(
    rec in nroafijo%rowtype
  );

  procedure ins(
    coll aat
  );

  procedure upd(
    rec in nroafijo%rowtype
  );

  procedure upd(
    coll aat
  );

  procedure del(
    cod_activo_fijo in nroafijo.cod_activo_fijo%type
  , cod_tipo in        nroafijo.cod_tipo%type
  );

  function onerow(
    cod_activo_fijo in nroafijo.cod_activo_fijo%type
  , cod_tipo in        nroafijo.cod_tipo%type
  ) return nroafijo%rowtype result_cache;

  function allrows return aat;

  function exist(
    cod_activo_fijo in nroafijo.cod_activo_fijo%type
  , cod_tipo in        nroafijo.cod_tipo%type
  ) return boolean;

  function next_key(
    cod_activo_fijo in nroafijo.cod_activo_fijo%type
  , cod_tipo in        nroafijo.cod_tipo%type
  ) return nroafijo.numero%type result_cache;
end api_nroafijo;


create or replace package body pevisa.api_nroafijo is
  forall_err exception;
  pragma exception_init (forall_err, -24381);

  procedure ins(
    rec in nroafijo%rowtype
  ) is
  begin
    insert into nroafijo
    values rec;
  end;

  procedure ins(
    coll in aat
  ) is
  begin
    forall i in 1 .. coll.count save exceptions
      insert into nroafijo values coll(i);
  exception
    when forall_err then
      for i in 1 .. sql%bulk_exceptions.COUNT loop
        logger.log('PK: ' || coll(sql%bulk_exceptions(i).error_index).cod_activo_fijo ||
                   ' ^ ' || coll(sql%bulk_exceptions(i).error_index).cod_tipo ||
                   ' Err: ' || sqlerrm(sql%bulk_exceptions(i).error_code * -1));
      end loop;
      raise;
  end;

  procedure upd(
    rec in nroafijo%rowtype
  ) is
  begin
    update nroafijo t
       set row = rec
     where t.cod_activo_fijo = rec.cod_activo_fijo
       and t.cod_tipo = rec.cod_tipo;
  end;

  procedure upd(
    coll in aat
  ) is
  begin
    forall i in 1 .. coll.count save exceptions
      update nroafijo
         set row = coll(i)
       where cod_activo_fijo = coll(i).cod_activo_fijo
         and cod_tipo = coll(i).cod_tipo;
  exception
    when forall_err then
      for i in 1 .. sql%bulk_exceptions.COUNT loop
        logger.log('PK: ' || coll(sql%bulk_exceptions(i).error_index).cod_activo_fijo ||
                   ' ^ ' || coll(sql%bulk_exceptions(i).error_index).cod_tipo ||
                   ' Err: ' || sqlerrm(sql%bulk_exceptions(i).error_code * -1));
      end loop;
      raise;
  end;

  procedure del(
    cod_activo_fijo in nroafijo.cod_activo_fijo%type
  , cod_tipo in        nroafijo.cod_tipo%type
  ) is
  begin
    delete
      from nroafijo t
     where t.cod_activo_fijo = del.cod_activo_fijo
       and t.cod_tipo = del.cod_tipo;
  end;

  function onerow(
    cod_activo_fijo in nroafijo.cod_activo_fijo%type
  , cod_tipo in        nroafijo.cod_tipo%type
  ) return nroafijo%rowtype result_cache is
    rec nroafijo%rowtype;
  begin
    select *
      into rec
      from nroafijo t
     where t.cod_activo_fijo = onerow.cod_activo_fijo
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
      from nroafijo;

    return coll;
  end;

  function exist(
    cod_activo_fijo in nroafijo.cod_activo_fijo%type
  , cod_tipo in        nroafijo.cod_tipo%type
  ) return boolean is
    dummy pls_integer;
  begin
    select 1
      into dummy
      from nroafijo t
     where t.cod_activo_fijo = exist.cod_activo_fijo
       and t.cod_tipo = exist.cod_tipo;

    return true;
  exception
    when no_data_found then
      return false;
    when too_many_rows then
      return true;
  end;

  function next_key(
    cod_activo_fijo in nroafijo.cod_activo_fijo%type
  , cod_tipo in        nroafijo.cod_tipo%type
  ) return nroafijo.numero%type result_cache is
    l_nro nroafijo.numero%type;
  begin
    if exist(cod_activo_fijo, cod_tipo) then
      -- obtiene el ultimo numero usado
      select t.numero + 1
        into l_nro
        from nroafijo t
       where t.cod_activo_fijo = next_key.cod_activo_fijo
         and t.cod_tipo = next_key.cod_tipo
         for update of t.numero;

      update nroafijo t
         set t.numero = l_nro
       where t.cod_activo_fijo = next_key.cod_activo_fijo
         and t.cod_tipo = next_key.cod_tipo;
    else
      l_nro := 1;
      insert into nroafijo(cod_activo_fijo, cod_tipo, numero)
      values (next_key.cod_activo_fijo, next_key.cod_tipo, l_nro);
    end if;

    return l_nro;
  exception
    when too_many_rows then
      raise;
  end;

end api_nroafijo;
/

create public synonym api_nroafijo for pevisa.api_nroafijo;