declare
  c_estado constant pls_integer := '87';

  cursor cr_guias is
    select distinct numero_kardex
      from pedido_flujo
     where numero_kardex in (
       317695
       );
begin
  for r in cr_guias loop
    delete
      from pedido_flujo p
     where p.numero_kardex in (
       r.numero_kardex
       )
       and fecha_envio > (
       select max(f.fecha_envio)
         from pedido_flujo f
        where f.numero_kardex = p.numero_kardex
          and f.codigo_area = c_estado
       );
  end loop;

  commit;
end ;
