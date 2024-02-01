create package api_color as
  type aat is table of color%rowtype index by binary_integer;
  type ntt is table of color%rowtype;

  procedure ins(
    p_rec in color%rowtype
  );

  procedure ins(
    p_coll aat
  );

  procedure upd(
    p_rec in color%rowtype
  );

  procedure upd(
    p_coll aat
  );

  procedure del(
    p_id_color in color.id_color%type
  );

  function onerow(
    p_id_color in color.id_color%type
  ) return color%rowtype result_cache;

  function allrows return aat;

  function exist(
    p_id_color in color.id_color%type
  ) return boolean;
end api_color;
/

create package body api_color as
  forall_err exception;
  pragma exception_init (forall_err, -24381);

  procedure ins(
    p_rec in color%rowtype
  ) is
  begin
    insert into color
    values p_rec;
  end;

  procedure ins(
    p_coll in aat
  ) is
  begin
    forall i in 1 .. p_coll.count save exceptions
      insert into color values p_coll(i);
  exception
    when forall_err then
      for i in 1 .. sql%bulk_exceptions.COUNT loop
        logger.log('PK: ' || p_coll(sql%bulk_exceptions(i).error_index).id_color ||
                   ' Err: ' || sqlerrm(sql%bulk_exceptions(i).error_code * -1));

      end loop;
      raise;
  end;

  procedure upd(
    p_rec in color%rowtype
  ) is
  begin
    update color t
       set row = p_rec
     where t.id_color = p_rec.id_color;
  end;

  procedure upd(
    p_coll in aat
  ) is
  begin
    forall i in 1 .. p_coll.count save exceptions
      update color
         set row = p_coll(i)
       where id_color = p_coll(i).id_color;
  exception
    when forall_err then
      for i in 1 .. sql%bulk_exceptions.COUNT loop
        logger.log('PK: ' || p_coll(sql%bulk_exceptions(i).error_index).id_color ||
                   ' Err: ' || sqlerrm(sql%bulk_exceptions(i).error_code * -1));
      end loop;
      raise;
  end;

  procedure del(
    p_id_color in color.id_color%type
  ) is
  begin
    delete
      from color t
     where t.id_color = p_id_color;
  end;

  function onerow(
    p_id_color in color.id_color%type
  ) return color%rowtype result_cache is
    rec color%rowtype;
  begin
    select *
      into rec
      from color t
     where t.id_color = p_id_color;

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
      from color;

    return coll;
  end;

  function exist(
    p_id_color in color.id_color%type
  ) return boolean is
    dummy pls_integer;
  begin
    select 1
      into dummy
      from color t
     where t.id_color = p_id_color;

    return true;
  exception
    when no_data_found then
      return false;
    when too_many_rows then
      return true;
  end;
end api_color;
/

create public synonym api_color for api_color;