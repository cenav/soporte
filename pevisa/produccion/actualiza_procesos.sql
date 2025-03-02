select *
  from pr_proceso
 where codigo = 'LIMYEMB';

select *
  from pr_forsec
 where codigo_proceso = 'LIMYEMB';

select *
  from pr_forsec
 where codigo_proceso in ('LIMP', 'EMBO');

select * from pr_forces_060225;

-- begin
--   for r in (
--     select * from pr_forces_060225
--     )
--   loop
--     update pr_forsec
--        set codigo_proceso = r.codigo_proceso
--      where cod_art = r.cod_art
--        and secuencia = r.secuencia;
--   end loop;
-- end;

-- update pr_forsec
--    set codigo_proceso = 'LIMYEMB'
--  where codigo_proceso in ('LIMP', 'EMBO');

select f.*
  from articul a
       join pr_forsec f on a.cod_art = f.cod_art
 where f.codigo_proceso in ('LIMP', 'EMBO')
   and a.cod_lin between '1241' and '1254'
   and length(a.cod_lin) = 4;


begin
  for r in (
    select f.*
      from articul a
           join pr_forsec f on a.cod_art = f.cod_art
     where f.codigo_proceso in ('LIMP', 'EMBO')
       and a.cod_lin between '1380' and '1387'
       and length(a.cod_lin) = 4
    )
  loop
    update pr_forsec
       set codigo_proceso = 'LIMYEMB'
     where cod_art = r.cod_art
       and secuencia = r.secuencia
       and codigo_proceso = r.codigo_proceso;
  end loop;
end;
