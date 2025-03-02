create or replace package pevisa.api_tipo_archivo as
  type aat is table of tipo_archivo%rowtype index by binary_integer;
  type ntt is table of tipo_archivo%rowtype;

  procedure ins(
    p_rec in tipo_archivo%rowtype
  );

  procedure ins(
    p_coll aat
  );

  procedure upd(
    p_rec in tipo_archivo%rowtype
  );

  procedure upd(
    p_coll aat
  );

  procedure del(
    p_id_tipo_archivo in tipo_archivo.id_tipo_archivo%type
  );

  function onerow(
    p_id_tipo_archivo in tipo_archivo.id_tipo_archivo%type
  ) return tipo_archivo%rowtype result_cache;

  function allrows return aat;

  function exist(
    p_id_tipo_archivo in tipo_archivo.id_tipo_archivo%type
  ) return boolean;
end api_tipo_archivo;
/

create or replace package body pevisa.api_tipo_archivo as
  forall_err exception;
  pragma exception_init (forall_err, -24381);

  procedure ins(
    p_rec in tipo_archivo%rowtype
  ) is
  begin
    insert into tipo_archivo
    values p_rec;
  end;

  procedure ins(
    p_coll in aat
  ) is
  begin
    forall i in 1 .. p_coll.count save exceptions
      insert into tipo_archivo values p_coll(i);
  exception
    when forall_err then
      for i in 1 .. sql%bulk_exceptions.COUNT loop
        logger.log('PK: ' || p_coll(sql%bulk_exceptions(i).error_index).id_tipo_archivo ||
                   ' Err: ' || sqlerrm(sql%bulk_exceptions(i).error_code * -1));

      end loop;
      raise;
  end;

  procedure upd(
    p_rec in tipo_archivo%rowtype
  ) is
  begin
    update tipo_archivo t
       set row = p_rec
     where t.id_tipo_archivo = p_rec.id_tipo_archivo;
  end;

  procedure upd(
    p_coll in aat
  ) is
  begin
    forall i in 1 .. p_coll.count save exceptions
      update tipo_archivo
         set row = p_coll(i)
       where id_tipo_archivo = p_coll(i).id_tipo_archivo;
  exception
    when forall_err then
      for i in 1 .. sql%bulk_exceptions.COUNT loop
        logger.log('PK: ' || p_coll(sql%bulk_exceptions(i).error_index).id_tipo_archivo ||
                   ' Err: ' || sqlerrm(sql%bulk_exceptions(i).error_code * -1));
      end loop;
      raise;
  end;

  procedure del(
    p_id_tipo_archivo in tipo_archivo.id_tipo_archivo%type
  ) is
  begin
    delete
      from tipo_archivo t
     where t.id_tipo_archivo = p_id_tipo_archivo;
  end;

  function onerow(
    p_id_tipo_archivo in tipo_archivo.id_tipo_archivo%type
  ) return tipo_archivo%rowtype result_cache is
    rec tipo_archivo%rowtype;
  begin
    select *
      into rec
      from tipo_archivo t
     where t.id_tipo_archivo = p_id_tipo_archivo;

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
      from tipo_archivo;

    return coll;
  end;

  function exist(
    p_id_tipo_archivo in tipo_archivo.id_tipo_archivo%type
  ) return boolean is
    dummy pls_integer;
  begin
    select 1
      into dummy
      from tipo_archivo t
     where t.id_tipo_archivo = p_id_tipo_archivo;

    return true;
  exception
    when no_data_found then
      return false;
    when too_many_rows then
      return true;
  end;
end api_tipo_archivo;
/

create public synonym api_tipo_archivo for api_tipo_archivo;