create or replace package body pevisa.api_almacen as
  forall_err exception;
  pragma exception_init (forall_err, -24381);

  type stock_aat is table of almacen.stock%type
    index by almacen.cod_art%type;

  g_stocks stock_aat;
  g_stocks_oa stock_aat;

  procedure ins(
    p_rec in almacen%rowtype
  ) is
  begin
    insert into almacen
    values p_rec;
  end;

  procedure ins(
    p_coll in aat
  ) is
  begin
    forall i in 1 .. p_coll.count save exceptions
      insert into almacen values p_coll
    (i);
  exception
    when forall_err then
      for i in 1 .. sql%bulk_exceptions.COUNT loop
        logger.log('PK: ' || p_coll(sql%bulk_exceptions(i).error_index).cod_art ||
                   'PK: ' || p_coll(sql%bulk_exceptions(i).error_index).cod_alm ||
                   ' Err: ' || sqlerrm(sql%bulk_exceptions(i).error_code * -1));

      end loop;
      raise;
  end;

  procedure upd(
    p_rec in almacen%rowtype
  ) is
  begin
    update almacen t
       set row = p_rec
     where t.cod_art = p_rec.cod_art
       and t.cod_art = p_rec.cod_alm;
  end;

  procedure upd(
    p_coll in aat
  ) is
  begin
    forall i in 1 .. p_coll.count save exceptions
      update almacen
         set row = p_coll(i)
       where cod_art = p_coll(i).cod_art
         and cod_art = p_coll(i).cod_art;
  exception
    when forall_err then
      for i in 1 .. sql%bulk_exceptions.COUNT loop
        logger.log('PK: ' || p_coll(sql%bulk_exceptions(i).error_index).cod_art ||
                   'PK: ' || p_coll(sql%bulk_exceptions(i).error_index).cod_alm ||
                   ' Err: ' || sqlerrm(sql%bulk_exceptions(i).error_code * -1));
      end loop;
      raise;
  end;

  procedure del(
    p_cod_art in almacen.cod_art%type
  , p_cod_alm in almacen.cod_alm%type
  ) is
  begin
    delete
      from almacen t
     where t.cod_art = p_cod_art
       and t.cod_alm = p_cod_alm;
  end;

  function onerow(
    p_cod_art in almacen.cod_art%type
  , p_cod_alm in almacen.cod_alm%type
  ) return almacen%rowtype result_cache is
    rec almacen%rowtype;
  begin
    select *
      into rec
      from almacen t
     where t.cod_art = p_cod_art
       and t.cod_alm = p_cod_alm;

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
      from almacen;

    return coll;
  end;

  function exist(
    p_cod_art in almacen.cod_art%type
  , p_cod_alm in almacen.cod_alm%type
  ) return boolean is
    dummy pls_integer;
  begin
    select 1
      into dummy
      from almacen t
     where t.cod_art = p_cod_art
       and t.cod_alm = p_cod_alm;

    return true;
  exception
    when no_data_found then
      return false;
    when too_many_rows then
      return true;
  end;

  procedure carga_stock is
  begin
    g_stocks.delete;

    for r in (
      select cod_art, nvl(sum(stock), 0) as stock
        from almacen
       where cod_alm in ('03', '05')
       group by cod_art
      )
    loop
      g_stocks(r.cod_art) := r.stock;
    end loop;

  end;

  procedure carga_stock_oa is
  begin
    g_stocks_oa.delete;

    for r in (
      select art_cod_art, nvl(sum(cant_formula), 0) as stock_oa_impresa
        from vw_ordenes_impresas_piezas
       group by art_cod_art
      )
    loop
      g_stocks_oa(r.art_cod_art) := r.stock_oa_impresa;
    end loop;

  end;

  function stock(
    p_cod_art almacen.cod_art%type
  ) return almacen.stock%type is
  begin
    return g_stocks(p_cod_art);
  exception
    when no_data_found then return null;
  end;

  function stock_oa(
    p_cod_art almacen.cod_art%type
  ) return almacen.stock%type is
  begin
    return g_stocks_oa(p_cod_art);
  exception
    when no_data_found then return null;
  end;

end api_almacen;
/