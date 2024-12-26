declare
  l_concepto_id varchar2(200);
  l_del         date;
  l_al          date;
begin
  l_concepto_id := 'NAM';
  l_del := to_date('24/12/2024 20:45', 'dd/mm/yyyy hh24:mi');
  l_al := to_date('24/12/2024 23:45', 'dd/mm/yyyy hh24:mi');

  bienestar.tiempo_permiso_ok(
      p_concepto_id => l_concepto_id
    , p_del => l_del
    , p_al => l_al
  );
end;
