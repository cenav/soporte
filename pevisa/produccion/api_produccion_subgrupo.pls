create or replace package pevisa.api_produccion_subgrupo as
  type aat is table of produccion_subgrupo%rowtype index by binary_integer;
  type ntt is table of produccion_subgrupo%rowtype;

  procedure ins(
    p_rec in produccion_subgrupo%rowtype
  );

  procedure ins(
    p_coll aat
  );

  procedure upd(
    p_rec in produccion_subgrupo%rowtype
  );

  procedure upd(
    p_coll aat
  );

  procedure del(
    p_id_subgrupo in produccion_subgrupo.id_subgrupo%type
  );

  function onerow(
    p_id_subgrupo in produccion_subgrupo.id_subgrupo%type
  ) return produccion_subgrupo%rowtype result_cache;

  function allrows return aat;

  function exist(
    p_id_subgrupo in produccion_subgrupo.id_subgrupo%type
  ) return boolean;
end api_produccion_subgrupo;
/

create or replace package body pevisa.api_produccion_subgrupo as
  forall_err exception;
  pragma exception_init (forall_err, -24381);

  procedure ins(
    p_rec in produccion_subgrupo%rowtype
  ) is
  begin
    insert into produccion_subgrupo
    values p_rec;
  end;

  procedure ins(
    p_coll in aat
  ) is
  begin
    forall i in 1 .. p_coll.count save exceptions
      insert into produccion_subgrupo values p_coll(i);
  exception
    when forall_err then
      for i in 1 .. sql%bulk_exceptions.COUNT loop
        logger.log('PK: ' || p_coll(sql%bulk_exceptions(i).error_index).id_subgrupo ||
                   ' Err: ' || sqlerrm(sql%bulk_exceptions(i).error_code * -1));

      end loop;
      raise;
  end;

  procedure upd(
    p_rec in produccion_subgrupo%rowtype
  ) is
  begin
    update produccion_subgrupo t
       set row = p_rec
     where t.id_subgrupo = p_rec.id_subgrupo;
  end;

  procedure upd(
    p_coll in aat
  ) is
  begin
    forall i in 1 .. p_coll.count save exceptions
      update produccion_subgrupo
         set row = p_coll(i)
       where id_subgrupo = p_coll(i).id_subgrupo;
  exception
    when forall_err then
      for i in 1 .. sql%bulk_exceptions.COUNT loop
        logger.log('PK: ' || p_coll(sql%bulk_exceptions(i).error_index).id_subgrupo ||
                   ' Err: ' || sqlerrm(sql%bulk_exceptions(i).error_code * -1));
      end loop;
      raise;
  end;

  procedure del(
    p_id_subgrupo in produccion_subgrupo.id_subgrupo%type
  ) is
  begin
    delete
      from produccion_subgrupo t
     where t.id_subgrupo = p_id_subgrupo;
  end;

  function onerow(
    p_id_subgrupo in produccion_subgrupo.id_subgrupo%type
  ) return produccion_subgrupo%rowtype result_cache is
    rec produccion_subgrupo%rowtype;
  begin
    select *
      into rec
      from produccion_subgrupo t
     where t.id_subgrupo = p_id_subgrupo;

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
      from produccion_subgrupo;

    return coll;
  end;

  function exist(
    p_id_subgrupo in produccion_subgrupo.id_subgrupo%type
  ) return boolean is
    dummy pls_integer;
  begin
    select 1
      into dummy
      from produccion_subgrupo t
     where t.id_subgrupo = p_id_subgrupo;

    return true;
  exception
    when no_data_found then
      return false;
    when too_many_rows then
      return true;
  end;
end api_produccion_subgrupo;

create public synonym api_produccion_subgrupo for api_produccion_subgrupo;