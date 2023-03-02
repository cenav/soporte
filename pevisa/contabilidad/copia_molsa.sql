CREATE OR REPLACE PACKAGE PEVISA.api_clientes IS
  TYPE AAT IS TABLE OF clientes%ROWTYPE INDEX BY PLS_INTEGER;
  TYPE NTT IS TABLE OF clientes%ROWTYPE;

  PROCEDURE ins(rec IN clientes%ROWTYPE);

  PROCEDURE ins(coll AAT);

  PROCEDURE upd(rec IN clientes%ROWTYPE);

  PROCEDURE upd(coll AAT);

  PROCEDURE del(cod_cliente IN clientes.cod_cliente%TYPE);

  FUNCTION onerow(cod_cliente IN clientes.cod_cliente%TYPE) RETURN clientes%ROWTYPE RESULT_CACHE;

  FUNCTION allrows RETURN AAT;

  FUNCTION exist(cod_cliente IN clientes.cod_cliente%TYPE) RETURN BOOLEAN;
END api_clientes;
/

CREATE OR REPLACE PACKAGE BODY PEVISA.api_clientes IS
  forall_err EXCEPTION;
  PRAGMA EXCEPTION_INIT (forall_err, -24381);

  PROCEDURE ins(rec IN clientes%ROWTYPE) IS
  BEGIN
    INSERT INTO clientes
    VALUES rec;
  END;

  PROCEDURE ins(coll IN AAT) IS
  BEGIN
    FORALL i IN 1 .. coll.count SAVE EXCEPTIONS
      INSERT INTO clientes VALUES coll(i);
  EXCEPTION
    WHEN forall_err THEN
      FOR i IN 1 .. SQL%BULK_EXCEPTIONS .COUNT LOOP
        logger.log('PK: ' || coll(SQL%BULK_EXCEPTIONS(i) .error_index).cod_cliente ||
                   ' Err: ' || SQLERRM(SQL%BULK_EXCEPTIONS(i) .error_code * -1));
      END LOOP;
      RAISE;
  END;

  PROCEDURE upd(rec IN clientes%ROWTYPE) IS
  BEGIN
    UPDATE clientes t
       SET row = rec
     WHERE t.cod_cliente = rec.cod_cliente;
  END;

  PROCEDURE upd(coll IN AAT) IS
  BEGIN
    FORALL i IN 1 .. coll.count SAVE EXCEPTIONS
      UPDATE clientes
         SET row = coll(i)
       WHERE cod_cliente = coll(i).cod_cliente;
  EXCEPTION
    WHEN forall_err THEN
      FOR i IN 1 .. SQL%BULK_EXCEPTIONS .COUNT LOOP
        logger.log('PK: ' || coll(SQL%BULK_EXCEPTIONS(i) .error_index).cod_cliente ||
                   ' Err: ' || SQLERRM(SQL%BULK_EXCEPTIONS(i) .error_code * -1));
      END LOOP;
      RAISE;
  END;

  PROCEDURE del(cod_cliente IN clientes.cod_cliente%TYPE) IS
  BEGIN
    DELETE
      FROM clientes t
     WHERE t.cod_cliente = del.cod_cliente;
  END;

  FUNCTION onerow(cod_cliente IN clientes.cod_cliente%TYPE) RETURN clientes%ROWTYPE RESULT_CACHE IS
    rec clientes%ROWTYPE;
  BEGIN
    SELECT *
      INTO rec
      FROM clientes t
     WHERE t.cod_cliente = onerow.cod_cliente;

    RETURN rec;
  EXCEPTION
    WHEN no_data_found THEN
      RETURN NULL;
    WHEN too_many_rows THEN
      RAISE;
  END;

  FUNCTION allrows RETURN AAT IS
    coll AAT;
  BEGIN
    SELECT *
        BULK COLLECT
      INTO coll
      FROM clientes;

    RETURN coll;
  END;

  FUNCTION exist(cod_cliente IN clientes.cod_cliente%TYPE) RETURN BOOLEAN IS
    dummy PLS_INTEGER;
  BEGIN
    SELECT 1
      INTO dummy
      FROM clientes t
     WHERE t.cod_cliente = exist.cod_cliente;

    RETURN TRUE;
  EXCEPTION
    WHEN no_data_found THEN
      RETURN FALSE;
    WHEN too_many_rows THEN
      RETURN TRUE;
  END;
END api_clientes;
/
