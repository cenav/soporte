create or replace package api_articul_archivos as

  type aat is table of articul_archivos%rowtype index by binary_integer;
  type ntt is table of articul_archivos%rowtype;

  procedure ins(
    p_rec in articul_archivos%rowtype
  );

  procedure ins(
    p_coll aat
  );

  procedure upd(
    p_rec in articul_archivos%rowtype
  );

  procedure upd(
    p_coll aat
  );

  procedure del(
    p_cod_art in articul_archivos.cod_art%type
  );

  procedure mer(
    p_rec articul_archivos%rowtype
  );

  procedure mer(
    p_cod_art         articul_archivos.cod_art%type
  , p_id_tipo_archivo articul_archivos.id_tipo_archivo%type
  , p_ruta_archivo    articul_archivos.ruta_archivo%type
  );

  function onerow(
    p_cod_art in         articul_archivos.cod_art%type
  , p_id_tipo_archivo in articul_archivos.id_tipo_archivo%type
  ) return articul_archivos%rowtype result_cache;

  function allrows return aat;

  function exist(
    p_cod_art in         articul_archivos.cod_art%type
  , p_id_tipo_archivo in articul_archivos.id_tipo_archivo%type
  ) return boolean;
end api_articul_archivos;


create or replace package body api_articul_archivos as

  forall_err exception;
  pragma exception_init (forall_err, -24381);

  procedure ins(
    p_rec in articul_archivos%rowtype
  ) is
  begin
    insert into articul_archivos
    values p_rec;
  end;

  procedure ins(
    p_coll in aat
  ) is
  begin
    forall i in 1 .. p_coll.count save exceptions
      insert into articul_archivos values p_coll(i);
  exception
    when forall_err then
      for i in 1 .. sql%bulk_exceptions.COUNT loop
        logger.log('PK: ' || p_coll(sql%bulk_exceptions(i).error_index).cod_art ||
                   ' Err: ' || sqlerrm(sql%bulk_exceptions(i).error_code * -1));

      end loop;
      raise;
  end;

  procedure upd(
    p_rec in articul_archivos%rowtype
  ) is
  begin
    update articul_archivos t
       set row = p_rec
     where t.cod_art = p_rec.cod_art;
  end;

  procedure upd(
    p_coll in aat
  ) is
  begin
    forall i in 1 .. p_coll.count save exceptions
      update articul_archivos
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
    p_cod_art in articul_archivos.cod_art%type
  ) is
  begin
    delete
      from articul_archivos t
     where t.cod_art = p_cod_art;
  end;

  procedure mer(
    p_rec articul_archivos%rowtype
  ) is
  begin
    merge into articul_archivos t
    using (
      select p_rec.cod_art as cod_art
           , p_rec.id_tipo_archivo as id_tipo_archivo
           , p_rec.ruta_archivo as ruta_archivo
        from dual
      ) s
    on (t.cod_art = s.cod_art and t.id_tipo_archivo = s.id_tipo_archivo)
    when not matched then
      insert (t.cod_art, t.id_tipo_archivo, t.ruta_archivo)
      values (s.cod_art, s.id_tipo_archivo, s.ruta_archivo)
    when matched then
      update set t.ruta_archivo = s.ruta_archivo;
  end;

  procedure mer(
    p_cod_art         articul_archivos.cod_art%type
  , p_id_tipo_archivo articul_archivos.id_tipo_archivo%type
  , p_ruta_archivo    articul_archivos.ruta_archivo%type
  ) is
  begin
    merge into articul_archivos t
    using (
      select p_cod_art as cod_art
           , p_id_tipo_archivo as id_tipo_archivo
           , p_ruta_archivo as ruta_archivo
        from dual
      ) s
    on (t.cod_art = s.cod_art and t.id_tipo_archivo = s.id_tipo_archivo)
    when not matched then
      insert (t.cod_art, t.id_tipo_archivo, t.ruta_archivo)
      values (s.cod_art, s.id_tipo_archivo, s.ruta_archivo)
    when matched then
      update set t.ruta_archivo = s.ruta_archivo;
  end;

  function onerow(
    p_cod_art in         articul_archivos.cod_art%type
  , p_id_tipo_archivo in articul_archivos.id_tipo_archivo%type
  ) return articul_archivos%rowtype result_cache is
    rec articul_archivos%rowtype;
  begin
    select *
      into rec
      from articul_archivos t
     where t.cod_art = p_cod_art
       and t.id_tipo_archivo = p_id_tipo_archivo;

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
      from articul_archivos;

    return coll;
  end;

  function exist(
    p_cod_art in         articul_archivos.cod_art%type
  , p_id_tipo_archivo in articul_archivos.id_tipo_archivo%type
  ) return boolean is
    dummy pls_integer;
  begin
    select 1
      into dummy
      from articul_archivos t
     where t.cod_art = p_cod_art
       and t.id_tipo_archivo = p_id_tipo_archivo;

    return true;
  exception
    when no_data_found then
      return false;
    when too_many_rows then
      return true;
  end;

end api_articul_archivos;
/

create public synonym api_articul_archivos for api_articul_archivos;