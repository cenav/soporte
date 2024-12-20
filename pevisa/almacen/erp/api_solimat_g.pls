create or replace package pevisa.api_solimat_g is
  type aat is table of solimat_g%rowtype index by pls_integer;
  type ntt is table of solimat_g%rowtype;

  procedure ins(
    p_rec in solimat_g%rowtype
  );

  procedure ins(
    p_coll aat
  );

  procedure upd(
    p_rec in solimat_g%rowtype
  );

  procedure upd(
    p_coll aat
  );

  procedure del(
    p_serie in  solimat_g.serie%type
  , p_numero in solimat_g.numero%type
  );

  function onerow(
    p_serie in  solimat_g.serie%type
  , p_numero in solimat_g.numero%type
  ) return solimat_g%rowtype result_cache;

  function onerow(
    p_almacen in     kardex_g.cod_alm%type
  , p_transaccion in kardex_g.tp_transac%type
  , p_serie in       kardex_g.serie%type
  , p_numero in      kardex_g.numero%type
  ) return solimat_g%rowtype result_cache;

  function allrows return aat;

  function exist(
    p_serie in  solimat_g.serie%type
  , p_numero in solimat_g.numero%type
  ) return boolean;

end api_solimat_g;


create or replace package body pevisa.api_solimat_g is
  forall_err exception;
  pragma exception_init (forall_err, -24381);

  procedure ins(
    p_rec in solimat_g%rowtype
  ) is
  begin
    insert into solimat_g
    values p_rec;
  end;

  procedure ins(
    p_coll in aat
  ) is
  begin
    forall i in 1 .. p_coll.count save exceptions
      insert into solimat_g values p_coll(i);
  exception
    when forall_err then
      for i in 1 .. sql%bulk_exceptions.COUNT loop
        logger.log('PK: ' || p_coll(sql%bulk_exceptions(i).error_index).serie ||
                   'PK: ' || p_coll(sql%bulk_exceptions(i).error_index).numero ||
                   ' Err: ' || sqlerrm(sql%bulk_exceptions(i).error_code * -1));
      end loop;
      raise;
  end;

  procedure upd(
    p_rec in solimat_g%rowtype
  ) is
  begin
    update solimat_g t
       set row = p_rec
     where t.serie = p_rec.serie
       and t.numero = p_rec.numero;
  end;

  procedure upd(
    p_coll in aat
  ) is
  begin
    forall i in 1 .. p_coll.count save exceptions
      update solimat_g
         set row = p_coll(i)
       where serie = p_coll(i).serie
         and numero = p_coll(i).numero;
  exception
    when forall_err then
      for i in 1 .. sql%bulk_exceptions.COUNT loop
        logger.log('PK: ' || p_coll(sql%bulk_exceptions(i).error_index).serie ||
                   'PK: ' || p_coll(sql%bulk_exceptions(i).error_index).numero ||
                   ' Err: ' || sqlerrm(sql%bulk_exceptions(i).error_code * -1));
      end loop;
      raise;
  end;

  procedure del(
    p_serie in  solimat_g.serie%type
  , p_numero in solimat_g.numero%type
  ) is
  begin
    delete
      from solimat_g t
     where t.serie = p_serie
       and t.numero = p_numero;
  end;

  function onerow(
    p_serie in  solimat_g.serie%type
  , p_numero in solimat_g.numero%type
  ) return solimat_g%rowtype result_cache is
    rec solimat_g%rowtype;
  begin
    select *
      into rec
      from solimat_g t
     where t.serie = p_serie
       and t.numero = p_numero;

    return rec;
  exception
    when no_data_found then
      return null;
    when too_many_rows then
      raise;
  end;

  function onerow(
    p_almacen in     kardex_g.cod_alm%type
  , p_transaccion in kardex_g.tp_transac%type
  , p_serie in       kardex_g.serie%type
  , p_numero in      kardex_g.numero%type
  ) return solimat_g%rowtype result_cache is
    rec solimat_g%rowtype;
  begin
    select s.*
      into rec
      from kardex_g k
           join solimat_g s
                on k.tip_doc_ref = 'P2' and k.ser_doc_ref = s.serie and k.nro_doc_ref = s.numero
     where k.cod_alm = p_almacen
       and k.tp_transac = p_transaccion
       and k.serie = p_serie
       and k.numero = p_numero;

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
      from solimat_g;

    return p_coll;
  end;

  function exist(
    p_serie in  solimat_g.serie%type
  , p_numero in solimat_g.numero%type
  ) return boolean is
    dummy pls_integer;
  begin
    select 1
      into dummy
      from solimat_g t
     where t.serie = p_serie
       and t.numero = p_numero;

    return true;
  exception
    when no_data_found then
      return false;
    when too_many_rows then
      return true;
  end;

end api_solimat_g;
/

create or replace public synonym api_proceso_rsc for pevisa.api_solimat_g;
