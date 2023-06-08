create or replace package pevisa.api_cuenta_asiento_auto as
  type aat is table of cuenta_asiento_auto%rowtype index by pls_integer;
  type ntt is table of cuenta_asiento_auto%rowtype;

  procedure ins(
    p_rec in cuenta_asiento_auto%rowtype
  );

  procedure ins(
    p_coll aat
  );

  procedure upd(
    p_rec in cuenta_asiento_auto%rowtype
  );

  procedure upd(
    p_coll aat
  );

  procedure del(
    p_id in cuenta_asiento_auto.id%type
  );

  function onerow(
    p_id in cuenta_asiento_auto.id%type
  ) return cuenta_asiento_auto%rowtype result_cache;

  function allrows return aat;

  function exist(
    p_id in cuenta_asiento_auto.id%type
  ) return boolean;

  function cuenta(
    p_id in     cuenta_asiento_auto.id%type
  , p_moneda in moneda.id_moneda%type
  ) return plancta.cuenta%type;
end api_cuenta_asiento_auto;
/

create or replace package body pevisa.api_cuenta_asiento_auto as
  forall_err exception;
  pragma exception_init (forall_err, -24381);

  procedure ins(
    p_rec in cuenta_asiento_auto%rowtype
  ) is
  begin
    insert into cuenta_asiento_auto
    values p_rec;
  end;

  procedure ins(
    p_coll in aat
  ) is
  begin
    forall i in 1 .. p_coll.count save exceptions
      insert into cuenta_asiento_auto values p_coll(i);
  exception
    when forall_err then
      for i in 1 .. sql%bulk_exceptions.COUNT loop
        logger.log('PK: ' || p_coll(sql%bulk_exceptions(i).error_index).id ||
                   ' Err: ' || sqlerrm(sql%bulk_exceptions(i).error_code * -1));

      end loop;
      raise;
  end;

  procedure upd(
    p_rec in cuenta_asiento_auto%rowtype
  ) is
  begin
    update cuenta_asiento_auto t
       set row = p_rec
     where t.id = p_rec.id;
  end;

  procedure upd(
    p_coll in aat
  ) is
  begin
    forall i in 1 .. p_coll.count save exceptions
      update cuenta_asiento_auto
         set row = p_coll(i)
       where id = p_coll(i).id;
  exception
    when forall_err then
      for i in 1 .. sql%bulk_exceptions.COUNT loop
        logger.log('PK: ' || p_coll(sql%bulk_exceptions(i).error_index).id ||
                   ' Err: ' || sqlerrm(sql%bulk_exceptions(i).error_code * -1));
      end loop;
      raise;
  end;

  procedure del(
    p_id in cuenta_asiento_auto.id%type
  ) is
  begin
    delete
      from cuenta_asiento_auto t
     where t.id = p_id;
  end;

  function onerow(
    p_id in cuenta_asiento_auto.id%type
  ) return cuenta_asiento_auto%rowtype result_cache is
    rec cuenta_asiento_auto%rowtype;
  begin
    select *
      into rec
      from cuenta_asiento_auto t
     where t.id = p_id;

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
      from cuenta_asiento_auto;

    return coll;
  end;

  function exist(
    p_id in cuenta_asiento_auto.id%type
  ) return boolean is
    dummy pls_integer;
  begin
    select 1
      into dummy
      from cuenta_asiento_auto t
     where t.id = p_id;

    return true;
  exception
    when no_data_found then
      return false;
    when too_many_rows then
      return true;
  end;

  function cuenta(
    p_id in     cuenta_asiento_auto.id%type
  , p_moneda in moneda.id_moneda%type
  ) return plancta.cuenta%type is
    l_auto cuenta_asiento_auto%rowtype;
  begin
    l_auto := onerow(p_id);
    return case p_moneda
             when 'S' then l_auto.cta_sol
             when 'D' then l_auto.cta_dol
           end;
  end;
end api_cuenta_asiento_auto;
/
