create package api_desmat_notas
as
  type aat is table of desmat_notas%rowtype index by binary_integer;
  type ntt is table of desmat_notas%rowtype;

  procedure ins(
    p_rec in desmat_notas%rowtype
  );

  procedure ins(
    p_coll aat
  );

  procedure upd(
    p_rec in desmat_notas%rowtype
  );

  procedure upd(
    p_coll aat
  );

  procedure del(
    p_id_subsidio in desmat_notas.cod_art%type
  );

  function onerow(
    p_id_subsidio in desmat_notas.cod_art%type
  ) return desmat_notas%rowtype result_cache;

  function allrows return aat;

  function exist(
    p_id_subsidio in desmat_notas.cod_art%type
  ) return boolean;
end api_desmat_notas;
/

create package body api_desmat_notas
as
  forall_err exception;
  pragma exception_init (forall_err, -24381);

  procedure ins(
    p_rec in desmat_notas%rowtype
  ) is
  begin
    insert into desmat_notas
    values p_rec;
  end;

  procedure ins(
    p_coll in aat
  ) is
  begin
    forall i in 1 .. p_coll.count save exceptions
      insert into desmat_notas values p_coll(i);
  exception
    when forall_err then
      for i in 1 .. sql%bulk_exceptions.COUNT loop
        logger.log('PK: ' || p_coll(sql%bulk_exceptions(i).error_index).cod_art ||
                   ' Err: ' || sqlerrm(sql%bulk_exceptions(i).error_code * -1));

      end loop;
      raise;
  end;

  procedure upd(
    p_rec in desmat_notas%rowtype
  ) is
  begin
    update desmat_notas t
       set row = p_rec
     where t.cod_art = p_rec.cod_art;
  end;

  procedure upd(
    p_coll in aat
  ) is
  begin
    forall i in 1 .. p_coll.count save exceptions
      update desmat_notas
         set row = p_coll(i)
       where cod_art = p_coll(i).cod_art;
  exception
    when forall_err then
      for i in 1 .. sql%bulk_exceptions.COUNT loop
        logger.log('PK: ' || p_coll(sql%bulk_exceptions(i).error_index).cod_art ||
                   ' Err: ' || sqlerrm(sql%bulk_exceptions(i).error_code * -1));
      end loop;
      raise;
  end;

  procedure del(
    p_id_subsidio in desmat_notas.cod_art%type
  ) is
  begin
    delete
      from desmat_notas t
     where t.cod_art = p_id_subsidio;
  end;

  function onerow(
    p_id_subsidio in desmat_notas.cod_art%type
  ) return desmat_notas%rowtype result_cache is
    rec desmat_notas%rowtype;
  begin
    select *
      into rec
      from desmat_notas t
     where t.cod_art = p_id_subsidio;

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
      from desmat_notas;

    return coll;
  end;

  function exist(
    p_id_subsidio in desmat_notas.cod_art%type
  ) return boolean is
    dummy pls_integer;
  begin
    select 1
      into dummy
      from desmat_notas t
     where t.cod_art = p_id_subsidio;

    return true;
  exception
    when no_data_found then
      return false;
    when too_many_rows then
      return true;
  end;
end api_desmat_notas;
/