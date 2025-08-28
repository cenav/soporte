create or replace package pevisa.api_almacen as
  type aat is table of almacen%rowtype index by binary_integer;
  type ntt is table of almacen%rowtype;

  procedure ins(
    p_rec in almacen%rowtype
  );

  procedure ins(
    p_coll aat
  );

  procedure upd(
    p_rec in almacen%rowtype
  );

  procedure upd(
    p_coll aat
  );

  procedure del(
    p_cod_art in almacen.cod_art%type
  , p_cod_alm in almacen.cod_alm%type
  );

  function onerow(
    p_cod_art in almacen.cod_art%type
  , p_cod_alm in almacen.cod_alm%type
  ) return almacen%rowtype result_cache;

  function allrows return aat;

  function exist(
    p_cod_art in almacen.cod_art%type
  , p_cod_alm in almacen.cod_alm%type
  ) return boolean;

  procedure carga_stock;

  procedure carga_stock_oa;

  function stock(
    p_cod_art almacen.cod_art%type
  ) return almacen.stock%type;

  function stock_oa(
    p_cod_art almacen.cod_art%type
  ) return almacen.stock%type;

end api_almacen;
/
