create package api_numdoc as
  type aat is table of numdoc%rowtype index by binary_integer;
  type ntt is table of numdoc%rowtype;

  procedure ins(
    p_rec in numdoc%rowtype
  );

  procedure ins(
    p_coll aat
  );

  procedure upd(
    p_rec in numdoc%rowtype
  );

  procedure upd(
    p_coll aat
  );

  procedure del(
    p_tp_transac in numdoc.tp_transac%type
  , p_serie in      numdoc.serie%type
  );

  function onerow(
    p_tp_transac in numdoc.tp_transac%type
  , p_serie in      numdoc.serie%type
  ) return numdoc%rowtype result_cache;

  function allrows return aat;

  function exist(
    p_tp_transac in numdoc.tp_transac%type
  , p_serie in      numdoc.serie%type
  ) return boolean;

  function next_id(
    p_tp_transac in numdoc.tp_transac%type
  , p_serie in      numdoc.serie%type
  ) return numdoc.numero%type;

end api_numdoc;
/

create package body api_numdoc as
  forall_err exception;
  pragma exception_init (forall_err, -24381);

  procedure ins(
    p_rec in numdoc%rowtype
  ) is
  begin
    insert into numdoc
    values p_rec;
  end;

  procedure ins(
    p_coll in aat
  ) is
  begin
    forall i in 1 .. p_coll.count save exceptions
      insert into numdoc values p_coll(i);
  exception
    when forall_err then
      for i in 1 .. sql%bulk_exceptions.COUNT loop
        logger.log('PK: ' || p_coll(sql%bulk_exceptions(i).error_index).numero ||
                   ' Err: ' || sqlerrm(sql%bulk_exceptions(i).error_code * -1));

      end loop;
      raise;
  end;

  procedure upd(
    p_rec in numdoc%rowtype
  ) is
  begin
    update numdoc t
       set row = p_rec
     where t.numero = p_rec.numero;
  end;

  procedure upd(
    p_coll in aat
  ) is
  begin
    forall i in 1 .. p_coll.count save exceptions
      update numdoc
         set row = p_coll(i)
       where numero = p_coll(i).numero;
  exception
    when forall_err then
      for i in 1 .. sql%bulk_exceptions.COUNT loop
        logger.log('PK: ' || p_coll(sql%bulk_exceptions(i).error_index).numero ||
                   ' Err: ' || sqlerrm(sql%bulk_exceptions(i).error_code * -1));
      end loop;
      raise;
  end;

  procedure del(
    p_tp_transac in numdoc.tp_transac%type
  , p_serie in      numdoc.serie%type
  ) is
  begin
    delete
      from numdoc t
     where t.tp_transac = p_tp_transac
       and t.serie = p_serie;
  end;

  function onerow(
    p_tp_transac in numdoc.tp_transac%type
  , p_serie in      numdoc.serie%type
  ) return numdoc%rowtype result_cache is
    rec numdoc%rowtype;
  begin
    select *
      into rec
      from numdoc t
     where t.tp_transac = p_tp_transac
       and t.serie = p_serie;

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
      from numdoc;

    return coll;
  end;

  function exist(
    p_tp_transac in numdoc.tp_transac%type
  , p_serie in      numdoc.serie%type
  ) return boolean is
    dummy pls_integer;
  begin
    select 1
      into dummy
      from numdoc t
     where t.tp_transac = p_tp_transac
       and t.serie = p_serie;

    return true;
  exception
    when no_data_found then
      return false;
    when too_many_rows then
      return true;
  end;

  function next_id(
    p_tp_transac in numdoc.tp_transac%type
  , p_serie in      numdoc.serie%type
  ) return numdoc.numero%type is
    l_id numdoc.numero%type;
  begin
       update numdoc
          set numero = numero + 1
        where tp_transac = p_tp_transac
          and serie = p_serie
    returning numero
      into l_id;

    return l_id;
  end;

end api_numdoc;
/